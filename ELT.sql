-- Create a function to execute the ELT process
CREATE OR REPLACE FUNCTION perform_elt_process()
RETURNS VOID AS $$
BEGIN
    -- Extract data to a temporary table
    CREATE TEMP TABLE temp_patient AS
    SELECT *
    FROM "public".Patient;

    -- Create the target table
    CREATE TABLE IF NOT EXISTS "dimension".Fact_Patient (
        SSN INTEGER PRIMARY KEY,
        Disease_ID INTEGER,
        First_Name VARCHAR(100),
        Last_Name VARCHAR(100),
        Age INTEGER,
        Gender CHAR(1)
        -- Add other columns...
    );

    -- Load data into the target table
    INSERT INTO "dimension".Fact_Patient (SSN, Disease_ID, First_Name, Last_Name, Age, Gender /*, ...*/)
    SELECT SSN, Disease_ID, First_Name, Last_Name, Age, Gender /*, ...*/
    FROM temp_patient;

    -- Clean up the temporary table
    DROP TABLE IF EXISTS temp_patient;

    -- Output message
    RAISE NOTICE 'ELT process completed.';
END;
$$ LANGUAGE plpgsql;

-- Execute the ELT process
SELECT perform_elt_process();

-- Analytical queries

-- 1.Number of patients by age group
SELECT 
    CASE 
        WHEN Age BETWEEN 0 AND 10 THEN '0-10' 
        WHEN Age BETWEEN 11 AND 20 THEN '11-20' 
        WHEN Age BETWEEN 21 AND 30 THEN '21-30' 
        WHEN Age BETWEEN 31 AND 40 THEN '31-40' 
        ELSE 'Over 40' 
    END AS age_group,
    COUNT(*) AS num_patients
FROM "dimension".Fact_Patient
GROUP BY age_group
ORDER BY age_group;

-- 2.Number of patients by disease type
SELECT Disease_ID, COUNT(*) AS num_patients
FROM "dimension".Fact_Patient
GROUP BY Disease_ID
ORDER BY num_patients DESC;

-- 3.Sex ratio
SELECT Gender, COUNT(*) AS num_patients
FROM "dimension".Fact_Patient
GROUP BY Gender;
