DELETE FROM `cond`;
DELETE FROM `exam`;
DELETE FROM `visit`;
DELETE FROM `Lect`;
DELETE FROM `Stud`;
DELETE FROM `Ass`;
DELETE FROM `Prof`;

INSERT INTO Stud(id, name, sem, dob) VALUES (24002, 'Xenokrates', 18, '1970-12-13'); 
INSERT INTO Stud(id, name, sem, dob) VALUES (25403, 'Jonas', 12, '1969-05-10'  ); 
INSERT INTO Stud(id, name, sem, dob) VALUES (26120, 'Fichte', 10, '1940-12-13'  ); 
INSERT INTO Stud(id, name, sem, dob) VALUES (26830, 'Aristoxenos', 8, '1968-12-13'  ); 
INSERT INTO Stud(id, name, sem, dob) VALUES (27550, 'Schopenhauer', 6, '1967-11-13'  ); 
INSERT INTO Stud(id, name, sem, dob) VALUES (28106, 'Carnap', 3, '1969-06-13'  ); 
INSERT INTO Stud(id, name, sem, dob) VALUES (29120, 'Theophrastos', 2, '1970-12-13'  ); 
INSERT INTO Stud(id, name, sem, dob) VALUES (29555, 'Feuerbach', 2, '1971-11-13'  ); 

INSERT INTO Prof(id, name, degree, room, dob) VALUES (2125, 'Sokrates', 'c4', 226, '1940-12-13'  ); 
INSERT INTO Prof(id, name, degree, room, dob) VALUES (2126, 'Russel', 'c4', 232, '1942-12-13'  );  
INSERT INTO Prof(id, name, degree, room, dob) VALUES (2127, 'Kopernikus', 'c3', 310, '1941-02-14'  ); 
INSERT INTO Prof(id, name, degree, room, dob) VALUES (2133, 'Popper', 'c3', 052, '1940-12-17'  ); 
INSERT INTO Prof(id, name, degree, room, dob) VALUES (2134, 'Augustinus', 'c3', 309, '1940-12-24'  ); 
INSERT INTO Prof(id, name, degree, room, dob) VALUES (2136, 'Curie', 'c4', 036, '1939-01-01'  ); 
INSERT INTO Prof(id, name, degree, room, dob) VALUES (2137, 'Kant', 'c4', 007, '1940-07-13'  ); 
INSERT INTO Prof(id, name, degree, room, dob) VALUES (2138, 'Berger', 'c4', 214, '1926-06-20'  ); 
 
INSERT INTO Ass(id, name, expertise, profid, dob) VALUES (3002, 'Platon', 'Ideenlehre', 2125, '1960-12-13'  ); 
INSERT INTO Ass(id, name, expertise, profid, dob) VALUES (3003, 'Aristoteles', 'Syllogistik', 2125, '1962-12-13'  ); 
INSERT INTO Ass(id, name, expertise, profid, dob) VALUES (3004, 'Wittgenstein', 'Sprachtheorie', 2126, '1961-12-24'  ); 
INSERT INTO Ass(id, name, expertise, profid, dob) VALUES (3005, 'Rhetikus', 'Planetenbewegung', 2127, '1960-06-13'  ); 
INSERT INTO Ass(id, name, expertise, profid, dob) VALUES (3006, 'Newton', 'Keplersche Gesetze', 2127, '1963-12-13'  ); 
INSERT INTO Ass(id, name, expertise, profid, dob) VALUES (3007, 'Spinoza', 'Gott und Natur', 2134, '1964-12-11'  ); 
 
