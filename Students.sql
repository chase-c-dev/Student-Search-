-- CREATE DATABASE students; 
-- USE students;

-- Create the Student table
CREATE TABLE Student (
    StudentId INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Age INT,
    Major VARCHAR(50)
);

-- Create the Department table
CREATE TABLE Department (
    DepartmentId INT PRIMARY KEY,
    DepartmentName VARCHAR(50) NOT NULL,
    DepartmentHead VARCHAR(50)
);

-- Create the Professor table
CREATE TABLE Professor (
    ProfessorId INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL
);

-- Create the Course table
CREATE TABLE Course (
    CourseId INT PRIMARY KEY,
    CourseName VARCHAR(50) NOT NULL,
    Credits INT,
    DepartmentId INT,
    ProfessorId INT,
    FOREIGN KEY (DepartmentId) REFERENCES Department(DepartmentId),
    FOREIGN KEY (ProfessorId) REFERENCES Professor(ProfessorId)
);

-- Create the Enrollment table
CREATE TABLE Enrollment (
    EnrollmentId INT PRIMARY KEY,
    StudentId INT,
    CourseId INT,
    Grade VARCHAR(2),
    FOREIGN KEY (StudentId) REFERENCES Student(StudentId),
    FOREIGN KEY (CourseId) REFERENCES Course(CourseId)
);



