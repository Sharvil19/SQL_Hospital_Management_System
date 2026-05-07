CREATE TABLE doctors (
    doctor_id       INT PRIMARY KEY,
    first_name      VARCHAR(50),
    last_name       VARCHAR(50),
    specialization  VARCHAR(100),
    phone           VARCHAR(15),
    email           VARCHAR(100),
    experience_years INT,
    salary          NUMERIC(10,2),
    ward            VARCHAR(50),
    shift           VARCHAR(20),
    available       BOOLEAN
);

CREATE TABLE patients (
    patient_id      SERIAL PRIMARY KEY,
    first_name      VARCHAR(50),
    last_name       VARCHAR(50),
    date_of_birth   DATE,
    gender          VARCHAR(10),
    blood_type      VARCHAR(5),
    phone           VARCHAR(15),
    email           VARCHAR(100),
    address         TEXT,
    city            VARCHAR(50),
    admission_date  DATE,
    discharge_date  DATE,
    ward            VARCHAR(50),
    doctor_id       INT REFERENCES doctors(doctor_id),
    diagnosis       VARCHAR(100),
    status          VARCHAR(20)
);