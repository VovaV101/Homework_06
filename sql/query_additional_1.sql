/Замініть це значення на конкретний ідентифікатор студента (student_id), для якого ви хочете отримати інформацію.
/Замініть це значення на конкретний ідентифікатор викладача (teacher_id), для якого ви хочете отримати інформацію.

SELECT AVG(grade) as avg_grade
FROM grades
WHERE subject_id IN (SELECT subject_id FROM subjects WHERE teacher_id = 'your_teacher_id')
  AND student_id = 'your_student_id';
