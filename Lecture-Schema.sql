/*
IDE USE: SQL SERVER 2012
*/

--Let's firstly create database to store tables for lecture's relational schema--
CREATE DATABASE ENFINT_SQL_ASSIGNMENT;

--statement to use the database created--
USE ENFINT_SQL_ASSIGNMENT;


--all the tables are surrounded by try catch to catch errors--
--TABLE 1--
--Statement for creating teacher table--
--Identity(100,11)--
GO
BEGIN TRY
CREATE TABLE TEACHER 
(
teacher_id INT CONSTRAINT PK_teacherID PRIMARY KEY,
first_name VARCHAR(40),
last_name  VARCHAR(40),
language_1 VARCHAR(3),
language_2 VARCHAR(3),
dob DATE,
tax_id INT UNIQUE,
phone_no VARCHAR(20)
);
END TRY
BEGIN CATCH
PRINT('ERROR: '+ERROR_MESSAGE())
END CATCH
GO


--TABLE 2--
--Statement for creating CLIENT table--
--IDENTITY(100,11)--
GO
BEGIN TRY
CREATE TABLE CLIENT 
(
client_id INT CONSTRAINT PK_ClientID PRIMARY KEY,
client_name VARCHAR(40),
address varchar(60),
industry varchar(20) 
);
END TRY
BEGIN CATCH
PRINT('ERROR: '+ERROR_MESSAGE())
END CATCH
GO

--TABLE 3--
--Statement for creating participant table--
--IDENTITY(100,11)--
GO
BEGIN TRY
CREATE TABLE PARTICIPANT 
(
participant_id INT CONSTRAINT PK_ParticipantID PRIMARY KEY,
first_name VARCHAR(40),
last_name VARCHAR(40),
phone_no VARCHAR(20),
client_id INT CONSTRAINT FK_ClientID FOREIGN KEY(client_id) REFERENCES CLIENT(client_id)
);
END TRY
BEGIN CATCH
PRINT('ERROR: '+ERROR_MESSAGE())
END CATCH
GO

--TABLE 4--
--Statement for creating COURSE table--
--IDENTITY(100,11)--
GO
BEGIN TRY
CREATE TABLE COURSE 
(
course_id INT CONSTRAINT PK_CourseID PRIMARY KEY , 
course_name VARCHAR(40),
language VARCHAR(3),
level VARCHAR(2),
course_length_weeks INT, 
start_date DATE,
in_school TINYINT,
teacher_id INT CONSTRAINT FK_teacherCID FOREIGN KEY(teacher_id) REFERENCES TEACHER(teacher_id),
client_id INT CONSTRAINT FK_clientCID FOREIGN KEY(client_id) REFERENCES CLIENT(client_id),
);
END TRY
BEGIN CATCH
PRINT('ERROR: '+ERROR_MESSAGE())
END CATCH
GO


--TABLE 5--
--Statement for creating TAKES_COURSE table--
GO
BEGIN TRY
CREATE TABLE TAKES_COURSE 
(
participant_id INT,
course_id INT,
CONSTRAINT PK_takesCourseID PRIMARY KEY (participant_id,course_id),
CONSTRAINT FK_participantTC FOREIGN KEY(participant_id) REFERENCES PARTICIPANT(participant_id),
CONSTRAINT FK_CourseTC FOREIGN KEY(course_id) REFERENCES COURSE(course_id),
);
END TRY
BEGIN CATCH
PRINT('ERROR: '+ERROR_MESSAGE())
END CATCH
GO


--QUESTION 2--

--Insert into Teacher--

GO
BEGIN TRY
INSERT INTO TEACHER VALUES
(100,'Jonase','Selowa','Eng','Zul',convert(date,'19-01-1954',104) ,400,'0818327069'),
(111,'Mashapole','Raletsemo','Sep','Eng',convert(date,'19-09-2000',104) ,401,'0657296720'),
(122,'Seloko','Sethe','Eng','Sep',convert(date,'10-06-1975',104) ,402,'0798019243'),
(133,'Moyabo','Gerald','Xho','Eng',convert(date,'01-11-1964',104) ,403,'0720352060'),
(144,'Jonase','Selowa','Eng','Zul',convert(date,'12-12-1975',104) ,404,'0860010111'),
(155,'Jonase','Selowa','Eng','Zul',convert(date,'09-11-1976',104) ,405,'0762349856'),
(166,'Mahlatse','Jakes','xho','Eng',convert(date,'12-01-1985',104) ,406,'0659847364'),
(177,'Jakes','Mathebula','Eng','Zul',convert(date,'09-10-1946',104) ,407,'0789016000');
END TRY
BEGIN CATCH
PRINT('ERROR: '+ERROR_MESSAGE())
END CATCH
GO

