CREATE OR REPLACE VIEW
`organic-byway-505319-d1.NHCS_ed_data.vw_monthly_discharge_outcomes` AS

SELECT
  discharge_date_month,
  discharge_month_name,
  DISCHARGE_STATUS_GROUP,
  COUNT(*) AS num_encounters

FROM
  `organic-byway-505319-d1.NHCS_ed_data.NHCS_ed_clean`

GROUP BY
  discharge_date_month,
  discharge_month_name,
  DISCHARGE_STATUS_GROUP

ORDER BY
  discharge_date_month,
  DISCHARGE_STATUS_GROUP;