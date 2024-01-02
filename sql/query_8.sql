/Замініть це значення на конкретний ідентифікатор викладача (teacher_id), для якого ви хочете отримати інформацію.

SELECT teacher_id, AVG(grade) as avg_grade
FROM grades
WHERE subject_id IN (SELECT subject_id FROM subjects WHERE teacher_id = 'your_teacher_id')
GROUP BY teacher_id;
