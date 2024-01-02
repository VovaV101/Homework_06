/Замініть це значення на конкретний ідентифікатор групи (group_id), для якого ви хочете отримати інформацію.
/Замініть це значення на конкретний ідентифікатор предмета (subject_id), для якого ви хочете отримати інформацію.

SELECT students.student_id, students.first_name, students.last_name, grades.grade
FROM grades
JOIN students ON grades.student_id = students.student_id
WHERE students.group_id = 'your_group_id' AND grades.subject_id = 'your_subject_id';