-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Insert data into the Student table
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Insert students with specified IDs
INSERT INTO Student (StudentId, FirstName, LastName, Age, Major) VALUES (1, 'Chase', 'Simao', 21, 'Computer Science');
INSERT INTO Student (StudentId, FirstName, LastName, Age, Major) VALUES (2, 'Kush', 'Patel', 21, 'Computer Science');
INSERT INTO Student (StudentId, FirstName, LastName, Age, Major) VALUES (3, 'Robert', 'Robertson', 25, 'History');
INSERT INTO Student (StudentId, FirstName, LastName, Age, Major) VALUES (4, 'John', 'Smith', 20, 'Biology');
INSERT INTO Student (StudentId, FirstName, LastName, Age, Major) VALUES (5, 'Jane', 'Doe', 22, 'Biochemistry');
INSERT INTO Student (StudentId, FirstName, LastName, Age, Major) VALUES (6, 'Sarah', 'Connor', 23, 'Physics');
INSERT INTO Student (StudentId, FirstName, LastName, Age, Major) VALUES (7, 'James', 'Cameron', 21, 'Art');
INSERT INTO Student (StudentId, FirstName, LastName, Age, Major) VALUES (8, 'Laura', 'Croft', 22, 'History');
INSERT INTO Student (StudentId, FirstName, LastName, Age, Major) VALUES (9, 'Peter', 'Mason', 20, 'Mathematics');
INSERT INTO Student (StudentId, FirstName, LastName, Age, Major) VALUES (10, 'Mary', 'Davis', 21, 'Computer Science');
INSERT INTO Student (StudentId, FirstName, LastName, Age, Major) VALUES (11, 'Bruce', 'Adams', 22, 'Engineering');
INSERT INTO Student (StudentId, FirstName, LastName, Age, Major) VALUES (12, 'Clark', 'Johnson', 24, 'Health and Medicine');
INSERT INTO Student (StudentId, FirstName, LastName, Age, Major) VALUES (13, 'Diana', 'Peters', 23, 'Philosophy');
INSERT INTO Student (StudentId, FirstName, LastName, Age, Major) VALUES (14, 'Tony', 'Harris', 25, 'Engineering');
INSERT INTO Student (StudentId, FirstName, LastName, Age, Major) VALUES (15, 'Steve', 'Rogers', 20, 'History');
INSERT INTO Student (StudentId, FirstName, LastName, Age, Major) VALUES (16, 'Natasha', 'Romanoff', 22, 'Physics');
INSERT INTO Student (StudentId, FirstName, LastName, Age, Major) VALUES (17, 'Wanda', 'Maxwell', 21, 'Psychology');
INSERT INTO Student (StudentId, FirstName, LastName, Age, Major) VALUES (18, 'Bruce', 'Bannister', 24, 'Biology');
INSERT INTO Student (StudentId, FirstName, LastName, Age, Major) VALUES (19, 'David', 'Thompson', 23, 'Health and Medicine');
INSERT INTO Student (StudentId, FirstName, LastName, Age, Major) VALUES (20, 'Lisa', 'Clark', 22, 'Arts and Humanities');
INSERT INTO Student (StudentId, FirstName, LastName, Age, Major) VALUES (21, 'Peter', 'Quinn', 21, 'Natural Sciences');
INSERT INTO Student (StudentId, FirstName, LastName, Age, Major) VALUES (22, 'Anna', 'Green', 20, 'Biochemistry');
INSERT INTO Student (StudentId, FirstName, LastName, Age, Major) VALUES (23, 'Jack', 'Brown', 23, 'Botany');
INSERT INTO Student (StudentId, FirstName, LastName, Age, Major) VALUES (24, 'Eric', 'Miller', 24, 'Engineering');
INSERT INTO Student (StudentId, FirstName, LastName, Age, Major) VALUES (25, 'Stephen', 'Stone', 25, 'Health and Medicine');
INSERT INTO Student (StudentId, FirstName, LastName, Age, Major) VALUES (26, 'Wade', 'Wilson', 22, 'Marketing');
INSERT INTO Student (StudentId, FirstName, LastName, Age, Major) VALUES (27, 'Matt', 'Murphy', 24, 'Law');
INSERT INTO Student (StudentId, FirstName, LastName, Age, Major) VALUES (28, 'Jessica', 'Jones', 23, 'Criminal Justice');
INSERT INTO Student (StudentId, FirstName, LastName, Age, Major) VALUES (29, 'Luke', 'Parker', 20, 'Education');
INSERT INTO Student (StudentId, FirstName, LastName, Age, Major) VALUES (30, 'Danny', 'Rand', 21, 'Business Administration');
INSERT INTO Student (StudentId, FirstName, LastName, Age, Major) VALUES (31, 'Jean', 'Grey', 22, 'Psychology');
INSERT INTO Student (StudentId, FirstName, LastName, Age, Major) VALUES (32, 'Scott', 'Summers', 23, 'Education');
INSERT INTO Student (StudentId, FirstName, LastName, Age, Major) VALUES (33, 'Ororo', 'Munroe', 21, 'Natural Sciences');
INSERT INTO Student (StudentId, FirstName, LastName, Age, Major) VALUES (34, 'Logan', 'Howlett', 25, 'History');
INSERT INTO Student (StudentId, FirstName, LastName, Age, Major) VALUES (35, 'Charles', 'Xavier', 24, 'Philosophy');
INSERT INTO Student (StudentId, FirstName, LastName, Age, Major) VALUES (36, 'Erik', 'Lehnsherr', 22, 'Physics');
INSERT INTO Student (StudentId, FirstName, LastName, Age, Major) VALUES (37, 'Raven', 'Smith', 23, 'Sociology');
INSERT INTO Student (StudentId, FirstName, LastName, Age, Major) VALUES (38, 'Hank', 'McCoy', 21, 'Biochemistry');
INSERT INTO Student (StudentId, FirstName, LastName, Age, Major) VALUES (39, 'Kitty', 'Pryde', 22, 'Computer Science');
INSERT INTO Student (StudentId, FirstName, LastName, Age, Major) VALUES (40, 'Kurt', 'Wagner', 20, 'Arts and Humanities');
INSERT INTO Student (StudentId, FirstName, LastName, Age, Major) VALUES (41, 'Warren', 'Worthington', 23, 'Business Administration');
INSERT INTO Student (StudentId, FirstName, LastName, Age, Major) VALUES (42, 'Anna', 'Marie', 21, 'Nursing');
INSERT INTO Student (StudentId, FirstName, LastName, Age, Major) VALUES (43, 'Remy', 'LeBeau', 24, 'Criminal Justice');
INSERT INTO Student (StudentId, FirstName, LastName, Age, Major) VALUES (44, 'Piotr', 'Rasputin', 22, 'Arts and Humanities');
INSERT INTO Student (StudentId, FirstName, LastName, Age, Major) VALUES (45, 'Betsy', 'Braddock', 23, 'Psychology');
INSERT INTO Student (StudentId, FirstName, LastName, Age, Major) VALUES (46, 'Emma', 'Frost', 21, 'Education');
INSERT INTO Student (StudentId, FirstName, LastName, Age, Major) VALUES (47, 'Sam', 'Guthrie', 24, 'Engineering');
INSERT INTO Student (StudentId, FirstName, LastName, Age, Major) VALUES (48, 'Roberto', 'da Costa', 22, 'International Relations');
INSERT INTO Student (StudentId, FirstName, LastName, Age, Major) VALUES (49, 'Amara', 'Aquilla', 21, 'Geology');
INSERT INTO Student (StudentId, FirstName, LastName, Age, Major) VALUES (50, 'Danielle', 'Moonstar', 23, 'Anthropology');

