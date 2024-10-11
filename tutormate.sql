CREATE DATABASE tutormate;

USE tutormate;

-- IT23400986

CREATE TABLE Admins (
  ano INT AUTO_INCREMENT PRIMARY KEY,
  aname VARCHAR(100) NOT NULL,                
  email VARCHAR(100) NOT NULL UNIQUE,         
  phone VARCHAR(15),                          
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP  
);

-- Create Course Table with Constraints
CREATE TABLE Course (
  cno INT AUTO_INCREMENT PRIMARY KEY,     
  cname VARCHAR(100) NOT NULL UNIQUE,      
  description VARCHAR(255) DEFAULT 'No description provided', 
  fee DECIMAL(10, 2) NOT NULL CHECK (fee > 0),            
  duration INT NOT NULL CHECK (duration > 0),             
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,          
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP  
);

CREATE TABLE Tutor (
  tno INT NOT NULL PRIMARY KEY,
  fname VARCHAR(20),
  lname VARCHAR(20),
  salary DECIMAL(10, 2),
  email VARCHAR(20),
  phone INT(10),
  ano INT,
  FOREIGN KEY (ano) REFERENCES Admins (ano)
);

DROP TABLE Tutor;

CREATE TABLE Tutor_Course (
  tno INT,
  cno INT,
  PRIMARY KEY (tno, cno),
  FOREIGN KEY (tno) REFERENCES Tutor (tno),
  FOREIGN KEY (cno) REFERENCES Course (cno)
);

DROP TABLE Tutor_Course;


INSERT INTO Course (cname, description, fee, duration)
VALUES ('Data Science', 'Learn the fundamentals of data analysis and machine learning', 1500.00, 40);


INSERT INTO Course (cname, description, fee, duration)
VALUES 
('Web Development', 'Learn to build dynamic websites using HTML, CSS, and JavaScript.', 1200.00, 30),
('Machine Learning', 'An introduction to machine learning concepts and algorithms.', 2000.00, 50),
('Digital Marketing', 'Understand the fundamentals of digital marketing strategies.', 900.00, 25),
('Graphic Design', 'Explore the principles of graphic design and visual communication.', 1100.00, 35);

-- Select Data from Tables
SELECT * FROM Admins;

SELECT * FROM Tutor;

SELECT * FROM Tutor_Course;

SELECT * FROM Course;


SELECT cno, cname, description, fee, duration 
FROM Course 
WHERE cno = 1;

-- searches for courses containing "Data" in the name
SELECT cno, cname, description, fee, duration 
FROM Course 
WHERE cname LIKE '%Data%';  

-- select from course fee
SELECT cno, cname, fee, duration 
FROM Course 
WHERE fee > 1000;
-- total number of Course
SELECT COUNT(*) AS total_courses 
FROM Course;
-- order course by durantion
SELECT cno, cname, duration 
FROM Course 
ORDER BY duration DESC;

INSERT INTO Admins (ano, aname, email, phone)
VALUES (1, 'Alice Johnson', 'alice.johnson@example.com', '1234567890');

INSERT INTO Tutor (tno, fname, lname, lname, salary, email, phone)
VALUES (001, "Joe", "King", 100,000, "joekinged@gmail.com", 0554433222);

INSERT INTO Tutor (tno, tname, fname, lname, salary, email, phone)
VALUES (002, 'Nimal', 'Perera', 85000, 'nimalperera@gmail.com', 0771234567);

INSERT INTO Tutor (tno, tname, fname, lname, salary, email, phone)
VALUES (003, 'Samantha', 'De Silva', 95000, 'samantha.desilva@yahoo.com', 0719876543);

INSERT INTO Tutor (tno, tname, fname, lname, salary, email, phone)
VALUES (004, 'Anjali', 'Fernando', 78000, 'anjali.fernando@hotmail.com', 0761122334);

INSERT INTO Tutor (tno, tname, fname, lname, salary, email, phone)
VALUES (005, 'Kusal', 'Jayawardena', 90000, 'kusal.j@gmail.com', 0725566778);

CREATE TABLE Finance_Manager(
fno INT PRIMARY KEY NOT NULL,
fname VARCHAR(20),
email VARCHAR(30),
phone INT(10)
);

INSERT INTO Finance_Manager VALUES 
(001, 'Kamal Perera', 'kamalperera@gmail.com', '0771952432'),
(002, 'Nimali Silva', 'nimalisilva@gmail.com', '0773654221'),
(003, 'John Sylvester', 'johnsylvester@gmail.com', '0723766988');

SELECT * FROM Finance_Manager;

CREATE TABLE Payment(
pno INT UNIQUE NOT NULL,
fno INT,
cno INT,
pdate DATE,
amount DECIMAL,
pstatus ENUM('APPROVED', 'REJECTED', 'PENDING'),
CONSTRAINT fk1 FOREIGN KEY (fno) REFERENCES Finance_Manager (fno) 
ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT fk2 FOREIGN KEY (cno) REFERENCES Course (cno)
ON DELETE CASCADE ON UPDATE CASCADE);

INSERT INTO Payment VALUES 
('1', '002', '1', '2024-10-01', '2000.00', 'APPROVED'),
('2', '001', '2', '2024-09-28', '1500.00', 'REJECTED'),
('3', '001', '3', '2024-10-11', '1500.00', 'PENDING');

SELECT * FROM Payment;
