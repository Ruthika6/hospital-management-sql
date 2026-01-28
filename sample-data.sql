INSERT INTO Patients (name, age, gender, city, registration_date) VALUES
('Amit Sharma', 45, 'Male', 'Delhi', '2024-01-10'),
('Neha Reddy', 30, 'Female', 'Hyderabad', '2024-02-15'),
('Rahul Verma', 60, 'Male', 'Bangalore', '2024-03-05'),
('Sneha Iyer', 28, 'Female', 'Chennai', '2024-03-20'),
('Karan Mehta', 50, 'Male', 'Mumbai', '2024-04-01');

INSERT INTO Doctors (name, specialization, experience_years) VALUES
('Dr. Rao', 'Cardiology', 15),
('Dr. Mehta', 'Orthopedics', 12),
('Dr. Singh', 'Neurology', 10);

INSERT INTO Appointments (patient_id, doctor_id, appointment_date, status) VALUES
(1, 1, '2024-03-10', 'Completed'),
(2, 2, '2024-03-12', 'Completed'),
(3, 3, '2024-03-15', 'Pending'),
(4, 1, '2024-03-18', 'Completed'),
(5, 2, '2024-03-20', 'Pending');
INSERT INTO Treatments (appointment_id, diagnosis, treatment_cost) VALUES
(1, 'Heart Checkup', 5000),
(2, 'Knee Pain', 3000),
(4, 'Cardiac Follow-up', 4500);

INSERT INTO Bills (patient_id, total_amount, payment_status) VALUES
(1, 5000, 'Pending'),
(2, 3000, 'Paid'),
(4, 4500, 'Pending');
