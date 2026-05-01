-- inserting a  data to each tables
INSERT INTO branches (branch_id, branch_name, city, address, phone, manager_name)
VALUES
  (1, 'Apollo Kathmandu', 'Kathmandu', 'Maharajgunj, Ring Road, Kathmandu', '01-4444444', 'Dr. Ram Shrestha'),
  (2, 'Apollo Pokhara',   'Pokhara',   'Newroad, Lakeside, Pokhara',         '061-555555', 'Dr. Sita Sharma'),
  (3, 'Apollo Chitwan',   'Chitwan',   'Bharatpur-10, Chitwan',              '056-666666', 'Dr. Hari Thapa');


INSERT INTO departments (department_id, branch_id, department_name, location, phone)
VALUES

  (10, 1, 'Cardiology',       'Floor 2, Block A', '01-4444401'),
  (11, 1, 'Neurology',        'Floor 3, Block A', '01-4444402'),
  (12, 1, 'General Medicine', 'Floor 1, Block B', '01-4444403'),
  (20, 2, 'Cardiology',       'Floor 1, Block A', '061-555501'),
  (21, 2, 'Orthopedics',      'Floor 2, Block B', '061-555502'),
  (22, 2, 'General Medicine', 'Floor 1, Block C', '061-555503'),
  (23, 3, 'Pediatrics',       'Floor 1, Block A', '056-666601'),
  (24, 3, 'General Medicine', 'Floor 2, Block A', '056-666602'),
  (25, 3, 'Orthopedics',      'Floor 3, Block B', '056-666603');



INSERT INTO doctors (doctor_id, branch_id, department_id, first_name, last_name, specialization, phone, email)
VALUES

  (1,  1, 10, 'Rajesh',  'Adhikari', 'Cardiologist',       '9801111111', 'rajesh.adhikari@apollo.com'),
  (2,  1, 10, 'Sunita',  'Koirala',  'Cardiac Surgeon',    '9801111112', 'sunita.koirala@apollo.com'),
  (3,  1, 12, 'Bikash',  'Thapa',    'Neurologist',        '9801111113', 'bikash.thapa@apollo.com'),
  (4,  1, 11, 'Anita',   'Gurung',   'General Physician',  '9801111114', 'anita.gurung@apollo.com'),
  (5,  2, 20, 'Prakash', 'Sharma',   'Cardiologist',       '9806111111', 'prakash.sharma@apollo.com'),
  (6,  2, 21, 'Manisha', 'Rai',      'Orthopedic Surgeon', '9806111112', 'manisha.rai@apollo.com'),
  (7,  2, 22, 'Suresh',  'Poudel',   'General Physician',  '9806111113', 'suresh.poudel@apollo.com'),
  (8,  2, 21, 'Dipesh',  'Basnet',   'Orthopedic Surgeon', '9806111114', 'dipesh.basnet@apollo.com'),
  (9,  3, 23, 'Priya',   'Maharjan', 'Pediatrician',       '9855111111', 'priya.maharjan@apollo.com'),
  (10, 3, 24, 'Rohan',   'Tamang',   'Pediatrician',       '9855111112', 'rohan.tamang@apollo.com'),
  (11, 3, 25, 'Kabita',  'Limbu',    'General Physician',  '9855111113', 'kabita.limbu@apollo.com'),
  (12, 3, 25, 'Sanjay',  'Bhandari', 'Orthopedic Surgeon', '9855111114', 'sanjay.bhandari@apollo.com');


 INSERT INTO patients (patient_id, branch_id, first_name, last_name, date_of_birth, gender, blood_group, phone, email, address)
