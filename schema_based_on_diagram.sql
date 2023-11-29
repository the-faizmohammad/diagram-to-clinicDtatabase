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

-- Create the treatments table
CREATE TABLE IF NOT EXISTS treatments (
    id INT GENERATED ALWAYS AS IDENTITY,
    type VARCHAR(200),
    name VARCHAR(200),
    PRIMARY KEY(id)
);

-- Create the invoices table
CREATE TABLE IF NOT EXISTS invoices (
    id INT GENERATED ALWAYS AS IDENTITY,
    total_amount DECIMAL(10, 2),
    generated_at TIMESTAMP,
    payed_at TIMESTAMP,
    medical_history_id INT,
    PRIMARY KEY(id),
    CONSTRAINT fk_medical_history_id FOREIGN KEY(medical_history_id) REFERENCES medical_histories(id)
);
