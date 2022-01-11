CREATE TABLE instrument (
 instrument_id CHAR(5) NOT NULL,
 brand VARCHAR(50) NOT NULL,
 instrument_name VARCHAR(50) NOT NULL,
 kind VARCHAR(50) NOT NULL
);

ALTER TABLE instrument ADD CONSTRAINT PK_instrument PRIMARY KEY (instrument_id);


CREATE TABLE Lesson (
);


CREATE TABLE person (
 person_nummer CHAR(12) NOT NULL,
 first_name VARCHAR(100) NOT NULL,
 last_name VARCHAR(100) NOT NULL,
 email VARCHAR(100) NOT NULL,
 phone_number VARCHAR(14),
 birth_year INT NOT NULL,
 city VARCHAR(100) NOT NULL,
 zipcode VARCHAR(100) NOT NULL,
 street VARCHAR(100) NOT NULL
);

ALTER TABLE person ADD CONSTRAINT PK_person PRIMARY KEY (person_nummer);


CREATE TABLE student (
 student_id CHAR(14) NOT NULL,
 contact_person_person_nummer CHAR(12) NOT NULL,
 sibling_student_id CHAR(14),
 person_nummer CHAR(12) NOT NULL
);

ALTER TABLE student ADD CONSTRAINT PK_student PRIMARY KEY (student_id);


CREATE TABLE student_enrollment (
 application_id CHAR(16) NOT NULL,
 skill_level SMALLINT NOT NULL,
 instrument_name VARCHAR(60),
 ensemble_name VARCHAR(60),
 first_name VARCHAR(100) NOT NULL,
 last_name VARCHAR(100) NOT NULL,
 phone_number CHAR(14) NOT NULL,
 email CHAR(10) NOT NULL,
 student_id CHAR(14) NOT NULL
);

ALTER TABLE student_enrollment ADD CONSTRAINT PK_student_enrollment PRIMARY KEY (application_id);


CREATE TABLE student_payment (
 student_payment_id CHAR(22) NOT NULL,
 student_id CHAR(14) NOT NULL,
 discount INT,
 lesson_enrollments CHAR(10)
);

ALTER TABLE student_payment ADD CONSTRAINT PK_student_payment PRIMARY KEY (student_payment_id);


CREATE TABLE contact_person (
 person_nummer CHAR(12) NOT NULL,
 email VARCHAR(50) NOT NULL,
 phone_number VARCHAR(14),
 first_name VARCHAR(100) NOT NULL,
 last_name VARCHAR(100) NOT NULL,
 student_id CHAR(14) NOT NULL
);

ALTER TABLE contact_person ADD CONSTRAINT PK_contact_person PRIMARY KEY (person_nummer);


CREATE TABLE instructor (
 instructor_id CHAR(12) NOT NULL,
 can_teach_ensembles BIT(1) NOT NULL,
 person_nummer CHAR(12)
);

ALTER TABLE instructor ADD CONSTRAINT PK_instructor PRIMARY KEY (instructor_id);


CREATE TABLE instructor_payment (
 instructor_id CHAR(12) NOT NULL,
 ids_of_lessons CHAR(15)
);

ALTER TABLE instructor_payment ADD CONSTRAINT PK_instructor_payment PRIMARY KEY (instructor_id);


CREATE TABLE instrument_rental (
 rental_id CHAR(18) NOT NULL,
 instrument_id CHAR(5),
 starting_date DATE NOT NULL,
 ending_date DATE NOT NULL,
 student_payment_id CHAR(22) NOT NULL
);

ALTER TABLE instrument_rental ADD CONSTRAINT PK_instrument_rental PRIMARY KEY (rental_id);


CREATE TABLE sibling_discount (
 sibling_discount_id CHAR(10) NOT NULL,
 student_id CHAR(14),
 student_payment_id CHAR(22),
 sibling_student_id CHAR(14)
);

ALTER TABLE sibling_discount ADD CONSTRAINT PK_sibling_discount PRIMARY KEY (sibling_discount_id);


CREATE TABLE taught_instrument (
 taught_instrument_id CHAR(10) NOT NULL,
 instructor_id CHAR(12) NOT NULL,
 instrument_id CHAR(5) NOT NULL
);

ALTER TABLE taught_instrument ADD CONSTRAINT PK_taught_instrument PRIMARY KEY (taught_instrument_id);


CREATE TABLE ensemble_lesson (
 ensemble_lesson_id CHAR(15) NOT NULL,
 day_number INT NOT NULL,
 month_number INT NOT NULL,
 year_number INT NOT NULL,
 price INT,
 ensemble_id CHAR(10) NOT NULL,
 genre VARCHAR(50),
 max_number_of_students INT NOT NULL,
 min_number_of_students INT NOT NULL,
 instructor_id CHAR(12)
);

ALTER TABLE ensemble_lesson ADD CONSTRAINT PK_ensemble_lesson PRIMARY KEY (ensemble_lesson_id);