INSERT INTO Lect(id, name, ects, profid) VALUES (5001, 'Grundzüge', 4, 2137);
INSERT INTO Lect(id, name, ects, profid) VALUES (5041, 'Ethik', 4, 2125);
INSERT INTO Lect(id, name, ects, profid) VALUES (5043, 'Erkenntnistheorie', 3, 2126);
INSERT INTO Lect(id, name, ects, profid) VALUES (5049, 'Mäeutik', 2, 2125);
INSERT INTO Lect(id, name, ects, profid) VALUES (4052, 'Logik', 4, 2125);
INSERT INTO Lect(id, name, ects, profid) VALUES (5052, 'Wissenschaftstheorie', 3, 2126); 
INSERT INTO Lect(id, name, ects, profid) VALUES (5216, 'Bioethik', 2, 2126); 
INSERT INTO Lect(id, name, ects, profid) VALUES (5259, 'Der Wiener Kreis', 2, 2133); 
INSERT INTO Lect(id, name, ects, profid) VALUES (5022, 'Glaube und Wissen', 2, 2134); 
INSERT INTO Lect(id, name, ects, profid) VALUES (4630, 'Die 3 Kritiken', 4, 2137); 
INSERT INTO Lect(id, name, ects, profid) VALUES (4001, 'Mathematik I', 4, 2138); 
INSERT INTO Lect(id, name, ects, profid) VALUES (4002, 'Mathematik II', 4, 2138); 
INSERT INTO Lect(id, name, ects, profid) VALUES (4003, 'Mathematik III', 4, 2138); 
INSERT INTO Lect(id, name, ects, profid) VALUES (4004, 'Mathematik IIII', 4, 2138); 

INSERT INTO visit(lectid, studid) VALUES (5041, 26120);
INSERT INTO visit(lectid, studid) VALUES (4052, 26120);
INSERT INTO visit(lectid, studid) VALUES (4630, 26120);
INSERT INTO visit(studid, lectid) VALUES (26120, 5001); 
INSERT INTO visit(studid, lectid) VALUES (27550, 5001); 
INSERT INTO visit(studid, lectid) VALUES (27550, 4052); 
INSERT INTO visit(studid, lectid) VALUES (28106, 5041); 
INSERT INTO visit(studid, lectid) VALUES (28106, 5052); 
INSERT INTO visit(studid, lectid) VALUES (28106, 5216); 
INSERT INTO visit(studid, lectid) VALUES (28106, 5259); 
INSERT INTO visit(studid, lectid) VALUES (28106, 5001);  
INSERT INTO visit(studid, lectid) VALUES (29120, 5001); 
INSERT INTO visit(studid, lectid) VALUES (29120, 5041); 
INSERT INTO visit(studid, lectid) VALUES (29120, 5049); 
INSERT INTO visit(studid, lectid) VALUES (29555, 5022); 
INSERT INTO visit(studid, lectid) VALUES (25403, 5022);  
INSERT INTO visit(studid, lectid) VALUES (29555, 5001);  
INSERT INTO visit(studid, lectid) VALUES (26120, 4003);  
INSERT INTO visit(studid, lectid) VALUES (27550, 4003);  
INSERT INTO visit(studid, lectid) VALUES (29120, 4003);  
INSERT INTO visit(studid, lectid) VALUES (28106, 4003);  
INSERT INTO visit(studid, lectid) VALUES (29555, 4003);  

INSERT INTO exam(studid, lectid, profid, grade, date) VALUES (28106, 5001, 2126, 1.0, '2010-03-17');
INSERT INTO exam(studid, lectid, profid, grade, date) VALUES (25403, 5041, 2125, 2.0, '2011-04-12');
INSERT INTO exam(studid, lectid, profid, grade, date) VALUES (27550, 4630, 2137, 2.0, '2011-04-11');
INSERT INTO exam(studid, lectid, profid, grade, date) VALUES (26120, 4001, 2138, 1.0, '2011-04-11');
INSERT INTO exam(studid, lectid, profid, grade, date) VALUES (26120, 4002, 2138, 2.0, '2012-04-11');
INSERT INTO exam(studid, lectid, profid, grade, date) VALUES (26120, 4003, 2138, 2.0, '2013-04-11');
INSERT INTO exam(studid, lectid, profid, grade, date) VALUES (27550, 4001, 2138, 1.0, '2011-04-11');
INSERT INTO exam(studid, lectid, profid, grade, date) VALUES (27550, 4002, 2138, 3.0, '2012-04-11');
INSERT INTO exam(studid, lectid, profid, grade, date) VALUES (29120, 4001, 2138, 4.0, '2011-04-11');

INSERT INTO cond(lectid, lectcond) VALUES (4002, 4001);
INSERT INTO cond(lectid, lectcond) VALUES (4003, 4002);
INSERT INTO cond(lectid, lectcond) VALUES (4004, 4003);


-- Fehlerhaft:
INSERT INTO exam(studid, lectid, profid, grade, date) VALUES (29120, 4003, 2138, 4.0, '2011-04-11');