VALUES

  (1,  1, 'Arun',    'Shrestha',  '1990-05-10', 'Male',   'A+',  '9841000001', 'arun.s@gmail.com',    'Baneshwor, Kathmandu'),
  (2,  1, 'Bina',    'Tamang',    '1985-08-22', 'Female', 'B+',  '9841000002', 'bina.t@gmail.com',    'Lalitpur, Kathmandu'),
  (3,  1, 'Chandra', 'Rai',       '1978-12-01', 'Male',   'O+',  '9841000003', 'chandra.r@gmail.com', 'Bhaktapur, Kathmandu'),
  (4,  1, 'Dipa',    'Magar',     '1995-03-18', 'Female', 'AB+', '9841000004', 'dipa.m@gmail.com',    'Koteshwor, Kathmandu'),
  (5,  1, 'Eshan',   'Karki',     '2000-07-25', 'Male',   'A-',  '9841000005', 'eshan.k@gmail.com',   'Chabahil, Kathmandu'),
  (6,  1, 'Fiona',   'Lama',      '1992-11-14', 'Female', 'B-',  '9841000006', 'fiona.l@gmail.com',   'Bouddha, Kathmandu'),
  (7,  1, 'Ganesh',  'Oli',       '1970-04-30', 'Male',   'O-',  '9841000007', 'ganesh.o@gmail.com',  'Kirtipur, Kathmandu'),
  (8,  2, 'Hari',    'Subedi',    '1988-09-15', 'Male',   'A+',  '9856000001', 'hari.s@gmail.com',    'Lakeside, Pokhara'),
  (9,  2, 'Indira',  'Gautam',    '1993-02-28', 'Female', 'B+',  '9856000002', 'indira.g@gmail.com',  'Newroad, Pokhara'),
  (10, 2, 'Jeevan',  'Pandey',    '1982-06-10', 'Male',   'O+',  '9856000003', 'jeevan.p@gmail.com',  'Mahendrapul, Pokhara'),
  (11, 2, 'Kamala',  'Thapa',     '1975-10-05', 'Female', 'AB-', '9856000004', 'kamala.t@gmail.com',  'Baidam, Pokhara'),
  (12, 2, 'Lokesh',  'Gurung',    '1998-01-20', 'Male',   'A+',  '9856000005', 'lokesh.g@gmail.com',  'Seti, Pokhara'),
  (13, 2, 'Mina',    'Pun',       '1987-07-12', 'Female', 'O+',  '9856000006', 'mina.p@gmail.com',    'Prithvi, Pokhara'),
  (14, 3, 'Nabin',   'Dahal',     '1991-04-08', 'Male',   'B+',  '9845000001', 'nabin.d@gmail.com',   'Bharatpur, Chitwan'),
  (15, 3, 'Oshin',   'Khadka',    '1996-12-25', 'Female', 'A+',  '9845000002', 'oshin.k@gmail.com',   'Ratnanagar, Chitwan'),
  (16, 3, 'Prajwal', 'Bhattarai', '1983-08-17', 'Male',   'O-',  '9845000003', 'prajwal.b@gmail.com', 'Kawasoti, Chitwan'),
  (17, 3, 'Qureshi', 'Ansari',    '1979-03-22', 'Male',   'AB+', '9845000004', 'qureshi.a@gmail.com', 'Madi, Chitwan'),
  (18, 3, 'Riya',    'Chaudhary', '1994-09-30', 'Female', 'B-',  '9845000005', 'riya.c@gmail.com',    'Bharatpur, Chitwan'),
  (19, 3, 'Suman',   'Yadav',     '2001-06-14', 'Male',   'A-',  '9845000006', 'suman.y@gmail.com',   'Kalyanpur, Chitwan'),
  (20, 3, 'Tara',    'Devi',      '1968-11-03', 'Female', 'O+',  '9845000007', 'tara.d@gmail.com',    'Patihani, Chitwan');


  INSERT INTO appointments (appointment_id, branch_id, patient_id, doctor_id, appointment_date, appointment_time, status, notes)
