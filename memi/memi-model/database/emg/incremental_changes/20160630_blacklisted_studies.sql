-- MySQL create and insert statements for blacklisting studies

-- Author: Maxim Scheremetjew, EMBL-EBI, InterPro

-- Create table statements
CREATE TABLE `STUDY_ERROR_TYPE` (
    `ERROR_ID` TINYINT COMMENT 'Primary key.',
    `ERROR_TYPE` VARCHAR(50) NOT NULL COMMENT 'Represents the name of the issue.',
    `DESCRIPTION` TEXT NOT NULL COMMENT 'Describes the issue.',
    PRIMARY KEY (`ERROR_ID`)
);

CREATE TABLE `BLACKLISTED_STUDY` (
    `EXT_STUDY_ID` VARCHAR(18) NOT NULL COMMENT 'This is the external unique (non-EMG) ID for the study, e.g. SRPXXXXXX for SRA studies',
    `ERROR_TYPE_ID` TINYINT NOT NULL COMMENT 'Foreign key to the study error type table.',
    `ANALYZER` VARCHAR(15) NOT NULL COMMENT 'Person who tried to analyse this study.',
    `PIPELINE_ID` TINYINT COMMENT 'Optional. The pipeline version used to run this study.',
    `DATE_BLACKLISTED` DATE NOT NULL COMMENT 'The date when the study has been marked as blacklisted.',
    PRIMARY KEY (`EXT_STUDY_ID`),
    FOREIGN KEY (`ERROR_TYPE_ID`)
        REFERENCES `STUDY_ERROR_TYPE` (`ERROR_ID`)
);

-- Insert statements
INSERT INTO STUDY_ERROR_TYPE (ERROR_ID,ERROR_TYPE,DESCRIPTION) VALUES (1,'RAW_DATA_NO_RECORDS_IN_ENA','ENA does not hold any records for this project.');
INSERT INTO STUDY_ERROR_TYPE (ERROR_ID,ERROR_TYPE,DESCRIPTION) VALUES (2,'RAW_DATA_DOWNLOAD_ERROR','Unable to download the raw data from ENA.');
INSERT INTO STUDY_ERROR_TYPE (ERROR_ID,ERROR_TYPE,DESCRIPTION) VALUES (3,'RAW_DATA_FILE_CORRUPT','The downloaded raw sequence files are corrupt.');
INSERT INTO STUDY_ERROR_TYPE (ERROR_ID,ERROR_TYPE,DESCRIPTION) VALUES (4,'DATA_PREPARATION_ERROR','Merging the pair-end sequences failed.');
INSERT INTO STUDY_ERROR_TYPE (ERROR_ID,ERROR_TYPE,DESCRIPTION) VALUES (5,'ANALYSIS_QC_NOT_PASSED','None of the raw sequences passed QC.');
INSERT INTO STUDY_ERROR_TYPE (ERROR_ID,ERROR_TYPE,DESCRIPTION) VALUES (6,'ANALYSIS_QC_NOT_PASSED_LENGTH','None of the raw sequences passed QC due to length.');
INSERT INTO STUDY_ERROR_TYPE (ERROR_ID,ERROR_TYPE,DESCRIPTION) VALUES (7,'ANALYSIS_QC_NOT_PASSED_QUALITY','None of the raw sequences passed QC due to quality.');
INSERT INTO STUDY_ERROR_TYPE (ERROR_ID,ERROR_TYPE,DESCRIPTION) VALUES (8,'DATABASE_UPLOAD_FAILED','The database upload of study and sample meta data failed.');

