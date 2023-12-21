CREATE  TABLE "public"."Address" ( 
	Address_ID               integer  NOT NULL  ,
	City_Name            varchar(100)    ,
	State_Name           varchar(100)    ,
	Country_Name         varchar(100)    ,
	CONSTRAINT Address_pkey PRIMARY KEY ( Address_ID )
 );
COMMENT ON COLUMN "public"."Address".Address_ID IS 'Key of Address';
COMMENT ON COLUMN "public"."Address".City_Name IS 'Name of the city';
COMMENT ON COLUMN "public"."Address".State_Name IS 'Name of the State';
COMMENT ON COLUMN "public"."Address".Country_Name IS 'Name of the country';

CREATE  TABLE "public".Hospital ( 
	Hosp_ID              integer  NOT NULL  ,
	Hosp_Name            varchar(100)    ,
	Address_ID               integer  NOT NULL  ,
	CONSTRAINT Hospital_pkey PRIMARY KEY ( Hosp_ID )
 );
ALTER TABLE "public".Hospital ADD CONSTRAINT Hospital_Address_ID_fkey FOREIGN KEY ( Address_ID ) REFERENCES "public"."Address"( Address_ID );
COMMENT ON COLUMN "public".Hospital.Hosp_ID IS 'Key of Hospital';
COMMENT ON COLUMN "public".Hospital.Hosp_Name IS 'Name of Hospital';

CREATE  TABLE "public".Doctor ( 
	Doc_ID               integer  NOT NULL  ,
	Doc_Name             varchar(30)    ,
	Gender               char(1)    ,
	Qualification        varchar(30)    ,
	Department           varchar(30)    ,
	Hosp_ID              integer    ,
	CONSTRAINT Doctor_pkey PRIMARY KEY ( Doc_ID )
 );

ALTER TABLE "public".Doctor ADD CONSTRAINT Doctor_Hosp_ID_fkey FOREIGN KEY ( Hosp_ID ) REFERENCES "public".Hospital( Hosp_ID );
COMMENT ON COLUMN "public".Doctor.Doc_ID IS 'Key of Doctor';
COMMENT ON COLUMN "public".Doctor.Doc_Name IS 'Name of Doctor';
COMMENT ON COLUMN "public".Doctor.Gender IS 'The Gender of Doctor';
COMMENT ON COLUMN "public".Doctor.Qualification IS 'The Qualification of the Doctor';
COMMENT ON COLUMN "public".Doctor.Department IS 'The Department of Doctor in';
COMMENT ON COLUMN "public".Doctor.Hosp_ID IS 'The ID of hosptal that the Doctor is in';

CREATE  TABLE "public".Nurse ( 
	Nurse_ID             integer  NOT NULL  ,
	Nurse_Name           varchar(30)    ,
	Gender               char(1)    ,
	Hosp_ID              integer    ,
	CONSTRAINT Nurse_pkey PRIMARY KEY ( Nurse_ID )
 );

ALTER TABLE "public".Nurse ADD CONSTRAINT Nurse_Hosp_ID_fkey FOREIGN KEY ( Hosp_ID ) REFERENCES "public".Hospital( Hosp_ID );

COMMENT ON COLUMN "public".Nurse.Nurse_ID IS 'Key of the Nurse';
COMMENT ON COLUMN "public".Nurse.Nurse_Name IS 'Name of the Nurse';
COMMENT ON COLUMN "public".Nurse.Gender IS 'Gender of the Nurse';
COMMENT ON COLUMN "public".Nurse.Hosp_ID IS 'The hsopital ID that the Nurse is in';

CREATE  TABLE "public".Disease ( 
	Disease_ID           integer  NOT NULL  ,
	Disease_Name         varchar(200)    ,
	Disease_type         varchar(200)    ,
	CONSTRAINT Disease_pkey PRIMARY KEY ( disease_ID )
 );

COMMENT ON COLUMN "public".Disease.Disease_ID IS 'Key of the Disease';
COMMENT ON COLUMN "public".Disease.Disease_Name IS 'The Name of the Disease';
COMMENT ON COLUMN "public".Disease.disease_type IS 'The type of the disease';

CREATE  TABLE "public".Diagnosis ( 
	Diagnos_ID           integer  NOT NULL  ,
	Issue_Date           date    ,
	Treatment            varchar(30)    ,
	Nurse_ID             integer    ,
	Doc_ID               integer  NOT NULL  ,
	CONSTRAINT Diagnosis_pkey PRIMARY KEY ( Diagnos_ID )
 );

ALTER TABLE "public".Diagnosis ADD CONSTRAINT Diagnosis_Doc_ID_fkey FOREIGN KEY ( Doc_ID ) REFERENCES "public".Doctor( Doc_ID );
ALTER TABLE "public".Diagnosis ADD CONSTRAINT Diagnosis_Nurse_ID_fkey FOREIGN KEY ( Nurse_ID ) REFERENCES "public".Nurse( Nurse_ID );

COMMENT ON COLUMN "public".Diagnosis.Diagnos_ID IS 'Key of the Diagnosis';
COMMENT ON COLUMN "public".Diagnosis.Issue_Date IS 'The issue date of the Diagnosis';
COMMENT ON COLUMN "public".Diagnosis.Treatment IS 'The Treatment of the Diagnosis';
COMMENT ON COLUMN "public".Diagnosis.Nurse_ID IS 'The head Nurse asigned for the Diagnosis';
COMMENT ON COLUMN "public".Diagnosis.Doc_ID IS 'The Doctor who give the Diagnosis';