--Insert into Client--

GO
BEGIN TRY
INSERT INTO CLIENT VALUES
(100,'James','777 Brockton Avenue','Chemical'),
(111,'Robert','30 Memorial Drive','Computer'),
(122,'Michael','250 Hartford Avenue','Information Tech'),
(133,'David','700 Oak Street','Construction '),
(144,'William','66-4 Parkhurst Rd','Electric powe'),
(155,'Richard','295 Plymouth Street','Engineering '),
(166,'Joseph','591 Memorial Dr','Entertainment '),
(177,'Thomas','55 Brooksby Village Way','Fishing '),
(188,'Charles','137 Teaticket Hwy','Hospitality'),
(199,'Christopher','42 Fairhaven Commons Way','Infrastructure'),
(210,'Daniel','374 William S Canning Blvd','Media'),
(221,'Matthew','121 Worcester Rd','Sport'),
(232,'Anthony','12 Worcester Rd','Tobacco'),
(243,'Mark','231 Worcester Rd','Transport'),
(254,'Donald','14 Worcester Rd','Wholesale'),
(265,'Steven','43 Worcester Rd','Wood'),
(276,'Paul','4 Worcester Rd','Engineering '),
(287,'Andrew','677 Timpany Blvd','Electric powe'),
(298,'Joshua','337 Russell St','Construction '),
(309,'Kenneth','295 Plymouth Street','Chemical');
END TRY
BEGIN CATCH
PRINT('ERROR: '+ERROR_MESSAGE())
END CATCH
GO


--Insert into participants--

GO
BEGIN TRY
INSERT INTO PARTICIPANT VALUES
(100,'Gary','Amy','+27871140568',177),
(111,'Nicholas','Roger','+27871140568',100),
(122,'Eric','Hannah','+27871140568',177),
(133,'Jonathan','Jacqueline','+27715324408',100),
(144,'Stephen','Martha','+27714161832',111),
(155,'Larry','Gloria','+27714161832',133),
(166,'Justin','Teresa','+27632650425',144),
(177,'Scott','Ann','+27733586613',144),
(188,'Brandon','Sara','+27105104950',100),
(199,'Benjamin','Madison','+27318135869',144),
(210,'Samuel','Frances','07429006370',199),
(221,'Gregory','Kathryn','07107254791',254),
(232,'Alexander','Janice','+27318135834',287),
(243,'Frank','Jean','+27317735869',298),
(254,'Patrick','Abigail','+27738135869',166),
(265,'Raymond','Alice','+27318885869',287),
(276,'Jack','Julia','+27318199869',265),
(287,'Dennis','Judy','+27318445869',265),
(298,'Jerry','Sophia','+27323135869',144),
(309,'Tyler','Grace','+27318545869',100),
(320,'Aaron','Grace','+27314535869',100),
(331,'Jose','Judy','+27818327069',177),
(342,'Adam','Denise','+27312335869',100),
(353,'Henry','Denise','+27323135869',232),
(364,'Douglas','Amber','+27818135869',221),
(375,'Zachary','Doris','+27878135869',232),
(386,'Peter','Marilyn','+27388135869',309),
(397,'Kyle','Danielle','+27315635869',188),
(408,'Ethan','Beverly','+27315435869',177),
(419,'Walter','Isabella','+27318235869',155),
(430,'Noah','Theresa','+27318139869',232),
(441,'Jeremy','Diana','+27318135878',210),
(452,'Christian','Natalie','+27378135869',210),
(463,'Keith','Brittany','+27318135865',111);
END TRY
BEGIN CATCH
PRINT('ERROR: '+ERROR_MESSAGE())
END CATCH
GO

