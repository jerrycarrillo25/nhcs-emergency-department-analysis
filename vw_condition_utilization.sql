CREATE OR REPLACE VIEW
`organic-byway-505319-d1.NHCS_ed_data.vw_condition_utilization` AS

WITH unpivoted AS (

  SELECT
    discharge_date_month,
    discharge_month_name,
    age_group,
    sex_group,
    condition_code,
    condition_present

  FROM
    `organic-byway-505319-d1.NHCS_ed_data.NHCS_ed_clean`

  UNPIVOT (
    condition_present FOR condition_code IN (
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
    )
  )

),

mapped AS (

  SELECT
    discharge_date_month,
    discharge_month_name,
    age_group,
    sex_group,
    condition_code,

    CASE condition_code
      WHEN 'CCSR_CIR007' THEN 'Essential hypertension'
      WHEN 'CCSR_CIR008' THEN 'Hypertension with complications and secondary hypertension'
      WHEN 'CCSR_CIR012' THEN 'Nonspecific chest pain'
      WHEN 'CCSR_CIR019' THEN 'Heart failure'
      WHEN 'CCSR_END005' THEN 'Diabetes mellitus, Type 2'
      WHEN 'CCSR_END010' THEN 'Disorders of lipid metabolism'
      WHEN 'CCSR_END011' THEN 'Fluid and electrolyte disorders'
      WHEN 'CCSR_FAC016' THEN 'Exposure, encounters, screening or contact with infectious disease'
      WHEN 'CCSR_FAC025' THEN 'Other specified status'
      WHEN 'CCSR_FAC026' THEN 'Personal history of nicotine dependence'
      WHEN 'CCSR_FAC030' THEN 'Other specified status'
      WHEN 'CCSR_GEN003' THEN 'Chronic kidney disease'
      WHEN 'CCSR_INF012' THEN 'Coronavirus disease, COVID-19'
      WHEN 'CCSR_INJ017' THEN 'Superficial injury; contusion, initial encounter'
      WHEN 'CCSR_MBD024' THEN 'Tobacco-related disorders'
      WHEN 'CCSR_MUS010' THEN 'Musculoskeletal pain, not low back pain'
      WHEN 'CCSR_SYM004' THEN 'Nausea and vomiting'
      WHEN 'CCSR_SYM006' THEN 'Abdominal pain and other digestive/ abdomen signs and symptoms'
      WHEN 'CCSR_SYM010' THEN 'Nervous system signs and symptoms'
      WHEN 'CCSR_SYM013' THEN 'Respiratory signs and symptoms'
    END AS condition,

    condition_present

  FROM unpivoted

)

SELECT
  discharge_date_month,
  discharge_month_name,
  age_group,
  sex_group,
  condition_code,
  condition,
  COUNTIF(condition_present = 1) AS encounters_with_condition

FROM mapped

GROUP BY
  discharge_date_month,
  discharge_month_name,
  age_group,
  sex_group,
  condition_code,
  condition

ORDER BY
  discharge_date_month,
  age_group,
  sex_group,
  condition;