-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Insert data into the Department table
-- ------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO Department (DepartmentId, DepartmentName, DepartmentHead) VALUES (1, 'Computer Science', 'Dr. Seikyung Jung');
INSERT INTO Department (DepartmentId, DepartmentName, DepartmentHead) VALUES (2, 'Mathematics', 'Dr. Katherine Bramen');
INSERT INTO Department (DepartmentId, DepartmentName, DepartmentHead) VALUES (3, 'History', 'Dr. George Lucas');
INSERT INTO Department (DepartmentId, DepartmentName, DepartmentHead) VALUES (4, 'Engineering', 'Dr. Henry Ford');
INSERT INTO Department (DepartmentId, DepartmentName, DepartmentHead) VALUES (5, 'Health and Medicine', 'Dr. Alexander Fleming');
INSERT INTO Department (DepartmentId, DepartmentName, DepartmentHead) VALUES (6, 'Arts and Humanities', 'Dr. Socrates Aeschines');
INSERT INTO Department (DepartmentId, DepartmentName, DepartmentHead) VALUES (7, 'Natural Sciences', 'Dr. Scarlett Howard');
INSERT INTO Department (DepartmentId, DepartmentName, DepartmentHead) VALUES (8, 'Education', 'Dr. Hannah Rivera');

-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Insert data into the Professor table
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Insert professors with specified IDs
INSERT INTO Professor (ProfessorId, FirstName, LastName) VALUES (1, 'Seikyung', 'Jung'); -- Department Head Computer Science
INSERT INTO Professor (ProfessorId, FirstName, LastName) VALUES (2, 'Katherine', 'Bramen'); -- Department Head Mathematics
INSERT INTO Professor (ProfessorId, FirstName, LastName) VALUES (3, 'George', 'Lucas'); -- Department Head History
INSERT INTO Professor (ProfessorId, FirstName, LastName) VALUES (4, 'Linus', 'TechTips'); -- Computer Science
INSERT INTO Professor (ProfessorId, FirstName, LastName) VALUES (5, 'Jake', 'Paul'); -- Health and Medicine
INSERT INTO Professor (ProfessorId, FirstName, LastName) VALUES (6, 'Mike', 'Tyson'); -- Arts and Humanities
INSERT INTO Professor (ProfessorId, FirstName, LastName) VALUES (7, 'Julius', 'Caesar'); -- History
INSERT INTO Professor (ProfessorId, FirstName, LastName) VALUES (8, 'Socrates', 'Aeschines'); -- Department Head Arts and Humanities
INSERT INTO Professor (ProfessorId, FirstName, LastName) VALUES (9, 'Henry', 'Ford'); -- Department Head Engineering
INSERT INTO Professor (ProfessorId, FirstName, LastName) VALUES (10, 'Alexander', 'Fleming'); -- Department Head Health and Medicine
INSERT INTO Professor (ProfessorId, FirstName, LastName) VALUES (11, 'Ava', 'White'); -- Natural Science
INSERT INTO Professor (ProfessorId, FirstName, LastName) VALUES (12, 'Mason', 'Clark'); -- Education
INSERT INTO Professor (ProfessorId, FirstName, LastName) VALUES (13, 'Hazel', 'Allen'); -- Engineering
INSERT INTO Professor (ProfessorId, FirstName, LastName) VALUES (14, 'Wyatt', 'Baker'); -- Mathematics
INSERT INTO Professor (ProfessorId, FirstName, LastName) VALUES (15, 'Edward', 'Edwards'); -- Education
INSERT INTO Professor (ProfessorId, FirstName, LastName) VALUES (16, 'John', 'Johnstone'); -- Engineering
INSERT INTO Professor (ProfessorId, FirstName, LastName) VALUES (17, 'Stella', 'Peterson'); -- Health and Medicine
INSERT INTO Professor (ProfessorId, FirstName, LastName) VALUES (18, 'Nathan', 'Myers'); -- Mathematics
INSERT INTO Professor (ProfessorId, FirstName, LastName) VALUES (19, 'Levi', 'Cook'); -- Natural Science
INSERT INTO Professor (ProfessorId, FirstName, LastName) VALUES (20, 'Caleb', 'Turner'); -- Computer Science
INSERT INTO Professor (ProfessorId, FirstName, LastName) VALUES (21, 'Nora', 'Henderson'); -- Arts and Humanities
INSERT INTO Professor (ProfessorId, FirstName, LastName) VALUES (22, 'Scarlett', 'Howard'); -- Department Head Natural Sciences
INSERT INTO Professor (ProfessorId, FirstName, LastName) VALUES (23, 'Ryan', 'Flores'); -- Education
INSERT INTO Professor (ProfessorId, FirstName, LastName) VALUES (24, 'Hannah', 'Rivera'); -- Department Head Education
INSERT INTO Professor (ProfessorId, FirstName, LastName) VALUES (25, 'Evelyn', 'Ross'); -- Computer Science

