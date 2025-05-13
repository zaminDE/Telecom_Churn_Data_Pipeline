# 📡 Telecom Customer Churn Analysis – End-to-End Data Engineering Project

## 🧠 Project Overview

This project simulates a real-world data engineering pipeline for a telecom company to analyze customer churn and identify at-risk customers based on behavior and service usage.  
It demonstrates complete ETL processing using **Python, Snowflake, SQL, and Power BI**.

---

## 🔧 Tools & Technologies

- **Python** – Data acquisition, cleaning, transformation
- **Snowflake** – Cloud data warehousing
- **SQL** – Data transformation, analysis, KPIs
- **Power BI** – Visualization and dashboard

---

## 🔗 Data Source

Synthetic telecom churn dataset with customer demographics, service usage, billing info, and churn label. Loaded via API and processed using Python.

---

## 📊 Key Features

- Cleaned raw data using Pandas and applied churn risk scoring
- Loaded transformed data into **Snowflake** directly from Python
- Performed SQL-based analytics:
  - Churn percentage
  - High-risk customer identification
  - Revenue loss estimation
- Created **Power BI dashboard** with KPIs, churn trends, and risk segments

---

## 🏁 Output Highlights

- 📉 **Churn Rate:** ~26%
- 🧍 **Top Risk Customers:** Identified via churn_risk_score ≥ 84
- 💸 **Monthly Revenue at Risk:** $X (from churned customers)
- 📊 Interactive filters for gender, billing type, and contract duration

---

## 🙏 Acknowledgements

This project was developed under the guidance of **Sir Qasim Hassan**, whose instruction and mentorship during the Data Engineering course were invaluable.
