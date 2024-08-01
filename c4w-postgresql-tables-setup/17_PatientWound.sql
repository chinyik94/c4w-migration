DROP TABLE IF EXISTS public."Audit_PatientWound";

CREATE TABLE IF NOT EXISTS public."Audit_PatientWound" (
    "AuditAction" VARCHAR(5) NOT NULL,
    "ActionTime" TIMESTAMP NOT NULL,
    "PatientWoundID" INT NOT NULL,
    "PatientID_FK" INT NULL,
    "InitialCareAssessmentID_FK" INT NULL,
    "OccurDate" TIMESTAMP NULL,
    "SeenDate" TIMESTAMP NULL,
    "Site" TEXT NOT NULL,
    "IsDeleted" BOOLEAN NOT NULL,
    "CreatedDate" TIMESTAMP NULL,
    "CreatedBy_FK" INT NULL,
    "ModifiedDate" TIMESTAMP NULL,
    "ModifiedBy_FK" INT NULL,
    "LocationOfWound" TEXT NULL,
    "CareReportID_FK" INT NULL,
    "ActionDescription" TEXT NULL,
    "Remarks" TEXT NULL,
    "Category" VARCHAR(50) NULL,
    "Stage" VARCHAR(50) NULL,
    "WoundStatusID_FK" INT NULL,
    "Comments" TEXT NULL,
    "Status" VARCHAR(15) NULL,
    "StatusRemark" TEXT NULL,
    "LocationRemark" VARCHAR(255) NULL,
    "OrgCode" VARCHAR(50) NULL,
    "ClientID" TEXT NOT NULL
);

DROP TABLE IF EXISTS public."PatientWound";

CREATE TABLE IF NOT EXISTS public."PatientWound" (
    "PatientWoundID" SERIAL PRIMARY KEY,
    "PatientID_FK" INT NULL,
    "InitialCareAssessmentID_FK" INT NULL,
    "OccurDate" TIMESTAMP NULL,
    "SeenDate" TIMESTAMP NULL,
    "Site" TEXT NOT NULL,
    "IsDeleted" BOOLEAN NOT NULL,
    "CreatedDate" TIMESTAMP NULL,
    "CreatedBy_FK" INT NULL,
    "ModifiedDate" TIMESTAMP NULL,
    "ModifiedBy_FK" INT NULL,
    "LocationOfWound" TEXT NULL,
    "CareReportID_FK" INT NULL,
    "ActionDescription" TEXT NULL,
    "Remarks" TEXT NULL,
    "Category" VARCHAR(50) NULL,
    "Stage" VARCHAR(50) NULL,
    "WoundStatusID_FK" INT NULL,
    "Comments" TEXT NULL,
    "Status" VARCHAR(15) NULL,
    "StatusRemark" TEXT NULL,
    "LocationRemark" VARCHAR(255) NULL,
    "OrgCode" VARCHAR(50) NULL,
    "ClientID" TEXT NOT NULL,

	CONSTRAINT "FK_PatientWound_Code"
	FOREIGN KEY ("WoundStatusID_FK")
	REFERENCES public."Code"("CodeId")
);

CREATE OR REPLACE FUNCTION public."fn_tr_PatientWound"()
RETURNS TRIGGER AS $$
BEGIN
    IF TG_OP = 'INSERT' THEN
        INSERT INTO public."Audit_PatientWound"
        SELECT 'I', NOW(), NEW.*;
    ELSIF TG_OP = 'UPDATE' THEN
        INSERT INTO public."Audit_PatientWound"
        SELECT 'U', NOW(), NEW.*;
    ELSIF TG_OP = 'DELETE' THEN
        INSERT INTO public."Audit_PatientWound"
        SELECT 'D', NOW(), OLD.*;
    END IF;
    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER "tr_PatientWound"
AFTER INSERT OR UPDATE OR DELETE ON public."PatientWound"
FOR EACH ROW EXECUTE FUNCTION public."fn_tr_PatientWound"();