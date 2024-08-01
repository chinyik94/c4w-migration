DROP TABLE IF EXISTS public."APIAccessKey";

CREATE TABLE IF NOT EXISTS public."APIAccessKey" (
    "APIAccessKeyID" SERIAL PRIMARY KEY,
	"TokenCode" VARCHAR(100) NOT NULL,
	"AccessKey" VARCHAR(200) NOT NULL,
    "ExpiryDate" TIMESTAMP NOT NULL,
    "CreatedDate" TIMESTAMP NULL,
    "ModifiedDate" TIMESTAMP NULL,
    "UserId_FK" INT NULL,
    "OrgCode" VARCHAR(50) NULL,
	"ClientID" TEXT NULL
);