-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Insert data into the Course table
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Seikyung Jung (1)
INSERT INTO Course (CourseId, CourseName, Credits, DepartmentId, ProfessorId) VALUES (1, 'Introduction Database Systems', 3, 1, 1);
INSERT INTO Course (CourseId, CourseName, Credits, DepartmentId, ProfessorId) VALUES (2, 'Computer Science I', 3, 1, 1);
INSERT INTO Course (CourseId, CourseName, Credits, DepartmentId, ProfessorId) VALUES (3, 'Web Application Development', 3, 1, 1);

-- Katherine Bramen (2)
INSERT INTO Course (CourseId, CourseName, Credits, DepartmentId, ProfessorId) VALUES (4, 'Calculus I', 4, 2, 2);
INSERT INTO Course (CourseId, CourseName, Credits, DepartmentId, ProfessorId) VALUES (5, 'Calculus II', 4, 2, 2);
INSERT INTO Course (CourseId, CourseName, Credits, DepartmentId, ProfessorId) VALUES (6, 'Calculus III', 4, 2, 2);
INSERT INTO Course (CourseId, CourseName, Credits, DepartmentId, ProfessorId) VALUES (7, 'Pre-Calc', 3, 2, 2);

-- George Lucas (3)
INSERT INTO Course (CourseId, CourseName, Credits, DepartmentId, ProfessorId) VALUES (8, 'World History', 3, 3, 3);
INSERT INTO Course (CourseId, CourseName, Credits, DepartmentId, ProfessorId) VALUES (9, 'History of World War I', 3, 3, 3);
INSERT INTO Course (CourseId, CourseName, Credits, DepartmentId, ProfessorId) VALUES (10, 'History of World War II', 3, 3, 3);

-- Linus TechTips (4)
INSERT INTO Course (CourseId, CourseName, Credits, DepartmentId, ProfessorId) VALUES (11, 'Operating Systems', 3, 1, 4);
INSERT INTO Course (CourseId, CourseName, Credits, DepartmentId, ProfessorId) VALUES (12, 'Computer Architecture', 3, 1, 4);

-- Jake Paul (5)
INSERT INTO Course (CourseId, CourseName, Credits, DepartmentId, ProfessorId) VALUES (13, 'Medical Ethics', 3, 5, 5);
INSERT INTO Course (CourseId, CourseName, Credits, DepartmentId, ProfessorId) VALUES (14, 'Pharmacology', 4, 5, 5);

-- Mike Tyson (6)
INSERT INTO Course (CourseId, CourseName, Credits, DepartmentId, ProfessorId) VALUES (15, 'Creative Writing', 3, 6, 6);

