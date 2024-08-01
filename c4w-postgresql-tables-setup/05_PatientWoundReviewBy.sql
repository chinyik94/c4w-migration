DROP TABLE IF EXISTS public."PatientWoundReviewBy";

CREATE TABLE IF NOT EXISTS public."PatientWoundReviewBy" (
    "PatientWoundReviewById" SERIAL PRIMARY KEY,
	"PatientWoundVisitID_FK" INT NULL,
	"UserId_FK" INT NULL,
	"ReviewComments" TEXT NULL,
    "ReviewDate" TIMESTAMP NULL,
	"IsDeleted" BOOLEAN NOT NULL DEFAULT FALSE,
    "CreatedDate" TIMESTAMP NOT NULL,
    "CreatedBy_FK" INT NOT NULL,
    "ModifiedDate" TIMESTAMP NULL,
    "ModifiedBy_FK" INT NULL,

	CONSTRAINT "FK_PatientWoundReviewBy_PatientWoundVisit"
	FOREIGN KEY ("PatientWoundVisitID_FK")
	REFERENCES public."PatientWoundVisit"("PatientWoundVisitID")
);
