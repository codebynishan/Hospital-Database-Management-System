-- Which department has the highest number of admissions in the last 6 months?-- 
SELECT 
    d.department_name,
    COUNT(a.admission_id) AS total_admissions
FROM Admission a
JOIN Doctor doc ON a.attending_doctor_id = doc.doctor_id
JOIN Department d ON doc.department_id = d.department_id
WHERE a.admission_date >= CURDATE() - INTERVAL 6 MONTH
GROUP BY d.department_name
ORDER BY total_admissions DESC
LIMIT 1;

-- Which ward and room type are most occupied?
SELECT 
    w.ward_name,
    r.room_type,
    COUNT(a.admission_id) AS occupancy_count
FROM Admission a
JOIN Room r ON a.room_id = r.room_id
JOIN Ward w ON r.ward_id = w.ward_id
GROUP BY w.ward_name, r.room_type
ORDER BY occupancy_count DESC
LIMIT 1;


-- Which doctor has the highest number of appointments?
SELECT 
    d.first_name,
    d.last_name,
    COUNT(a.appointment_id) AS total_appointments
FROM Doctor d
JOIN Appointment a ON d.doctor_id = a.doctor_id
GROUP BY d.doctor_id
ORDER BY total_appointments DESC
LIMIT 1;

-- Which days and times are busiest for doctors?
SELECT 
    day_of_week,
    start_time,
    end_time,
    COUNT(doctor_id) AS num_doctors
FROM Doctor_Duty
GROUP BY day_of_week, start_time, end_time
ORDER BY num_doctors DESC
LIMIT 10;


-- What is the total revenue generated per month?
SELECT 
    DATE_FORMAT(bill_date, '%Y-%m') AS month,
    SUM(total_amount) AS total_revenue
FROM Billing
GROUP BY month
ORDER BY month;

-- Which patients have the highest billing amount?
SELECT 
    p.first_name,
    p.last_name,
    SUM(b.total_amount) AS total_billed
FROM Patient p
JOIN Billing b ON p.patient_id = b.patient_id
GROUP BY p.patient_id
ORDER BY total_billed DESC
LIMIT 10;


-- Average bill amount per department or per patient type.
SELECT 
    dept.department_name,
    AVG(b.total_amount) AS avg_bill
FROM Billing b
JOIN Patient p ON b.patient_id = p.patient_id
JOIN Admission a ON a.patient_id = p.patient_id
JOIN Room r ON a.room_id = r.room_id
JOIN Ward w ON r.ward_id = w.ward_id
JOIN Department dept ON dept.department_id = w.branch_id   -- optional, if dept linked
GROUP BY dept.department_name
ORDER BY avg_bill DESC;

-- Assuming you have a table linking medication to patient/admission
SELECT 
    m.medicine_name,
    COUNT(*) AS times_prescribed
FROM Medication m
JOIN Prescription p ON m.medication_id = p.medication_id  -- if exists
GROUP BY m.medicine_name
ORDER BY times_prescribed DESC
LIMIT 5;

-- Average cost per lab test.
SELECT 
    test_name,
    AVG(cost) AS avg_cost
FROM Lab_Test
GROUP BY test_name;

-- Which lab test is most frequently conducted?
SELECT 
    lt.test_name,
    COUNT(tr.result_id) AS times_conducted
FROM Lab_Test lt
JOIN Test_Result tr ON lt.lab_test_id = tr.lab_test_id
GROUP BY lt.lab_test_id
ORDER BY times_conducted DESC
LIMIT 1;



-- Which staff member has the highest number of “Not Available” days?
SELECT 
    s.first_name,
    s.last_name,
    COUNT(sd.duty_id) AS not_available_days
FROM Staff s
JOIN Staff_Duty sd ON s.staff_id = sd.staff_id
WHERE sd.staff_status = 'Not Available'
GROUP BY s.staff_id
ORDER BY not_available_days DESC
LIMIT 1;