-- Julius Caesar (7)
INSERT INTO Course (CourseId, CourseName, Credits, DepartmentId, ProfessorId) VALUES (16, 'Roman History', 3, 3, 7);
INSERT INTO Course (CourseId, CourseName, Credits, DepartmentId, ProfessorId) VALUES (17, 'Greek History', 3, 3, 7);
INSERT INTO Course (CourseId, CourseName, Credits, DepartmentId, ProfessorId) VALUES (18, 'Egyptian History', 3, 3, 7);

-- Socrates Aeschines (8)
INSERT INTO Course (CourseId, CourseName, Credits, DepartmentId, ProfessorId) VALUES (19, 'Philosophy of Mind', 3, 6, 8);
INSERT INTO Course (CourseId, CourseName, Credits, DepartmentId, ProfessorId) VALUES (20, 'Ancient Philosophy', 3, 6, 8);
INSERT INTO Course (CourseId, CourseName, Credits, DepartmentId, ProfessorId) VALUES (21, 'Philosophy of Science', 3, 6, 8);
INSERT INTO Course (CourseId, CourseName, Credits, DepartmentId, ProfessorId) VALUES (22, 'Political Philosophy', 3, 6, 8);

-- Henry Ford (9)
INSERT INTO Course (CourseId, CourseName, Credits, DepartmentId, ProfessorId) VALUES (23, 'Machine Design', 4, 4, 9);
INSERT INTO Course (CourseId, CourseName, Credits, DepartmentId, ProfessorId) VALUES (24, 'Heat Transfer', 3, 4, 9);
INSERT INTO Course (CourseId, CourseName, Credits, DepartmentId, ProfessorId) VALUES (25, 'Manufacturing', 4, 4, 9);

-- Alexander Fleming (10)
INSERT INTO Course (CourseId, CourseName, Credits, DepartmentId, ProfessorId) VALUES (26, 'Global Health', 4, 5, 10);
INSERT INTO Course (CourseId, CourseName, Credits, DepartmentId, ProfessorId) VALUES (27, 'Telemedicine', 3, 5, 10);
INSERT INTO Course (CourseId, CourseName, Credits, DepartmentId, ProfessorId) VALUES (28, 'Introduction to Orthopedics', 4, 5, 10);

-- Ava White (11)
INSERT INTO Course (CourseId, CourseName, Credits, DepartmentId, ProfessorId) VALUES (29, 'Biology I', 4, 7, 11); -- 4 credits, Natural Science
INSERT INTO Course (CourseId, CourseName, Credits, DepartmentId, ProfessorId) VALUES (30, 'Biology II', 4, 7, 11); -- 4 credits, Natural Science

-- Mason Clark (12)
INSERT INTO Course (CourseId, CourseName, Credits, DepartmentId, ProfessorId) VALUES (31, 'Introduction to Education', 4, 8, 12); -- 3 credits, Education

-- Hazel Allen (13)
INSERT INTO Course (CourseId, CourseName, Credits, DepartmentId, ProfessorId) VALUES (32, 'Control Systems', 3, 4, 13); -- 3 credits, Engineering
INSERT INTO Course (CourseId, CourseName, Credits, DepartmentId, ProfessorId) VALUES (33, 'Power Systems', 3, 4, 13); -- 3 credits, Engineering

-- Wyatt Baker (14)
INSERT INTO Course (CourseId, CourseName, Credits, DepartmentId, ProfessorId) VALUES (34, 'Statistics I', 3, 2, 14); -- 3 credits, Mathematics
INSERT INTO Course (CourseId, CourseName, Credits, DepartmentId, ProfessorId) VALUES (35, 'Statistics II', 3, 2, 14); -- 3 credits, Mathematics

-- Edward Edwards (15)
INSERT INTO Course (CourseId, CourseName, Credits, DepartmentId, ProfessorId) VALUES (36, 'Classroom Management', 4, 8, 15); -- 4 credits, Education

