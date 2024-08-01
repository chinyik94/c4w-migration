DROP TABLE IF EXISTS public."Audit_TreatmentListItem";

CREATE TABLE IF NOT EXISTS public."Audit_TreatmentListItem" (
    "AuditAction" VARCHAR(5) NOT NULL,
    "ActionTime" TIMESTAMP NOT NULL,
    "TListItemID" INT NOT NULL,
    "ItemName" VARCHAR(255) NULL,
    "TListTypeID_FK" INT NULL,
    "IsActive" BOOLEAN NULL,
    "IsSystemUsed" BOOLEAN NULL,
    "IsDeleted" BOOLEAN NULL,
    "CreatedDate" TIMESTAMP NULL,
    "CreatedBy_FK" INT NULL,
    "ModifiedDate" TIMESTAMP NULL,
    "ModifiedBy_FK" INT NULL,
    "ItemBrand" VARCHAR(255) NULL
);

DROP TABLE IF EXISTS public."TreatmentListItem";

CREATE TABLE IF NOT EXISTS public."TreatmentListItem" (
    "TListItemID" SERIAL PRIMARY KEY,
    "ItemName" VARCHAR(255) NULL,
    "TListTypeID_FK" INT NULL,
    "IsActive" BOOLEAN NULL,
    "IsSystemUsed" BOOLEAN NULL,
    "IsDeleted" BOOLEAN NULL,
    "CreatedDate" TIMESTAMP NULL,
    "CreatedBy_FK" INT NULL,
    "ModifiedDate" TIMESTAMP NULL,
    "ModifiedBy_FK" INT NULL,
    "ItemBrand" VARCHAR(255) NULL,

	CONSTRAINT "FK_TreatmentListItem_Code"
	FOREIGN KEY ("TListTypeID_FK")
	REFERENCES public."Code"("CodeId")
);

CREATE OR REPLACE FUNCTION public."fn_tr_TreatmentListItem"()
RETURNS TRIGGER AS $$
BEGIN
    IF TG_OP = 'INSERT' THEN
        INSERT INTO public."Audit_TreatmentListItem"
        SELECT 'I', NOW(), NEW.*;
    ELSIF TG_OP = 'UPDATE' THEN
        INSERT INTO public."Audit_TreatmentListItem"
        SELECT 'U', NOW(), NEW.*;
    ELSIF TG_OP = 'DELETE' THEN
        INSERT INTO public."Audit_TreatmentListItem"
        SELECT 'D', NOW(), OLD.*;
    END IF;
    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER "tr_TreatmentListItem"
AFTER INSERT OR UPDATE OR DELETE ON public."TreatmentListItem"
FOR EACH ROW EXECUTE FUNCTION public."fn_tr_TreatmentListItem"();