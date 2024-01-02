/Замініть це значення на конкретний ідентифікатор предмету(subject_id), для якого ви хочете отримати інформацію.
/Замініть це значення на конкретний ідентифікатор групи (group_id), для якого ви хочете отримати інформацію.

WITH LastClass AS (
  SELECT student_id, MAX(date_received) as last_class_date
  FROM grades
  WHERE subject_id = 'your_subject_id' AND group_id = 'your_group_id'
  GROUP BY student_id
)

SELECT grades.student_id, grades.grade
FROM grades
JOIN LastClass ON grades.student_id = LastClass.student_id AND grades.date_received = LastClass.last_class_date;
