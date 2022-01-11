INSERT INTO person VALUES ('200003214312', 'Maddie', 'Gustavson', 'maddie.gustavson@gmail.com', '+4642079389', 2000, 'Stockholm', '18365', 'Palmstruchsvagen');
INSERT INTO student VALUES ('20000321S00001', '197809054942', '20010902S00002', '200109022143');

INSERT INTO person VALUES ('200109022143', 'Per', 'Gustavson', 'per.gustavson@gmail.com', '+465812384', 2001, 'Stockholm', '18365', 'Palmstruchsvagen');
INSERT INTO student VALUES ('20010902S00002', '197809054942', '20000321S00001', '200003214312');

INSERT INTO contact_person VALUES ('197809054942', 'john.gustavson@gmail.com', 'John', 'Gustavson', '20060731S00001');

INSERT INTO student_enrollment VALUES ('2022011011001204', 1, 'guitar', NULL, 'Maddie', 'Gustavson', '+4642079389', 'maddie.gustavson@gmail.com', '20000321S00001');

INSERT INTO person VALUES ('198309082341', 'Chris', 'Newman', 'Chris.Newman@gmail.com', '+4625373', 1983, 'Stockholm', '145043', 'Kalmarsgatan');
INSERT INTO instructor VALUES ('19830908i1203', 1, '198309082341');

INSERT INTO instructor_payment VALUES('19830908i1203');
INSERT INTO taught_instrument VALUES ('2001030490', '19830908i1203', '21340');

INSERT INTO group_lesson VALUES ('201706261600G1203', 2, 4, 9, 20, 1, 'guitar', 1, 6, '19830908i1203');
INSERT INTO lesson_enrollment VALUES('8012904332', yes, NULL, NULL, '2022011011001204', '20000321S0000120170809');