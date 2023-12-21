INSERT INTO "Address" (Address_ID, City_Name, State_Name, Country_Name)
VALUES
(1, 'New York City', 'New York', 'USA'),
(2, 'Los Angeles', 'California', 'USA'),
(3, 'London', 'England', 'UK'),
(4, 'Chicago', 'Illinois', 'USA'),
(5, 'Houston', 'Texas', 'USA'),
(6, 'Philadelphia', 'Pennsylvania', 'USA'),
(7, 'San Francisco', 'California', 'USA'),
(8, 'Miami', 'Florida', 'USA'),
(9, 'Boston', 'Massachusetts', 'USA'),
(10, 'Seattle', 'Washington', 'USA'),
(11, 'Austin', 'Texas', 'USA'),
(12, 'Denver', 'Colorado', 'USA'),
(13, 'Atlanta', 'Georgia', 'USA'),
(14, 'Portland', 'Oregon', 'USA');

INSERT INTO Hospital (Hosp_ID, Hosp_Name, Address_ID)
VALUES
(1, 'New York General Hospital', 1),
(2, 'Los Angeles Medical Center', 2),
(3, 'London Health Care', 3),
(4, 'Chicago General Hospital', 4),
(5, 'Houston Medical Center', 5),
(6, 'Philadelphia Health Care', 6)
;
INSERT INTO Medicine (Med_ID, Med_Name, Price, Company, Active_Ingredient, Standard_Industry_Number)
VALUES
(1, 'Aspirin', 5.99, 'Pfizer', 'Acetylsalicylic Acid', 'ABC123'),
(2, 'Amoxicillin', 9.99, 'GlaxoSmithKline', 'Amoxicillin', 'DEF456'),
(3, 'Lipitor', 15.75, 'Pfizer', 'Atorvastatin', 'GHI789'),
(4, 'Paracetamol', 3.99, 'Johnson & Johnson', 'Paracetamol', 'JKL012'),
(5, 'Ibuprofen', 6.25, 'Bayer', 'Ibuprofen', 'MNO345'),
(6, 'Omeprazole', 9.50, 'AstraZeneca', 'Omeprazole', 'PQR678'),
(7, 'Amoxicillin', 7.99, 'Pfizer', 'Amoxicillin', 'STU901'),
(8, 'Metformin', 5.50, 'Merck', 'Metformin', 'VWX234'),
(9, 'Atorvastatin', 12.75, 'Novartis', 'Atorvastatin', 'YZA567')
;
INSERT INTO Disease (Disease_ID, Disease_Name, Disease_Type)
VALUES
(1, 'Influenza', 'Viral Infection'),
(2, 'Diabetes', 'Metabolic Disorder'),
(3, 'Hypertension', 'Cardiovascular'),
(4, 'Migraine', 'Neurological Disorder'),
(5, 'Asthma', 'Viral Infection'),
(6, 'Arthritis', 'Metabolic Disorder'),
(7, 'Rare never seen', 'Metabolic Disorder')
;
INSERT INTO Doctor (Doc_ID, Doc_Name, Gender, Qualification, Department, Hosp_ID)
VALUES
(1, 'Dr. Smith', 'M', 'MD', 'Cardiologist', 1),
(2, 'Dr. Johnson', 'F', 'MD', 'Pediatrician', 2),
(3, 'Dr. Williams', 'M', 'MD', 'Surgeon', 3)
;
INSERT INTO Nurse (Nurse_ID, Nurse_Name, Gender, Hosp_ID)
VALUES
(1, 'Nurse Adams', 'F', 1),
(2, 'Nurse Garcia', 'F', 2),
(3, 'Nurse Clark', 'M', 3)
;
INSERT INTO Diagnosis (Diagnos_ID, Issue_Date, Treatment, Nurse_ID, Doc_ID)
VALUES
(1, '2023-01-15',  'Prescribed medication', 1, 1),
(2, '2023-02-20',  'Physical therapy', 2, 2),
(3, '2023-03-25',  'Surgery recommended', 3, 3),
(4, '2023-04-10',  'Prescribed medication', 3, 2),
(5, '2023-05-20',  'Physical therapy', 1, 3),
(6, '2023-06-15',  'Surgery recommended', 2, 1),
(7, '2023-07-10',  'Prescribed medication', 1, 1),
(8, '2023-08-20',  'Physical therapy', 2, 2),
(9, '2023-09-15',  'Surgery recommended', 3, 3),
(10, '2023-10-10', 'Physical therapy', 2, 1),
(11, '2023-11-15', 'Prescribed medication', 1, 3),
(12, '2023-12-20', 'Surgery recommended', 3, 2),
(13, '2024-01-05', 'Physical therapy', 2, 1),
(14, '2024-02-10', 'Prescribed medication', 1, 3),
(15, '2023-10-05', 'Prescribed medication', 2, 3),
(16, '2023-11-15', 'Physical therapy', 3, 1),
(17, '2023-12-20', 'Surgery recommended', 1, 2),
(18, '2023-11-02', 'Prescribed medication', 2, 3),
(19, '2023-10-18', 'Physical therapy', 1, 1);

