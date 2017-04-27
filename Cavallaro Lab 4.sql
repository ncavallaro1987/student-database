/* 	Nick Cavallaro
	CSCI-2370
	Lab 2
	Due: 2016-10-24
*/

--Lab 1 started here. 
--I made 6 modifications to lab 1 for lab 2 to add cascade constraints to each drop table, and increase the size constraint on student e-mail, as I was not being added to the table with my student email
--I made 3 modifications to lab 1 for lab 3 to add drop table commands for the tables created in lab 3


-- set line size
set linesize 300
set pages 35
	
-- drop existing tables
drop table Student cascade constraints;
drop table Faculty cascade constraints;
drop table Course cascade constraints;
drop table Section cascade constraints;
drop table location cascade constraints;
-- drop lab 3 tables
drop table Registration cascade constraints;
drop table Grade cascade constraints;
drop table CourseInstructor cascade constraints;


--reset counters
drop sequence studentcounter;
drop sequence facultycounter;
drop sequence coursecounter;
drop sequence sectioncounter;
drop sequence locationcounter;

--drop existing indexes
drop index student_id;
drop index student_lastname;
drop index faculty_id;
drop index faculty_lastname;
drop index seciton_courseid;
drop index section_location;
drop index course_name;
drop index course_number;
drop index location_room;
drop index location_building;

-- create new tables
create table Student (
StudentID Number(10),
FirstName varchar2(20),
LastName varchar2(20),
MI char(1),
Address varchar2(20),
City varchar2(20),
State char(2),
Zip varchar2(10),
HomePhone varchar2(10),
WorkPhone varchar2(10),
Email varchar2(30),
DOB date,
Pin varchar2(10),
Status char(1));
create table faculty (
FacultyID number(10),
FirstName varchar2(20),
LastName varchar2(20),
MI char(1),
WorkPhone varchar2(10),
CellPhone varchar2(10),
Rank varchar2(20),
Experience varchar2(20),
status char(1));
create table course (
CourseID number(10),
CourseNumber varchar2(20),
CourseName varchar2(30),
Description varchar2(30),
CreditHours number(4),
Status char(1));
create table section (
SectionID number(10),
CourseID number(10),
SectionNumber varchar2(10),
Days varchar2(10),
StartTime date,
EndTime date,
LocationID number(10),
SeatsAvailable number(3),
Status char(1));
create table Location (
LocationID number(10),
Building varchar2(20),
Room varchar2(5),
Capacity number(5),
Status char(1));


--create new counters

-- all student IDs will end in 1
create sequence StudentCounter minvalue 1 increment by 10;

-- all faculty IDs will end in 2
create sequence FacultyCounter minvalue 2 increment by 10;

-- all course IDs will end in 3
create sequence CourseCounter minvalue 3 increment by 10;

-- all section IDs will end in 4
create sequence SectionCounter minvalue 4 increment by 10;

-- all location IDs will end in 5
create sequence LocationCounter minvalue 5 increment by 10;


