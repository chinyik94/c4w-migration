DROP TABLE IF EXISTS public."WoundConsolidatedEmail";

CREATE TABLE IF NOT EXISTS public."WoundConsolidatedEmail" (
    "WoundConsolidatedEmailID" SERIAL PRIMARY KEY,
	"PatientWoundVisitID_FK" INT NOT NULL,
	"MailSettingsID_FK" INT NOT NULL,
	"PDFContent" TEXT NULL,
	"IsDeleted" BOOLEAN NOT NULL,
    "CreatedDate" TIMESTAMP NOT NULL,
    "CreatedBy_FK" INT NOT NULL,
    "ModifiedDate" TIMESTAMP NULL,
    "ModifiedBy_FK" INT NULL,
	"PatientID_FK" INT NULL,
	"IsCompleted" BOOLEAN NULL,
	"PatientWoundID_FK" INT NULL,

	CONSTRAINT "FK_WoundConsolidatedEmail_MailSettings"
	FOREIGN KEY ("MailSettingsID_FK")
	REFERENCES public."MailSettings"("id"),

	CONSTRAINT "FK_WoundConsolidatedEmail_PatientWoundVisit"
	FOREIGN KEY ("PatientWoundVisitID_FK")
	REFERENCES public."PatientWoundVisit"("PatientWoundVisitID")
);
