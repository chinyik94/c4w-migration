DROP TABLE IF EXISTS public."Audit_WoundUser";

CREATE TABLE IF NOT EXISTS public."Audit_WoundUser" (
    "AuditAction" VARCHAR(5) NOT NULL,
    "ActionTime" TIMESTAMP NOT NULL,
    "WoundUserID" INT NOT NULL,
    "WoundID_FK" INT NOT NULL,
    "CareAppUserID_FK" INT NOT NULL,
    "ApprovedBy" INT NULL,
	"ApprovedDate" TIMESTAMP NULL,
	"Remarks" VARCHAR(150) NULL,
	"Comment" VARCHAR(150) NULL,
	"Status" VARCHAR(10) NULL,
    "CreatedDate" TIMESTAMP NULL,
    "CreatedBy_FK" INT NULL,
    "ModifiedDate" TIMESTAMP NULL,
    "ModifiedBy_FK" INT NULL
);

DROP TABLE IF EXISTS public."WoundUser";

CREATE TABLE IF NOT EXISTS public."WoundUser" (
    "WoundUserID" SERIAL PRIMARY KEY,
    "WoundID_FK" INT NOT NULL,
    "CareAppUserID_FK" INT NOT NULL,
    "ApprovedBy" INT NULL,
	"ApprovedDate" TIMESTAMP NULL,
	"Remarks" VARCHAR(150) NULL,
	"Comment" VARCHAR(150) NULL,
	"Status" VARCHAR(10) NULL,
    "CreatedDate" TIMESTAMP NULL,
    "CreatedBy_FK" INT NULL,
    "ModifiedDate" TIMESTAMP NULL,
    "ModifiedBy_FK" INT NULL,

	CONSTRAINT "FK_PatientWoundVisitTreatmentObjectives_PatientWoundDraft"
	FOREIGN KEY ("CareAppUserID_FK")
	REFERENCES public."CaresAppUser"("Id")
);

CREATE OR REPLACE FUNCTION public."fn_tr_WoundUser"()
RETURNS TRIGGER AS $$
BEGIN
    IF TG_OP = 'INSERT' THEN
        INSERT INTO public."Audit_WoundUser"
        SELECT 'I', NOW(), NEW.*;
    ELSIF TG_OP = 'UPDATE' THEN
        INSERT INTO public."Audit_WoundUser"
        SELECT 'U', NOW(), NEW.*;
    ELSIF TG_OP = 'DELETE' THEN
        INSERT INTO public."Audit_WoundUser"
        SELECT 'D', NOW(), OLD.*;
    END IF;
    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER "tr_WoundUser"
AFTER INSERT OR UPDATE OR DELETE ON public."WoundUser"
FOR EACH ROW EXECUTE FUNCTION public."fn_tr_WoundUser"();