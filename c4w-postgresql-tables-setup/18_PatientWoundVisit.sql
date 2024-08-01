DROP TABLE IF EXISTS public."Audit_PatientWoundVisit";

CREATE TABLE IF NOT EXISTS public."Audit_PatientWoundVisit" (
    "AuditAction" VARCHAR(5) NOT NULL,
    "ActionTime" TIMESTAMP NOT NULL,
    "PatientWoundVisitID" INT NOT NULL,
    "PatientWoundID_FK" INT NOT NULL,
    "VisitDate" TIMESTAMP NULL,
    "WoundType" VARCHAR(50) NOT NULL,
    "WoundSubType" VARCHAR(50) NULL,
    "WoundTypeOther" VARCHAR(50) NULL,
    "SizeLength" DECIMAL(5, 2) NULL,
    "SizeDepth" DECIMAL(5, 2) NULL,
    "SizeWidth" DECIMAL(5, 2) NULL,
    "Edges" VARCHAR(50) NULL,
    "Appearance" VARCHAR(50) NULL,
    "Smell" VARCHAR(50) NULL,
    "UnderMining" VARCHAR(255) NULL,
    "Exudate" VARCHAR(50) NULL,
    "Suffering" INT NULL,
    "ImageUpload" TEXT NULL,
    "SurfaceArea" DECIMAL(5, 2) NULL,
    "UnderMiningDepth" DECIMAL(4, 1) NULL,
    "ExudateSubInfo" VARCHAR(50) NULL,
    "VitalSignID_FK" INT NULL,
    "IsDeleted" BOOLEAN NOT NULL,
    "CreatedDate" TIMESTAMP NULL,
    "CreatedBy_FK" INT NULL,
    "ModifiedDate" TIMESTAMP NULL,
    "ModifiedBy_FK" INT NULL,
    "CareReportID_FK" INT NULL,
    "InitialCareAssessmentID_FK" INT NULL,
    "ReferID_FK" INT NULL,
    "NextReviewDate" TIMESTAMP NULL,
    "TreatmentRemarks" TEXT NULL,
    "AssignedToID_FK" INT NULL,
    "DESIGN_R_Depth" VARCHAR(50) NULL,
    "DESIGN_R_Exudate" INT NULL,
    "DESIGN_R_Size" INT NULL,
    "DESIGN_R_Inflammation" INT NULL,
    "DESIGN_R_Granulation" INT NULL,
    "DESIGN_R_Necrotic" INT NULL,
    "DESIGN_R_Pocket" INT NULL,
    "DESIGN_R_Score" INT NULL,
    "IsDESIGN_R" BOOLEAN NULL,
    "ExudateSubInfo2" VARCHAR(50) NULL,
    "PeriWound" VARCHAR(50) NULL,
    "Debridement" VARCHAR(50) NULL,
    "CleansingSolutionUsed" VARCHAR(50) NULL,
    "Model_jpg" TEXT NULL,
    "Model_mtl" TEXT NULL,
    "Model_obj" TEXT NULL,
    "IsDraft" BOOLEAN DEFAULT FALSE,
    "Volume" DECIMAL(5, 2) NULL,
    "WoundInfection" BOOLEAN NULL,
    "fever" BOOLEAN NULL,
    "temperature" DECIMAL(5, 2) NULL,
    "abscessPuss" BOOLEAN NULL,
    "increasedPain" BOOLEAN NULL,
    "erythema" BOOLEAN NULL,
    "oedema" BOOLEAN NULL,
    "localWarmth" BOOLEAN NULL,
    "increasedExcudate" BOOLEAN NULL,
    "delayedHealing" BOOLEAN NULL,
    "maladour" BOOLEAN NULL,
    "pocketing" BOOLEAN NULL,
    "suspectedInfection" BOOLEAN NULL,
    "TC_Granulation" DECIMAL(5, 2) NULL,
    "TC_Slough" DECIMAL(5, 2) NULL,
    "TC_Necrosis" DECIMAL(5, 2) NULL,
    "TC_Epithelizing" DECIMAL(5, 2) NULL,
    "TC_Others" DECIMAL(5, 2) NULL,
    "TC_OriginalImage" TEXT NULL,
    "TC_WoundBedImage" TEXT NULL,
    "TC_AnnotatedImage" TEXT NULL,
    "TC_IsAccept" BOOLEAN NULL,
    "TC_Reason" TEXT NULL,
    "Perimeter" DECIMAL(5, 2) NULL,
    "AverageDepth" DECIMAL(8, 2) NULL,
    "MaximumDepth" DECIMAL(5, 2) NULL,
    "MinimumDepth" DECIMAL(5, 2) NULL,
    "IsRedness" BOOLEAN NULL,
    "IsSwelling" BOOLEAN NULL,
    "IsWarmToTouch" BOOLEAN NULL,
    "IsSmell" BOOLEAN NULL,
    "Size" DECIMAL(5, 2) NULL,
    "TC_Auto_Granulation" DECIMAL(5, 2) NULL,
    "TC_Auto_Slough" DECIMAL(5, 2) NULL,
    "TC_Auto_Necrosis" DECIMAL(5, 2) NULL,
    "TC_Auto_Epithelizing" DECIMAL(5, 2) NULL,
    "TC_Auto_Others" DECIMAL(5, 2) NULL,
    "NextTreatmentDate" TIMESTAMP NULL,
    "InfectionRemarks" TEXT NULL,
    "TO_Comments" TEXT NULL,
    "DepthImage" TEXT NULL,
    "Status" VARCHAR(15) NULL,
    "StatusRemark" TEXT NULL,
    "woundOverlaysImageDistance" DECIMAL(5, 2) NULL,
    "woundOverlaysImage" VARCHAR(50) NULL,
    "otherTissueName" TEXT NULL,
    "isTCAndImageModified" BOOLEAN NULL,
    "isTCModified" BOOLEAN NULL,
    "isWMModified" BOOLEAN NULL,
    "isUploadImageModified" BOOLEAN NULL,
    "ProgressiveWoundStage" VARCHAR(50) NULL,
    "Tempreture" DECIMAL(6, 2) NULL,
    "PR" DECIMAL(6, 2) NULL,
    "BPSys" DECIMAL(6, 2) NULL,
    "BPDias" DECIMAL(6, 2) NULL,
    "OriginalImageMeasurement" VARCHAR(50) NULL,
    "WoundBedImageMeasurement" VARCHAR(50) NULL,
    "DepthImageMeasurement" VARCHAR(50) NULL,
    "AnnotatedImageMeasurement" VARCHAR(50) NULL,
    "SizeLength_Auto" DECIMAL(5, 2) NULL,
    "SizeDepth_Auto" DECIMAL(5, 2) NULL,
    "SizeWidth_Auto" DECIMAL(5, 2) NULL,
    "MeasurementUpdateRemark" VARCHAR(255) NULL,
    "TCUpdateRemark" VARCHAR(255) NULL,
    "DepthMax" DECIMAL(5, 2) NULL,
    "DepthEighty" DECIMAL(5, 2) NULL,
    "DepthSixty" DECIMAL(5, 2) NULL,
    "DepthForty" DECIMAL(5, 2) NULL,
    "DepthTwenty" DECIMAL(5, 2) NULL,
    "DepthNegative" DECIMAL(5, 2) NULL,
    "DepthNans" DECIMAL(5, 2) NULL,
    "Rotation" DECIMAL(5, 2) NULL,
    "Comments" TEXT NULL,
    "Title" VARCHAR(30) NULL,
    "ReasonForChangeMeasurement" TEXT NULL,
    "ReasonForChangeClassification" TEXT NULL,
    "OrigWoundId" INT NULL,
    "SmallWound" BOOLEAN NULL,
    "ActionDescription" TEXT NULL,
    "FrequencyOfVisit" INT NULL
);

