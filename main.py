from faker import Faker
import random
import psycopg2
from config import db_config

fake = Faker('uk_UA')

# З'єднання з базою даних
conn = psycopg2.connect(**db_config)
cursor = conn.cursor()

table_scripts = [
    'create_table_groups.sql',
    'create_table_students.sql',
    'create_table_teachers.sql',
    'create_table_subjects.sql',
    'create_table_grades.sql'
]

for script in table_scripts:
    with open(f'sql/{script}', 'r') as file:
        sql_script = file.read()
        cursor.execute(sql_script)

# Додавання груп
groups = ['Group A', 'Group B', 'Group C']
for group in groups:
    cursor.execute("INSERT INTO groups (group_name) VALUES (%s) RETURNING group_id;", (group,))
    group_id = cursor.fetchone()[0]

    # Додавання студентів
    for _ in range(random.randint(10, 15)):
        first_name = fake.first_name()
        last_name = fake.last_name()
        cursor.execute("INSERT INTO students (first_name, last_name, group_id) VALUES (%s, %s, %s);",
                       (first_name, last_name, group_id))

# Додавання викладачів
for _ in range(3):
    first_name = fake.first_name()
    last_name = fake.last_name()
    cursor.execute("INSERT INTO teachers (first_name, last_name) VALUES (%s, %s);", (first_name, last_name))

# Додавання предметів
subjects = ['Math', 'Physics', 'Chemistry', 'History', 'English']
for subject in subjects:
    teacher_id = random.randint(1, 3)  # Виберіть випадкового викладача
    cursor.execute("INSERT INTO subjects (subject_name, teacher_id) VALUES (%s, %s);", (subject, teacher_id))

# Додавання оцінок
for student_id in range(1, 31):
    for subject_id in range(1, 6):
        grade = random.randint(60, 100)
        date_received = fake.date_between(start_date='-1y', end_date='today')
        cursor.execute("INSERT INTO grades (student_id, subject_id, grade, date_received) VALUES (%s, %s, %s, %s);",
                       (student_id, subject_id, grade, date_received))

# Збереження змін та закриття з'єднання
conn.commit()
conn.close()
