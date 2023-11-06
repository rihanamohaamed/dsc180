--- This code joins tables with patient info and Elixhauser comorbidities to 
--- provide all the info needed for LCA in one relation
DROP TABLE IF EXISTS ELIXHAUSER_FINAL;
CREATE TABLE ELIXHAUSER_FINAL AS
(SELECT CONGESTIVE_HEART_FAILURE,
  CARDIAC_ARRHYTHMIAS,
  VALVULAR_DISEASE,
  PULMONARY_CIRCULATION,
  PERIPHERAL_VASCULAR,
  HYPERTENSION,
  PARALYSIS,
  OTHER_NEUROLOGICAL,
  CHRONIC_PULMONARY,
  DIABETES_UNCOMPLICATED,
  DIABETES_COMPLICATED,
  HYPOTHYROIDISM,
  RENAL_FAILURE,
  LIVER_DISEASE,
  PEPTIC_ULCER,
  AIDS,
  LYMPHOMA,
  SOLID_TUMOR,
  RHEUMATOID_ARTHRITIS,
  COAGULOPATHY,
  OBESITY,
  WEIGHT_LOSS,
  FLUID_ELECTROLYTE,
  BLOOD_LOSS_ANEMIA,
  DEFICIENCY_ANEMIAS,
  ALCOHOL_ABUSE,
  DRUG_ABUSE,
  PSYCHOSES,
  DEPRESSION, q.hadm_id, p.age, p.subject_id, p.admission_type,
  CASE
    WHEN age BETWEEN 16 AND 24 THEN 1
    WHEN age BETWEEN 24 AND 44 THEN 2
    WHEN age BETWEEN 44 AND 64 THEN 3 
    WHEN age BETWEEN 64 AND 84 THEN 4 
    ELSE 5 
  END AS age_bracket,
  CASE 
  	 WHEN admission_type = 'EMERGENCY' THEN 1
     ELSE 0
  END AS admission_type_encoded

FROM ELIXHAUSER_QUAN q
INNER JOIN PATIENT_INFO as p ON q.hadm_id = p.hadm_id
WHERE q.cardiac_arrhythmias IS NOT NULL);

SELECT * FROM ELIXHAUSER_FINAL;