--Insert into Course--
GO
BEGIN TRY
INSERT INTO COURSE VALUES
(100,'Accountants and Auditors','Eng','2',200, Convert(date,'12-12-2021',104),23,133 ,309),
(111,'Administrative Services Manager','Eng','3',300, Convert(date,'17-05-2020',104),24,144 ,298),
(122,'Agricultural and Food Scientist','Eng','4',144, Convert(date,'14-05-2020',104),25,155 ,298),
(133,'Agricultural Engineer','Eng','5',100, Convert(date,'15-02-2019',104),26,166 ,199),
(144,'Air Traffic Controller','Eng','6',400, Convert(date,'17-12-2022',104),27,166 ,221),
(155,'Airline and Commercial Pilot','Eng','7',500, Convert(date,'13-06-2022',104),28,177 ,232),
(166,'Animal Care and Service Worker','Eng','8',600, Convert(date,'10-02-2022',104),29, 144,243),
(177,'Assembler and Fabricator','Eng','9','200', Convert(date,'12-09-2017',104),30, 144,100),
(188,'Audiologist','Eng','2',800, Convert(date,'12-09-2018',104),40,133 ,111),
(199,'Accounting and Auditing Clerk','Eng','10',313, Convert(date,'12-07-2022',104),50,133 ,122),
(210,'Chefs and Head Cooks','Eng','23',412, Convert(date,'23-06-2021',104),60,144 ,144),
(221,'Chefs and Head Cooks','Eng','4',122, Convert(date,'17-12-2020',104),23,144 ,155),
(232,'Chemical Technician','Eng','4',560, Convert(date,'12-12-2022',104),20,122 ,188),
(243,'Childcare Worker','Eng','2',99, Convert(date,'16-12-2020',104),21, 100,188),
(254,'Civil Engineer','Eng','5',78, Convert(date,'15-12-2019',104),22, 166,199),
(265,'Civil Engineer','Eng','6',60, Convert(date,'12-12-2022',104),15,155 ,210),
(276,'Social Worker','Eng','10',50, Convert(date,'13-12-2021',104),16, 155,221),
(287,'Social Worker','Eng','7',123, Convert(date,'15-12-2022',104),17, 144,309),
(298,'Software Developer','Eng','2',212, Convert(date,'14-04-2022',104),18, 133,298),
(309,'Sales Engineer','Eng','6',82, Convert(date,'19-12-2020',104),19,166 ,287),
(320,'Sales Engineer','Eng','9',81, Convert(date,'16-12-2019',104),20,133 ,276),
(331,'Psychologist','Eng','6',87, Convert(date,'19-12-2019',104),23,100 ,265),
(342,'Political Scientist','Eng','4',76, Convert(date,'15-12-2020',104),23, 166,254),
(353,'Political Scientist','Eng','5',90, Convert(date,'19-12-2021',104),23,177 ,232),
(364,'Acting','Eng','6',78, Convert(date,'18-12-2021',104),23, 122,221),
(386,'Engineering','Eng','5',102, Convert(date,'14-12-2021',104),23, 155,221),
(397,'Pharmacist','Eng','4',103, Convert(date,'16-12-2021',104),23,166 ,199),
(408,'Nursing','Eng','2',104, Convert(date,'18-12-2021',104),23,144 ,210),
(419,'Nuclear Engineer','Eng','2',105, Convert(date,'16-12-2021',104),23,144 ,232),
(430,'Modeling','Eng','2',106, Convert(date,'14-12-2021',104),23,144 ,166);
END TRY
BEGIN CATCH
PRINT('ERROR: '+ERROR_LINE())
END CATCH
GO


---Insert into takes_course-
GO
BEGIN TRY
INSERT INTO TAKES_COURSE VALUES
(100,155),
(111,166),
(122,177),
(133,188),
(144,199),
(155,210),
(166,221),
(177,232),
(188,243),
(199,254),
(210,276),
(221,276),
(232,287),
(243,298),
(254,309),
(265,320),
(276,331),
(287,342),
(298,364),
(320,430),
(100,430),
(111,386),
(122,155),
(133,155),
(144,166),
(155,177),
(166,188),
(177,199),
(188,210),
(199,232),
(210,243),
(221,265),
(232,155),
(243,232),
(254,155),
(265,155),
(276,155),
(287,155),
(298,155),
(309,177),
(320,166),
(331,188),
(342,199);
END TRY
BEGIN CATCH
PRINT('ERROR: '+ERROR_MESSAGE())
END CATCH
GO


