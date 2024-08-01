DROP TABLE IF EXISTS public."Audit_CaresAppUser";

CREATE TABLE IF NOT EXISTS public."Audit_CaresAppUser" (
    "AuditAction" VARCHAR(5) NOT NULL,
    "ActionTime" TIMESTAMP NOT NULL,
    "Id" INT NOT NULL,
    "UserTypeId_FK" INT NULL,
    "UserID" INT NOT NULL,
    "PatientID" INT NULL,
    "OrganizationID" VARCHAR(50) NOT NULL,
    "Firstname" VARCHAR(50) NOT NULL,
    "Lastname" VARCHAR(50) NOT NULL,
    "NRIC" VARCHAR(20) NOT NULL,
    "DateOfBirth" TIMESTAMP NULL,
    "Age" INT NULL,
    "PostalCode" VARCHAR(10) NULL,
    "Photo" VARCHAR(50) NULL,
    "Email" VARCHAR(150) NULL,
    "MobilePhone" VARCHAR(100) NULL,
    "HomePhone" VARCHAR(100) NULL,
    "MailingAddress1" VARCHAR(255) NULL,
    "MailingAddress2" VARCHAR(255) NULL,
    "MailingAddress3" VARCHAR(255) NULL,
    "GenderID_FK" INT NULL,
    "ResidentTypeID_FK" INT NULL,
    "MaritalStatusID_FK" INT NULL,
    "ReligionID_FK" INT NULL,
    "DisplayName" VARCHAR(255) NULL,
    "Accepted" BOOLEAN NULL,
    "Notes" VARCHAR(150) NULL,
    "Status" VARCHAR(10) NULL,
    "CreatedDate" TIMESTAMP NULL,
    "CreatedBy_FK" INT NULL,
    "ModifiedDate" TIMESTAMP NULL,
    "ModifiedBy_FK" INT NULL,
    "ClientID" TEXT NULL
);

DROP TABLE IF EXISTS public."CaresAppUser";

CREATE TABLE IF NOT EXISTS public."CaresAppUser" (
    "Id" SERIAL PRIMARY KEY,
    "UserTypeId_FK" INT NULL,
    "UserID" INT NOT NULL,
    "PatientID" INT NULL,
    "OrganizationID" VARCHAR(50) NOT NULL,
    "Firstname" VARCHAR(50) NOT NULL,
    "Lastname" VARCHAR(50) NOT NULL,
    "NRIC" VARCHAR(20) NOT NULL,
    "DateOfBirth" TIMESTAMP NULL,
    "Age" INT NULL,
    "PostalCode" VARCHAR(10) NULL,
    "Photo" VARCHAR(50) NULL,
    "Email" VARCHAR(150) NULL,
    "MobilePhone" VARCHAR(100) NULL,
    "HomePhone" VARCHAR(100) NULL,
    "MailingAddress1" VARCHAR(255) NULL,
    "MailingAddress2" VARCHAR(255) NULL,
    "MailingAddress3" VARCHAR(255) NULL,
    "GenderID_FK" INT NULL,
    "ResidentTypeID_FK" INT NULL,
    "MaritalStatusID_FK" INT NULL,
    "ReligionID_FK" INT NULL,
    "DisplayName" VARCHAR(255) NULL,
    "Accepted" BOOLEAN NULL,
    "Notes" VARCHAR(150) NULL,
    "Status" VARCHAR(10) NULL,
    "CreatedDate" TIMESTAMP NULL,
    "CreatedBy_FK" INT NULL,
    "ModifiedDate" TIMESTAMP NULL,
    "ModifiedBy_FK" INT NULL,
    "ClientID" TEXT NOT NULL,

	CONSTRAINT "FK_CaresAppUser_Code"
	FOREIGN KEY ("UserTypeId_FK")
	REFERENCES public."Code"("CodeId")
);

CREATE OR REPLACE FUNCTION public."fn_tr_CaresAppUser"()
RETURNS TRIGGER AS $$
BEGIN
    IF TG_OP = 'INSERT' THEN
        INSERT INTO public."Audit_CaresAppUser"
        SELECT 'I', NOW(), NEW.*;
    ELSIF TG_OP = 'UPDATE' THEN
        INSERT INTO public."Audit_CaresAppUser"
        SELECT 'U', NOW(), NEW.*;
    ELSIF TG_OP = 'DELETE' THEN
        INSERT INTO public."Audit_CaresAppUser"
        SELECT 'D', NOW(), OLD.*;
    END IF;
    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER "tr_CaresAppUser"
AFTER INSERT OR UPDATE OR DELETE ON public."CaresAppUser"
FOR EACH ROW EXECUTE FUNCTION public."fn_tr_CaresAppUser"();