-- populate student table
INSERT INTO STUDENT ( studentid, firstname, lastname, mi, address, city, state, zip, homephone, workphone, email, dob, pin, status
) VALUES (studentcounter.nextval, 'Booky', 'Phillips', 'L', 'PO BOX 339', 'Pickerington', 'OH', '43147-9998', '6142812811', '6142541254', 'bphillips@email.com', '12-JAN-1963', '15246', 'F');
INSERT INTO STUDENT ( studentid, firstname, lastname, mi, address, city, state, zip, homephone, workphone, email, dob, pin, status
) VALUES (studentcounter.nextval, 'Denise', 'Miller', 'S', '172 E Main St', 'Columbus', 'OH', '43215-9997', '6145412544', '6142541254', 'dsmith@email.com', '01-FEB-1964', '45246', 'S');
INSERT INTO STUDENT ( studentid, firstname, lastname, mi, address, city, state, zip, homephone, workphone, email, dob, pin, status
) VALUES (studentcounter.nextval, 'Rocky', 'Smith', 'R', '45 Broad St', 'Westerville', 'OH', '43081-8888', '6145542211', '6142541254', 'rsmith@email.com', '02-APR-1950', '99999', 'J');
INSERT INTO STUDENT ( studentid, firstname, lastname, mi, address, city, state, zip, homephone, workphone, email, dob, pin, status
) VALUES (studentcounter.nextval, 'Tammy', 'Stone', 'B', '88 E Broad St', 'Columbus', 'OH', '43215-7777', '6142812811', '6142541254', 'Tstone@email.com', '04-MAR-1958', '88855', 'R');
INSERT INTO STUDENT ( studentid, firstname, lastname, mi, address, city, state, zip, homephone, workphone, email, dob, pin, status
) VALUES (studentcounter.nextval, 'Anne', 'Thomas', 'P', '172 E State St', 'Columbus', 'OH', '43215-7777', '6144667245', '6142541254', 'athomas@email.com', '05-MAY-1971', '99911', 'F');
INSERT INTO STUDENT ( studentid, firstname, lastname, mi, address, city, state, zip, homephone, workphone, email, dob, pin, status
) VALUES (studentcounter.nextval, 'Paula', 'Miller', 'R', '250 Civic Center Dr', 'Columbus', 'OH', '43215-8888', '6142812811', '6142541254', 'Pthomas@email.com', '06- JuN-1972', '44555', 'R');
INSERT INTO STUDENT ( studentid, firstname, lastname, mi, address, city, state, zip, homephone, workphone, email, dob, pin, status
) VALUES (studentcounter.nextval, 'Melissa', 'Harrison', 'G', 'PO BOX 154', 'Obetz', 'OH', '43147-4444', '6142812811', '6142541254', 'mHarrison@email.com', '07-JUL-1974', '77898', 'J');
INSERT INTO STUDENT ( studentid, firstname, lastname, mi, address, city, state, zip, homephone, workphone, email, dob, pin, status
) VALUES (studentcounter.nextval, 'Ellen', 'Andrews', 'M', '17 E State St', 'Columbus', 'OH', '43215-5555', '6145415411', '6142541254', 'EAndrews@email.com', '08-AUG-1964', '11512', 'F');
INSERT INTO STUDENT ( studentid, firstname, lastname, mi, address, city, state, zip, homephone, workphone, email, dob, pin, status
) VALUES (studentcounter.nextval, 'Mary', 'Green', 'S', '10 Broad Meadows Ct', 'Columbus', 'OH', '43214-6666', '6142812811', '6142541254', 'mGreen@email.com', '09-SEP-1963', '04455', 'S');
INSERT INTO STUDENT ( studentid, firstname, lastname, mi, address, city, state, zip, homephone, workphone, email, dob, pin, status
) VALUES (studentcounter.nextval, 'Michael', 'Jones', 'W', '23 E Main St', 'Circleville', 'OH', '43113-4444', '6145415455', '6142541254', 'mjones@email.com', '10-OCT-1973', '55246', 'J');
INSERT INTO STUDENT ( studentid, firstname, lastname, mi, address, city, state, zip, homephone, workphone, email, dob, pin, status
) VALUES (studentcounter.nextval, 'Timothy', 'Johnson', 'T', '45 S Scioto', 'Circleville', 'OH', '43113-3333', '4281281122', '6142541254', 'tjohnson@email.com', '11-NOV-1975', '95246', 'F');
INSERT INTO STUDENT ( studentid, firstname, lastname, mi, address, city, state, zip, homephone, workphone, email, dob, pin, status
) VALUES (studentcounter.nextval, 'Ryan', 'Moore', 'E', '90 N Court St', 'Pickerington', 'OH', '43147-6666', '6145454455', '6142541254', 'Rmoore@email.com', '12-DEC-1978', '65246', 'R');
INSERT INTO STUDENT ( studentid, firstname, lastname, mi, address, city, state, zip, homephone, workphone, email, dob, pin, status
) VALUES (studentcounter.nextval, 'Theresa', 'Anderson', 'C', '8 W High St', 'Columbus', 'OH', '43207-7777', '6145414455', '6142541254', 'tanderson@email.com', '03-APR-1973', '5746', 'S');
INSERT INTO STUDENT ( studentid, firstname, lastname, mi, address, city, state, zip, homephone, workphone, email, dob, pin, status
) VALUES (studentcounter.nextval, 'Cathy', 'Ream', 'A', '123 Weber Rd', 'Worthington', 'OH', '43085-6666', '6148845544', '6142541254', 'Cream@email.com', '01-AUG-1968', '28246', 'R');
INSERT INTO STUDENT ( studentid, firstname, lastname, mi, address, city, state, zip, homephone, workphone, email, dob, pin, status
) VALUES (studentcounter.nextval, 'Toni', 'Baloney', 'R', '2210 Trent Rd', 'Columbus', 'OH', '43229-8888', '6142812811', '6142541254', 'Tbaloney@email.com', '07-OCT-1969', '09090', 'J');
INSERT INTO STUDENT ( studentid, firstname, lastname, mi, address, city, state, zip, homephone, workphone, email, dob, pin, status
) VALUES (studentcounter.nextval, 'Daphne', 'Miller', 'R', '10 Main St', 'Obetz', 'OH', '43101-4444', '6145415477', '6142541254', 'dmiller@email.com', '02-MAR-1971', '34343', 'F');
INSERT INTO STUDENT ( studentid, firstname, lastname, mi, address, city, state, zip, homephone, workphone, email, dob, pin, status
) VALUES (studentcounter.nextval, 'Keith', 'Palmer', 'W', '205 Court St', 'Circleville', 'OH', '43113-9909', '7402812811', '6142541254', 'kpalmer@email.com', '22-JAN-1974', '84575', 'F');
INSERT INTO STUDENT ( studentid, firstname, lastname, mi, address, city, state, zip, homephone, workphone, email, dob, pin, status
) VALUES (studentcounter.nextval, 'Renee', 'Pierson', 'S', '4578 Heatherton Dr', 'Columbus', 'OH', '43229-1234', '6148461415', '6142541254', 'rpierson@email.com', '04-JAN-1978', '98789', 'J');
INSERT INTO STUDENT ( studentid, firstname, lastname, mi, address, city, state, zip, homephone, workphone, email, dob, pin, status
) VALUES (studentcounter.nextval, 'Maria', 'Gordon', 'P', '5515 Briarcliff', 'Reynoldsburg', 'OH', '43068-5644', '6142812811', '6142541254', 'mgordons@email.com', '12-Feb-1975', '43422', 'R');
INSERT INTO STUDENT ( studentid, firstname, lastname, mi, address, city, state, zip, homephone, workphone, email, dob, pin, status
) VALUES (studentcounter.nextval, 'Randy', 'Thompson', ' ', '1459 Northtown Blvd', 'Columbus', 'OH', '43229-4551', '6148891544', '6142541254', 'rthompson@email.com', '12-JAN-1963', '65454', 'S'); 
INSERT INTO STUDENT ( studentid, firstname, lastname, mi, address, city, state, zip, homephone, workphone, email, dob, pin, status
) VALUES (studentcounter.nextval, 'Nicholas', 'Cavallaro', 'H', '3506 Beulah rd', 'Columbus', 'OH', '43224-****', '6146206425', '6146206425', 'ncavallaro@student.cscc.edu', '15-OCT-1987', '12345', 'S'); 


