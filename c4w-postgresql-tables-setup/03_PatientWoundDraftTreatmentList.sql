DROP TABLE IF EXISTS public."PatientWoundDraftTreatmentList";

CREATE TABLE IF NOT EXISTS public."PatientWoundDraftTreatmentList" (
    "PatientWoundDraftTListID" SERIAL PRIMARY KEY,
	"PatientWoundDraftID_FK" INT NOT NULL,
	"TListItemID_FK" INT NOT NULL,
	"Remarks" VARCHAR(500) NULL,
	"IsDeleted" BOOLEAN NOT NULL,
    "CreatedDate" TIMESTAMP NULL,
    "CreatedBy_FK" INT NULL,
    "ModifiedDate" TIMESTAMP NULL,
    "ModifiedBy_FK" INT NULL,

	CONSTRAINT "FK_PatientWoundDraftTreatmentList_PatientWoundDraft"
	FOREIGN KEY ("PatientWoundDraftID_FK")
	REFERENCES public."PatientWoundDraft"("PatientWoundDraftID"),

	CONSTRAINT "FK_PatientWoundDraftTreatmentList_TreatmentListItem"
	FOREIGN KEY ("TListItemID_FK")
	REFERENCES public."TreatmentListItem"("TListItemID")
);