-- John Johnstone (16)
INSERT INTO Course (CourseId, CourseName, Credits, DepartmentId, ProfessorId) VALUES (37, 'Thermodynamics', 4, 4, 16); -- 4 credits, Engineering
INSERT INTO Course (CourseId, CourseName, Credits, DepartmentId, ProfessorId) VALUES (38, 'Process Design', 3, 4, 16); -- 3 credits, Engineering
INSERT INTO Course (CourseId, CourseName, Credits, DepartmentId, ProfessorId) VALUES (39, 'Chemical Reaction Engineering', 4, 4, 16); -- 4 credits, Engineering

-- Stella Peterson (17)
INSERT INTO Course (CourseId, CourseName, Credits, DepartmentId, ProfessorId) VALUES (40, 'Public Health', 3, 5, 17); -- 3 credits, Health and Medicine

-- Nathan Meyers (18)
INSERT INTO Course (CourseId, CourseName, Credits, DepartmentId, ProfessorId) VALUES (41, 'Discrete Math', 3, 2, 18); -- 3 credits, Mathematics
INSERT INTO Course (CourseId, CourseName, Credits, DepartmentId, ProfessorId) VALUES (42, 'Linear Algebra', 3, 2, 18); -- 3 credits, Mathematics

-- Levi Cook (19) 
INSERT INTO Course (CourseId, CourseName, Credits, DepartmentId, ProfessorId) VALUES (43, 'Chemistry I', 4, 7, 19); -- 4 credits, Natural Science
INSERT INTO Course (CourseId, CourseName, Credits, DepartmentId, ProfessorId) VALUES (44, 'Chemistry II', 4, 7, 19); -- 4 credits, Natural Science
INSERT INTO Course (CourseId, CourseName, Credits, DepartmentId, ProfessorId) VALUES (45, 'Biochemistry', 4, 7, 19); -- 4 credits, Natural Science

-- Caleb Turner (20)
INSERT INTO Course (CourseId, CourseName, Credits, DepartmentId, ProfessorId) VALUES (46, 'Cloud Computing', 3, 1, 20); -- 3 credits, Computer Science
INSERT INTO Course (CourseId, CourseName, Credits, DepartmentId, ProfessorId) VALUES (47, 'Mobile App Development', 3, 1, 20); -- 3 credits, Computer Science

-- Nora Henderson (21)
INSERT INTO Course (CourseId, CourseName, Credits, DepartmentId, ProfessorId) VALUES (48, 'Art Studio', 3, 6, 21); -- 3 credits, Arts and Humanities

-- Scarlett Howard (22)
INSERT INTO Course (CourseId, CourseName, Credits, DepartmentId, ProfessorId) VALUES (49, 'Genetics', 4, 7, 22); -- 4 credits, Natural Science
INSERT INTO Course (CourseId, CourseName, Credits, DepartmentId, ProfessorId) VALUES (50, 'Microbiology', 4, 7, 22); -- 4 credits, Natural Science
INSERT INTO Course (CourseId, CourseName, Credits, DepartmentId, ProfessorId) VALUES (51, 'Ecology', 3, 7, 22); -- 3 credits, Natural Science
INSERT INTO Course (CourseId, CourseName, Credits, DepartmentId, ProfessorId) VALUES (52, 'Botany', 3, 7, 22); -- 3 credits, Natural Science

-- Ryan Flores (23)
INSERT INTO Course (CourseId, CourseName, Credits, DepartmentId, ProfessorId) VALUES (53, 'Educational Leadership', 3, 8, 23); -- 3 credits, Education

-- Hannah Rivera (24) 
INSERT INTO Course (CourseId, CourseName, Credits, DepartmentId, ProfessorId) VALUES (54, 'Instructional Strategies', 3, 8, 24); -- 3 credits, Education
INSERT INTO Course (CourseId, CourseName, Credits, DepartmentId, ProfessorId) VALUES (55, 'Curriculum Development', 3, 8, 24); -- 3 credits, Education
INSERT INTO Course (CourseId, CourseName, Credits, DepartmentId, ProfessorId) VALUES (56, 'Education Policy', 3, 8, 24); -- 3 credits, Education
INSERT INTO Course (CourseId, CourseName, Credits, DepartmentId, ProfessorId) VALUES (57, 'Philosophy of Education', 3, 8, 24); -- 3 credits, Education

