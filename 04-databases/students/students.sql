DROP TABLE students;
CREATE TABLE students (
  id SERIAL8 PRIMARY KEY,
  first_name VARCHAR(25),
  age INT2,
  gender CHAR(1)
);

DROP TABLE courses;
CREATE TABLE courses (
  id SERIAL8 PRIMARY KEY,
  name TEXT
);

DROP TABLE courses_students;
CREATE TABLE courses_students (
  student_id INT8,
  course_id INT8
);

-- seed data
INSERT INTO students (first_name, age, gender) VALUES ('bob', 25, 'm');
INSERT INTO students (first_name, age, gender) VALUES ('alice', 23, 'f');
INSERT INTO students (first_name, age, gender) VALUES ('jonesy', 57, 'm');

INSERT INTO courses (name) VALUES ('Mathematics');
INSERT INTO courses (name) VALUES ('Linguistics');
INSERT INTO courses (name) VALUES ('Architecture');

INSERT INTO courses_students (student_id, course_id) VALUES (1, 1);
INSERT INTO courses_students (student_id, course_id) VALUES (2, 2);
INSERT INTO courses_students (student_id, course_id) VALUES (3, 3);
INSERT INTO courses_students (student_id, course_id) VALUES (1, 2);