--Question A--
/*Write a query that selects course_id, course_name of all courses that start no later than
12-12-2021*/

GO
BEGIN TRY
SELECT COURSE_ID AS 'COURSE ID', COURSE_NAME AS 'COURSE NAME', START_DATE
FROM COURSE 
WHERE START_DATE<CONVERT(DATE,'12-12-2021',104);
END TRY
BEGIN CATCH
PRINT('ERROR: '+ERROR_MESSAGE())
END CATCH
GO
--Question B--
/*Write a query that selects client_id and client_name of those clients whose address 
contains letter ‘a’.*/
GO
BEGIN TRY
SELECT CLIENT_ID AS 'CLIENT ID', CLIENT_NAME AS 'CLIENT NAME'
FROM CLIENT
WHERE ADDRESS LIKE '%a%'
END TRY
BEGIN CATCH
PRINT('ERROR: '+ERROR_MESSAGE())
END CATCH
GO
--Question C--
/*Write queries that counts how many courses, teachers and participants we have in or 
database. You may write three separate SQL-queries OR, if you know how to do that –
you may unite them into one SQL-query*/
GO
BEGIN TRY
select count(course_id) as 'COURSE TOTAL', TEACHER_TOTAL=(SELECT COUNT(teacher_id) FROM TEACHER), PARTICIPANT_TOTAL=(SELECT COUNT(participant_id) FROM PARTICIPANT) 
from course
END TRY
BEGIN CATCH
PRINT('ERROR: '+ERROR_MESSAGE())
END CATCH
GO
--Question D--
/*Write a query that calculates maximum course_length among all courses from the table 
course.*/
GO
BEGIN TRY
select MAX(course_length_weeks) as 'Maximum Course Length'
from course
END TRY
BEGIN CATCH
PRINT('ERROR: '+ERROR_MESSAGE())
END CATCH
GO

--Question E--
/*Write a query that calculates minimunim course_length among courses within each 
level (attribute – level). */
GO
BEGIN TRY
select MIN(course_length_weeks-level) as 'Minimum Course Length'
from COURSE
END TRY
BEGIN CATCH
PRINT('ERROR: '+ERROR_MESSAGE())
END CATCH
GO

--Question F--
/*Write a query that selects all participant’s attributes and the client_id, clent_name of 
the clients to which participants are related to. */
GO
BEGIN TRY
select distinct p.*, c.client_id as 'Client ID',c.client_name as 'Client Name'
from PARTICIPANT p inner join CLIENT c on c.client_id=p.client_id
END TRY
BEGIN CATCH
PRINT('ERROR: '+ERROR_MESSAGE())
END CATCH
GO

--Question G--
/*Choose one course_id (any value that you inserted into course table) and select 
first_name, last_name, phone_no of a teacher who delivers this course. */
GO
BEGIN TRY
select t.first_name as 'First Name', t.last_name as 'Last Name', t.phone_no as 'Phone Number'
from teacher t inner join course c on c.teacher_id=t.teacher_id
where c.course_id=111;
END TRY
BEGIN CATCH
PRINT('ERROR: '+ERROR_MESSAGE())
END CATCH
GO
--Question H--
/*Choose one course_id from course table and write a query that selects first name, last 
name of all participants that are enrolled into this course as well as the name of the 
course and a teacher’s first_name and last_name who delivers this course.*/
GO
BEGIN TRY
select distinct p.first_name as 'Participant First Name', p.last_name as 'Participant Last Name' ,c.course_name as 'Course Name', t.first_name as 'Teacher First Name', t.last_name 'Teacher Last Name'
from COURSE c inner join TAKES_COURSE tc on tc.course_id=c.course_id
inner join PARTICIPANT p on p.participant_id=tc.participant_id
inner join teacher t on t.teacher_id=c.teacher_id
where c.course_id=155;
END TRY
BEGIN CATCH
PRINT('ERROR: '+ERROR_MESSAGE())
END CATCH
GO