INSERT INTO BLACKLISTED_STUDY (EXT_STUDY_ID, ERROR_TYPE_ID, ANALYZER, DATE_BLACKLISTED) VALUES ('ERP015980',4,'hudenise','2016-06-09');
INSERT INTO BLACKLISTED_STUDY (EXT_STUDY_ID, ERROR_TYPE_ID, ANALYZER, DATE_BLACKLISTED) VALUES ('ERP005537',1,'rdf','2016-06-22');
INSERT INTO BLACKLISTED_STUDY (EXT_STUDY_ID, ERROR_TYPE_ID, ANALYZER, DATE_BLACKLISTED) VALUES ('ERP005836',5,'rdf','2016-06-28');
INSERT INTO BLACKLISTED_STUDY (EXT_STUDY_ID, ERROR_TYPE_ID, ANALYZER, DATE_BLACKLISTED) VALUES ('SRP005398',5,'rdf','2016-06-28');
INSERT INTO BLACKLISTED_STUDY (EXT_STUDY_ID, ERROR_TYPE_ID, ANALYZER, DATE_BLACKLISTED) VALUES ('SRP026386',5,'rdf','2016-06-28');
INSERT INTO BLACKLISTED_STUDY (EXT_STUDY_ID, ERROR_TYPE_ID, ANALYZER, DATE_BLACKLISTED) VALUES ('SRP029181',5,'rdf','2016-06-28');
INSERT INTO BLACKLISTED_STUDY (EXT_STUDY_ID, ERROR_TYPE_ID, ANALYZER, DATE_BLACKLISTED) VALUES ('SRP035350',5,'rdf','2016-06-28');
INSERT INTO BLACKLISTED_STUDY (EXT_STUDY_ID, ERROR_TYPE_ID, ANALYZER, DATE_BLACKLISTED) VALUES ('SRP035457',5,'rdf','2016-06-28');
INSERT INTO BLACKLISTED_STUDY (EXT_STUDY_ID, ERROR_TYPE_ID, ANALYZER, DATE_BLACKLISTED) VALUES ('SRP038003',5,'rdf','2016-06-28');
INSERT INTO BLACKLISTED_STUDY (EXT_STUDY_ID, ERROR_TYPE_ID, ANALYZER, DATE_BLACKLISTED) VALUES ('SRP038018',5,'rdf','2016-06-28');
INSERT INTO BLACKLISTED_STUDY (EXT_STUDY_ID, ERROR_TYPE_ID, ANALYZER, DATE_BLACKLISTED) VALUES ('SRP040047',5,'rdf','2016-06-28');
INSERT INTO BLACKLISTED_STUDY (EXT_STUDY_ID, ERROR_TYPE_ID, ANALYZER, DATE_BLACKLISTED) VALUES ('SRP040581',5,'rdf','2016-06-28');
INSERT INTO BLACKLISTED_STUDY (EXT_STUDY_ID, ERROR_TYPE_ID, ANALYZER, DATE_BLACKLISTED) VALUES ('SRP040706',5,'rdf','2016-06-28');
INSERT INTO BLACKLISTED_STUDY (EXT_STUDY_ID, ERROR_TYPE_ID, ANALYZER, DATE_BLACKLISTED) VALUES ('SRP040766',5,'rdf','2016-06-28');
INSERT INTO BLACKLISTED_STUDY (EXT_STUDY_ID, ERROR_TYPE_ID, ANALYZER, DATE_BLACKLISTED) VALUES ('SRP040994',5,'rdf','2016-06-28');
INSERT INTO BLACKLISTED_STUDY (EXT_STUDY_ID, ERROR_TYPE_ID, ANALYZER, DATE_BLACKLISTED) VALUES ('SRP041809',5,'rdf','2016-06-28');
INSERT INTO BLACKLISTED_STUDY (EXT_STUDY_ID, ERROR_TYPE_ID, ANALYZER, DATE_BLACKLISTED) VALUES ('SRP042336',5,'rdf','2016-06-28');
INSERT INTO BLACKLISTED_STUDY (EXT_STUDY_ID, ERROR_TYPE_ID, ANALYZER, DATE_BLACKLISTED) VALUES ('SRP042992',5,'rdf','2016-06-28');
INSERT INTO BLACKLISTED_STUDY (EXT_STUDY_ID, ERROR_TYPE_ID, ANALYZER, DATE_BLACKLISTED) VALUES ('SRP043371',5,'rdf','2016-06-28');
INSERT INTO BLACKLISTED_STUDY (EXT_STUDY_ID, ERROR_TYPE_ID, ANALYZER, DATE_BLACKLISTED) VALUES ('SRP044034',5,'rdf','2016-06-28');
INSERT INTO BLACKLISTED_STUDY (EXT_STUDY_ID, ERROR_TYPE_ID, ANALYZER, DATE_BLACKLISTED) VALUES ('SRP044070',5,'rdf','2016-06-28');
INSERT INTO BLACKLISTED_STUDY (EXT_STUDY_ID, ERROR_TYPE_ID, ANALYZER, DATE_BLACKLISTED) VALUES ('SRP044095',5,'rdf','2016-06-28');
INSERT INTO BLACKLISTED_STUDY (EXT_STUDY_ID, ERROR_TYPE_ID, ANALYZER, DATE_BLACKLISTED) VALUES ('SRP045056',5,'rdf','2016-06-28');
INSERT INTO BLACKLISTED_STUDY (EXT_STUDY_ID, ERROR_TYPE_ID, ANALYZER, DATE_BLACKLISTED) VALUES ('SRP045543',5,'rdf','2016-06-28');
INSERT INTO BLACKLISTED_STUDY (EXT_STUDY_ID, ERROR_TYPE_ID, ANALYZER, DATE_BLACKLISTED) VALUES ('SRP045608',5,'rdf','2016-06-28');
INSERT INTO BLACKLISTED_STUDY (EXT_STUDY_ID, ERROR_TYPE_ID, ANALYZER, DATE_BLACKLISTED) VALUES ('SRP045947',5,'rdf','2016-06-28');
INSERT INTO BLACKLISTED_STUDY (EXT_STUDY_ID, ERROR_TYPE_ID, ANALYZER, DATE_BLACKLISTED) VALUES ('SRP047111',5,'rdf','2016-06-28');
INSERT INTO BLACKLISTED_STUDY (EXT_STUDY_ID, ERROR_TYPE_ID, ANALYZER, DATE_BLACKLISTED) VALUES ('SRP048667',5,'rdf','2016-06-28');
INSERT INTO BLACKLISTED_STUDY (EXT_STUDY_ID, ERROR_TYPE_ID, ANALYZER, DATE_BLACKLISTED) VALUES ('SRP049448',5,'rdf','2016-06-28');
INSERT INTO BLACKLISTED_STUDY (EXT_STUDY_ID, ERROR_TYPE_ID, ANALYZER, DATE_BLACKLISTED) VALUES ('SRP049459',5,'rdf','2016-06-28');
INSERT INTO BLACKLISTED_STUDY (EXT_STUDY_ID, ERROR_TYPE_ID, ANALYZER, DATE_BLACKLISTED) VALUES ('SRP049692',5,'rdf','2016-06-28');
INSERT INTO BLACKLISTED_STUDY (EXT_STUDY_ID, ERROR_TYPE_ID, ANALYZER, DATE_BLACKLISTED) VALUES ('SRP050184',5,'rdf','2016-06-28');
INSERT INTO BLACKLISTED_STUDY (EXT_STUDY_ID, ERROR_TYPE_ID, ANALYZER, DATE_BLACKLISTED) VALUES ('SRP050186',5,'rdf','2016-06-28');
INSERT INTO BLACKLISTED_STUDY (EXT_STUDY_ID, ERROR_TYPE_ID, ANALYZER, DATE_BLACKLISTED) VALUES ('SRP050277',5,'rdf','2016-06-28');
INSERT INTO BLACKLISTED_STUDY (EXT_STUDY_ID, ERROR_TYPE_ID, ANALYZER, DATE_BLACKLISTED) VALUES ('SRP050357',5,'rdf','2016-06-28');
INSERT INTO BLACKLISTED_STUDY (EXT_STUDY_ID, ERROR_TYPE_ID, ANALYZER, DATE_BLACKLISTED) VALUES ('SRP071345',5,'rdf','2016-06-28');