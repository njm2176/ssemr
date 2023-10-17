DELIMITER //

DROP PROCEDURE IF EXISTS ssemr_etl_tables;

-- Create the procedure
CREATE PROCEDURE ssemr_etl_tables()
BEGIN
    DECLARE script_id INT(11);

    DROP TABLE IF EXISTS ssemr.etl_script_status;

    CREATE TABLE ssemr.etl_script_status
    (
        id          INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
        script_name VARCHAR(50)  DEFAULT null,
        start_time  DATETIME     DEFAULT NULL,
        stop_time   DATETIME     DEFAULT NULL,
        error       VARCHAR(255) DEFAULT NULL
    );
 
    INSERT INTO ssemr.etl_script_status(script_name, start_time) VALUES ('initial_creation_of_tables', NOW());
    SET script_id = LAST_INSERT_ID();


-- Create table tb_screening --

CREATE TABLE flat_encounter_tb_screening
(
    date_                                    DATE,
    current_cough                            VARCHAR(255),
    tb_screening_fever                       VARCHAR(255),
    tb_screening_weight_loss                 VARCHAR(255),
    close_contact_history_with_tb_patients   VARCHAR(255),
    geneexpert_result                        VARCHAR(255),
    bacteriology_sputum_for_afb_information  VARCHAR(255),
    sputum_for_afb_done                      VARCHAR(255),
    sputum_for_afb_result                    VARCHAR(255),
    radiology_crx_information                VARCHAR(255),
    crx_done                                 VARCHAR(255),
    cxr_results                              VARCHAR(255),
    fna_culture_ultrasound_done              VARCHAR(255),
    tb_diagnosed                             VARCHAR(255),
    hivtc_tb_type                            VARCHAR(255)
);

    UPDATE ssemr.etl_script_status SET stop_time = NOW() WHERE id = script_id;
    
    SELECT "Successfully created flat_encounter_tb_screening table";
    
END //

DELIMITER ;

-- Call the procedure
CALL ssemr_etl_tables();