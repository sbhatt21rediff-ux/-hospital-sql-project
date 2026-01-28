-- =========================================
-- Hospital Database SQL Queries
-- =========================================


-- 1. Total Number of Patients
-- Find the total number of patients across all hospitals
SELECT 
    SUM(patients_count) AS total_no_of_patients
FROM Hospital;


-- 2. Average Number of Doctors per Hospital
-- Retrieve the average count of doctors available in hospitals
SELECT 
    ROUND(AVG(doctors_count)) AS average_doctors_per_hospital
FROM Hospital;


-- 3. Top 3 Departments with the Highest Number of Patients
-- Find the top 3 departments having the highest number of patients
SELECT 
    department,
    SUM(patients_count) AS number_of_patients
FROM Hospital
GROUP BY department
ORDER BY number_of_patients DESC
LIMIT 3;


-- 4. Hospital with the Maximum Medical Expenses
-- Identify the hospital that recorded the highest medical expenses
SELECT 
    hospital_name,
    medical_expenses
FROM Hospital
ORDER BY medical_expenses DESC
LIMIT 1;


-- 5. Daily Average Medical Expenses
-- Calculate the average medical expenses per day for each hospital
SELECT 
    hospital_name,
    admission_date,
    ROUND(AVG(medical_expenses), 2) AS average_medical_expense_per_day
FROM Hospital
GROUP BY hospital_name, admission_date
ORDER BY hospital_name, admission_date;


-- 6. Longest Hospital Stay
-- Find the patient with the longest stay
SELECT 
    hospital_name,
    department,
    (discharge_date - admission_date) AS longest_stay
FROM Hospital
WHERE discharge_date IS NOT NULL
ORDER BY longest_stay DESC
LIMIT 1;


-- 7. Total Patients Treated Per City
-- Count the total number of patients treated in each city
SELECT 
    location,
    SUM(patients_count) AS number_of_patient
FROM Hospital
GROUP BY location;


-- 8. Average Length of Stay Per Department
-- Calculate the average number of days patients spend in each department
SELECT 
    department,
    ROUND(AVG(discharge_date - admission_date)) AS average_stay_in_days
FROM Hospital
WHERE discharge_date IS NOT NULL
GROUP BY department;


-- 9. Department with the Lowest Number of Patients
-- Find the department with the least number of patients
SELECT 
    department,
    SUM(patients_count) AS number_of_patient
FROM Hospital
GROUP BY department
ORDER BY number_of_patient ASC
LIMIT 1;


-- 10. Monthly Medical Expenses Report
-- Group data by month and calculate total medical expenses
SELECT 
    TO_CHAR(admission_date, 'YYYY-MM') AS month,
    SUM(medical_expenses) AS monthly_expense
FROM Hospital
GROUP BY TO_CHAR(admission_date, 'YYYY-MM')
ORDER BY month;
