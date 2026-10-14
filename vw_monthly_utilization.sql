CREATE OR REPLACE VIEW
`organic-byway-505319-d1.NHCS_ed_data.vw_monthly_utilization` AS

SELECT
  discharge_date_month,
  discharge_month_name,
  COUNT(*) AS num_encounters
FROM
  `organic-byway-505319-d1.NHCS_ed_data.NHCS_ed_clean`
GROUP BY
  discharge_date_month,
  discharge_month_name
ORDER BY
  discharge_date_month;