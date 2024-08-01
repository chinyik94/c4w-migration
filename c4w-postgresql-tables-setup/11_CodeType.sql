DROP TABLE IF EXISTS public."Audit_CodeType";

CREATE TABLE IF NOT EXISTS public."Audit_CodeType" (
    "AuditAction" VARCHAR(5) NOT NULL,
    "ActionTime" TIMESTAMP NOT NULL,
    "CodeTypeId" INT NOT NULL,
    "CodeTypeName" VARCHAR(255) NOT NULL,
    "IsSystemUsed" BOOLEAN NOT NULL,
    "IsDeleted" BOOLEAN NOT NULL,
    "CreatedDate" TIMESTAMP NULL,
    "CreatedBy_FK" INT NULL,
    "ModifiedDate" TIMESTAMP NULL,
    "ModifiedBy_FK" INT NULL
);


DROP TABLE IF EXISTS public."CodeType";

CREATE TABLE IF NOT EXISTS public."CodeType" (
    "CodeTypeId" SERIAL PRIMARY KEY,
    "CodeTypeName" VARCHAR(255) NOT NULL,
    "IsSystemUsed" BOOLEAN NOT NULL,
    "IsDeleted" BOOLEAN NOT NULL,
    "CreatedDate" TIMESTAMP NULL,
    "CreatedBy_FK" INT NULL,
    "ModifiedDate" TIMESTAMP NULL,
    "ModifiedBy_FK" INT NULL
);

CREATE OR REPLACE FUNCTION public."fn_tr_CodeType"()
RETURNS TRIGGER AS $$
BEGIN
    IF TG_OP = 'INSERT' THEN
        INSERT INTO public."Audit_CodeType"
        SELECT 'I', NOW(), NEW.*;
    ELSIF TG_OP = 'UPDATE' THEN
        INSERT INTO public."Audit_CodeType"
        SELECT 'U', NOW(), NEW.*;
    ELSIF TG_OP = 'DELETE' THEN
        INSERT INTO public."Audit_CodeType"
        SELECT 'D', NOW(), OLD.*;
    END IF;
    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER "tr_CodeType"
AFTER INSERT OR UPDATE OR DELETE ON public."CodeType"
FOR EACH ROW EXECUTE FUNCTION public."fn_tr_CodeType"();