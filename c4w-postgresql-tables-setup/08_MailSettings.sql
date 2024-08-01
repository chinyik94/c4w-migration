DROP TABLE IF EXISTS public."Audit_MailSettings";

CREATE TABLE IF NOT EXISTS public."Audit_MailSettings" (
    "AuditAction" VARCHAR(5) NOT NULL,
    "ActionTime" TIMESTAMP NOT NULL,
    "id" INT NOT NULL,
    "description" VARCHAR(255) NOT NULL,
    "msgBCC" VARCHAR(255) NULL,
    "msgCC" VARCHAR(255) NULL,
    "msgTo" VARCHAR(255) NULL,
    "msgSubj" TEXT NULL,
    "msgBody" TEXT NULL,
    "displayMsgTo" BOOLEAN NULL,
    "displayMsgCC" BOOLEAN NULL,
    "displayMsgBCC" BOOLEAN NULL,
    "ModifiedDate" TIMESTAMP NULL,
    "ModifiedBy_FK" INT NULL,
    "IsDeleted" BOOLEAN NOT NULL
);

DROP TABLE IF EXISTS public."MailSettings";

CREATE TABLE IF NOT EXISTS public."MailSettings" (
    "id" INT PRIMARY KEY,
    "description" VARCHAR(255) NOT NULL,
    "msgBCC" VARCHAR(255) NULL,
    "msgCC" VARCHAR(255) NULL,
    "msgTo" VARCHAR(255) NULL,
    "msgSubj" TEXT NULL,
    "msgBody" TEXT NULL,
    "displayMsgTo" BOOLEAN NULL,
    "displayMsgCC" BOOLEAN NULL,
    "displayMsgBCC" BOOLEAN NULL,
    "ModifiedDate" TIMESTAMP NULL,
    "ModifiedBy_FK" INT NULL,
    "IsDeleted" BOOLEAN NOT NULL
);

CREATE OR REPLACE FUNCTION public."fn_tr_MailSettings"()
RETURNS TRIGGER AS $$
BEGIN
    IF TG_OP = 'INSERT' THEN
        INSERT INTO public."Audit_MailSettings"
        SELECT 'I', NOW(), NEW.*;
    ELSIF TG_OP = 'UPDATE' THEN
        INSERT INTO public."Audit_MailSettings"
        SELECT 'U', NOW(), NEW.*;
    ELSIF TG_OP = 'DELETE' THEN
        INSERT INTO public."Audit_MailSettings"
        SELECT 'D', NOW(), OLD.*;
    END IF;
    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER "tr_MailSettings"
AFTER INSERT OR UPDATE OR DELETE ON public."MailSettings"
FOR EACH ROW EXECUTE FUNCTION public."fn_tr_MailSettings"();