-- Evelyn Ross (25)
INSERT INTO Course (CourseId, CourseName, Credits, DepartmentId, ProfessorId) VALUES (58, 'Computer Forensics', 3, 1, 25); -- 3 credits, Computer Science
INSERT INTO Course (CourseId, CourseName, Credits, DepartmentId, ProfessorId) VALUES (59, 'Introduction to Cybersecurity', 3, 1, 25); -- 3 credits, Computer Science


-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Insert data into the Enrollment table
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Chase Simao (Computer Science)
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (1, 1, 1, 'A');
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (2, 1, 2, 'B');
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (3, 1, 3, 'A');
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (4, 1, 26, 'B');

-- Kush Patel (Computer Science)
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (5, 2, 1, 'B');
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (6, 2, 2, 'A');
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (7, 2, 4, 'C');

-- Robert Robertson (History)
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (8, 3, 8, 'A');
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (9, 3, 9, 'B');
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (10, 3, 10, 'A');

-- John Smith (Biology)
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (11, 4, 32, 'A');
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (12, 4, 33, 'B');
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (13, 4, 34, 'A');

-- Jane Doe (Biochemistry)
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (14, 5, 48, 'A');
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (15, 5, 49, 'B');
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (16, 5, 50, 'A');

-- Sarah Connor (Physics)
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (17, 6, 16, 'B');
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (18, 6, 29, 'A');
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (19, 6, 37, 'A');

-- James Cameron (Art)
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (20, 7, 21, 'A');
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (21, 7, 55, 'B');
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (22, 7, 56, 'A');

-- Laura Croft (History)
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (23, 8, 13, 'A');
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (24, 8, 14, 'B');
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (25, 8, 15, 'A');

-- Peter Mason (Mathematics)
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (26, 9, 5, 'A');
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (27, 9, 6, 'B');
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (28, 9, 7, 'A');

-- Mary Davis (Computer Science)
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (29, 10, 1, 'B');
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (30, 10, 2, 'A');
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (31, 10, 4, 'C');

-- Bruce Adams (Engineering)
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (32, 11, 17, 'A');
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (33, 11, 18, 'B');
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (34, 11, 19, 'A');

-- Clark Johnson (Health and Medicine)
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (35, 12, 41, 'A');
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (36, 12, 42, 'B');
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (37, 12, 45, 'A');

-- Diana Peters (Philosophy)
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (38, 13, 21, 'A');
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (39, 13, 22, 'B');
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (40, 13, 23, 'A');

-- Tony Harris (Engineering)
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (41, 14, 17, 'B');
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (42, 14, 18, 'A');
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (43, 14, 19, 'A');
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (44, 14, 26, 'A');

-- Steve Rogers (History)
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (45, 15, 8, 'A');
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (46, 15, 9, 'B');
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (47, 15, 10, 'A');

-- Natasha Romanoff (Physics)
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (48, 16, 16, 'A');
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (49, 16, 29, 'B');
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (50, 16, 37, 'A');

-- Wanda Maxwell (Psychology)
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (51, 17, 30, 'A');
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (52, 17, 31, 'B');
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (53, 17, 32, 'A');

-- Bruce Bannister (Biology)
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (54, 18, 32, 'A');
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (55, 18, 33, 'B');
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (56, 18, 34, 'A');

-- David Thompson (Health and Medicine)
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (57, 19, 46, 'B');
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (58, 19, 47, 'A');
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (59, 19, 48, 'B');

-- Lisa Clark (Arts and Humanities)
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (60, 20, 55, 'A');
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (61, 20, 56, 'B');
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (62, 20, 57, 'A');

-- Peter Quinn (Natural Sciences)
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (63, 21, 48, 'A');
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (64, 21, 49, 'B');
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (65, 21, 50, 'A');

-- Anna Green (Biochemistry)
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (66, 22, 40, 'A');
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (67, 22, 41, 'B');
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (68, 22, 42, 'A');

-- Jack Brown (Botany)
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (69, 23, 52, 'A');
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (70, 23, 55, 'B');
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (71, 23, 56, 'A');

