📊 Medical Data History – SQL Analysis Project

This project contains 35 SQL queries solving real-world healthcare data problems such as patient demographics, admissions analytics, doctor–patient relationships, obesity detection, and data grouping.

The project covers querying data from multiple tables:

patients

admissions

doctors

province_names

The SQL file includes operations such as:

Data cleaning

Aggregations

Joins

Case statements

String functions

Date functions

Grouping & filtering

Window logic style problems

🚀 Project Highlights
✔ Patient Demographics Analysis

Querying gender, allergies, unique names, tallest patient, birth years, etc.

✔ Admissions & Diagnosis Analytics

Total admissions, repeated diagnoses, date-based analytics, epilepsy case identification.

✔ Doctor–Patient Relationship Insights

Joined datasets to find attending doctors, specialties, and specific diagnosis patterns.

✔ Derived Business Metrics

Temporary password generator

Obesity classifier (BMI-based)

City-wise population

Weight-group-based segmentation

📁 Files Included
File	Description
Medical_Data_History_Project.sql	Complete SQL solution (35 questions)
README.md	Project documentation
Optional (add if available)	ER Diagram, screenshots
🛠️ Tech Used

MySQL

SQL Joins

Aggregations & Grouping

Date & String Functions

Logical Conditions

Data Cleaning Queries

📌 Sample Query (Obesity Calculation)
SELECT
    patient_id,
    weight,
    height,
    CASE 
        WHEN weight / POWER(height / 100, 2) >= 30 THEN 1
        ELSE 0
    END AS isObese
FROM patients;

📈 How to Run

Install MySQL or use any SQL IDE:

MySQL Workbench

DBeaver

phpMyAdmin

DataGrip

Import the dataset / run the SQL queries directly.

⭐ Author

Amit Birbitte
Data Analyst | SQL • Python • Power BI | Healthcare Analytics


🔗 Feel free to fork, star ⭐, or use this project for learning!