-- populate Faculty table
INSERT INTO FACULTY ( facultyid, firstname, lastname, mi, workphone, cellphone, rank, experience, status
) VALUES (facultycounter.nextval, 'sam', 'cook', 'p', '6142812811', '6142541254', 'newbie', '5 YEARS', 'A');
INSERT INTO FACULTY ( facultyid, firstname, lastname, mi, workphone, cellphone, rank, experience, status
) VALUES (facultycounter.nextval, 'mike', 'jones', 'l', '6142812811', '6142541254', 'historian', '3 YEARS', 'T');
INSERT INTO FACULTY ( facultyid, firstname, lastname, mi, workphone, cellphone, rank, experience, status
) VALUES (facultycounter.nextval, 'denise', 'smith', 'h', '6142812811', '6142541254', 'professor', '25 YEARS', 'A');
INSERT INTO FACULTY ( facultyid, firstname, lastname, mi, workphone, cellphone, rank, experience, status
) VALUES (facultycounter.nextval, 'tim', 'miller', 'o', '6142812811', '6142541254', 'Adjunct', '5 YEARS', 'L');
INSERT INTO FACULTY ( facultyid, firstname, lastname, mi, workphone, cellphone, rank, experience, status
) VALUES (facultycounter.nextval, 'ann', 'meek', 'p', '6142812811', '6142541254', 'Professor', '35 YEARS', 'R');
INSERT INTO FACULTY ( facultyid, firstname, lastname, mi, workphone, cellphone, rank, experience, status
) VALUES (facultycounter.nextval, 'betty', 'lane', 'w', '6142812811', '6142541254', 'associate', '5 YEARS', 'A');
INSERT INTO FACULTY ( facultyid, firstname, lastname, mi, workphone, cellphone, rank, experience, status
) VALUES (facultycounter.nextval, 'greg', 'morris', 's', '6142812811', '6142541254', 'Professor', '5 YEARS', 'L');
INSERT INTO FACULTY ( facultyid, firstname, lastname, mi, workphone, cellphone, rank, experience, status
) VALUES (facultycounter.nextval, 'wayne', 'grill', 'a', '6142812811', '6142541254', 'associate', '15 YEARS', 'R');
INSERT INTO FACULTY ( facultyid, firstname, lastname, mi, workphone, cellphone, rank, experience, status
) VALUES (facultycounter.nextval, 'mika', 'wiley', 'q', '6142812811', '6142541254', 'associaTe', '10 YEARS', 'A');
INSERT INTO FACULTY ( facultyid, firstname, lastname, mi, workphone, cellphone, rank, experience, status
) VALUES (facultycounter.nextval, 'debbie', 'wine', 'y', '6142812811', '6142541254', 'Adjunct', '5 YEARS', 'L');
INSERT INTO FACULTY ( facultyid, firstname, lastname, mi, workphone, cellphone, rank, experience, status
) VALUES (facultycounter.nextval, 'sonya', 'fellows', 'z', '6142812811', '6142541254', 'associate', '5 YEARS', 'A');
INSERT INTO FACULTY ( facultyid, firstname, lastname, mi, workphone, cellphone, rank, experience, status
) VALUES (facultycounter.nextval, 'leslie', 'merritt', 'p', '6142812811', '6142541254', 'professor', '35 YEARS', 'R');
INSERT INTO FACULTY ( facultyid, firstname, lastname, mi, workphone, cellphone, rank, experience, status
) VALUES (facultycounter.nextval, 'thomas', 'prist', 'l', '6142812811', '6142541254', 'associate', '5 YEARS', 'A');
INSERT INTO FACULTY ( facultyid, firstname, lastname, mi, workphone, cellphone, rank, experience, status
) VALUES (facultycounter.nextval, 'rodney', 'reynolds', 'm', '6142812811', '6142541254', 'TA', '2 YEARS', 'A');
INSERT INTO FACULTY ( facultyid, firstname, lastname, mi, workphone, cellphone, rank, experience, status
) VALUES (facultycounter.nextval, 'cathy', 'frazier', 'n', '6142812811', '6142541254', 'associate', '5 YEARS', 'A');
INSERT INTO FACULTY ( facultyid, firstname, lastname, mi, workphone, cellphone, rank, experience, status
) VALUES (facultycounter.nextval, 'Shaun', 'Ferguson', 'M', '0118999881', '9991197253', 'professor', '8 YEARS', 'A'); 
INSERT INTO FACULTY ( facultyid, firstname, lastname, mi, workphone, cellphone, rank, experience, status
) VALUES (facultycounter.nextval, 'Elizabeth', 'Newman', 'K', '6148675309', '6143287448', 'professor', '2 YEARS', 'A');
INSERT INTO FACULTY ( facultyid, firstname, lastname, mi, workphone, cellphone, rank, experience, status
) VALUES (facultycounter.nextval, 'Matthew', 'Heywood', 'R', '6143825633', '0123456789', 'professor', '7 YEARS', 'A');
INSERT INTO FACULTY ( facultyid, firstname, lastname, mi, workphone, cellphone, rank, experience, status
) VALUES (facultycounter.nextval, 'Madeline', 'Cardona-Lebron', ' ', '0123456789', '0987654321', 'professor', '4 YEARS', 'A');   

-- populate course table
INSERT INTO COURSE (courseid, coursenumber, coursename, description, credithours, status ) VALUES (coursecounter.nextval, 'ACT-1211', 'Financial Accounting', 'Financial Accounting', '3', 'E');
INSERT INTO COURSE (courseid, coursenumber, coursename, description, credithours, status) VALUES (coursecounter.nextval, 'CSCI-2370', 'Database Systems', 'Database Systems', '3', 'I');
INSERT INTO COURSE (courseid, coursenumber, coursename, description, credithours, status) VALUES (coursecounter.nextval, 'CSCI-2489', 'Mobile Development', 'Mobile Development', '4', 'D');
INSERT INTO COURSE (courseid, coursenumber, coursename, description, credithours, status) VALUES (coursecounter.nextval, 'CSCI-2447', 'JavaScript Fundamentals', 'JavaScript Fundamentals', '4', 'B');
INSERT INTO COURSE (courseid, coursenumber, coursename, description, credithours, status) VALUES (coursecounter.nextval, 'CSCI-2412', 'Web Database', 'Web Database', '3', 'A');
INSERT INTO COURSE (courseid, coursenumber, coursename, description, credithours, status) VALUES (coursecounter.nextval, 'GIS-2100', 'Intro to GIS Data', 'Intro to GIS Data', '3', 'E');
INSERT INTO COURSE (courseid, coursenumber, coursename, description, credithours, status) VALUES (coursecounter.nextval, 'GIS-1102', 'GIS in Industry', 'GIS in Industry', '4', 'I');
INSERT INTO COURSE (courseid, coursenumber, coursename, description, credithours, status) VALUES (coursecounter.nextval, 'GIS-1101', 'Acquire GIS Data', 'Acquire GIS Data', '4', 'E');
INSERT INTO COURSE (courseid, coursenumber, coursename, description, credithours, status) VALUES (coursecounter.nextval, 'HOSP-1153', 'Nutrition', 'Nutrition', '3', 'D');
INSERT INTO COURSE (courseid, coursenumber, coursename, description, credithours, status) VALUES (coursecounter.nextval, 'HOSP-1109', 'Food Principles', 'Food Principles', '3', 'S');
INSERT INTO COURSE (courseid, coursenumber, coursename, description, credithours, status) VALUES (coursecounter.nextval, 'IMM-2601', 'Game Development', 'Game Development', '4', 'R');
INSERT INTO COURSE (courseid, coursenumber, coursename, description, credithours, status) VALUES (coursecounter.nextval, 'IMM-1530', 'Screenwriting', 'Screenwriting', '4', 'Z');
INSERT INTO COURSE (courseid, coursenumber, coursename, description, credithours, status) VALUES (coursecounter.nextval, 'MKTG-1110', 'Marketing Principles', 'Marketing Principles', '3', 'U');
INSERT INTO COURSE (courseid, coursenumber, coursename, description, credithours, status) VALUES (coursecounter.nextval, 'SES-1006', 'Intro to Golf', 'Intro to Golf', '3', 'Y');
INSERT INTO COURSE (courseid, coursenumber, coursename, description, credithours, status) VALUES (coursecounter.nextval, 'SES-2216', 'Basics of Golf', 'Basics of Golf', '4', 'B');
INSERT INTO COURSE (courseid, coursenumber, coursename, description, credithours, status) VALUES (coursecounter.nextval, 'CSCI-1610', 'Object Oriented Analysis', 'Object Oriented Programming', '3', 'B');
INSERT INTO COURSE (courseid, coursenumber, coursename, description, credithours, status) VALUES (coursecounter.nextval, 'CSCI-1145', 'HTML', 'intro to web development', '3', 'B');
INSERT INTO COURSE (courseid, coursenumber, coursename, description, credithours, status) VALUES (coursecounter.nextval, 'PHIL-1150', 'Introduction to Logic', 'Introduction to Logic', '3', 'B');