VALUES

  (1,  1, 1,  1,  '2024-01-10', '09:00', 'completed', 'Chest pain checkup'),
  (2,  1, 2,  3,  '2024-01-11', '10:00', 'completed', 'Headache and dizziness'),
  (3,  1, 3,  1,  '2024-01-12', '11:00', 'completed', 'Routine heart checkup'),
  (4,  1, 4,  4,  '2024-01-13', '09:30', 'completed', 'Fever and cold'),
  (5,  1, 5,  2,  '2024-01-14', '14:00', 'completed', 'Heart palpitation'),
  (6,  1, 6,  3,  '2024-01-15', '11:30', 'cancelled', 'Patient did not show up'),
  (7,  1, 7,  4,  '2024-01-16', '10:30', 'completed', 'Diabetes follow up'),
  (8,  1, 1,  3,  '2024-02-10', '09:00', 'completed', 'Follow up neurology'),
  (9,  1, 2,  4,  '2024-02-12', '10:00', 'scheduled', 'General checkup'),
  (10, 1, 3,  2,  '2024-02-15', '11:00', 'scheduled', 'Cardiac surgery consult'),
  (11, 2, 8,  5,  '2024-01-10', '09:00', 'completed', 'Heart pain'),
  (12, 2, 9,  6,  '2024-01-11', '10:30', 'completed', 'Knee injury'),
  (13, 2, 10, 7,  '2024-01-12', '11:00', 'completed', 'Routine checkup'),
  (14, 2, 11, 5,  '2024-01-13', '14:00', 'completed', 'Blood pressure high'),
  (15, 2, 12, 8,  '2024-01-14', '09:30', 'completed', 'Shoulder pain'),
  (16, 2, 13, 7,  '2024-01-15', '10:00', 'cancelled', 'Cancelled by patient'),
  (17, 2, 8,  6,  '2024-02-10', '11:00', 'completed', 'Knee follow up'),
  (18, 2, 9,  5,  '2024-02-11', '09:00', 'scheduled', 'Heart follow up'),
  (19, 2, 10, 8,  '2024-02-13', '10:30', 'scheduled', 'Orthopedic consult'),
  (20, 2, 11, 7,  '2024-02-14', '11:00', 'scheduled', 'BP monitoring'),
  (21, 3, 14, 9,  '2024-01-10', '09:00', 'completed', 'Child fever'),
  (22, 3, 15, 11, '2024-01-11', '10:00', 'completed', 'General checkup'),
  (23, 3, 16, 12, '2024-01-12', '11:30', 'completed', 'Back pain'),
  (24, 3, 17, 9,  '2024-01-13', '14:00', 'completed', 'Child vaccination'),
  (25, 3, 18, 10, '2024-01-14', '09:30', 'completed', 'Child growth checkup'),
  (26, 3, 19, 11, '2024-01-15', '10:00', 'cancelled', 'Doctor unavailable'),
  (27, 3, 20, 12, '2024-01-16', '11:00', 'completed', 'Spine checkup'),
  (28, 3, 14, 10, '2024-02-10', '09:00', 'scheduled', 'Follow up pediatric'),
  (29, 3, 15, 12, '2024-02-12', '10:30', 'scheduled', 'Orthopedic follow up'),
  (30, 3, 16, 11, '2024-02-14', '11:00', 'scheduled', 'General follow up');

select * from appointments;


