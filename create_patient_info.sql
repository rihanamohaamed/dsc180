--- this code creates a patient_info table that calculates 
--- patient age using admit_time from admissions and dob from patients
--- as well as includes admission_type from admissions to be used later in LCA
DROP TABLE IF EXISTS PATIENT_INFO;
CREATE TABLE PATIENT_INFO AS(
WITH admissions_with_age AS(
  SELECT
    a.subject_id,
    a.admittime,
    p.dob,
	a.hadm_id,
	a.admission_type,
    ROW_NUMBER() OVER (PARTITION BY a.subject_id ORDER BY a.admittime ASC) AS admission_rank,
    CASE 
      WHEN EXTRACT(YEAR FROM AGE(a.ADMITTIME, p.DOB)) < 16 THEN NULL
      WHEN EXTRACT(YEAR FROM AGE(a.ADMITTIME, p.DOB)) >= 300 THEN 90
      ELSE EXTRACT(YEAR FROM AGE(a.ADMITTIME, p.DOB))
    END AS age
  FROM
    mimiciii.admissions a
    JOIN mimiciii.patients p ON a.subject_id = p.subject_id
	WHERE a.admission_type = 'EMERGENCY' or a.admission_type = 'ELECTIVE'
)
SELECT
  subject_id,
  admission_type,
  hadm_id,
--   admittime,
--   dob,
  age
FROM
  admissions_with_age
WHERE
  admission_rank = 1
  AND age IS NOT NULL);

SELECT * FROM PATIENT_INFO;