INSERT INTO Patient (SSN, Disease_ID, Diagnos_ID, First_Name, Last_Name, Age, Gender, Race, Severity_lv, Address_ID, Hosp_ID)
VALUES
(123456789, 1,1, 'John', 'Doe', 35, 'M', 'Caucasian', 1, 7, 1),
(234567890, 2,2, 'Jane', 'Smith', 50, 'F', 'African American', 2, 7, 2),
(345678901, 3,3, 'David', 'Johnson', 28, 'M', 'Asian', 3, 8, 3),
(456789012, 4,4, 'Emily', 'Davis', 28, 'F', 'Caucasian', 4, 8, 4),
(567890123, 5, 5,'Michael', 'Wilson', 45, 'M', 'African American', 5, 8, 5),
(678901234, 6,6, 'Sophia', 'Martinez', 38, 'F', 'Hispanic', 6, 13, 6),
(789012345, 1,7, 'Olivia', 'Anderson', 32, 'F', 'Asian', 7, 9, 1),
(890123456, 2,8, 'Daniel', 'Thompson', 50, 'M', 'Caucasian', 8, 12, 2),
(901234567, 3,9, 'Isabella', 'Hernandez', 42, 'F', 'Hispanic', 9, 3, 3),
(112233445, 4,10, 'William', 'Brown', 40, 'M', 'Caucasian', 3, 4, 4),
(334455667, 1,11, 'Emma', 'Wilson', 28, 'F', 'African American', 1, 5, 5),
(556677889, 3,12, 'James', 'Garcia', 55, 'M', 'Hispanic', 2, 14, 6),
(778899001, 2,13, 'Ava', 'Rodriguez', 33, 'F', 'Asian', 3, 9, 1),
(990011223, 5,14, 'Sophie', 'Lopez', 60, 'F', 'Hispanic', 4, 10, 3),
(111111111, 1,15, 'Emma', 'Wilson', 25, 'F', 'Caucasian', 1, 11, 1);


INSERT INTO DiagnosisMedicine (Diagnos_ID, Med_ID, Med_Qty)
VALUES
(1, 1, 1), -- Diagnos_ID 1 uses Med_ID 1 (Aspirin)
(2, 2, 1), -- Diagnos_ID 2 uses Med_ID 2 (Amoxicillin)
(3, 3, 1), -- Diagnos_ID 3 uses Med_ID 3 (Lipitor)
(4, 7, 3), -- Diagnos_ID 4 uses Med_ID 7 (Amoxicillin)
(5, 8, 6), -- Diagnos_ID 5 uses Med_ID 8 (Metformin)
(6, 9, 1), -- Diagnos_ID 6 uses Med_ID 9 (Atorvastatin)
(7, 4, 2), -- Diagnos_ID 7 uses Med_ID 4 (Paracetamol)
(7, 5, 3), -- Diagnos_ID 7 uses Med_ID 4 (Paracetamol)
(8, 5, 1), -- Diagnos_ID 8 uses Med_ID 5 (Ibuprofen)
(9, 6, 1), -- Diagnos_ID 9 uses Med_ID 6 (Omeprazole)
(10, 1, 2), -- Diagnos_ID 10 uses Med_ID 1 (Aspirin)
(11, 2, 1), -- Diagnos_ID 11 uses Med_ID 2 (Amoxicillin)
(12, 3, 1), -- Diagnos_ID 12 uses Med_ID 3 (Lipitor)
(13, 7, 3), -- Diagnos_ID 13 uses Med_ID 7 (Amoxicillin)
(14, 8, 2), -- Diagnos_ID 14 uses Med_ID 8 (Metformin)
(15, 2, 1); -- Diagnos_ID 14 uses Med_ID 8 (Metformin)
