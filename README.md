# 🏥 Medical Data Analysis — MySQL Project

A clean and complete SQL-based healthcare data analysis project focused on patient records, diagnoses, doctors, and hospital billing insights. This repository is designed for **data analysts, SQL learners, and portfolio building**, and is fully ready to push to GitHub.

---

## 📘 Project Overview
This project uses **MySQL** to analyze real-world style medical data, perform data cleaning, join multiple tables, and generate actionable medical insights.  
It demonstrates writing optimized SQL queries, using aggregate functions, grouping, filtering, and multi-table JOIN operations.

---

## 🗂 Database Structure (Example Tables)
- **patients** — demographic and personal details  
- **diagnosis** — disease name, severity, diagnosis date  
- **admissions** — admit/discharge dates, ward type  
- **doctors** — specialty and department  
- **treatment** — medicines, tests, follow-up needs  
- **billing** — billing amount, payment status, insurance

---

## 🛠 SQL Skills Demonstrated
✔ JOIN (INNER, LEFT, RIGHT)  
✔ GROUP BY & HAVING  
✔ Aggregate functions: COUNT, SUM, AVG, MAX, MIN  
✔ Filtering: WHERE, LIKE, BETWEEN, IN  
✔ Subqueries & nested queries  
✔ Data cleaning & standardization  
✔ Date formatting & extraction (YEAR, MONTH, DAY)

---

## 🧠 Sample Queries

### 🔹 1. Total number of patients
```sql
SELECT COUNT(*) AS total_patients
FROM patients;
```

### 🔹 2. Top 5 most common diagnoses
```sql
SELECT diagnosis, COUNT(*) AS total_cases
FROM diagnosis
GROUP BY diagnosis
ORDER BY total_cases DESC
LIMIT 5;
```

### 🔹 3. Monthly admission trend
```sql
SELECT 
    MONTH(admit_date) AS month_num,
    COUNT(*) AS total_admissions
FROM admissions
GROUP BY month_num
ORDER BY month_num;
```

### 🔹 4. Doctor performance (patients treated)
```sql
SELECT d.doctor_name, COUNT(*) AS cases_handled
FROM treatment t
JOIN doctors d ON t.doctor_id = d.doctor_id
GROUP BY d.doctor_name
ORDER BY cases_handled DESC;
```

### 🔹 5. Total revenue from billing
```sql
SELECT SUM(amount) AS total_revenue
FROM billing;
```

---

## 📊 Key Insights You Can Generate
- Most common diseases / diagnosis distribution  
- Monthly and seasonal admission spikes  
- Revenue trends from medical billing  
- Best-performing doctors by patient volume  
- City-wise or age-wise patient segmentation  

---

## 🔧 Tech Stack
- **Database:** MySQL  
- **Querying:** SQL (joins, aggregates, subqueries)  
- **Tools:** MySQL Workbench / phpMyAdmin / DBeaver  

---

## 📁 Folder Structure (Recommended)
```
medical_data_sql_project/
│── data/
│── sql_queries/
│── screenshots/
│── README.md
```

---

## 🚀 How to Use
1. Import tables (`.sql` scripts) into MySQL  
2. Run sample queries to explore insights  
3. Modify and build your own KPIs for dashboards  

---

## 👤 Author
**Amit Birbitte**  
📧 amitbirbitte99@gmail.com  
🔗 GitHub: *add link here*  
🔗 LinkedIn: *add link here*  

---

> 💡 Tip: Use these SQL queries as a base to build a **Power BI / Tableau medical analytics dashboard**.