-- populate Section table
INSERT INTO SECTION (sectionid, courseid, SectionNumber, Days, Starttime, endtime, locationid, SeatsAvailable, Status) 
VALUES (sectioncounter.nextval, 3, 'B1-H', 'Tue', '22-MAY-13', '3-AUG-13', 29995, 23, 'A');
INSERT INTO SECTION (sectionid, courseid, SectionNumber, Days, Starttime, endtime, locationid, SeatsAvailable, Status) 
VALUES (sectioncounter.nextval, 413, 'C1-H', 'Wed', '22-MAY-13', '3-AUG-13',39995, 23, 'C');
INSERT INTO SECTION (sectionid, courseid, SectionNumber, Days, Starttime, endtime, locationid, SeatsAvailable, Status) 
VALUES (sectioncounter.nextval, 23, 'D1-W', 'Thur', '22-MAY-13', '3-AUG-13',49995, 23, 'F');
INSERT INTO SECTION (sectionid, courseid, SectionNumber, Days, Starttime, endtime, locationid, SeatsAvailable, Status) 
VALUES (sectioncounter.nextval, 23, 'E1-2', 'Fri', '22-MAY-13', '3-AUG-13',59995, 23, 'D');
INSERT INTO SECTION (sectionid, courseid, SectionNumber, Days, Starttime, endtime, locationid, SeatsAvailable, Status) 
VALUES (sectioncounter.nextval, 313, 'F1-B', 'Sat', '22-MAY-13', '3-AUG-13',69995, 23, 'E');
INSERT INTO SECTION (sectionid, courseid, SectionNumber, Days, Starttime, endtime, locationid, SeatsAvailable, Status) 
VALUES (sectioncounter.nextval, 33, 'G1-B', 'Mon', '22-MAY-13', '3-AUG-13',79995, 23, 'E');
INSERT INTO SECTION (sectionid, courseid, SectionNumber, Days, Starttime, endtime, locationid, SeatsAvailable, Status) 
VALUES (sectioncounter.nextval, 63, 'H1-HWB', 'Tue', '22-MAY-13', '3-AUG-13',89995, 23, 'R');
INSERT INTO SECTION (sectionid, courseid, SectionNumber, Days, Starttime, endtime, locationid, SeatsAvailable, Status) 
VALUES (sectioncounter.nextval, 123, 'I1-HWB', 'Wed', '22-MAY-13', '3-AUG-13',99995, 23, 'T');
INSERT INTO SECTION (sectionid, courseid, SectionNumber, Days, Starttime, endtime, locationid, SeatsAvailable, Status) 
VALUES (sectioncounter.nextval, 73, 'J1-HWB', 'Thur', '22-MAY-13', '3-AUG-13',9995, 23, 'U');
INSERT INTO SECTION (sectionid, courseid, SectionNumber, Days, Starttime, endtime, locationid, SeatsAvailable, Status)
VALUES (sectioncounter.nextval, 213, 'K1-HWB', 'Fri', '22-MAY-13', '3-AUG-13',229995, 23, 'A');
INSERT INTO SECTION (sectionid, courseid, SectionNumber, Days, Starttime, endtime, locationid, SeatsAvailable, Status)
VALUES (sectioncounter.nextval, 63, 'L1-HWB', 'Sat', '22-MAY-13', '3-AUG-13',2439870005, 23, 'G');
INSERT INTO SECTION (sectionid, courseid, SectionNumber, Days, Starttime, endtime, locationid, SeatsAvailable, Status)
VALUES (sectioncounter.nextval, 43, 'M1-W', 'Tue', '22-MAY-13', '3-AUG-13',2249870005, 23, 'A');
INSERT INTO SECTION (sectionid, courseid, SectionNumber, Days, Starttime, endtime, locationid, SeatsAvailable, Status)
VALUES (sectioncounter.nextval, 53, 'N1-W', 'Thur', '22-MAY-13', '3-AUG-13',2259870005, 23, 'Y');
INSERT INTO SECTION (sectionid, courseid, SectionNumber, Days, Starttime, endtime, locationid, SeatsAvailable, Status)
VALUES (sectioncounter.nextval, 3, 'O1-W', 'Mon', '22-MAY-13', '3-AUG-13',2269870005, 23, 'A');
INSERT INTO SECTION (sectionid, courseid, SectionNumber, Days, Starttime, endtime, locationid, SeatsAvailable, Status)
VALUES (sectioncounter.nextval, 83, 'P1-H', 'Fri', '22-MAY-13', '3-AUG-13',2279870005, 23, 'R');
INSERT INTO SECTION (sectionid, courseid, SectionNumber, Days, Starttime, endtime, locationid, SeatsAvailable, Status)
VALUES (sectioncounter.nextval, 33, 'Q1-H', 'Sat', '22-MAY-13', '3-AUG-13',2289870005, 23, 'E');
INSERT INTO SECTION (sectionid, courseid, SectionNumber, Days, Starttime, endtime, locationid, SeatsAvailable, Status)
VALUES (sectioncounter.nextval, 213, 'R1-H', 'Tue', '22-MAY-13', '3-AUG-13',2299870005, 23, 'W');
INSERT INTO SECTION (sectionid, courseid, SectionNumber, Days, Starttime, endtime, locationid, SeatsAvailable, Status)
VALUES (sectioncounter.nextval, 443, 'S1-WE', 'Tue', '22-MAY-13', '3-AUG-13',2309870005, 23, 'I');
INSERT INTO SECTION (sectionid, courseid, SectionNumber, Days, Starttime, endtime, locationid, SeatsAvailable, Status)
VALUES (sectioncounter.nextval, 223, 'T1-WE', 'Tue', '22-MAY-13', '3-AUG-13',2319870005, 23, 'W');
INSERT INTO SECTION (sectionid, courseid, SectionNumber, Days, Starttime, endtime, locationid, SeatsAvailable, Status)
VALUES (sectioncounter.nextval, 63, 'U1-LE', 'Tue', '22-MAY-13', '3-AUG-13',229995, 23, 'N');
INSERT INTO SECTION (sectionid, courseid, SectionNumber, Days, Starttime, endtime, locationid, SeatsAvailable, Status) 
VALUES (sectioncounter.nextval, 43, 'V1-LE', 'Tue', '22-MAY-13', '3-AUG-13',2439870005, 23, 'W');
INSERT INTO SECTION (sectionid, courseid, SectionNumber, Days, Starttime, endtime, locationid, SeatsAvailable, Status)
VALUES (sectioncounter.nextval, 993, 'W1-LE', 'Tue', '22-MAY-13', '3-AUG-13',2249870005, 23, 'A');
INSERT INTO SECTION (sectionid, courseid, SectionNumber, Days, Starttime, endtime, locationid, SeatsAvailable, Status)
VALUES (sectioncounter.nextval, 8873, 'X1-BTW', 'Tue', '22-MAY-13', '3-AUG-13',2259870005, 23, 'A');
INSERT INTO SECTION (sectionid, courseid, SectionNumber, Days, Starttime, endtime, locationid, SeatsAvailable, Status)
VALUES (sectioncounter.nextval, 1123, 'Y1-BTW', 'Tue', '22-MAY-13', '3-AUG-13',2269870005, 23, 'I');
INSERT INTO SECTION (sectionid, courseid, SectionNumber, Days, Starttime, endtime, locationid, SeatsAvailable, Status) 
VALUES (sectioncounter.nextval, 3213, 'A1-BTW', 'Mon', '22-MAY-13', '3-AUG-13', 19995, 23, 'O'); 
INSERT INTO SECTION (sectionid, courseid, SectionNumber, Days, Starttime, endtime, locationid, SeatsAvailable, Status) 
VALUES (sectioncounter.nextval, 13, 'B01-96484', 'Mon', '29-AUG-16', '17-DEC-16', 19995, 24, 'O'); 
INSERT INTO SECTION (sectionid, courseid, SectionNumber, Days, Starttime, endtime, locationid, SeatsAvailable, Status) 
VALUES (sectioncounter.nextval, 173, 'W01-95846', ' ', '29-AUG-16', '17-DEC-16', 225, 24, 'O');
INSERT INTO SECTION (sectionid, courseid, SectionNumber, Days, Starttime, endtime, locationid, SeatsAvailable, Status) 
VALUES (sectioncounter.nextval, 163, 'B02-96463', 'Thur', '29-AUG-16', '17-DEC-16', 215, 24, 'O');
INSERT INTO SECTION (sectionid, courseid, SectionNumber, Days, Starttime, endtime, locationid, SeatsAvailable, Status) 
VALUES (sectioncounter.nextval, 153, 'B01-96475', 'Wed', '29-AUG-16', '17-DEC-16', 205, 24, 'O');


