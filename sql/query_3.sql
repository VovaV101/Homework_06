/Замініть це значення на конкретний ідентифікатор предмету(subject_id), для якого ви хочете отримати інформацію.

SELECT groups.group_id, AVG(grade) as avg_grade
FROM grades
JOIN students ON grades.student_id = students.student_id
JOIN groups ON students.group_id = groups.group_id
WHERE subject_id = 'your_subject_id'
GROUP BY groups.group_id;
