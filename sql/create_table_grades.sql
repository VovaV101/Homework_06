CREATE TABLE grades (
    grade_id SERIAL PRIMARY KEY,
    student_id INT,
    subject_id INT,
    grade INT,
    date_received DATE,
    CONSTRAINT fk_student_id FOREIGN KEY (student_id) REFERENCES students(student_id),
    CONSTRAINT fk_subject_id FOREIGN KEY (subject_id) REFERENCES subjects(subject_id)
);
