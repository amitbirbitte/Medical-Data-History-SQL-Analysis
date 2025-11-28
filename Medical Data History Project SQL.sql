USE project_medical_data_history;

-- to read data

SELECT *
FROM admissions;

SELECT *
FROM doctors;

SELECT *
FROM patients;

SELECT *
FROM province_names;

-- ANALYSIS MEDICAL DATA 

-- 1. Show first name, last name, and gender of patients who's gender is 'M'

SELECT FIRST_NAME, LAST_NAME, GENDER
FROM patients
WHERE GENDER = 'M';

-- 2. Show first name and last name of patients who does not have allergies.

SELECT first_name, last_name, allergies
FROM patients
WHERE allergies IS NULL;

-- 3. Show first name of patients that start with the letter 'C'

SELECT first_name
FROM patients
WHERE first_name LIKE "C%";

-- 4. Show first name and last name of patients that weight within the range of 100 to 120 (inclusive)

SELECT first_name, last_name, weight
FROM patients
WHERE weight BETWEEN 100 AND 120;

-- 5. Update the patients table for the allergies column. If the patient's allergies is null then replace it with 'NKA'

UPDATE patients SET allergies='NKA' WHERE allergies IS NULL;

-- 6. Show first name and last name concatenated into one column to show their full name.

SELECT concat(FIRST_NAME," ", LAST_NAME) AS "FULL NAME"
FROM patients;

-- 7. Show first name, last name, and the full province name of each patient.province_name

SELECT first_name, last_name, province_name
FROM patients, province_names
WHERE patients.province_id=province_names.province_id;

-- 8. Show how many patients have a birth_date with 2010 as the birth year.

SELECT COUNT(*)
FROM patients
WHERE YEAR(birth_date) = 2010;

-- 9. Show the first_name, last_name, and height of the patient with the greatest height.

SELECT first_name, last_name, height
FROM patients
WHERE height = (SELECT MAX(height) FROM patients);

-- 10. Show all columns for patients who have one of the following patient_ids: 1,45,534,879,1000

SELECT * FROM patients
WHERE patient_id IN (1,45,534,879,1000);

-- 11. Show the total number of admissions

SELECT COUNT(patient_id)
FROM admissions;

-- 12. Show all the columns from admissions where the patient was admitted and discharged on the same day.

SELECT * FROM admissions
WHERE admission_date = discharge_date;

-- 13. Show the total number of admissions for patient_id 579.

SELECT count(*)
FROM patients
WHERE patient_id = 579;

-- 14. Based on the cities that our patients live in, show unique cities that are in province_id 'NS'?

SELECT DISTINCT P1.CITY
FROM patients AS P1 JOIN province_names AS P2
ON P1.province_id=P2.province_id
WHERE P2.province_id='NS';

-- 15. first_name, last name and birth date of patients who have height more than 160 and weight more than 70

SELECT first_name, last_name, birth_date
FROM patients
WHERE height > 160 AND weight > 70;

-- 16. Show unique birth years from patients and order them by ascending.

SELECT DISTINCT YEAR(BIRTH_DATE) AS BIRTH_YEAR
FROM patients
ORDER BY BIRTH_YEAR ASC;

-- 17. Show unique first names from the patients table which only occurs once in the list.

SELECT first_name
FROM patients
GROUP BY first_name
HAVING COUNT(first_name)=1;

-- 18. Show patient_id and first_name from patients where their first_name start and ends with 's' and is at least 6 characters long.

SELECT patient_id, first_name
FROM patients
WHERE first_name LIKE "S%S"
AND LENGTH(first_name)>=6;

-- 19. Show patient_id, first_name, last_name from patients whos diagnosis is 'Dementia'.   Primary diagnosis is stored in the admissions table.

SELECT P.patient_id, P.first_name, P.last_name, A.DIAGNOSIS
FROM patients AS P, admissions AS A 
WHERE DIAGNOSIS="DEMENTIA"
AND P.patient_id=A.patient_id;

-- OR USING JOIN

SELECT P.patient_id, P.first_name, P.last_name, A.diagnosis
FROM patients AS P
JOIN admissions AS A 
  ON P.patient_id = A.patient_id
WHERE A.diagnosis = 'Dementia';

-- 19. Display every patient's first_name. Order the list by the length of each name and then by alphbetically.

SELECT  first_name, LENGTH(first_name)
FROM patients
ORDER BY LENGTH(first_name) ASC, first_name;


-- 20. Display every patient's first_name. Order the list by the length of each name and then by alphbetically.

SELECT first_name
FROM patients
ORDER BY LENGTH(first_name), first_name ASC;

-- 21. Show the total amount of male patients and the total amount of female patients in the patients table. Display the two results in the same row.

SELECT 
    SUM(CASE WHEN gender = 'M' THEN 1 ELSE 0 END) AS male_count,
    SUM(CASE WHEN gender = 'F' THEN 1 ELSE 0 END) AS female_count
FROM patients;

