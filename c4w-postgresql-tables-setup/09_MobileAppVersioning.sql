DROP TABLE IF EXISTS public."Audit_MobileAppVersioning";

CREATE TABLE IF NOT EXISTS public."Audit_MobileAppVersioning" (
    "AuditAction" VARCHAR(5) NOT NULL,
    "ActionTime" TIMESTAMP NOT NULL,
    "MobileVersionId" INT NOT NULL,
    "AppName" VARCHAR(50) NULL,
    "DeviceType" VARCHAR(50) NULL,
    "Version" VARCHAR(50) NULL,
    "Status" VARCHAR(50) NULL,
    "IsDeleted" BOOLEAN NULL,
    "CreatedDate" TIMESTAMP NULL,
    "CreatedBy_FK" INT NULL,
    "ModifiedDate" TIMESTAMP NULL,
    "ModifiedBy_FK" INT NULL
);

DROP TABLE IF EXISTS public."MobileAppVersioning";

CREATE TABLE IF NOT EXISTS public."MobileAppVersioning" (
    "MobileVersionId" SERIAL PRIMARY KEY,
    "AppName" VARCHAR(50) NULL,
    "DeviceType" VARCHAR(50) NULL,
    "Version" VARCHAR(50) NULL,
    "Status" VARCHAR(50) NULL,
    "IsDeleted" BOOLEAN NULL,
    "CreatedDate" TIMESTAMP NULL,
    "CreatedBy_FK" INT NULL,
    "ModifiedDate" TIMESTAMP NULL,
    "ModifiedBy_FK" INT NULL
);

CREATE OR REPLACE FUNCTION public."fn_tr_MobileAppVersioning"()
RETURNS TRIGGER AS $$
BEGIN
    IF TG_OP = 'INSERT' THEN
        INSERT INTO public."Audit_MobileAppVersioning"
        SELECT 'I', NOW(), NEW.*;
    ELSIF TG_OP = 'UPDATE' THEN
        INSERT INTO public."Audit_MobileAppVersioning"
        SELECT 'U', NOW(), NEW.*;
    ELSIF TG_OP = 'DELETE' THEN
        INSERT INTO public."Audit_MobileAppVersioning"
        SELECT 'D', NOW(), OLD.*;
    END IF;
    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER "tr_MobileAppVersioning"
AFTER INSERT OR UPDATE OR DELETE ON public."MobileAppVersioning"
FOR EACH ROW EXECUTE FUNCTION public."fn_tr_MobileAppVersioning"();