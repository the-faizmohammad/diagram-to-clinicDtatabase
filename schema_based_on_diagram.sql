-- Create the human_clinic database
CREATE DATABASE human_clinic;

-- Create the medical_histories table
CREATE TABLE IF NOT EXISTS medical_histories (
    id INT GENERATED ALWAYS AS IDENTITY,
    admitted_at TIMESTAMP,
    patient_id INT,
    status VARCHAR(200),
    PRIMARY KEY(id),
    CONSTRAINT fk_patient_id FOREIGN KEY(patient_id) REFERENCES patients(id)
);

-- Create the patients table
CREATE TABLE IF NOT EXISTS patients (
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(200),
    date_of_birth DATE,
    PRIMARY KEY(id)
);
