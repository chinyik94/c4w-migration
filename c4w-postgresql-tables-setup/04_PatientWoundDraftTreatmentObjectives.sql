DROP TABLE IF EXISTS public."PatientWoundDraftTreatmentObjectives";

CREATE TABLE IF NOT EXISTS public."PatientWoundDraftTreatmentObjectives" (
    "PatientWoundDraftID_FK" INT NOT NULL,
    "ObjectiveID_FK" INT NOT NULL,

	CONSTRAINT "FK_PatientWoundDraftTreatmentObjectives_Code"
	FOREIGN KEY ("ObjectiveID_FK")
	REFERENCES public."Code"("CodeId"),

	CONSTRAINT "FK_PatientWoundDraftTreatmentObjectives_PatientWoundDraft"
	FOREIGN KEY ("PatientWoundDraftID_FK")
	REFERENCES public."PatientWoundDraft"("PatientWoundDraftID")
);
