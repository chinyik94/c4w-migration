DROP TABLE IF EXISTS public."Audit_TreatmentTOL";

CREATE TABLE IF NOT EXISTS public."Audit_TreatmentTOL" (
    "AuditAction" VARCHAR(5) NOT NULL,
    "ActionTime" TIMESTAMP NOT NULL,
    "TreatmentTOLID" INT NOT NULL,
    "TListItemID_FK" INT NOT NULL
);

DROP TABLE IF EXISTS public."TreatmentTOL";

CREATE TABLE IF NOT EXISTS public."TreatmentTOL" (
    "TreatmentTOLID" INT NOT NULL,
    "TListItemID_FK" INT NOT NULL,

	CONSTRAINT "FK_TreatmentTOL_TreatmentListItem"
	FOREIGN KEY ("TListItemID_FK")
	REFERENCES public."TreatmentListItem"("TListItemID")
);

CREATE OR REPLACE FUNCTION public."fn_tr_TreatmentTOL"()
RETURNS TRIGGER AS $$
BEGIN
    IF TG_OP = 'INSERT' THEN
        INSERT INTO public."Audit_TreatmentTOL"
        SELECT 'I', NOW(), NEW.*;
    ELSIF TG_OP = 'UPDATE' THEN
        INSERT INTO public."Audit_TreatmentTOL"
        SELECT 'U', NOW(), NEW.*;
    ELSIF TG_OP = 'DELETE' THEN
        INSERT INTO public."Audit_TreatmentTOL"
        SELECT 'D', NOW(), OLD.*;
    END IF;
    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER "tr_TreatmentTOL"
AFTER INSERT OR UPDATE OR DELETE ON public."TreatmentTOL"
FOR EACH ROW EXECUTE FUNCTION public."fn_tr_TreatmentTOL"();