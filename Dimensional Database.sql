-- Create dimension table
-- Dim_Address
CREATE TABLE Dim_Address (
    Address_ID SERIAL PRIMARY KEY,
    City_Name VARCHAR(100),
    State_Name VARCHAR(100),
    Country_Name VARCHAR(100)
);

-- Dim_Hospital
CREATE TABLE Dim_Hospital (
    Hosp_ID SERIAL PRIMARY KEY,
    Hosp_Name VARCHAR(100),
    Address_ID INTEGER REFERENCES Dim_Address(Address_ID)
);

-- Dim_Doctor
CREATE TABLE Dim_Doctor (
    Doc_ID SERIAL PRIMARY KEY,
    Doc_Name VARCHAR(30),
    Gender CHAR(1),
    Qualification VARCHAR(30),
    Department VARCHAR(30),
    Hosp_ID INTEGER REFERENCES Dim_Hospital(Hosp_ID)
);

-- Dim_Nurse
CREATE TABLE Dim_Nurse (
    Nurse_ID SERIAL PRIMARY KEY,
    Nurse_Name VARCHAR(30),
    Gender CHAR(1),
    Hosp_ID INTEGER REFERENCES Dim_Hospital(Hosp_ID)
);

-- Dim_Disease
CREATE TABLE Dim_Disease (
    Disease_ID SERIAL PRIMARY KEY,
    Disease_Name VARCHAR(200),
    Disease_Type VARCHAR(200)
);

-- Dim_Medicine
CREATE TABLE Dim_Medicine (
    Med_ID SERIAL PRIMARY KEY,
    Med_Name VARCHAR(20),
    Price DOUBLE PRECISION,
    Company VARCHAR(30),
    Active_Ingredient VARCHAR(30),
    Standard_Industry_Number VARCHAR(25)
);

-- Create fact table
-- Fact_Diagnosis
CREATE TABLE Fact_Diagnosis (
    Diagnos_ID SERIAL PRIMARY KEY,
    Issue_Date DATE,
    Treatment VARCHAR(30),
    Nurse_ID INTEGER REFERENCES Dim_Nurse(Nurse_ID),
    Doc_ID INTEGER REFERENCES Dim_Doctor(Doc_ID)
);

-- Fact_DiagnosisMedicine
CREATE TABLE Fact_DiagnosisMedicine (
    Diagnos_ID INTEGER REFERENCES Fact_Diagnosis(Diagnos_ID),
    Med_ID INTEGER REFERENCES Dim_Medicine(Med_ID),
    Med_Qty INTEGER,
    PRIMARY KEY (Diagnos_ID, Med_ID)
);

-- Fact_Patient
CREATE TABLE Fact_Patient (
    SSN INTEGER PRIMARY KEY,
    Disease_ID INTEGER REFERENCES Dim_Disease(Disease_ID),
    First_Name VARCHAR(100),
    Last_Name VARCHAR(100),
    Age INTEGER,
    Gender CHAR(1),
    Race VARCHAR(20),
    Diagnos_ID INTEGER REFERENCES Fact_Diagnosis(Diagnos_ID),
    Severity_lv INTEGER,
    Address_ID INTEGER REFERENCES Dim_Address(Address_ID),
    Hosp_ID INTEGER REFERENCES Dim_Hospital(Hosp_ID)
);