INSERT INTO medical_records (record_id, appointment_id, diagnosis, symptoms, treatment, follow_up_date)
VALUES
  (1,  1,  'Angina Pectoris',     'Chest pain, shortness of breath',   'Prescribed nitrates, rest advised',        '2024-02-10'),
  (2,  2,  'Migraine',            'Severe headache, light sensitivity', 'Prescribed sumatriptan, avoid triggers',   '2024-02-11'),
  (3,  3,  'Hypertensive Heart',  'High BP, mild chest discomfort',    'BP medication adjusted',                   '2024-02-15'),
  (4,  4,  'Upper Respiratory',   'Fever, runny nose, sore throat',    'Prescribed antibiotics and rest',          NULL),
  (5,  5,  'Arrhythmia',          'Irregular heartbeat, fatigue',      'ECG done, medication prescribed',          '2024-02-14'),
  (6,  7,  'Type 2 Diabetes',     'High blood sugar, fatigue',         'Insulin dosage adjusted, diet plan given', '2024-03-16'),
  (7,  8,  'Tension Headache',    'Mild headache, neck stiffness',     'Physiotherapy recommended',                NULL),
  (8,  11, 'Coronary Artery',     'Chest tightness, breathlessness',   'Angioplasty recommended',                  '2024-02-10'),
  (9,  12, 'Ligament Tear',       'Knee pain, swelling',               'Surgery recommended, physiotherapy',       '2024-02-11'),
  (10, 13, 'Common Cold',         'Runny nose, mild fever',            'Rest, fluids, paracetamol',                NULL),
  (11, 14, 'Hypertension',        'High BP, dizziness',                'Antihypertensive medication prescribed',   '2024-02-13'),
  (12, 15, 'Rotator Cuff Injury', 'Shoulder pain, limited movement',   'Physiotherapy, anti-inflammatory drugs',   '2024-02-14'),
  (13, 17, 'Knee Osteoarthritis', 'Knee pain, stiffness',              'Pain management, knee brace recommended',  '2024-03-10'),
  (14, 21, 'Viral Fever',         'High fever, body ache',             'Antipyretics, rest, fluids',               NULL),
  (15, 22, 'Gastroenteritis',     'Stomach pain, loose motions',       'ORS, light diet, probiotics',              NULL),
  (16, 23, 'Lumbar Spondylosis',  'Lower back pain, stiffness',        'Physiotherapy, pain killers',              '2024-02-12'),
  (17, 24, 'Routine Vaccination', 'Healthy child',                     'MMR vaccine administered',                 '2024-04-13'),
  (18, 25, 'Growth Delay',        'Below average height, weight',      'Nutritional supplements prescribed',       '2024-04-14'),
  (19, 27, 'Herniated Disc',      'Severe back pain, numbness',        'MRI recommended, pain management',         '2024-02-16');


INSERT INTO prescriptions (prescription_id, appointment_id, medicine_name, dosage, frequency, duration_days, notes)
VALUES
  (1,  1,  'Nitroglycerin',    '0.5mg',   'As needed',    30, 'Take under tongue during chest pain'),
  (2,  1,  'Aspirin',          '75mg',    'Once daily',   90, 'Take after food'),
  (3,  2,  'Sumatriptan',      '50mg',    'As needed',    10, 'Max 2 tablets per day'),
  (4,  2,  'Ibuprofen',        '400mg',   'Twice daily',  5,  'Take with food'),
  (5,  3,  'Amlodipine',       '5mg',     'Once daily',   30, 'Take at same time each day'),
  (6,  4,  'Amoxicillin',      '500mg',   'Thrice daily', 7,  'Complete the full course'),
  (7,  4,  'Paracetamol',      '500mg',   'Twice daily',  5,  'Take when fever above 38C'),
  (8,  5,  'Metoprolol',       '25mg',    'Twice daily',  30, 'Do not stop suddenly'),
  (9,  7,  'Metformin',        '500mg',   'Twice daily',  90, 'Take with meals'),
  (10, 7,  'Insulin Glargine', '10 units','Once at night',30, 'Inject subcutaneously'),
  (11, 11, 'Atorvastatin',     '40mg',    'Once daily',   90, 'Take at night'),
  (12, 11, 'Clopidogrel',      '75mg',    'Once daily',   90, 'Take after food'),
  (13, 12, 'Diclofenac',       '50mg',    'Twice daily',  7,  'Apply gel locally as well'),
  (14, 13, 'Cetirizine',       '10mg',    'Once daily',   5,  'Take at night'),
  (15, 14, 'Losartan',         '50mg',    'Once daily',   30, 'Monitor BP daily'),
  (16, 15, 'Naproxen',         '250mg',   'Twice daily',  10, 'Take with food'),
  (17, 21, 'Paracetamol',      '650mg',   'Thrice daily', 5,  'Take when temperature rises'),
  (18, 21, 'ORS',              '1 sachet','After loose stool', 5, 'Dissolve in 200ml water'),
  (19, 23, 'Pregabalin',       '75mg',    'Twice daily',  30, 'Do not drive after taking'),
  (20, 25, 'Vitamin D3',       '1000 IU', 'Once daily',   90, 'Take with fatty meal');


