/Замініть це значення на конкретний ідентифікатор студента (student_id), для якого ви хочете отримати інформацію.

SELECT student_id, AVG(grade) as avg_grade
FROM grades
GROUP BY student_id
ORDER BY avg_grade DESC
LIMIT 5;
