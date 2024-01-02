CREATE TABLE subjects (
    subject_id SERIAL PRIMARY KEY,
    subject_name VARCHAR(50),
    teacher_id INT,
    CONSTRAINT fk_teacher_id FOREIGN KEY (teacher_id) REFERENCES teachers(teacher_id)
);