-- populate Location table
INSERT INTO Location (locationid, Building, Room, Capacity, status) VALUES (locationcounter.nextval, 'Eibling Hall', '209', 00030, 'A');
INSERT INTO Location (locationid, Building, Room, Capacity, status) VALUES (locationcounter.nextval, 'Delaware Hall', '210', 00030, 'B');
INSERT INTO Location (locationid, Building, Room, Capacity, status) VALUES (locationcounter.nextval, 'Nestor Hall', '211', 00030, 'C');
INSERT INTO Location (locationid, Building, Room, Capacity, status) VALUES (locationcounter.nextval, 'Delaware', '212', 00030, 'D');
INSERT INTO Location (locationid, Building, Room, Capacity, status) VALUES (locationcounter.nextval, 'Eibling Hall', '213', 00030, 'E');
INSERT INTO Location (locationid, Building, Room, Capacity, status) VALUES (locationcounter.nextval, 'Acquinas Hall', '214', 00030, 'F');
INSERT INTO Location (locationid, Building, Room, Capacity, status) VALUES (locationcounter.nextval, 'Nestor Hall', '215', 00030, 'G');
INSERT INTO Location (locationid, Building, Room, Capacity, status) VALUES (locationcounter.nextval, 'Eibling Hall', '216', 00030, 'H');
INSERT INTO Location (locationid, Building, Room, Capacity, status) VALUES (locationcounter.nextval, 'Nestor Hall', '217', 00030, 'I');
INSERT INTO Location (locationid, Building, Room, Capacity, status) VALUES (locationcounter.nextval, 'Eibling Hall', '218', 00030, 'J');
INSERT INTO Location (locationid, Building, Room, Capacity, status) VALUES (locationcounter.nextval, 'Delaware Hall', '220', 00030, 'K');
INSERT INTO Location (locationid, Building, Room, Capacity, status) VALUES (locationcounter.nextval, 'Eibling Hall', '221', 00030, 'L');
INSERT INTO Location (locationid, Building, Room, Capacity, status) VALUES (locationcounter.nextval, 'Eibling Hall', '222', 00030, 'M');
INSERT INTO Location (locationid, Building, Room, Capacity, status) VALUES (locationcounter.nextval, 'Eibling Hall', '223', 00030, 'N');
INSERT INTO Location (locationid, Building, Room, Capacity, status) VALUES (locationcounter.nextval, 'Eibling Hall', '224', 00030, 'O');
INSERT INTO Location (locationid, Building, Room, Capacity, status) VALUES (locationcounter.nextval, 'Delaware Hall', '220', 00030, 'P');
INSERT INTO Location (locationid, Building, Room, Capacity, status) VALUES (locationcounter.nextval, 'Eibling Hall', '221', 00030, 'Q');
INSERT INTO Location (locationid, Building, Room, Capacity, status) VALUES (locationcounter.nextval, 'Delaware Hall', '222', 00030, 'R');
INSERT INTO Location (locationid, Building, Room, Capacity, status) VALUES (locationcounter.nextval, 'Acquinas Hall', '223', 00030, 'S');
INSERT INTO Location (locationid, Building, Room, Capacity, status) VALUES (locationcounter.nextval, 'Eibling Hall', '224', 00030, 'T');
INSERT INTO Location (locationid, Building, Room, Capacity, status) VALUES (locationcounter.nextval, 'Delaware Hall', '202', 00030, 'T');
INSERT INTO Location (locationid, Building, Room, Capacity, status) VALUES (locationcounter.nextval, 'Delaware Hall', '109', 00030, 'T'); 
INSERT INTO Location (locationid, Building, Room, Capacity, status) VALUES (locationcounter.nextval, 'Delaware Hall', '209', 00030, 'T');

