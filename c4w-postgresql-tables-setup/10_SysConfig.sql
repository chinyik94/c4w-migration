DROP TABLE IF EXISTS public."SysConfig";

CREATE TABLE IF NOT EXISTS public."SysConfig" (
    "ConfigName" VARCHAR(50) NOT NULL,
    "ConfigValue" TEXT NULL,
    "ModifiedDate" TIMESTAMP NULL,
    "ModifiedBy_FK" INT NULL,
    "IsConfigurable" BOOLEAN NULL,
	"ClientID" TEXT NULL
);

DROP TABLE IF EXISTS public."Audit_SysConfig";

CREATE TABLE IF NOT EXISTS public."Audit_SysConfig" (
    "AuditAction" VARCHAR(5) NOT NULL,
    "ActionTime" TIMESTAMP NOT NULL,
    "ConfigName" VARCHAR(50) NOT NULL,
    "ConfigValue" TEXT NULL,
    "ModifiedDate" TIMESTAMP NULL,
    "ModifiedBy_FK" INT NULL,
    "IsConfigurable" BOOLEAN NULL,
	"ClientID" TEXT NULL
);

CREATE OR REPLACE FUNCTION public."fn_tr_SysConfig"()
RETURNS TRIGGER AS $$
BEGIN
    IF TG_OP = 'INSERT' THEN
        INSERT INTO public."Audit_SysConfig"
        SELECT 'I', NOW(), NEW.*;
    ELSIF TG_OP = 'UPDATE' THEN
        INSERT INTO public."Audit_SysConfig"
        SELECT 'U', NOW(), NEW.*;
    ELSIF TG_OP = 'DELETE' THEN
        INSERT INTO public."Audit_SysConfig"
        SELECT 'D', NOW(), OLD.*;
    END IF;
    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER "tr_SysConfig"
AFTER INSERT OR UPDATE OR DELETE ON public."SysConfig"
FOR EACH ROW EXECUTE FUNCTION public."fn_tr_SysConfig"();