DROP TABLE IF EXISTS public."PatientWoundVisit";

CREATE TABLE IF NOT EXISTS public."PatientWoundVisit" (
    "PatientWoundVisitID" SERIAL PRIMARY KEY,
    "PatientWoundID_FK" INT NOT NULL,
    "VisitDate" TIMESTAMP NULL,
    "WoundType" VARCHAR(50) NOT NULL,
    "WoundSubType" VARCHAR(50) NULL,
    "WoundTypeOther" VARCHAR(50) NULL,
    "SizeLength" DECIMAL(5, 2) DEFAULT 0,
    "SizeDepth" DECIMAL(5, 2) DEFAULT 0,
    "SizeWidth" DECIMAL(5, 2) DEFAULT 0,
    "Edges" VARCHAR(50) NULL,
    "Appearance" VARCHAR(50) NULL,
    "Smell" VARCHAR(50) NULL,
    "UnderMining" VARCHAR(255) NULL,
    "Exudate" VARCHAR(50) NULL,
    "Suffering" INT DEFAULT 0,
    "ImageUpload" TEXT NULL,
    "SurfaceArea" DECIMAL(5, 2) DEFAULT 0,
    "UnderMiningDepth" DECIMAL(4, 1) DEFAULT 0,
    "ExudateSubInfo" VARCHAR(50) NULL,
    "VitalSignID_FK" INT NULL,
    "IsDeleted" BOOLEAN NOT NULL,
    "CreatedDate" TIMESTAMP NULL,
    "CreatedBy_FK" INT NULL,
    "ModifiedDate" TIMESTAMP NULL,
    "ModifiedBy_FK" INT NULL,
    "CareReportID_FK" INT NULL,
    "InitialCareAssessmentID_FK" INT NULL,
    "ReferID_FK" INT NULL,
    "NextReviewDate" TIMESTAMP NULL,
    "TreatmentRemarks" TEXT NULL,
    "AssignedToID_FK" INT NULL,
    "DESIGN_R_Depth" VARCHAR(50) NULL,
    "DESIGN_R_Exudate" INT NULL,
    "DESIGN_R_Size" INT NULL,
    "DESIGN_R_Inflammation" INT NULL,
    "DESIGN_R_Granulation" INT NULL,
    "DESIGN_R_Necrotic" INT NULL,
    "DESIGN_R_Pocket" INT NULL,
    "DESIGN_R_Score" INT NULL,
    "IsDESIGN_R" BOOLEAN DEFAULT FALSE,
    "ExudateSubInfo2" VARCHAR(50) NULL,
    "PeriWound" VARCHAR(50) NULL,
    "Debridement" VARCHAR(50) NULL,
    "CleansingSolutionUsed" VARCHAR(50) NULL,
    "Model_jpg" TEXT NULL,
    "Model_mtl" TEXT NULL,
    "Model_obj" TEXT NULL,
    "IsDraft" BOOLEAN DEFAULT FALSE,
    "Volume" DECIMAL(5, 2) DEFAULT 0,
    "WoundInfection" BOOLEAN NULL,
    "fever" BOOLEAN NULL,
    "temperature" DECIMAL(5, 2) NULL,
    "abscessPuss" BOOLEAN NULL,
    "increasedPain" BOOLEAN NULL,
    "erythema" BOOLEAN NULL,
    "oedema" BOOLEAN NULL,
    "localWarmth" BOOLEAN NULL,
    "increasedExcudate" BOOLEAN NULL,
    "delayedHealing" BOOLEAN NULL,
    "maladour" BOOLEAN NULL,
    "pocketing" BOOLEAN NULL,
    "suspectedInfection" BOOLEAN NULL,
    "TC_Granulation" DECIMAL(5, 2) DEFAULT 0,
    "TC_Slough" DECIMAL(5, 2) DEFAULT 0,
    "TC_Necrosis" DECIMAL(5, 2) DEFAULT 0,
    "TC_Epithelizing" DECIMAL(5, 2) DEFAULT 0,
    "TC_Others" DECIMAL(5, 2) DEFAULT 0,
    "TC_OriginalImage" TEXT NULL,
    "TC_WoundBedImage" TEXT NULL,
    "TC_AnnotatedImage" TEXT NULL,
    "TC_IsAccept" BOOLEAN DEFAULT FALSE,
    "TC_Reason" TEXT NULL,
    "Perimeter" DECIMAL(5, 2) DEFAULT 0,
    "AverageDepth" DECIMAL(8, 2) DEFAULT 0,
    "MaximumDepth" DECIMAL(5, 2) DEFAULT 0,
    "MinimumDepth" DECIMAL(5, 2) DEFAULT 0,
    "IsRedness" BOOLEAN DEFAULT FALSE,
    "IsSwelling" BOOLEAN DEFAULT FALSE,
    "IsWarmToTouch" BOOLEAN DEFAULT FALSE,
    "IsSmell" BOOLEAN DEFAULT FALSE,
    "Size" DECIMAL(5, 2) DEFAULT 0,
    "TC_Auto_Granulation" DECIMAL(5, 2) DEFAULT 0,
    "TC_Auto_Slough" DECIMAL(5, 2) DEFAULT 0,
    "TC_Auto_Necrosis" DECIMAL(5, 2) DEFAULT 0,
    "TC_Auto_Epithelizing" DECIMAL(5, 2) DEFAULT 0,
    "TC_Auto_Others" DECIMAL(5, 2) DEFAULT 0,
    "NextTreatmentDate" TIMESTAMP NULL,
    "InfectionRemarks" TEXT NULL,
    "TO_Comments" TEXT NULL,
    "DepthImage" TEXT NULL,
    "Status" VARCHAR(15) NULL,
    "StatusRemark" TEXT NULL,
    "woundOverlaysImageDistance" DECIMAL(5, 2) NULL,
    "woundOverlaysImage" VARCHAR(50) NULL,
    "otherTissueName" TEXT NULL,
    "isTCAndImageModified" BOOLEAN NULL,
    "isTCModified" BOOLEAN NULL,
    "isWMModified" BOOLEAN NULL,
    "isUploadImageModified" BOOLEAN NULL,
    "ProgressiveWoundStage" VARCHAR(50) NULL,
    "Tempreture" DECIMAL(6, 2) NULL,
    "PR" DECIMAL(6, 2) NULL,
    "BPSys" DECIMAL(6, 2) NULL,
    "BPDias" DECIMAL(6, 2) NULL,
    "OriginalImageMeasurement" VARCHAR(50) NULL,
    "WoundBedImageMeasurement" VARCHAR(50) NULL,
    "DepthImageMeasurement" VARCHAR(50) NULL,
    "AnnotatedImageMeasurement" VARCHAR(50) NULL,
    "SizeLength_Auto" DECIMAL(5, 2) NULL,
    "SizeDepth_Auto" DECIMAL(5, 2) NULL,
    "SizeWidth_Auto" DECIMAL(5, 2) NULL,
    "MeasurementUpdateRemark" VARCHAR(255) NULL,
    "TCUpdateRemark" VARCHAR(255) NULL,
    "DepthMax" DECIMAL(5, 2) NULL,
    "DepthEighty" DECIMAL(5, 2) NULL,
    "DepthSixty" DECIMAL(5, 2) NULL,
    "DepthForty" DECIMAL(5, 2) NULL,
    "DepthTwenty" DECIMAL(5, 2) NULL,
    "DepthNegative" DECIMAL(5, 2) NULL,
    "DepthNans" DECIMAL(5, 2) NULL,
    "Rotation" DECIMAL(5, 2) NULL,
    "Comments" TEXT NULL,
    "Title" VARCHAR(30) NULL,
    "ReasonForChangeMeasurement" TEXT NULL,
    "ReasonForChangeClassification" TEXT NULL,
    "OrigWoundId" INT NULL,
    "SmallWound" BOOLEAN NULL,
    "ActionDescription" TEXT NULL,
    "FrequencyOfVisit" INT NULL,

	CONSTRAINT "FK_PatientWoundVisit_PatientWound"
	FOREIGN KEY ("PatientWoundID_FK")
	REFERENCES public."PatientWound"("PatientWoundID"),

	CONSTRAINT "FK_PatientWoundVisit_PatientWoundVisit"
	FOREIGN KEY ("ReferID_FK")
	REFERENCES public."PatientWoundVisit"("PatientWoundVisitID")
);

CREATE OR REPLACE FUNCTION public."fn_tr_PatientWoundVisit"()
RETURNS TRIGGER AS $$
BEGIN
    IF TG_OP = 'INSERT' THEN
        INSERT INTO public."Audit_PatientWoundVisit"
        SELECT 'I', NOW(), NEW.*;
    ELSIF TG_OP = 'UPDATE' THEN
        INSERT INTO public."Audit_PatientWoundVisit"
        SELECT 'U', NOW(), NEW.*;
    ELSIF TG_OP = 'DELETE' THEN
        INSERT INTO public."Audit_PatientWoundVisit"
        SELECT 'D', NOW(), OLD.*;
    END IF;
    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER "tr_PatientWoundVisit"
AFTER INSERT OR UPDATE OR DELETE ON public."PatientWoundVisit"
FOR EACH ROW EXECUTE FUNCTION public."fn_tr_PatientWoundVisit"();