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

-- Create the invoice_items table
CREATE TABLE IF NOT EXISTS invoice_items (
    id INT GENERATED ALWAYS AS IDENTITY,
    unit_price DECIMAL(10, 2),
    quantity INT,
    total_price DECIMAL(10, 2),
    invoice_id INT,
    treatment_id INT,
    PRIMARY KEY(id),
    CONSTRAINT fk_invoice_id FOREIGN KEY(invoice_id) REFERENCES invoices(id),
    CONSTRAINT fk_treatment_id FOREIGN KEY(treatment_id) REFERENCES treatments(id)
);

-- Create the treatments_histories table for the many-to-many relationship
CREATE TABLE IF NOT EXISTS treatments_histories (
    id INT GENERATED ALWAYS AS IDENTITY,
    medical_history_id INT,
    treatment_id INT,
    PRIMARY KEY(id),
    CONSTRAINT fk_medical_history_id FOREIGN KEY(medical_history_id) REFERENCES medical_histories(id),
    CONSTRAINT fk_treatment_id FOREIGN KEY(treatment_id) REFERENCES treatments(id)
);

-- Create Indexes
CREATE INDEX IF NOT EXISTS idx_medical_histories_patient_id ON medical_histories (patient_id);
CREATE INDEX IF NOT EXISTS idx_invoices_medical_history_id ON invoices (medical_history_id);
CREATE INDEX IF NOT EXISTS idx_invoice_items_invoice_id ON invoice_items (invoice_id);
CREATE INDEX IF NOT EXISTS idx_invoice_items_treatment_id ON invoice_items (treatment_id);
CREATE INDEX IF NOT EXISTS idx_treatments_histories_medical_history_id ON treatments_histories(medical_history_id);
CREATE INDEX IF NOT EXISTS idx_treatments_histories_treatment_id ON treatments_histories(treatment_id);
