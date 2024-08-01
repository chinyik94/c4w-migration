DROP TABLE IF EXISTS public."WoundUserCategoryParentChild";

CREATE TABLE IF NOT EXISTS public."WoundUserCategoryParentChild" (
    "ParentUserCategoryID_FK" INT NOT NULL,
	"ChildUserCategoryID_FK" INT NOT NULL
);