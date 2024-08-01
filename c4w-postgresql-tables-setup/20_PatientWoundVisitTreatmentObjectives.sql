DROP TABLE IF EXISTS public."Audit_PatientWoundVisitTreatmentObjectives";

CREATE TABLE IF NOT EXISTS public."Audit_PatientWoundVisitTreatmentObjectives" (
    "AuditAction" VARCHAR(5) NOT NULL,
    "ActionTime" TIMESTAMP NOT NULL,
    "PatientWoundVisitID_FK" INT NOT NULL,
    "ObjectiveID_FK" INT NULL
);

DROP TABLE IF EXISTS public."PatientWoundVisitTreatmentObjectives";

CREATE TABLE IF NOT EXISTS public."PatientWoundVisitTreatmentObjectives" (
    "PatientWoundVisitID_FK" INT NOT NULL,
    "ObjectiveID_FK" INT NOT NULL,

	CONSTRAINT "FK_PatientWoundVisitTreatmentObjectives_Code"
	FOREIGN KEY ("ObjectiveID_FK")
	REFERENCES public."Code"("CodeId"),

	CONSTRAINT "FK_PatientWoundVisitTreatmentObjectives_PatientWoundDraft"
	FOREIGN KEY ("PatientWoundVisitID_FK")
	REFERENCES public."PatientWoundVisit"("PatientWoundVisitID")
);

CREATE OR REPLACE FUNCTION public."fn_tr_PatientWoundVisitTreatmentObjectives"()
RETURNS TRIGGER AS $$
BEGIN
    IF TG_OP = 'INSERT' THEN
        INSERT INTO public."Audit_PatientWoundVisitTreatmentObjectives"
        SELECT 'I', NOW(), NEW.*;
    ELSIF TG_OP = 'UPDATE' THEN
        INSERT INTO public."Audit_PatientWoundVisitTreatmentObjectives"
        SELECT 'U', NOW(), NEW.*;
    ELSIF TG_OP = 'DELETE' THEN
        INSERT INTO public."Audit_PatientWoundVisitTreatmentObjectives"
        SELECT 'D', NOW(), OLD.*;
    END IF;
    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER "tr_PatientWoundVisitTreatmentObjectives"
AFTER INSERT OR UPDATE OR DELETE ON public."PatientWoundVisitTreatmentObjectives"
FOR EACH ROW EXECUTE FUNCTION public."fn_tr_PatientWoundVisitTreatmentObjectives"();