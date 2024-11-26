Tutor Mate: Online Tutor Management System
Overview
Tutor Mate is an online platform designed to connect students with tutors for virtual learning experiences. The system facilitates the management of user profiles, course enrollment, lesson scheduling, and financial transactions. Students can browse and enroll in courses, choose tutors, and manage their own profiles. Tutors can offer courses, schedule lessons, and update their profiles. Admins have control over user enrollments and course payments. The platform is built using the Spring Boot framework with MySQL for the database, and the frontend uses Thymeleaf for rendering views.

Features
User Roles:
Students: Browse and enroll in courses, select tutors, manage their profile and course history.
Tutors: Create and manage courses, schedule lessons, interact with students, update personal profiles.
Admins: Approve student enrollments, manage teacher registrations, handle course payments.
Finance Managers: Process payments and generate financial reports.
Core Features:
Profile management for all users
Course enrollment and management
Payment handling and financial reporting
Tutor-student interactions
Technologies Used
Backend:
Spring Boot
Spring Data JPA (Hibernate)
Spring Security
Spring Web
Thymeleaf
Lombok
Database:
MySQL
Frontend:
HTML, CSS, JavaScript, Thymeleaf for rendering dynamic views
Version Control:
GitHub
Build Tool:
Maven
Getting Started
1. Clone the repository
git clone https://github.com/yourusername/tutormate.git
cd tutormate
2. Set up the database
Install MySQL and create a database for Tutor Mate.
Update application.properties with the database connection details:
spring.datasource.url=jdbc:mysql://localhost:3306/tutormate
spring.datasource.username=root
spring.datasource.password=password
3. Build and run the project
Use Maven to build the project:
mvn clean install
Run the application:
mvn spring-boot:run
4. Access the application
Open a browser and navigate to http://localhost:8080 to access the platform.
