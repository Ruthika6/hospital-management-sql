-- Doctor revenue ranking
SELECT 
    d.name AS doctor_name,
    SUM(t.treatment_cost) AS total_revenue,
    RANK() OVER (ORDER BY SUM(t.treatment_cost) DESC) AS revenue_rank
FROM Doctors d
JOIN Appointments a ON d.doctor_id = a.doctor_id
JOIN Treatments t ON a.appointment_id = t.appointment_id
GROUP BY d.name;

-- patient with repeat visits
SELECT 

    p.name,
    COUNT(a.appointment_id) AS visit_count
FROM Patients p
JOIN Appointments a ON p.patient_id = a.patient_id
GROUP BY p.name
HAVING COUNT(a.appointment_id) > 1;

-- Monthly hospital revenue
WITH MonthlyRevenue AS (   
    SELECT 
        MONTH(a.appointment_date) AS month,
        SUM(t.treatment_cost) AS revenue
    FROM Appointments a
    JOIN Treatments t ON a.appointment_id = t.appointment_id
    GROUP BY MONTH(a.appointment_date)
)
SELECT * 
FROM MonthlyRevenue
ORDER BY month;

-- patients whose bill is above average
SELECT 
    p.name AS patient_name,
    SUM(b.total_amount) AS total_spent
FROM Patients p
JOIN Bills b 
    ON p.patient_id = b.patient_id
GROUP BY p.name
HAVING SUM(b.total_amount) > (
    SELECT AVG(total_amount)
    FROM Bills
);

-- doctors with above average revenue
SELECT 
    d.name AS doctor_name,
    SUM(t.treatment_cost) AS total_revenue
FROM Doctors d
JOIN Appointments a 
    ON d.doctor_id = a.doctor_id
JOIN Treatments t 
    ON a.appointment_id = t.appointment_id
GROUP BY d.name
HAVING SUM(t.treatment_cost) > (
    SELECT AVG(doctor_revenue)
    FROM (
        SELECT 
            SUM(t2.treatment_cost) AS doctor_revenue
        FROM Appointments a2
        JOIN Treatments t2 
            ON a2.appointment_id = t2.appointment_id
        GROUP BY a2.doctor_id
    ) AS revenue_table
);

