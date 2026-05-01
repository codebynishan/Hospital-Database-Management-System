CREATE INDEX idx_branches_city ON branches(city);

CREATE INDEX idx_departments_branch_id ON departments(branch_id);

CREATE INDEX idx_doctors_specialization ON doctors(specialization);

CREATE INDEX idx_patients_last_name ON patients(last_name);

CREATE INDEX idx_appointments_appointment_date ON appointments(appointment_date);

CREATE INDEX idx_medical_records_appointment_id ON medical_records(appointment_id);

CREATE INDEX idx_prescriptions_appointment_id ON prescriptions(appointment_id);

CREATE INDEX idx_bills_status ON bills(status);

CREATE INDEX idx_payments_bill_id ON payments(bill_id);