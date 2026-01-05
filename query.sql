create database Hospitaldb;
use Hospitaldb;


CREATE TABLE Branch (
    branch_id INT PRIMARY KEY,
    branch_name VARCHAR(100) NOT NULL,
    address VARCHAR(255),
    contact_number VARCHAR(20)
);


CREATE TABLE Department (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL,
    branch_id  INT REFERENCES Branch
);

CREATE TABLE Ward (
    ward_id INT PRIMARY KEY,
    ward_name VARCHAR(50) NOT NULL,
    ward_type VARCHAR(50),
    floor_number INT,
    branch_id INT REFERENCES Branch(branch_id)
);


CREATE TABLE Room (
    room_id INT PRIMARY KEY,
    ward_id INT REFERENCES Ward(ward_id),
    room_number VARCHAR(10) NOT NULL,
    room_type VARCHAR(50),
    daily_charge DECIMAL(10,2),
    no_of_bed INT,
    room_status  ENUM ('Available', 'Not Available')
    
);


CREATE TABLE Patient (
    patient_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50),
    gender ENUM('M','F','O'),
    date_of_birth DATE,
    phone VARCHAR(20),
    email VARCHAR(50),
    address VARCHAR(255)
);

CREATE TABLE Emergency_Contact (
    contact_id INT PRIMARY KEY,
    patient_id INT REFERENCES Patient(patient_id),
    contact_name VARCHAR(100),
    relationship VARCHAR(50),
    phone VARCHAR(20)
);



CREATE TABLE Doctor (
    doctor_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50),
    specialization VARCHAR(100),
    phone VARCHAR(20),
    email VARCHAR(50),
    department_id INT REFERENCES Department(department_id)
);

CREATE TABLE Doctor_Duty (
    duty_id INT PRIMARY KEY,
    doctor_id INT REFERENCES Doctor(doctor_id),
    day_of_week VARCHAR(10) NOT NULL,      
    start_time TIME NOT NULL,
    end_time TIME NOT NULL,
    doctor_status ENUM( 'Available','Not Available')  
);



CREATE TABLE Staff (
    staff_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    role VARCHAR(50),
    phone VARCHAR(20),
    email VARCHAR(50),
    department_id INT REFERENCES Department(department_id)
);

CREATE TABLE Staff_Duty (
    duty_id INT PRIMARY KEY,
    staff_id INT REFERENCES Staff(staff_id),
    day_of_week VARCHAR(10) NOT NULL,
    start_time TIME NOT NULL,
    end_time TIME NOT NULL,
    staff_status  ENUM( 'Available','Not Available')  
);




CREATE TABLE Appointment (
    appointment_id INT PRIMARY KEY,
    patient_id INT REFERENCES Patient(patient_id),
    doctor_id INT REFERENCES Doctor(doctor_id),
    appointment_date DATE,
    appointment_time TIME,
    appointment_status ENUM('Scheduled','Unscheduled')
);


CREATE TABLE Admission (
    admission_id INT PRIMARY KEY,
    patient_id INT REFERENCES Patient(patient_id),
    room_id INT REFERENCES Room(room_id),
    admission_date DATE,
    discharge_date DATE,
    attending_doctor_id INT REFERENCES Doctor(doctor_id)
);


CREATE TABLE Medical_Record (
    record_id INT PRIMARY KEY,
    patient_id INT REFERENCES Patient(patient_id),
    admission_id INT REFERENCES Admission(admission_id),
    visit_date DATE,
    notes TEXT
);

CREATE TABLE Medication (
    medication_id INT PRIMARY KEY,
    medicine_name VARCHAR(100),
    category VARCHAR(50),
    unit_price DECIMAL(10,2),
    manufacturer VARCHAR(100)
);


CREATE TABLE Medicine_Inventory (
    inventory_id INT PRIMARY KEY,
    medication_id INT REFERENCES Medication(medication_id),
    branch_id INT REFERENCES Branch(branch_id),
    quantity_in_stock INT,
    reorder_level INT,
    expiry_date DATE,
    last_updated TIMESTAMP DEFAULT NOW()
);

CREATE TABLE Lab_Test (
    lab_test_id INT PRIMARY KEY,
    test_name VARCHAR(100),
    description TEXT,
    cost DECIMAL(10,2)
);


CREATE TABLE Test_Result (
    result_id INT PRIMARY KEY,
    lab_test_id INT REFERENCES Lab_Test(lab_test_id),
    record_id INT REFERENCES Medical_Record(record_id),
    result_value TEXT,
    result_date DATE
);


CREATE TABLE Billing (
    bill_id INT PRIMARY KEY,
    patient_id INT REFERENCES Patient(patient_id),
    bill_date DATE,
    total_amount DECIMAL(10,2)
);


CREATE TABLE Billing_Item (
    item_id INT PRIMARY KEY,
    bill_id INT REFERENCES Billing(bill_id),
    description VARCHAR(100),
    amount DECIMAL(10,2)
);


CREATE TABLE Payment (
    payment_id INT PRIMARY KEY,
    bill_id INT REFERENCES Billing(bill_id),
    payment_date DATE,
    amount DECIMAL(10,2),
    payment_method VARCHAR(50)
);


