-- validating row count

SELECT
  COUNT(*) AS total_rows,
  COUNT(DISTINCT PUF_ID) AS unique_PUF_IDs
FROM
  `organic-byway-505319-d1.NHCS_ed_data.NHCS_ed_clean`;

-- finding duplicates

SELECT
  PUF_ID,
  COUNT(*) AS row_count
FROM
  `organic-byway-505319-d1.NHCS_ed_data.NHCS_ed_clean`
GROUP BY
  PUF_ID
HAVING COUNT(*) > 1
ORDER BY
  row_count DESC;

-- validating dates

SELECT
  MIN(year) AS min_year,
  MAX(year) AS max_year,
  MIN(DISCHARGE_MONTH) AS min_month,
  MAX(DISCHARGE_MONTH) AS max_month,
  COUNT(DISTINCT discharge_month) AS distinct_months
FROM
  `organic-byway-505319-d1.NHCS_ed_data.NHCS_ed_clean`;

-- validating dates again

SELECT
  discharge_month,
  discharge_month_name,
  COUNT(*) AS encounters
FROM
  `organic-byway-505319-d1.NHCS_ed_data.NHCS_ed_clean`
GROUP BY
  discharge_month,
  discharge_month_name
ORDER BY
  discharge_month;

-- validating sex

SELECT
  sex,
  sex_group,
  COUNT(*) AS encounters
FROM
  `organic-byway-505319-d1.NHCS_ed_data.NHCS_ed_clean`
GROUP BY
  sex,
  sex_group
ORDER BY
  sex,
  sex_group;

-- validating age

SELECT
  sex,
  sex_group,
  COUNT(*) AS encounters
FROM
  `organic-byway-505319-d1.NHCS_ed_data.NHCS_ed_clean`
GROUP BY
  sex,
  sex_group
ORDER BY
  sex,
  sex_group;

-- validating newborn status

SELECT
  newborn,
  newborn_group,
  COUNT(*) AS encounters
FROM
  `organic-byway-505319-d1.NHCS_ed_data.NHCS_ed_clean`
GROUP BY
  newborn,
  newborn_group
ORDER BY
  newborn,
  newborn_group;

-- validating discharge group

SELECT
  DISCHARGE_STATUS,
  DISCHARGE_STATUS_GROUP,
  COUNT(*) AS encounters
FROM
  `organic-byway-505319-d1.NHCS_ed_data.NHCS_ed_clean`
GROUP BY
  DISCHARGE_STATUS,
  DISCHARGE_STATUS_GROUP
ORDER BY
  DISCHARGE_STATUS;

-- validating CCSR codes

SELECT
  COUNTIF(CCSR_CIR007 = 1) AS CIR007_present,
  COUNTIF(CCSR_CIR008 = 1) AS CIR008_present,
  COUNTIF(CCSR_CIR012 = 1) AS CIR012_present,
  COUNTIF(CCSR_CIR019 = 1) AS CIR019_present,
  COUNTIF(CCSR_END005 = 1) AS END005_present,
  COUNTIF(CCSR_END010 = 1) AS END010_present,
  COUNTIF(CCSR_END011 = 1) AS END011_present,
  COUNTIF(CCSR_FAC016 = 1) AS FAC016_present,
  COUNTIF(CCSR_FAC025 = 1) AS FAC025_present,
  COUNTIF(CCSR_FAC026 = 1) AS FAC026_present,
  COUNTIF(CCSR_FAC030 = 1) AS FAC030_present,
  COUNTIF(CCSR_GEN003 = 1) AS GEN003_present
FROM
  `organic-byway-505319-d1.NHCS_ed_data.NHCS_ed_clean`;

-- validating duplicates again

SELECT
  COUNT(*) AS clean_rows,
  COUNT(DISTINCT PUF_ID) AS clean_unique_encounters
FROM
  `organic-byway-505319-d1.NHCS_ed_data.NHCS_ed_clean`;

-- validating discharges

SELECT
  DISCHARGE_MONTH,
  COUNT(*) AS encounters
FROM
  `organic-byway-505319-d1.NHCS_ed_data.NHCS_raw_ed_1`
GROUP BY
  DISCHARGE_MONTH
ORDER BY
  DISCHARGE_MONTH;

-- validating rows

SELECT
  COUNT(*) AS raw_rows,
  COUNT(DISTINCT PUF_ID) AS raw_unique_encounters
FROM
  `organic-byway-505319-d1.NHCS_ed_data.NHCS_raw_ed_1`;