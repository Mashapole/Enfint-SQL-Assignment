Home task
Let’s take the schema from the lecture Relational Databases, slide 3. Your task is to:
1. Create all tables from the schema with all the related attributes using CREATE TABLE. Don’t
forget to use PRIMARY KEY constraint for attributes that are included in PK.
2. Insert into these tables random values (in other words, you need to fulfill tables with your own 
values) using INSERT INTO … VALUES … . The number of inserted rows is unlimited. 
NOTE: Make sure, that all values that you insert into table have the same data types that you 
specified when creating tables. For example, if the attribute course_name has a VARCHAR(60) 
data type, so only ‘text’ can be inserted in this attribute. If the attribute start_date has DATE 
data type, only dates may be inserted, no text or number etc.
3. Congratulations, your database is created! ☺ Let’s write some SQL queries.
a. Write a query that selects course_id, course_name of all courses that start no later than
12-12-2021.
b. Write a query that selects client_id and client_name of those clients whose address 
contains letter ‘a’.
c. Write queries that counts how many courses, teachers and participants we have in or 
database. You may write three separate SQL-queries OR, if you know how to do that –
you may unite them into one SQL-query
d. Write a query that calculates maximum course_length among all courses from the table 
course.
e. Write a query that calculates minimunim course_length among courses within each 
level (attribute – level). 
f. Write a query that selects all participant’s attributes and the client_id, clent_name of 
the clients to which participants are related to. 
g. Choose one course_id (any value that you inserted into course table) and select 
first_name, last_name, phone_no of a teacher who delivers this course. 
h. Choose one course_id from course table and write a query that selects first name, last 
name of all participants that are enrolled into this course as well as the name of the 
course and a teacher’s first_name and last_name who delivers this course.
As a result, I expect the following:
1. Provide the file with your queries CREATE TABLE
2. Provide the file with your queries INSERT INTO … VALUES
3. Provide the file with your SQL queries
NOTE: you may provide only one file, but make sure that you include all the queries, including CREATE 
TABLE, INSERT and SQL SELECT queries
 
