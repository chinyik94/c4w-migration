DROP TABLE IF EXISTS public."Audit_PatientWoundVisitTreatmentList";

CREATE TABLE IF NOT EXISTS public."Audit_PatientWoundVisitTreatmentList" (
    "AuditAction" VARCHAR(5) NOT NULL,
    "ActionTime" TIMESTAMP NOT NULL,
    "PatientWoundVisitTListID" INT NOT NULL,
    "PatientWoundVisitID_FK" INT NULL,
    "TListItemID_FK" INT NULL,
    "Remarks" VARCHAR(500) NULL,
    "IsDeleted" BOOLEAN NULL,
    "CreatedDate" TIMESTAMP NULL,
    "CreatedBy_FK" INT NULL,
    "ModifiedDate" TIMESTAMP NULL,
    "ModifiedBy_FK" INT NULL
);

DROP TABLE IF EXISTS public."PatientWoundVisitTreatmentList";

CREATE TABLE IF NOT EXISTS public."PatientWoundVisitTreatmentList" (
    "PatientWoundVisitTListID" SERIAL PRIMARY KEY,
    "PatientWoundVisitID_FK" INT NULL,
    "TListItemID_FK" INT NULL,
    "Remarks" VARCHAR(500) NULL,
    "IsDeleted" BOOLEAN NULL,
    "CreatedDate" TIMESTAMP NULL,
    "CreatedBy_FK" INT NULL,
    "ModifiedDate" TIMESTAMP NULL,
    "ModifiedBy_FK" INT NULL,

	CONSTRAINT "FK_PatientWoundVisitTreatmentList_PatientWoundVisit"
	FOREIGN KEY ("PatientWoundVisitID_FK")
	REFERENCES public."PatientWoundVisit"("PatientWoundVisitID"),

	CONSTRAINT "FK_PatientWoundVisitTreatmentList_TreatmentListItem"
	FOREIGN KEY ("TListItemID_FK")
	REFERENCES public."TreatmentListItem"("TListItemID")
);

CREATE OR REPLACE FUNCTION public."fn_tr_PatientWoundVisitTreatmentList"()
RETURNS TRIGGER AS $$
BEGIN
    IF TG_OP = 'INSERT' THEN
        INSERT INTO public."Audit_PatientWoundVisitTreatmentList"
        SELECT 'I', NOW(), NEW.*;
    ELSIF TG_OP = 'UPDATE' THEN
        INSERT INTO public."Audit_PatientWoundVisitTreatmentList"
        SELECT 'U', NOW(), NEW.*;
    ELSIF TG_OP = 'DELETE' THEN
        INSERT INTO public."Audit_PatientWoundVisitTreatmentList"
        SELECT 'D', NOW(), OLD.*;
    END IF;
    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER "tr_PatientWoundVisitTreatmentList"
AFTER INSERT OR UPDATE OR DELETE ON public."PatientWoundVisitTreatmentList"
FOR EACH ROW EXECUTE FUNCTION public."fn_tr_PatientWoundVisitTreatmentList"();