CREATE  TABLE "public".Medicine ( 
	Med_ID               integer  NOT NULL  ,
	Med_Name             varchar(20)  NOT NULL  ,
	Price                double precision    ,
	Company              varchar(30)    ,
	Active_Ingredient    varchar(30)    ,
	Standard_Industry_Number varchar(25)    ,
	CONSTRAINT Medicine_pkey PRIMARY KEY ( Med_ID )
 );

COMMENT ON COLUMN "public".Medicine.Med_ID IS 'The key of Medicine';
COMMENT ON COLUMN "public".Medicine.Med_Name IS 'The Name of the Medicine';
COMMENT ON COLUMN "public".Medicine.Price IS 'The Price of the Medicine';
COMMENT ON COLUMN "public".Medicine.Company IS 'The Company that produce the Medicine';
COMMENT ON COLUMN "public".Medicine.Active_Ingredient IS 'The active ingredient of the Medicine';
COMMENT ON COLUMN "public".Medicine.Standard_Industry_Number IS 'The standard industry number of the Medicine';

CREATE  TABLE "public".DiagnosisMedicine ( 
	Diagnos_ID           integer  NOT NULL  ,
	Med_ID               integer  NOT NULL  ,
	Med_Qty              integer    ,
	CONSTRAINT DiagnosisMedicine_pkey PRIMARY KEY ( Diagnos_ID, Med_ID )
 );

ALTER TABLE "public".DiagnosisMedicine ADD CONSTRAINT DiagnosisMedicine_Diagnos_ID_fkey FOREIGN KEY ( Diagnos_ID ) REFERENCES "public".Diagnosis( Diagnos_ID );
ALTER TABLE "public".DiagnosisMedicine ADD CONSTRAINT DiagnosisMedicine_Med_ID_fkey FOREIGN KEY ( Med_ID ) REFERENCES "public".Medicine( Med_ID );

COMMENT ON COLUMN "public".DiagnosisMedicine.Diagnos_ID IS 'The ID of the Diagnosis';
COMMENT ON COLUMN "public".DiagnosisMedicine.Med_ID IS 'The ID of the Medicine';
COMMENT ON COLUMN "public".DiagnosisMedicine.Med_Qty IS 'the quantity of the Medicine';

CREATE  TABLE "public".Patient ( 
	SSN                  integer  NOT NULL  ,
	Disease_ID           integer    ,
	First_Name           varchar(100)    ,
	Last_Name            varchar(100)    ,
	Age                  integer    ,
	Gender               char(1)    ,
	Race                 varchar(20)    ,
	Diagnos_ID           integer    ,
	Severity_lv          integer    ,
	Address_ID          integer    ,
	Hosp_ID              integer    ,
	CONSTRAINT Patient_pkey PRIMARY KEY ( SSN )
 );

ALTER TABLE "public".Patient ADD CONSTRAINT Patient_Diagnos_ID_fkey FOREIGN KEY ( Diagnos_ID ) REFERENCES "public".Diagnosis( Diagnos_ID );
ALTER TABLE "public".Patient ADD CONSTRAINT Patient_Disease_ID_fkey FOREIGN KEY ( Disease_ID ) REFERENCES "public".Disease( Disease_ID );
ALTER TABLE "public".Patient ADD CONSTRAINT Patient_Hosp_ID_fkey FOREIGN KEY ( Hosp_ID ) REFERENCES "public".Hospital( Hosp_ID );
ALTER TABLE "public".Patient ADD CONSTRAINT Patient_Address_ID_fkey FOREIGN KEY ( Address_ID ) REFERENCES "public"."Address"( Address_ID );

COMMENT ON COLUMN "public".Patient.SSN IS 'The key of Patient';
COMMENT ON COLUMN "public".Patient.Disease_ID IS 'The ID of the Disease the Patient have';
COMMENT ON COLUMN "public".Patient.First_Name IS 'First Name of the Patient';
COMMENT ON COLUMN "public".Patient.Last_Name IS 'Last Name of the Patient';
COMMENT ON COLUMN "public".Patient.Age IS 'Age of the Patient';
COMMENT ON COLUMN "public".Patient.Gender IS 'Gender of the Patient';
COMMENT ON COLUMN "public".Patient.Race IS 'Race of the Patient';
COMMENT ON COLUMN "public".Patient.Diagnos_ID IS 'Diagnosis ID of the Patient';
COMMENT ON COLUMN "public".Patient.Severity_lv IS 'Disease severity of the Patient';
COMMENT ON COLUMN "public".Patient.Address_ID IS 'The home address of Patient';
COMMENT ON COLUMN "public".Patient.Hosp_ID IS 'The Hospital ID of the Patient';

-- Create a function that deletes related diagnoses and medication records
CREATE OR REPLACE FUNCTION delete_patient_related_records()
RETURNS TRIGGER AS $$
BEGIN
    -- Delete DiagnosisMedicine records related to the patient being deleted
    DELETE FROM DiagnosisMedicine WHERE Diagnos_ID = OLD.Diagnos_ID;
    -- Delete Diagnosis records related to the patient being deleted
    DELETE FROM Diagnosis WHERE Diagnos_ID = OLD.Diagnos_ID;
    RETURN OLD;
END;
$$ LANGUAGE plpgsql;

-- Create a trigger that activates the function before deleting a patient
CREATE TRIGGER delete_patient_trigger
BEFORE DELETE ON Patient
FOR EACH ROW
EXECUTE FUNCTION delete_patient_related_records();