--create indexes
create index student_id on student(studentid);
create index student_lastname on student(lastname);
create index faculty_id on faculty(facultyid);
create index faculty_lastname on faculty(lastname);
create index seciton_courseid on section(courseid);
create index section_location on section(locationid);
create index course_name on course(coursename);
create index course_number on course(coursenumber);
create index location_room on location(room);
create index location_building on location(building);

--clear the screen
clear screen

select sysdate as v_date from dual;

--create reports
ttitle left 'date: 2016-Oct-10' center 'Students' right 'page: ' sql.pno;
btitle center 'Created by Nick Cavallaro' right 'Page:' sql.pno;
select * from student;
ttitle left 'date: 2016-Oct-10 ' center 'Faculty members' right 'Page: ' sql.pno;
select * from faculty;
ttitle left 'date: 2016-Oct-10 ' center 'Available courses' right 'Page:' sql.pno;
select * from course;
ttitle left 'date: 2016-Oct-10 ' center 'Course Sections' right 'Page:' sql.pno;
select * from section;
ttitle left 'date: 2016-Oct-10 ' center 'Locations' right 'Page:' sql.pno;
select * from location;
ttitle off;
btitle off;


--Lab 2 Starts here
clear screen


--update data to fit constraints

update section set courseid = '53' where courseid = '413';
update section set courseid = '63' where courseid = '313';
update section set courseid = '73' where courseid = '123';
update section set courseid = '43' where courseid = '213';
update section set courseid = '33' where courseid = '443';
update section set courseid = '23' where courseid = '223';
update section set courseid = '3' where courseid = '993';
update section set courseid = '83' where courseid = '8873';
update section set courseid = '93' where courseid = '1123';
update section set courseid = '103' where courseid = '3213';
update section set locationid = '5' where locationid = '29995';
update section set locationid = '15' where locationid = '39995';
update section set locationid = '25' where locationid = '49995';
update section set locationid = '35' where locationid = '59995';
update section set locationid = '45' where locationid = '69995';
update section set locationid = '55' where locationid = '79995';
update section set locationid = '65' where locationid = '89995';
update section set locationid = '75' where locationid = '99995';
update section set locationid = '85' where locationid = '9995';
update section set locationid = '95' where locationid = '229995';
update section set locationid = '105' where locationid = '2439870005';
update section set locationid = '115' where locationid = '2249870005';
update section set locationid = '125' where locationid = '2259870005';
update section set locationid = '135' where locationid = '2269870005';
update section set locationid = '145' where locationid = '2279870005';
update section set locationid = '155' where locationid = '2289870005';
update section set locationid = '165' where locationid = '2299870005';
update section set locationid = '175' where locationid = '2309870005';
update section set locationid = '185' where locationid = '2319870005';
update section set locationid = '195' where locationid = '19995';
update section set days = 'M' where days = 'Mon';
update section set days = 'T' where days = 'Tue';
update section set days = 'W' where days = 'Wed';
update section set days = 'R' where days = 'Thur';
update section set days = 'F' where days = 'Fri';
update section set days = 'S' where days = 'Sat';
update section set days = 'U' where days = 'Sun';
update section set days = 'U' where days = ' ';
update student set status = 'C' where status in ('F', 'S');
update student set status = 'T' where status in ('J', 'R');
update faculty set status = 'A' where status in ('T', 'L');
update faculty set status = 'F' where status = 'R';
update course set status = 'A' where status in ('E', 'D', 'B', 'S');
update course set status = 'I' where status in ('R', 'Z', 'U', 'Y');
update Section set status = 'A' where status in ('E', 'C', 'F', 'D', 'R', 'T', 'U');
update section set status = 'I' where status in ( 'G', 'Y', 'W', 'N', 'O');
update location set status = 'A' where status in ('B', 'C', 'D', 'E', 'F', 'G', 'H');
update location set status = 'I' where status in ('J','K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T');
update section set starttime = to_date('08/29/2016 08:00', 'mm/dd/yyyy hh:mi AM') where starttime = to_date('05/22/2013', 'mm/dd/yyyy');
update section set endtime = to_date('12/17/2016 12:00 PM', 'mm/dd/yyyy hh:mi AM') where endtime = to_date('08/03/2013', 'mm/dd/yyyy');
update section set starttime = to_date('08/29/2016 00:00 AM', 'mm/dd/yyyy hh:mi AM') where sectionid = 264;
update section set starttime = to_date('08/29/2016 06:00 PM', 'mm/dd/yyyy hh:mi AM') where sectionid = 274;
update section set starttime = to_date('08/29/2016 06:00 PM', 'mm/dd/yyyy hh:mi AM') where sectionid = 284;
update section set endtime = to_date('08/29/2016 00:00 AM', 'mm/dd/yyyy hh:mi AM') where sectionid = 264;
update section set endtime = to_date('08/29/2016 09:00 PM', 'mm/dd/yyyy hh:mi AM') where sectionid = 274;
update section set endtime = to_date('08/29/2016 09:00 PM', 'mm/dd/yyyy hh:mi AM') where sectionid = 284;
update section set starttime = to_date('08/29/2016 06:00 PM', 'mm/dd/yyyy hh:mi AM') where sectionid = 254;
update section set endtime = to_date('08/29/2016 09:00 PM', 'mm/dd/yyyy hh:mi AM') where sectionid = 254;
update section set locationid = '25' where sectionid = '114';
update student set zip = '43224-9999' where studentid = 201;
update student set mi = '' where mi = ' ';