-- 22. Show the total amount of male patients and the total amount of female patients in the patients table. Display the two results in the same row.

SELECT 
    SUM(CASE WHEN gender = 'M' THEN 1 ELSE 0 END) AS male_count,
    SUM(CASE WHEN gender = 'F' THEN 1 ELSE 0 END) AS female_count
FROM patients;

-- 23. Show patient_id, diagnosis from admissions. Find patients admitted multiple times for the same diagnosis.

SELECT patient_id, diagnosis
FROM admissions
GROUP BY patient_id, diagnosis
HAVING COUNT(*)>1;

-- 24. Show the city and the total number of patients in the city. Order from most to least patients and then by city name ascending.
 
 SELECT
    city,
    COUNT(*) AS total_patients
FROM patients
GROUP BY city
ORDER BY total_patients DESC, city ASC;

 -- 25. Show first name, last name and role of every person that is either patient or doctor.The roles are either "Patient" or "Doctor"
  
 SELECT first_name, last_name, 'PATIENTS' AS role
 FROM patients
 
 UNION
 
 SELECT first_name, last_name, 'DOCTORS' AS role
 FROM doctors;
  
 -- 26. Show all allergies ordered by popularity. Remove NULL values from query.
 
 SELECT allergies, COUNT(*) AS total_cases
 FROM patients
 WHERE allergies IS NOT NULL
 GROUP BY allergies
 ORDER BY total_cases DESC;
 
 -- 27. Show all patient's first_name, last_name, and birth_date who were born in the 1970s decade. Sort the list starting from the earliest birth_date.
 
 SELECT first_name, last_name, birth_date
FROM patients
WHERE birth_date BETWEEN '1970-01-01' AND '1979-12-31'
ORDER BY birth_date ASC;
 
-- 28. We want to display each patient's full name in a single column. Their last_name in all upper letters must appear first, then first_name in all lower case letters. Separate the last_name and first_name with a comma. Order the list by the first_name in decending order    EX: SMITH,jane

SELECT CONCAT(UPPER(last_name), ", ", LOWER(first_name)) AS FULL_NAME
FROM patients
ORDER BY first_name DESC;

 -- 29. Show the province_id(s), sum of height; where the total sum of its patient's height is greater than or equal to 7,000.
 
 SELECT province_id, SUM(height) AS SUM_OF_HEIGHT
 FROM patients
 GROUP BY province_id
 HAVING SUM_OF_HEIGHT >= 7000;
 
 -- 30. Show the difference between the largest weight and smallest weight for patients with the last name 'Maroni'
 
 SELECT (MAX(WEIGHT)-MIN(WEIGHT)) AS WEIGHT_DIFFERENCE
 FROM patients
 WHERE last_name = "MARONI";
 
 -- 31. Show all of the days of the month (1-31) and how many admission_dates occurred on that day. Sort by the day with most admissions to least admissions.
 
SELECT DATE(admission_date) AS Date_of_Month,
COUNT(*) AS Total_Admissions
FROM admissions
GROUP BY DATE(admission_date)
ORDER BY Total_Admissions DESC;
 
 -- 32. Show all of the patients grouped into weight groups. Show the total amount of patients in each weight group. Order the list by the weight group decending. e.g. if they weight 100 to 109 they are placed in the 100 weight group, 110-119 = 110 weight group, etc.
 
 SELECT
    FLOOR(weight / 10) * 10 AS weight_group,
    COUNT(*) AS total_patients
FROM patients
GROUP BY FLOOR(weight / 10) * 10
ORDER BY weight_group DESC;

-- 33. Show patient_id, weight, height, isObese from the patients table. Display isObese as a boolean 0 or 1. Obese is defined as weight(kg)/(height(m). Weight is in units kg. Height is in units cm.

SELECT
    patient_id,
    weight,
    height,
    CASE 
        WHEN weight / POWER(height / 100, 2) >= 30 THEN 1
        ELSE 0
    END AS isObese
FROM patients;

-- 34. Show patient_id, first_name, last_name, and attending doctor's specialty. Show only the patients who has a diagnosis as 'Epilepsy' and the doctor's first name is 'Lisa'. Check patients, admissions, and doctors tables for required information.

SELECT P.patient_id, P.first_name, P.last_name, D.specialty
FROM patients P
JOIN admissions A
ON P.patient_id = A.patient_id
JOIN doctors D
ON A.attending_doctor_id = D.doctor_id
WHERE A.diagnosis = 'Epilepsy'
AND D.first_name = 'Lisa';

-- 35. All patients who have gone through admissions, can see their medical documents on our site. Those patients are given a temporary password after their first admission. Show the patient_id and temp_password.
    /* The password must be the following, in order:
    - patient_id
    - the numerical length of patient's last_name
    - year of patient's birth_date */
    
SELECT P.patient_id, 
CONCAT(P.patient_id,LENGTH(P.last_name), YEAR(P.birth_date)) AS TEMP_PASSWORD
FROM patients P
JOIN admissions A
ON P.patient_id = A.patient_id;