-- Eric Miller (Engineering)
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (72, 24, 17, 'B');
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (73, 24, 18, 'A');
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (74, 24, 19, 'A');

-- Stephen Stone (Health and Medicine)
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (75, 25, 45, 'A');
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (76, 25, 46, 'B');
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (77, 25, 47, 'A');

-- Wade Wilson (Marketing)
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (78, 26, 41, 'B');
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (79, 26, 46, 'A');

-- Matt Murphy (Law)
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (80, 27, 45, 'A');
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (81, 27, 46, 'B');

-- Jessica Jones (Criminal Justice)
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (82, 28, 43, 'A');
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (83, 28, 44, 'B');
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (84, 28, 25, 'A');

-- Luke Parker (Education)
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (85, 29, 38, 'A');
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (86, 29, 39, 'B');
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (87, 29, 40, 'A');

-- Danny Rand (Business Administration)
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (88, 30, 23, 'A');
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (89, 30, 27, 'B');
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (90, 30, 19, 'A');

-- Jean Grey (Psychology)
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (91, 31, 30, 'A');
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (92, 31, 31, 'B');
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (93, 31, 32, 'A');

-- Scott Summers (Education)
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (94, 32, 38, 'A');
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (95, 32, 39, 'B');
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (96, 32, 40, 'A');

-- Ororo Munroe (Natural Sciences)
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (97, 33, 22, 'A');
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (98, 33, 23, 'B');
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (99, 33, 34, 'A');

-- Logan Howlett (History)
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (100, 34, 13, 'A');
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (101, 34, 14, 'B');
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (102, 34, 15, 'A');

-- Charles Xavier (Philosophy)
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (103, 35, 21, 'A');
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (104, 35, 22, 'B');
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (105, 35, 23, 'A');

-- Erik Lehnsherr (Physics)
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (106, 36, 16, 'A');
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (107, 36, 29, 'B');
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (108, 36, 37, 'A');

-- Raven Smith (Sociology)
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (109, 37, 38, 'A');
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (110, 37, 39, 'B');
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (111, 37, 40, 'A');

-- Hank McCoy (Biochemistry)
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (112, 38, 48, 'A');
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (113, 38, 49, 'B');
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (114, 38, 50, 'A');

-- Kitty Pryde (Computer Science)
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (115, 39, 1, 'A');
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (116, 39, 2, 'B');
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (117, 39, 3, 'A');

-- Kurt Wagner (Arts and Humanities)
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (118, 40, 55, 'A');
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (119, 40, 56, 'B');
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (120, 40, 57, 'A');

-- Warren Worthington (Business Administration)
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (121, 41, 12, 'A');
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (122, 41, 27, 'B');
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (123, 41, 15, 'A');

-- Anna Marie (Nursing)
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (124, 42, 45, 'A');
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (125, 42, 46, 'B');
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (126, 42, 47, 'A');

-- Remy LeBeau (Criminal Justice)
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (127, 43, 43, 'A');
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (128, 43, 44, 'B');
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (129, 43, 25, 'A');

-- Piotr Rasputin (Arts and Humanities)
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (130, 44, 55, 'A');
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (131, 44, 56, 'B');
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (132, 44, 57, 'A');

-- Betsy Braddock (Psychology)
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (133, 45, 30, 'A');
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (134, 45, 31, 'B');
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (135, 45, 32, 'A');

-- Emma Frost (Education)
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (136, 46, 38, 'A');
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (137, 46, 39, 'B');
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (138, 46, 40, 'A');

-- Sam Guthrie (Engineering)
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (139, 47, 17, 'A');
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (140, 47, 18, 'B');
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (141, 47, 19, 'A');

-- Roberto da Costa (International Relations)
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (142, 48, 13, 'A');
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (143, 48, 14, 'B');
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (144, 48, 15, 'A');

-- Amara Aquilla (Geology)
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (145, 49, 19, 'A');
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (146, 49, 22, 'B');
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (147, 49, 34, 'A');

-- Danielle Moonstar (Anthropology)
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (148, 50, 32, 'A');
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (149, 50, 33, 'B');
INSERT INTO Enrollment (EnrollmentId, StudentId, CourseId, Grade) VALUES (150, 50, 34, 'A');







