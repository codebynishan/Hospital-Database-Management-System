-- =============================================
-- PHASE 6: ROLE BASED SECURITY
-- COMPLETE CLEAN SCRIPT
-- =============================================

-- PART 1: CREATE ROLES
CREATE ROLE receptionist_role;
CREATE ROLE doctor_role;
CREATE ROLE billing_role;
CREATE ROLE pharmacist_role;
CREATE ROLE admin_role;

-- PART 2: CREATE USERS
CREATE USER receptionist_01 WITH PASSWORD 'Recep@2024';
CREATE USER doctor_01       WITH PASSWORD 'Doctor@2024';
CREATE USER billing_01      WITH PASSWORD 'Billing@2024';
CREATE USER pharmacist_01   WITH PASSWORD 'Pharma@2024';
CREATE USER admin_01        WITH PASSWORD 'Admin@2024';

-- PART 3: ASSIGN USERS TO ROLES
GRANT receptionist_role TO receptionist_01;
GRANT doctor_role       TO doctor_01;
GRANT billing_role      TO billing_01;
GRANT pharmacist_role   TO pharmacist_01;
GRANT admin_role        TO admin_01;

-- PART 4: GRANT DATABASE CONNECTION
GRANT CONNECT ON DATABASE hospital_management TO receptionist_01;
GRANT CONNECT ON DATABASE hospital_management TO doctor_01;
GRANT CONNECT ON DATABASE hospital_management TO billing_01;
GRANT CONNECT ON DATABASE hospital_management TO pharmacist_01;
GRANT CONNECT ON DATABASE hospital_management TO admin_01;

-- PART 5: GRANT SCHEMA ACCESS TO ALL ROLES
GRANT USAGE ON SCHEMA public TO receptionist_role;
GRANT USAGE ON SCHEMA public TO doctor_role;
GRANT USAGE ON SCHEMA public TO billing_role;
GRANT USAGE ON SCHEMA public TO pharmacist_role;
GRANT USAGE ON SCHEMA public TO admin_role;

-- PART 6: GRANT TABLE PERMISSIONS

-- Receptionist: manage patients and appointments only
GRANT SELECT, INSERT, UPDATE ON patients     TO receptionist_role;
GRANT SELECT, INSERT, UPDATE ON appointments TO receptionist_role;
GRANT SELECT ON doctors                      TO receptionist_role;
GRANT SELECT ON departments                  TO receptionist_role;
GRANT SELECT ON branches                     TO receptionist_role;

-- Doctor: view patients, manage medical records and prescriptions
GRANT SELECT ON patients                          TO doctor_role;
GRANT SELECT ON appointments                      TO doctor_role;
GRANT SELECT, INSERT, UPDATE ON medical_records   TO doctor_role;
GRANT SELECT, INSERT ON prescriptions             TO doctor_role;
GRANT SELECT ON departments                       TO doctor_role;
GRANT SELECT ON branches                          TO doctor_role;

-- Billing: manage bills and payments only
GRANT SELECT ON patients                          TO billing_role;
GRANT SELECT ON appointments                      TO billing_role;
GRANT SELECT, INSERT, UPDATE ON bills             TO billing_role;
GRANT SELECT, INSERT ON payments                  TO billing_role;

-- Pharmacist: view prescriptions only
GRANT SELECT ON prescriptions                     TO pharmacist_role;
GRANT SELECT ON patients                          TO pharmacist_role;
GRANT SELECT ON appointments                      TO pharmacist_role;

-- Admin: full access to everything
GRANT ALL PRIVILEGES ON ALL TABLES
IN SCHEMA public                                  TO admin_role;


-- Check 1: All roles and users exist
SELECT rolname
FROM pg_roles
WHERE rolname IN (
    'receptionist_role', 'doctor_role',
    'billing_role', 'pharmacist_role', 'admin_role',
    'receptionist_01', 'doctor_01', 'billing_01',
    'pharmacist_01', 'admin_01'
)
ORDER BY rolname;

-- Check 2: Table permissions exist
SELECT grantee, table_name, privilege_type
FROM information_schema.role_table_grants
WHERE grantee IN (
    'receptionist_role', 'doctor_role',
    'billing_role', 'pharmacist_role', 'admin_role'
)
ORDER BY grantee, table_name;

-- Check 3: Schema permissions exist
SELECT
    r.rolname AS grantee,
    n.nspname AS schema_name,
    p.privilege_type
FROM pg_namespace n
CROSS JOIN pg_roles r
CROSS JOIN (VALUES ('USAGE')) AS p(privilege_type)
WHERE n.nspname = 'public'
AND r.rolname IN (
    'receptionist_role', 'doctor_role',
    'billing_role', 'pharmacist_role', 'admin_role'
)
AND has_schema_privilege(r.rolname, n.nspname, p.privilege_type);



