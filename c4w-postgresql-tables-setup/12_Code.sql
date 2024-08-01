DROP TABLE IF EXISTS public."Audit_Code";

CREATE TABLE IF NOT EXISTS public."Audit_Code" (
    "AuditAction" VARCHAR(5) NOT NULL,
    "ActionTime" TIMESTAMP NOT NULL,
    "CodeId" INT NOT NULL,
    "CodeTypeId_FK" INT NOT NULL,
    "CodeName" VARCHAR(255) NOT NULL,
    "Ordering" INT NULL,
    "IsSystemUsed" BOOLEAN NOT NULL,
    "IsDeleted" BOOLEAN NOT NULL,
    "CreatedDate" TIMESTAMP NULL,
    "CreatedBy_FK" INT NULL,
    "ModifiedDate" TIMESTAMP NULL,
    "ModifiedBy_FK" INT NULL,
    "Status" VARCHAR(15) NULL
);

DROP TABLE IF EXISTS public."Code";

CREATE TABLE IF NOT EXISTS public."Code" (
    "CodeId" SERIAL PRIMARY KEY,
    "CodeTypeId_FK" INT NOT NULL,
    "CodeName" VARCHAR(255) NOT NULL,
    "Ordering" INT NULL,
    "IsSystemUsed" BOOLEAN NOT NULL,
    "IsDeleted" BOOLEAN NOT NULL,
    "CreatedDate" TIMESTAMP NULL,
    "CreatedBy_FK" INT NULL,
    "ModifiedDate" TIMESTAMP NULL,
    "ModifiedBy_FK" INT NULL,
    "Status" VARCHAR(15) NULL,

	CONSTRAINT "FK_Code_CodeType"
	FOREIGN KEY ("CodeTypeId_FK")
	REFERENCES public."CodeType"("CodeTypeId")
);

CREATE OR REPLACE FUNCTION public."fn_tr_Code"()
RETURNS TRIGGER AS $$
BEGIN
    IF TG_OP = 'INSERT' THEN
        INSERT INTO public."Audit_Code"
        SELECT 'I', NOW(), NEW.*;
    ELSIF TG_OP = 'UPDATE' THEN
        INSERT INTO public."Audit_Code"
        SELECT 'U', NOW(), NEW.*;
    ELSIF TG_OP = 'DELETE' THEN
        INSERT INTO public."Audit_Code"
        SELECT 'D', NOW(), OLD.*;
    END IF;
    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER "tr_Code"
AFTER INSERT OR UPDATE OR DELETE ON public."Code"
FOR EACH ROW EXECUTE FUNCTION public."fn_tr_Code"();