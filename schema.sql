-- Hospital table schema

DROP TABLE IF EXISTS Hospital;

CREATE TABLE Hospital (
    hospital_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    hospital_name VARCHAR(100) NOT NULL,
    location VARCHAR(100) NOT NULL,
    department VARCHAR(100) NOT NULL,
    doctors_count INT NOT NULL CHECK (doctors_count >= 0),
    patients_count INT NOT NULL CHECK (patients_count >= 0),
    admission_date DATE NOT NULL,
    discharge_date DATE CHECK (discharge_date >= admission_date),
    medical_expenses NUMERIC(10,2) NOT NULL CHECK (medical_expenses >= 0)
);

-- Load data from CSV
COPY Hospital (
    hospital_name,
    location,
    department,
    doctors_count,
    patients_count,
    admission_date,
    discharge_date,
    medical_expenses
)
FROM 'C:\Program Files\PostgreSQL\18\data\Hospital_Data.csv'
CSV HEADER;
