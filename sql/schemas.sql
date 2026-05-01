-- creating database
create database hospital_management;

-- creating tables

CREATE TABLE branches (
    branch_id     INT PRIMARY KEY,
    branch_name   VARCHAR(100) NOT NULL,
    city          VARCHAR(100) NOT NULL,
    address       TEXT NOT NULL,
    phone         VARCHAR(15),
    manager_name  VARCHAR(100)
);


CREATE TABLE departments (
    department_id    INT PRIMARY KEY,
    branch_id       INT NOT NULL,
    department_name VARCHAR(100) NOT NULL,
    location        VARCHAR(100),
    phone           VARCHAR(15),
    CONSTRAINT branch
        FOREIGN KEY (branch_id)
        REFERENCES branches(branch_id)
        ON DELETE RESTRICT
);


CREATE TABLE doctors (
    doctor_id      INT PRIMARY KEY,
    branch_id      INT NOT NULL,
    department_id  INT NOT NULL,
    first_name     VARCHAR(50) NOT NULL,
    last_name      VARCHAR(50) NOT NULL,
    specialization VARCHAR(100),
    phone          VARCHAR(15),
    email          VARCHAR(100) UNIQUE,
		    created_at      TIMESTAMP DEFAULT NOW(),
    CONSTRAINT branch
        FOREIGN KEY (branch_id)
        REFERENCES branches(branch_id)
        ON DELETE RESTRICT,
    CONSTRAINT department
        FOREIGN KEY (department_id)
        REFERENCES departments(department_id)
        ON DELETE RESTRICT
);


CREATE TABLE patients (
    patient_id    INT PRIMARY KEY,
    branch_id     INT NOT NULL,
    first_name    VARCHAR(50) NOT NULL,
    last_name     VARCHAR(50) NOT NULL,
    date_of_birth DATE NOT NULL,
    gender        VARCHAR(10) CHECK (gender IN ('Male', 'Female', 'Other')),
    blood_group   VARCHAR(5) CHECK (blood_group IN ('A+','A-','B+','B-','AB+','AB-','O+','O-')),
    phone         VARCHAR(15),
    email         VARCHAR(100) UNIQUE,
    address       TEXT,
		    created_at      TIMESTAMP DEFAULT NOW(),
       CONSTRAINT branch
        FOREIGN KEY (branch_id)
        REFERENCES branches(branch_id)
        ON DELETE RESTRICT
);


CREATE TABLE appointments (
    appointment_id  INT  PRIMARY KEY,
    branch_id        INT NOT NULL,
    patient_id       INT NOT NULL,
    doctor_id        INT NOT NULL,
    appointment_date DATE NOT NULL,
    appointment_time TIME NOT NULL,
    status           VARCHAR(20) DEFAULT 'scheduled'
                     CHECK (status IN ('scheduled','completed','cancelled')),
    notes            TEXT,
	    created_at      TIMESTAMP DEFAULT NOW(),
    CONSTRAINT branch
        FOREIGN KEY (branch_id)
        REFERENCES branches(branch_id)
        ON DELETE RESTRICT,
		
    CONSTRAINT patient
        FOREIGN KEY (patient_id)
        REFERENCES patients(patient_id)
        ON DELETE RESTRICT,
		
    CONSTRAINT doctor
        FOREIGN KEY (doctor_id)
        REFERENCES doctors(doctor_id)
        ON DELETE RESTRICT,
    
    CONSTRAINT unique_doctor_schedule
        UNIQUE (doctor_id, appointment_date, appointment_time)
);


CREATE TABLE medical_records (
    record_id      INT  PRIMARY KEY,
    appointment_id  INT NOT NULL UNIQUE,
    diagnosis       TEXT NOT NULL,
    symptoms        TEXT,
    treatment       TEXT,
    follow_up_date  DATE,
    created_at      TIMESTAMP DEFAULT NOW(),
    CONSTRAINT appointment
        FOREIGN KEY (appointment_id)
        REFERENCES appointments(appointment_id)
        ON DELETE RESTRICT
);


CREATE TABLE prescriptions (
    prescription_id INT PRIMARY KEY,
    appointment_id  INT NOT NULL,
    medicine_name   VARCHAR(100) NOT NULL,
    dosage          VARCHAR(50),
    frequency       VARCHAR(50),
    duration_days   INT CHECK (duration_days > 0),
    notes           TEXT,
    CONSTRAINT appointment
        FOREIGN KEY (appointment_id)
        REFERENCES appointments(appointment_id)
        ON DELETE RESTRICT
);


CREATE TABLE bills (
    bill_id      INT   PRIMARY KEY,
    appointment_id INT NOT NULL UNIQUE,
    total_amount   DECIMAL(10,2) NOT NULL CHECK (total_amount > 0),
    bill_date      DATE DEFAULT CURRENT_DATE,
    due_date       DATE,
    status         VARCHAR(20) DEFAULT 'unpaid'
                   CHECK (status IN ('unpaid','paid','partial')),
    CONSTRAINT appointment
        FOREIGN KEY (appointment_id)
        REFERENCES appointments(appointment_id)
        ON DELETE RESTRICT
);


CREATE TABLE payments (
    payment_id     INT PRIMARY KEY,
    bill_id        INT NOT NULL,
    amount_paid    DECIMAL(10,2) NOT NULL CHECK (amount_paid > 0),
    payment_date   TIMESTAMP DEFAULT NOW(),
    payment_method VARCHAR(50) CHECK (payment_method IN ('cash','card','bank transfer','insurance')),
    CONSTRAINT bill
        FOREIGN KEY (bill_id)
        REFERENCES bills(bill_id)
        ON DELETE RESTRICT
);
