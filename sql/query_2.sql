/Замініть це значення на конкретний ідентифікатор предмету(subject_id), для якого ви хочете отримати інформацію.

SELECT student_id, AVG(grade) as avg_grade
FROM grades
WHERE subject_id = 'your_subject_id'
GROUP BY student_id
ORDER BY avg_grade DESC
LIMIT 1;