-- add constraints

alter table student add constraint student_id_pk Primary key (StudentID);
alter table course add constraint course_id_pk Primary key (CourseID);
alter table location add constraint location_id_pk Primary key (LocationID);
alter table faculty add constraint faculty_id_pk Primary key (FacultyID);
alter table section add constraint section_id_pk Primary key (SectionID);
alter table section add constraint section_courseid_fk Foreign key (CourseID) references Course (CourseID);
alter table section add constraint section_location_fk Foreign key (LocationID) references Location (LocationID);
alter table student add constraint pin_not_null_cc check (pin is not null);
alter table section add constraint section_days_cc CHECK (REGEXP_LIKE(days, '[MTWRFSU]'));
alter table section add constraint start_time_cc check (starttime < endtime);
alter table section add constraint seats_cc check (seatsavailable < 100);
alter table course add constraint credithours_max_cc check (CreditHours <= 6.0);
alter table student add constraint student_status_cc check (status in ('C', 'T'));
alter table faculty add constraint faculty_status_cc check (status in ('F', 'A'));
alter table course add constraint course_status_cc check (status in ('A', 'I'));
alter table section add constraint section_status_cc check (status in ('A', 'I'));
alter table location add constraint location_status_cc check (status in ('A', 'I'));
alter table section add constraint Location_Conflict_u unique (days, starttime, locationid);
alter table student add constraint student_zip_cc check (regexp_like (zip, '^[[:digit:]]{5}-[[:digit:]]{4}$'));
alter table student add constraint Mi_valid_character_cc check (mi is null or regexp_like(mi, '[[:alpha:]]'));

--create reports
ttitle left 'date: 2016-Oct-24' center 'Students' right 'page: ' sql.pno;
btitle center 'Created by Nick Cavallaro' right 'Page:' sql.pno;
select * from student;
ttitle left 'date: 2016-Oct-24 ' center 'Faculty members' right 'Page: ' sql.pno;
select * from faculty;
ttitle left 'date: 2016-Oct-24 ' center 'Available courses' right 'Page:' sql.pno;
select * from course;
ttitle left 'date: 2016-Oct-24 ' center 'Course Sections' right 'Page:' sql.pno;
select sectionid, courseid, sectionnumber, days, to_char(starttime, 'mm/dd/yyyy') "Start Date", to_char(endtime, 'mm/dd/yyyy') "End Date", to_char(starttime, 'hh:mi am') "Start Time", to_char(endtime, 'hh:mi am') "End Time", locationid, seatsavailable, status  from section;
ttitle left 'date: 2016-Oct-24 ' center 'Locations' right 'Page:' sql.pno;
select * from location;
ttitle off;
btitle off;



--LAB 3 STARTS HERE--
clear creen

-- create tables
create table Registration (
StudentID Number(10),
SectionID Number(10));

create table Grade(
StudentID Number(10),
SectionID Number(10),
Grade varchar2(2));

create table CourseInstructor (
SectionID Number(10),
FacultyID Number(10));

--create trigger to populate grade table
Create or replace trigger PopulateGrades
After insert on Registration
for each row 
begin
insert into grade (StudentID, SectionID) values(:new.StudentID, :new.sectionID);
end PopulateGrades;
/

--Create contraints on new tables
alter table Registration add constraint Registraion_StudentID_Fk Foreign Key (StudentID) references Student (StudentID);
alter table Registration add constraint Registraion_SectionID_FK Foreign Key (SectionID) references Section (SectionID);
alter table Registration add constraint Registration_ComposKey unique (StudentID, SectionID);
alter table Grade add constraint Grade_StudentID_FK foreign key (StudentID) references Student(StudentID);
alter table Grade add constraint Grade_SectionID_FK foreign key (SectionID) references Section (SectionID);
alter table Grade add constraint Grade_ComposKey unique (StudentID, SectionID);
alter table CourseInstructor add constraint CourseInstructor_SectionID_FK foreign key (SectionID) references Section (SectionID);
alter table CourseInstructor add constraint CourseInstructor_FacultyID_FK foreign key (FacultyID) references Faculty (FacultyID);
alter table CourseInstructor add constraint CourseInstructor_ComposKey unique (SectionID, FacultyID);

-- register students to sections
insert into Registration (StudentID, SectionID) Values(1, 4);
insert into Registration (StudentID, SectionID) Values(1, 14);
insert into Registration (StudentID, SectionID) Values(1, 24);
insert into Registration (StudentID, SectionID) Values(11, 4);
insert into Registration (StudentID, SectionID) Values(11, 44);
insert into Registration (StudentID, SectionID) Values(11, 54);
insert into Registration (StudentID, SectionID) Values(21, 4);
insert into Registration (StudentID, SectionID) Values(21, 64);
insert into Registration (StudentID, SectionID) Values(21, 74);
insert into Registration (StudentID, SectionID) Values(31, 4);
insert into Registration (StudentID, SectionID) Values(31, 84);
insert into Registration (StudentID, SectionID) Values(31, 94);
insert into Registration (StudentID, SectionID) Values(41, 4);
insert into Registration (StudentID, SectionID) Values(41, 104);
insert into Registration (StudentID, SectionID) Values(41, 114);
insert into Registration (StudentID, SectionID) Values(51, 4);
insert into Registration (StudentID, SectionID) Values(51, 124);
insert into Registration (StudentID, SectionID) Values(51, 134);
insert into Registration (StudentID, SectionID) Values(61, 4);
insert into Registration (StudentID, SectionID) Values(61, 144);
insert into Registration (StudentID, SectionID) Values(61, 154);
insert into Registration (StudentID, SectionID) Values(71, 4);
insert into Registration (StudentID, SectionID) Values(71, 164);
insert into Registration (StudentID, SectionID) Values(71, 174);
insert into Registration (StudentID, SectionID) Values(81, 4);
insert into Registration (StudentID, SectionID) Values(81, 184);
insert into Registration (StudentID, SectionID) Values(81, 194);
insert into Registration (StudentID, SectionID) Values(201, 254);
insert into Registration (StudentID, SectionID) Values(201, 264);
insert into Registration (StudentID, SectionID) Values(201, 274);
insert into Registration (StudentID, SectionID) Values(201, 284);
	
