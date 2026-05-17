/* =========================================================
   PROJECT: HOSPITAL MANAGEMENT & PATIENT ANALYTICS SYSTEM
   ========================================================= */


/* =========================================================
   CREATE DATABASE
   ========================================================= */

CREATE DATABASE hospital_management;

USE hospital_management;


/* =========================================================
   TABLE: DEPARTMENTS
   ========================================================= */

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100)
);


/* =========================================================
   TABLE: DOCTORS
   ========================================================= */

CREATE TABLE doctors (
    doctor_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department_id INT,
    specialization VARCHAR(100),
    hire_date DATE,

    FOREIGN KEY (department_id)
    REFERENCES departments(department_id)
);


/* =========================================================
   TABLE: PATIENTS
   ========================================================= */

CREATE TABLE patients (
    patient_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    gender VARCHAR(10),
    date_of_birth DATE,
    phone VARCHAR(20),
    city VARCHAR(50)
);


/* =========================================================
   TABLE: APPOINTMENTS
   ========================================================= */

CREATE TABLE appointments (
    appointment_id INT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    appointment_date DATE,
    status VARCHAR(20),

    FOREIGN KEY (patient_id)
    REFERENCES patients(patient_id),

    FOREIGN KEY (doctor_id)
    REFERENCES doctors(doctor_id)
);


/* =========================================================
   TABLE: TREATMENTS
   ========================================================= */

CREATE TABLE treatments (
    treatment_id INT PRIMARY KEY,
    appointment_id INT,
    treatment_type VARCHAR(100),
    cost DECIMAL(10,2),

    FOREIGN KEY (appointment_id)
    REFERENCES appointments(appointment_id)
);


/* =========================================================
   TABLE: BILLING
   ========================================================= */

CREATE TABLE billing (
    bill_id INT PRIMARY KEY,
    patient_id INT,
    treatment_id INT,
    amount_paid DECIMAL(10,2),
    payment_date DATE,

    FOREIGN KEY (patient_id)
    REFERENCES patients(patient_id),

    FOREIGN KEY (treatment_id)
    REFERENCES treatments(treatment_id)
);



/* =========================================================
   INSERT DATA INTO DEPARTMENTS
   ========================================================= */

INSERT INTO departments VALUES
(1, 'Cardiology'),
(2, 'Neurology'),
(3, 'Orthopedics'),
(4, 'Pediatrics'),
(5, 'General Medicine');


/* =========================================================
   INSERT DATA INTO DOCTORS
   ========================================================= */

INSERT INTO doctors VALUES
(101, 'John', 'Adams', 1, 'Heart Specialist', '2020-01-10'),
(102, 'Mary', 'Brown', 2, 'Brain Specialist', '2019-03-15'),
(103, 'David', 'Clark', 3, 'Bone Specialist', '2021-07-20'),
(104, 'Sarah', 'Wilson', 4, 'Child Specialist', '2022-02-12'),
(105, 'James', 'Taylor', 5, 'General Physician', '2018-11-05');


/* =========================================================
   INSERT DATA INTO PATIENTS
   ========================================================= */

INSERT INTO patients VALUES
(201, 'Michael', 'Scott', 'Male', '1985-06-15', '08011111111', 'Lagos'),
(202, 'Pam', 'Beesly', 'Female', '1990-09-25', '08022222222', 'Ibadan'),
(203, 'Jim', 'Halpert', 'Male', '1988-12-05', '08033333333', 'Abuja'),
(204, 'Angela', 'Martin', 'Female', '1987-03-18', '08044444444', 'Lagos'),
(205, 'Dwight', 'Schrute', 'Male', '1983-01-20', '08055555555', 'Kano');


/* =========================================================
   INSERT DATA INTO APPOINTMENTS
   ========================================================= */

INSERT INTO appointments VALUES
(301, 201, 101, '2025-01-05', 'Completed'),
(302, 202, 102, '2025-01-06', 'Completed'),
(303, 203, 103, '2025-01-07', 'Pending'),
(304, 204, 104, '2025-01-08', 'Completed'),
(305, 205, 105, '2025-01-09', 'Cancelled'),
(306, 201, 102, '2025-01-10', 'Completed'),
(307, 203, 101, '2025-01-11', 'Completed');


/* =========================================================
   INSERT DATA INTO TREATMENTS
   ========================================================= */

INSERT INTO treatments VALUES
(401, 301, 'Heart Checkup', 50000),
(402, 302, 'Brain MRI', 80000),
(403, 303, 'Bone X-Ray', 30000),
(404, 304, 'Child Vaccination', 20000),
(405, 306, 'Neurology Consultation', 60000),
(406, 307, 'Cardiology Review', 55000);


