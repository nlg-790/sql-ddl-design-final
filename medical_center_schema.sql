-- Create Doctors Table
CREATE TABLE Doctors (
    doctor_id INT PRIMARY KEY,
    name VARCHAR(100),
    specialty VARCHAR(100)
);

-- Create Patients Table
CREATE TABLE Patients (
    patient_id INT PRIMARY KEY,
    name VARCHAR(100),
    insurance VARCHAR(100),
    birthday DATE
);

-- Create Visits Table (to handle many-to-many relationship between Doctors and Patients)
CREATE TABLE Visits (
    visit_id INT PRIMARY KEY,
    doctor_id INT,
    patient_id INT,
    visit_date TIMESTAMP,
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id),
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id)
);

-- Create Diseases Table
CREATE TABLE Diseases (
    disease_id INT PRIMARY KEY,
    name VARCHAR(100),
    description TEXT
);

-- Create Diagnoses Table (to handle many-to-many relationship between Visits and Diseases)
CREATE TABLE Diagnoses (
    diagnosis_id INT PRIMARY KEY,
    visit_id INT,
    disease_id INT,
    notes TEXT,
    FOREIGN KEY (visit_id) REFERENCES Visits(visit_id),
    FOREIGN KEY (disease_id) REFERENCES Diseases(disease_id)
);
