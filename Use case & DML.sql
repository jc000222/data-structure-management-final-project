-- Use case 1
SELECT 
    CONCAT(p.First_Name, ' ', p.Last_Name) AS Patient_Name,
    p.Age AS Patient_Age,
    p.Gender AS Patient_Gender,
    p.Race AS Patient_Race,
    dis.Disease_Type AS Disease_Type,
    hos.Hosp_Name AS Hospital_Name,
    CONCAT(a.City_Name, ', ', a.State_Name, ', ', a.Country_Name) AS Address,
    d.Issue_Date,
    d.Treatment,
    dis.Disease_Name,
    m.Med_Name
FROM 
    Patient p
JOIN 
    Diagnosis d ON p.Diagnos_ID = d.Diagnos_ID
JOIN 
    Disease dis ON p.Disease_ID = dis.Disease_ID
LEFT JOIN 
    DiagnosisMedicine dm ON d.Diagnos_ID = dm.Diagnos_ID
LEFT JOIN 
    Medicine m ON dm.Med_ID = m.Med_ID
LEFT JOIN 
    Hospital hos ON p.Hosp_ID = hos.Hosp_ID
LEFT JOIN 
    "Address" a ON p.Address_ID = a.Address_ID;

-- Use case 2
SELECT d.Disease_Type, 
       COUNT(*) AS Total_Patients, 
       ROUND(AVG(p.Age), 2) AS Average_Age
FROM Patient p
JOIN Disease d ON p.Disease_ID = d.Disease_ID
GROUP BY d.Disease_Type;

--Use case 3
WITH DiseaseSeverity AS (
    SELECT p.Disease_ID, dis.Disease_Name, ROUND(AVG(p.Severity_lv), 2) AS Avg_Severity
    FROM Patient p
    JOIN Disease dis ON p.Disease_ID = dis.Disease_ID
    GROUP BY p.Disease_ID, dis.Disease_Name
),
TreatmentCounts AS (
    SELECT d.Diagnos_ID, d.Treatment, COUNT(*) AS Treatment_Count
    FROM Diagnosis d
    GROUP BY d.Diagnos_ID, d.Treatment
)
SELECT ds.Disease_Name, ds.Avg_Severity, tc.Treatment
FROM DiseaseSeverity ds
LEFT JOIN TreatmentCounts tc ON ds.Disease_ID = tc.Diagnos_ID
ORDER BY ds.Disease_Name, tc.Treatment_Count DESC;

-- DML operations:
-- First add a new patient that has Asthma. Patient has a reference key from diagnosis, so first create the diagnosis for the patient.
INSERT INTO Diagnosis (Diagnos_ID, Issue_Date, Treatment, Nurse_ID, Doc_ID)
VALUES
(20, '2023-12-18', 'Prescribed medication', 1, 3);
-- Now create the patient information.
INSERT INTO Patient (SSN, Disease_ID, Diagnos_ID, First_Name, Last_Name, Age, Gender, Race, Severity_lv, Address_ID, Hosp_ID)
VALUES
(222222222, 1,20, 'Jacky', 'Chan', 25, 'M', 'Asian', 1, 1, 1);
-- Also add the information on DiagnosisMedicine.
INSERT INTO DiagnosisMedicine (Diagnos_ID, Med_ID, Med_Qty)
VALUES
(20, 1, 5);

SELECT 
    p.First_Name || ' ' || p.Last_Name AS Patient_Name,
    p.Age AS Patient_Age,
    p.Gender AS Patient_Gender,
    p.Race AS Patient_Race,
    d.Issue_Date,
    d.Treatment,
    dis.Disease_Name AS Disease_Type,
    h.Hosp_Name AS Hospital_Name,
    a.City_Name || ', ' || a.State_Name || ', ' || a.Country_Name AS Address
FROM Patient p
JOIN Diagnosis d ON p.Diagnos_ID = d.Diagnos_ID
JOIN Disease dis ON p.Disease_ID = dis.Disease_ID
LEFT JOIN DiagnosisMedicine dm ON d.Diagnos_ID = dm.Diagnos_ID
LEFT JOIN Medicine m ON dm.Med_ID = m.Med_ID
JOIN Hospital h ON p.Hosp_ID = h.Hosp_ID
JOIN "Address" a ON p.Address_ID = a.Address_ID
WHERE p.SSN = 222222222;

DELETE FROM Patient WHERE SSN = 222222222;
SELECT * FROM Diagnosis;
