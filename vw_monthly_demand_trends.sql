CREATE OR REPLACE VIEW
`organic-byway-505319-d1.NHCS_ed_data.vw_monthly_demand_trends` AS

WITH monthly_volume AS (

  SELECT
    discharge_month,
    discharge_month_name,
    COUNT(*) AS num_encounters

  FROM
    `organic-byway-505319-d1.NHCS_ed_data.NHCS_ed_clean`

  GROUP BY
    discharge_month,
    discharge_month_name

),

with_previous_month AS (

  SELECT
    discharge_month,
    discharge_month_name,
    num_encounters,

    LAG(num_encounters) OVER (
      ORDER BY discharge_month
    ) AS previous_month_encounters

  FROM monthly_volume

)

SELECT
  discharge_month,
  discharge_month_name,
  num_encounters,
  previous_month_encounters,

  num_encounters - previous_month_encounters
    AS change_from_previous_month,

  ROUND(
    SAFE_DIVIDE(
      num_encounters - previous_month_encounters,
      previous_month_encounters
    ) * 100,
    2
  ) AS percent_change_from_previous_month,

  RANK() OVER (
    ORDER BY num_encounters DESC
  ) AS volume_rank

FROM with_previous_month

ORDER BY
  discharge_month;