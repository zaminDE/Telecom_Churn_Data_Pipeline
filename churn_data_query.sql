DROP WAREHOUSE IF EXISTS telecom_wh;
DROP DATABASE IF EXISTS telecom_db;

CREATE WAREHOUSE telecom_wh;
CREATE DATABASE telecom_db;
CREATE SCHEMA telecom_db.churn_schema;

select * from telecom_db.churn_schema.churn_data;
SELECT * FROM churn_data WHERE TRIM("Churn") = 'Yes';


-- 1. Churn Percentage
SELECT 
  COUNT(*) AS total_customers,
  SUM(CASE WHEN "Churn" = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
  ROUND(SUM(CASE WHEN "Churn" = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS churn_percentage
FROM churn_data;

-- 2. High Risk Customers
SELECT "customerID", "churn_risk_score"
FROM churn_data
WHERE CAST("churn_risk_score" AS INT) >= 10
ORDER BY "churn_risk_score" DESC;

-- 3. Revenue Loss
SELECT 
  ROUND(SUM(CAST("MonthlyCharges" AS FLOAT)), 2) AS monthly_revenue_loss
FROM churn_data
WHERE TRIM("Churn") = 'Yes';

SELECT 
  CASE WHEN "gender_Male" = 'True' THEN 'Male' ELSE 'Female' END AS gender,
  ROUND(AVG(CAST("MonthlyCharges" AS FLOAT)), 2) AS avg_monthly_charge
FROM churn_data
GROUP BY "gender_Male";


-- 5. View: Top 10 Risk Customers
CREATE OR REPLACE VIEW top_risk_customers AS
SELECT "customerID", "churn_risk_score", "MonthlyCharges"
FROM churn_data
WHERE CAST("churn_risk_score" AS INT) >= 85
ORDER BY "churn_risk_score" DESC
LIMIT 10;

-- 6. Customers with Above-Average Monthly Charges
SELECT "customerID", "MonthlyCharges"
FROM churn_data
WHERE CAST("MonthlyCharges" AS FLOAT) > (
  SELECT AVG(CAST("MonthlyCharges" AS FLOAT)) FROM churn_data
);
