DROP TABLE IF EXISTS public."WoundStage";

CREATE TABLE IF NOT EXISTS public."WoundStage" (
    "WoundStageId" SERIAL PRIMARY KEY,
	"CategoryOfWoundId_FK" INT NOT NULL,
	"WoundStageName" VARCHAR(255) NOT NULL,
	"Ordering" INT NULL,
	"IsSystemUsed" BOOLEAN NOT NULL,
	"IsDeleted" BOOLEAN NOT NULL,
    "CreatedDate" TIMESTAMP NULL,
    "CreatedBy_FK" INT NULL,
    "ModifiedDate" TIMESTAMP NULL,
    "ModifiedBy_FK" INT NULL,
	"Status" VARCHAR(15) NULL,

	CONSTRAINT "FK_WoundStage_CategoryOfWound"
	FOREIGN KEY ("CategoryOfWoundId_FK")
	REFERENCES public."CategoryOfWound"("CategoryOfWoundId")
);
