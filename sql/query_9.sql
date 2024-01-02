/Замініть це значення на конкретний ідентифікатор студента (student_id), для якого ви хочете отримати інформацію.

SELECT DISTINCT subject_name
FROM subjects
JOIN grades ON subjects.subject_id = grades.subject_id
WHERE grades.student_id = 'your_student_id';