--assign faculty to sections
insert into CourseInstructor (SectionID, FacultyID) Values (4, 2);
insert into CourseInstructor (SectionID, FacultyID) Values (4, 12);
insert into CourseInstructor (SectionID, FacultyID) Values (4, 22);
insert into CourseInstructor (SectionID, FacultyID) Values (14, 2);
insert into CourseInstructor (SectionID, FacultyID) Values (14, 32);
insert into CourseInstructor (SectionID, FacultyID) Values (14, 42);
insert into CourseInstructor (SectionID, FacultyID) Values (24, 2);
insert into CourseInstructor (SectionID, FacultyID) Values (24, 52);
insert into CourseInstructor (SectionID, FacultyID) Values (24, 62);
insert into CourseInstructor (SectionID, FacultyID) Values (34, 2);
insert into CourseInstructor (SectionID, FacultyID) Values (34, 72);
insert into CourseInstructor (SectionID, FacultyID) Values (34, 82);
insert into CourseInstructor (SectionID, FacultyID) Values (44, 2);
insert into CourseInstructor (SectionID, FacultyID) Values (44, 92);
insert into CourseInstructor (SectionID, FacultyID) Values (44, 102);
insert into CourseInstructor (SectionID, FacultyID) Values (254, 152);
insert into CourseInstructor (SectionID, FacultyID) Values (264, 162);
insert into CourseInstructor (SectionID, FacultyID) Values (274, 172);
insert into CourseInstructor (SectionID, FacultyID) Values (284, 182);

-- create views
create or replace view StudentRegistration as 
select Student.StudentID, Student.LastName, Student.FirstName, course.coursename, section.SectionID, course.credithours, Section.Days, to_char(section.starttime, 'mm/dd/yyyy') "Start Date", to_char(section.endtime, 'mm/dd/yyyy') "End Date", to_char(section.starttime, 'hh:mi am') "Start Time", to_char(section.endtime, 'hh:mi am') "End Time"
from Student
Inner join Registration on(student.StudentID = Registration.StudentID)
inner join Section on (section.sectionID = registration.SectionID)
inner join course on (course.courseID = section.courseid);

create or replace view Instructors as
select Faculty.LastName, Faculty.FirstName, Course.CourseName, Section.SectionID, Section.Days, to_char(section.starttime, 'mm/dd/yyyy') "Start Date", to_char(section.endtime, 'mm/dd/yyyy') "End Date", to_char(section.starttime, 'hh:mi am') "Start Time", to_char(section.endtime, 'hh:mi am') "End Time", location.building, location.room
from Faculty
inner join CourseInstructor on (Faculty.FacultyID = CourseInstructor.FacultyID)
inner join section on (Section.SectionID = CourseInstructor.SectionID)
inner join Course on (Course.CourseID = Section.CourseID)
inner join Location on (Location.LocationID = section.LocationID);

--create reports
select * from StudentRegistration;
select * from Instructors;




-- LAB 4 STARTS HERE

--create cursor
declare
Cursor Student_Classes is
	select section.Sectionid, grade.studentid, course.courseid, substr(course.coursename, -1, 1)
		from grade, section, course
		where section.sectionid = grade.sectionid
		and section.courseid = course.courseid;
	my_sectionid number;
	my_studentid number;
	my_courseid number;
	my_lastletter char;
	begin
		open student_classes;
		loop --loop through each record in cursor
			fetch Student_classes into my_sectionid, my_studentid, my_courseid, my_lastletter;
			exit when student_classes%notfound;
			if lower(my_lastletter)  in('a','b','c','d','e','f') --check last letter of course name between a and f
				then update grade 
					set grade = 'A'
					where my_sectionid = grade.sectionID
					and my_studentid = grade.studentID;
			elsif lower(my_lastletter)  in('g','h', 'i', 'j', 'k') --check last letter of course name between g and k
				then update grade 
					set grade = 'B'
					where my_sectionid = grade.sectionID
					and my_studentid = grade.studentID;
			elsif lower(my_lastletter)  in('l','m','n','o','p') --check last letter of course name between l and p
				then update grade 
					set grade = 'C'
					where my_sectionid = grade.sectionID
					and my_studentid = grade.studentID;
			elsif lower(my_lastletter)  in('q','r','s','t') --check last letter of course name between q and t
				then update grade 
					set grade = 'D'
					where my_sectionid = grade.sectionID
					and my_studentid = grade.studentID;
			elsif lower(my_lastletter)  in('u','v','w','x','y','z') --check last letter of course name between u and z
				then update grade 
					set grade = 'E'
					where my_sectionid = grade.sectionID
					and my_studentid = grade.studentID;
			end if;
			commit;
		end loop;
		close student_classes;
	end;
	/
	
--create report	
create or replace view transcript as
select 
	student.studentid, student.lastname, student.firstname, course.coursename, grade.grade, section.sectionid, course.credithours, section.days, to_char(section.starttime, 'mm/dd/yyyy') "Start Date", 
	to_char(section.endtime, 'mm/dd/yyyy') "End Date", to_char(section.starttime, 'hh:mi am') "Start Time", to_char(section.endtime, 'hh:mi am') "End Time", location.building, faculty.lastname "Instructor last name", faculty.firstname "instructor first name"
from Student
inner join grade on (grade.studentid = student.studentid)
inner join Section on (section.sectionID = grade.SectionID)
inner join course on (course.courseID = section.courseid)
inner join courseinstructor on (courseinstructor.sectionid = section.sectionid)
inner join faculty on (faculty.facultyid = courseinstructor.facultyid)
inner join location on (location.locationid = section.locationid)
;

--display report
select * from transcript;



	