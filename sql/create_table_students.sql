CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    group_id INT,
    CONSTRAINT fk_group_id FOREIGN KEY (group_id) REFERENCES groups(group_id)
);