/* =========================================================
   INSERT DATA INTO BILLING
   ========================================================= */

INSERT INTO billing VALUES
(501, 201, 401, 50000, '2025-01-05'),
(502, 202, 402, 80000, '2025-01-06'),
(503, 203, 403, 30000, '2025-01-07'),
(504, 204, 404, 20000, '2025-01-08'),
(505, 201, 405, 60000, '2025-01-10'),
(506, 203, 406, 55000, '2025-01-11');



/* =========================================================
   BUSINESS ANALYSIS QUERIES
   ========================================================= */


/* =========================================================
   1. VIEW ALL PATIENTS
   ========================================================= */

SELECT * FROM patients;


/* =========================================================
   2. TOTAL HOSPITAL REVENUE
   ========================================================= */

SELECT SUM(amount_paid) AS total_revenue
FROM billing;


/* =========================================================
   3. REVENUE BY DEPARTMENT
   ========================================================= */

SELECT
    d.department_name,
    SUM(b.amount_paid) AS department_revenue
FROM billing b
JOIN treatments t ON b.treatment_id = t.treatment_id
JOIN appointments a ON t.appointment_id = a.appointment_id
JOIN doctors doc ON a.doctor_id = doc.doctor_id
JOIN departments d ON doc.department_id = d.department_id
GROUP BY d.department_name
ORDER BY department_revenue DESC;


/* =========================================================
   4. DOCTOR PERFORMANCE (PATIENT COUNT)
   ========================================================= */

SELECT
    doc.first_name,
    doc.last_name,
    COUNT(a.appointment_id) AS total_patients
FROM doctors doc
JOIN appointments a ON doc.doctor_id = a.doctor_id
GROUP BY doc.first_name, doc.last_name
ORDER BY total_patients DESC;


/* =========================================================
   5. APPOINTMENT STATUS ANALYSIS
   ========================================================= */

SELECT
    status,
    COUNT(*) AS total_appointments
FROM appointments
GROUP BY status;


/* =========================================================
   6. TOP PAYING PATIENTS
   ========================================================= */

SELECT
    p.first_name,
    p.last_name,
    SUM(b.amount_paid) AS total_spent
FROM billing b
JOIN patients p ON b.patient_id = p.patient_id
GROUP BY p.first_name, p.last_name
ORDER BY total_spent DESC;


/* =========================================================
   7. BUSIEST DOCTORS BY APPOINTMENTS
   ========================================================= */

SELECT
    doc.first_name,
    doc.last_name,
    COUNT(a.appointment_id) AS total_appointments
FROM doctors doc
JOIN appointments a ON doc.doctor_id = a.doctor_id
GROUP BY doc.first_name, doc.last_name
ORDER BY total_appointments DESC;


/* =========================================================
   8. TREATMENT COST ANALYSIS
   ========================================================= */

SELECT
    treatment_type,
    AVG(cost) AS avg_cost
FROM treatments
GROUP BY treatment_type;


/* =========================================================
   9. PATIENT VISIT HISTORY
   ========================================================= */

SELECT
    p.first_name,
    p.last_name,
    a.appointment_date,
    d.first_name AS doctor_first_name,
    d.last_name AS doctor_last_name,
    a.status
FROM appointments a
JOIN patients p ON a.patient_id = p.patient_id
JOIN doctors d ON a.doctor_id = d.doctor_id
ORDER BY a.appointment_date;


/* =========================================================
   10. MONTHLY REVENUE ANALYSIS
   ========================================================= */

SELECT
    MONTH(payment_date) AS month,
    SUM(amount_paid) AS monthly_revenue
FROM billing
GROUP BY MONTH(payment_date)
ORDER BY month;


/* =========================================================
   11. HIGH VALUE TREATMENTS
   ========================================================= */

SELECT
    treatment_type,
    cost
FROM treatments
WHERE cost > (SELECT AVG(cost) FROM treatments);


/* =========================================================
   12. DOCTOR SPECIALIZATION DISTRIBUTION
   ========================================================= */

SELECT
    specialization,
    COUNT(*) AS total_doctors
FROM doctors
GROUP BY specialization;



/* =========================================================
   CREATE VIEW: PATIENT BILLING SUMMARY
   ========================================================= */

CREATE VIEW patient_billing_summary AS

SELECT
    p.patient_id,
    p.first_name,
    p.last_name,
    b.amount_paid,
    b.payment_date
FROM billing b
JOIN patients p ON b.patient_id = p.patient_id;



/* =========================================================
   VIEW RESULT
   ========================================================= */

SELECT * FROM patient_billing_summary;