CREATE TABLE group_lesson (
 group_lesson_id CHAR(15) NOT NULL,
 year_number INT NOT NULL,
 day_number INT NOT NULL,
 month_number INT NOT NULL,
 price INT,
 skill_level SMALLINT NOT NULL,
 instrument VARCHAR(50) NOT NULL,
 max_number_of_students INT NOT NULL,
 min_number_of_students INT NOT NULL,
 instructor_id CHAR(12) NOT NULL
);

ALTER TABLE group_lesson ADD CONSTRAINT PK_group_lesson PRIMARY KEY (group_lesson_id);


CREATE TABLE individual_lesson (
 individual_lesson_id CHAR(15) NOT NULL,
 day_number INT NOT NULL,
 month_number INT NOT NULL,
 year_number INT NOT NULL,
 price INT,
 skill_level SMALLINT NOT NULL,
 instrument VARCHAR(50) NOT NULL,
 instructor_id CHAR(12) NOT NULL
);

ALTER TABLE individual_lesson ADD CONSTRAINT PK_individual_lesson PRIMARY KEY (individual_lesson_id);


CREATE TABLE lesson_enrollment (
 enrollment_id CHAR(10) NOT NULL,
 group_lesson_id CHAR(15),
 individual_lesson_id CHAR(15),
 ensemble_lesson_id CHAR(15),
 application_id CHAR(16) NOT NULL,
 student_payment_id CHAR(22)
);

ALTER TABLE lesson_enrollment ADD CONSTRAINT PK_lesson_enrollment PRIMARY KEY (enrollment_id);


ALTER TABLE student ADD CONSTRAINT FK_student_0 FOREIGN KEY (person_nummer) REFERENCES person (person_nummer);


ALTER TABLE student_enrollment ADD CONSTRAINT FK_student_enrollment_0 FOREIGN KEY (student_id) REFERENCES student (student_id);


ALTER TABLE student_payment ADD CONSTRAINT FK_student_payment_0 FOREIGN KEY (student_id) REFERENCES student (student_id);


ALTER TABLE contact_person ADD CONSTRAINT FK_contact_person_0 FOREIGN KEY (student_id) REFERENCES student (student_id);


ALTER TABLE instructor ADD CONSTRAINT FK_instructor_0 FOREIGN KEY (person_nummer) REFERENCES person (person_nummer);


ALTER TABLE instructor_payment ADD CONSTRAINT FK_instructor_payment_0 FOREIGN KEY (instructor_id) REFERENCES instructor (instructor_id);


ALTER TABLE instrument_rental ADD CONSTRAINT FK_instrument_rental_0 FOREIGN KEY (instrument_id) REFERENCES instrument (instrument_id);
ALTER TABLE instrument_rental ADD CONSTRAINT FK_instrument_rental_1 FOREIGN KEY (student_payment_id) REFERENCES student_payment (student_payment_id);


ALTER TABLE sibling_discount ADD CONSTRAINT FK_sibling_discount_0 FOREIGN KEY (student_id) REFERENCES student (student_id);
ALTER TABLE sibling_discount ADD CONSTRAINT FK_sibling_discount_1 FOREIGN KEY (student_payment_id) REFERENCES student_payment (student_payment_id);


ALTER TABLE taught_instrument ADD CONSTRAINT FK_taught_instrument_0 FOREIGN KEY (instructor_id) REFERENCES instructor (instructor_id);
ALTER TABLE taught_instrument ADD CONSTRAINT FK_taught_instrument_1 FOREIGN KEY (instrument_id) REFERENCES instrument (instrument_id);


ALTER TABLE ensemble_lesson ADD CONSTRAINT FK_ensemble_lesson_0 FOREIGN KEY (instructor_id) REFERENCES instructor_payment (instructor_id);


ALTER TABLE group_lesson ADD CONSTRAINT FK_group_lesson_0 FOREIGN KEY (instructor_id) REFERENCES instructor_payment (instructor_id);


ALTER TABLE individual_lesson ADD CONSTRAINT FK_individual_lesson_0 FOREIGN KEY (instructor_id) REFERENCES instructor_payment (instructor_id);


ALTER TABLE lesson_enrollment ADD CONSTRAINT FK_lesson_enrollment_0 FOREIGN KEY (group_lesson_id) REFERENCES group_lesson (group_lesson_id);
ALTER TABLE lesson_enrollment ADD CONSTRAINT FK_lesson_enrollment_1 FOREIGN KEY (individual_lesson_id) REFERENCES individual_lesson (individual_lesson_id);
ALTER TABLE lesson_enrollment ADD CONSTRAINT FK_lesson_enrollment_2 FOREIGN KEY (ensemble_lesson_id) REFERENCES ensemble_lesson (ensemble_lesson_id);
ALTER TABLE lesson_enrollment ADD CONSTRAINT FK_lesson_enrollment_3 FOREIGN KEY (application_id) REFERENCES student_enrollment (application_id);
ALTER TABLE lesson_enrollment ADD CONSTRAINT FK_lesson_enrollment_4 FOREIGN KEY (student_payment_id) REFERENCES student_payment (student_payment_id);


