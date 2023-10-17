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


-- Create table hiv_care_follow_up --

CREATE TABLE ssemr.ssemr_flat_encounter_hiv_care_follow_up
(
    date_of_death                                DATE,
    lost_to_follow_up                            VARCHAR(255),
    lost_follow_up_last_visit_date               DATE,
    transferred_out                              VARCHAR(255),
    hivtc_date_of_transfered_out                 DATE,
    hivtc_transferred_out_to                     VARCHAR(255),
    follow_up_scheduled                          BOOLEAN,
    follow_up_date                               DATE,
    duration_in_months_since_first_starting      INT(15),
    weight_kg                                    INT(15),
    height_cm                                    INT(15),
    bmi                                          INT(15),
    muac_pregnancy_visit                         INT(15),
    current_on_fp                                BOOLEAN,
    fp_method_used_by_the_patient                VARCHAR(255),
    edd                                          DATE,
    tb_status                                    DATE,
    side_effects                                 VARCHAR(255),
    new_io_other_problems                        VARCHAR(255),
    who_clinical_stage                           VARCHAR(255),
    contrimoxazole_dapstone                      BOOLEAN,
    adherence_number_of_days                     INT(15),
    inh                                          BOOLEAN,
    pills_dispensed                              VARCHAR(255),
    other_meds_dispensed                         VARCHAR(255),
    adhere_why                                   VARCHAR(255),
    regimen_dose                                 VARCHAR(255),
    number_of_days_dispensed                     INT(15),
    cd4                                          INT(15),
    date_vl_sample_collected                     DATE,
    vl_results                                   INT(15),
    rpr_hb_sputum_cxr_bepb                       VARCHAR(255),
    rfts_lfts_and_other_lab_tests                VARCHAR(255),
    number_of_days_hospitalized                  INT(15),
    clinician                                    VARCHAR(255)
);

    UPDATE ssemr.etl_script_status SET stop_time = NOW() WHERE id = script_id;
    
    SELECT "Successfully created ssemr_flat_encounter_hiv_care_follow_up table";
    
END //

DELIMITER ;

-- Call the procedure
CALL ssemr_etl_tables();