DROP TABLE IF EXISTS public."CategoryOfWound";

CREATE TABLE IF NOT EXISTS public."CategoryOfWound" (
	"CategoryOfWoundId" SERIAL PRIMARY KEY,
    "CategoryOfWoundName" VARCHAR(255) NOT NULL,
    "IsSystemUsed" BOOLEAN NOT NULL,
    "IsDeleted" BOOLEAN NOT NULL,
    "CreatedDate" TIMESTAMP NULL,
    "CreatedBy_FK" INT NULL,
    "ModifiedDate" TIMESTAMP NULL,
    "ModifiedBy_FK" INT NULL
);