INSERT INTO bills (bill_id, appointment_id, total_amount, bill_date, due_date, status)
VALUES
  (1,  1,  2500.00, '2024-01-10', '2024-01-20', 'paid'),
  (2,  2,  1800.00, '2024-01-11', '2024-01-21', 'paid'),
  (3,  3,  2200.00, '2024-01-12', '2024-01-22', 'paid'),
  (4,  4,  1200.00, '2024-01-13', '2024-01-23', 'paid'),
  (5,  5,  3000.00, '2024-01-14', '2024-01-24', 'partial'),
  (6,  7,  1500.00, '2024-01-16', '2024-01-26', 'paid'),
  (7,  8,  1000.00, '2024-02-10', '2024-02-20', 'unpaid'),
  (8,  11, 2800.00, '2024-01-10', '2024-01-20', 'paid'),
  (9,  12, 3500.00, '2024-01-11', '2024-01-21', 'partial'),
  (10, 13, 1000.00, '2024-01-12', '2024-01-22', 'paid'),
  (11, 14, 1800.00, '2024-01-13', '2024-01-23', 'paid'),
  (12, 15, 2500.00, '2024-01-14', '2024-01-24', 'paid'),
  (13, 17, 2000.00, '2024-02-10', '2024-02-20', 'unpaid'),
  (14, 21, 1200.00, '2024-01-10', '2024-01-20', 'paid'),
  (15, 22, 800.00,  '2024-01-11', '2024-01-21', 'paid'),
  (16, 23, 1500.00, '2024-01-12', '2024-01-22', 'paid'),
  (17, 24, 500.00,  '2024-01-13', '2024-01-23', 'paid'),
  (18, 25, 1200.00, '2024-01-14', '2024-01-24', 'partial'),
  (19, 27, 2000.00, '2024-01-16', '2024-01-26', 'paid');




INSERT INTO payments (payment_id, bill_id, amount_paid, payment_date, payment_method)
VALUES
  (1,  1,  2500.00, '2024-01-10 10:30:00', 'card'),
  (2,  2,  1800.00, '2024-01-11 11:00:00', 'cash'),
  (3,  3,  2200.00, '2024-01-12 12:00:00', 'bank transfer'),
  (4,  4,  1200.00, '2024-01-13 09:45:00', 'cash'),
  (5,  5,  2000.00, '2024-01-14 14:30:00', 'card'),
  (6,  6,  1500.00, '2024-01-16 10:00:00', 'insurance'),
  (7,  8,  2800.00, '2024-01-10 10:00:00', 'card'),
  (8,  9,  2000.00, '2024-01-11 11:30:00', 'cash'),
  (9,  10, 1000.00, '2024-01-12 09:00:00', 'cash'),
  (10, 11, 1800.00, '2024-01-13 14:00:00', 'bank transfer'),
  (11, 12, 2500.00, '2024-01-14 10:30:00', 'insurance'),
  (12, 14, 1200.00, '2024-01-10 11:00:00', 'cash'),
  (13, 15, 800.00,  '2024-01-11 09:30:00', 'card'),
  (14, 16, 1500.00, '2024-01-12 10:00:00', 'cash'),
  (15, 17, 500.00,  '2024-01-13 11:30:00', 'insurance'),
  (16, 18, 800.00,  '2024-01-14 14:00:00', 'card'),
  (17, 19, 2000.00, '2024-01-16 10:30:00', 'bank transfer'),
  (18, 9,  1500.00, '2024-01-25 11:00:00', 'cash'),
  (19, 18, 400.00,  '2024-01-28 09:00:00', 'card'),
  (20, 5,  1000.00, '2024-01-30 10:00:00', 'cash');


 
