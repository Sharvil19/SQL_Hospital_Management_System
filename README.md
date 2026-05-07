# SQL_Hospital_Management_System
🏥 Hospital Management System — PostgreSQL
A real-world SQL project built using PostgreSQL 18 to manage hospital data including patients and doctors.

📌 Project Overview
This project simulates a Hospital Management System database with:

Patients — admission records, diagnosis, ward, status
Doctors — specialization, salary, shift, availability


🗂️ Dataset
FileRecordsDescriptiondatasets/patients.csv20 rowsPatient admission recordsdatasets/doctors.csv10 rowsDoctor details

🛠️ Tech Stack

Database: PostgreSQL 18
Tool: pgAdmin 4
Language: SQL


🚀 How to Set Up
1. Create the Database
sqlCREATE DATABASE "Hospital Management System";
2. Create Tables
Run the script in schema/tables.sql
3. Import CSV Data
sql-- Import doctors first (foreign key dependency)
\copy public.doctors FROM 'path/to/doctors.csv' WITH (FORMAT csv, HEADER true);

-- Then import patients
\copy public.patients FROM 'path/to/patients.csv' WITH (FORMAT csv, HEADER true);

📊 Schema Design
doctors
-------
doctor_id (PK)
first_name, last_name
specialization
phone, email
experience_years
salary
ward, shift
available

patients
--------
patient_id (PK)
first_name, last_name
date_of_birth, gender, blood_type
phone, email, address, city
admission_date, discharge_date
ward
doctor_id (FK → doctors)
diagnosis
status

❓ SQL Practice Questions
#QuestionConcepts Used1List all admitted patients with their doctor's nameJOIN, WHERE2Count total patients in each wardGROUP BY, COUNT3Find the doctor with the highest salaryORDER BY, LIMIT4Show all patients admitted in February 2024EXTRACT, WHERE5Which doctor is handling the most patients?JOIN, GROUP BY, LIMIT6List patients admitted for more than 6 daysSubquery, Date Diff7Find doctors with no patients assignedNOT IN, Subquery8Average hospital stay per wardAVG, ROUND, Subquery9Rank doctors by number of patientsDENSE_RANK, Window Function10Monthly admission count for 2024DATE_TRUNC, GROUP BY

💡 Key Concepts Covered

JOIN between tables
GROUP BY with aggregates
Subqueries and nested queries
Date functions (EXTRACT, DATE_TRUNC)
Window functions (DENSE_RANK)
NULL handling in SQL
Foreign key relationships


👨‍💻 Author
Sharvil Bookshet 
📍 Pune, Maharashtra
sharvilbookshet19@gmail.com
📍 Nagpur, Maharashtra
🔗 LinkedIn | GitHub
