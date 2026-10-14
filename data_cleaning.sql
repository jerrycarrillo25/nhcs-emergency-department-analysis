CREATE OR REPLACE TABLE
  `organic-byway-505319-d1.NHCS_ed_data.NHCS_ed_clean` AS

SELECT
  -- Encounter identifier
  PUF_ID,

  -- Time
  year,
  DISCHARGE_MONTH,
  DATE(year, DISCHARGE_MONTH, 1) AS discharge_date_month,
  FORMAT_DATE(
    '%B',
    DATE(year, DISCHARGE_MONTH, 1)
  ) AS discharge_month_name,

  -- Demographics
  sex,
  CASE
    WHEN sex = 1 THEN 'Male'
    WHEN sex = 2 THEN 'Female'
    ELSE 'Unknown'
  END AS sex_group,

  age,
  CASE
    WHEN age = 0 THEN 'Infant'
    WHEN age BETWEEN 1 AND 12 THEN '1-12'
    WHEN age BETWEEN 13 AND 17 THEN '13-17'
    WHEN age BETWEEN 18 AND 25 THEN '18-25'
    WHEN age BETWEEN 26 AND 35 THEN '26-35'
    WHEN age BETWEEN 36 AND 49 THEN '36-49'
    WHEN age BETWEEN 50 AND 64 THEN '50-64'
    WHEN age BETWEEN 65 AND 85 THEN '65-85'
    WHEN age >= 86 THEN '86 and older'
    ELSE 'Unknown'
  END AS age_group,

  newborn,
  CASE
    WHEN newborn = 1 THEN 'Newborn'
    WHEN newborn = 2 THEN 'Not a Newborn'
    ELSE 'Unknown'
  END AS newborn_group,

  -- Discharge information
  DISCHARGE_STATUS,
  CASE
    WHEN DISCHARGE_STATUS = -9 THEN 'Unknown'
    WHEN DISCHARGE_STATUS = 1 THEN 'Routine to Home'
    WHEN DISCHARGE_STATUS = 2 THEN 'Left AMA'
    WHEN DISCHARGE_STATUS = 3 THEN 'Transfer to Short-Term Facility'
    WHEN DISCHARGE_STATUS = 4 THEN 'Transfer to Long-Term Facility'
    WHEN DISCHARGE_STATUS = 5 THEN 'Home Health Care'
    WHEN DISCHARGE_STATUS = 6 THEN 'Hospice Care'
    WHEN DISCHARGE_STATUS = 7 THEN 'Other'
    WHEN DISCHARGE_STATUS = 8 THEN 'Dead'
    ELSE 'Unknown'
  END AS DISCHARGE_STATUS_GROUP,

  -- Diagnosis codes
  DX1,
  DX2,
  DX3,
  DX4,
  DX5,
  DX6,
  DX7,
  DX8,
  DX9,
  DX10,
  DX11,
  DX12,
  DX13,
  DX14,
  DX15,
  DX16,
  DX17,
  DX18,
  DX19,
  DX20,
  DX21,
  DX22,
  DX23,
  DX24,
  DX25,
  DX26,
  DX27,
  DX28,
  DX29,
  DX30,
  DX_GT30,

  -- CCSR condition indicators
  CCSR_CIR007,
  CCSR_CIR008,
  CCSR_CIR012,
  CCSR_CIR019,
  CCSR_END005,
  CCSR_END010,
  CCSR_END011,
  CCSR_FAC016,
  CCSR_FAC025,
  CCSR_FAC026,
  CCSR_FAC030,
  CCSR_GEN003,
  CCSR_INF012,
  CCSR_INJ017,
  CCSR_MBD024,
  CCSR_MUS010,
  CCSR_SYM004,
  CCSR_SYM006,
  CCSR_SYM010,
  CCSR_SYM013


FROM
  `organic-byway-505319-d1.NHCS_ed_data.NHCS_raw_ed_1`;