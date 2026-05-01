# Olist E-Commerce: End-to-End Analytics Engineering Pipeline

## Executive Summary
This project represents a full-stack analytics pipeline, transforming raw retail data from Olist (Brazil) into a production-ready environment. The workflow spans cloud data warehousing in Snowflake, transformation via dbt, and behavioral analysis using Machine Learning in Python.

## The Tech Stack
* **Cloud Warehouse:** Snowflake
* **Transformation:** dbt Core (Medallion Architecture)
* **Analysis:** Python (Pandas, Matplotlib, Seaborn)
* **Machine Learning:** Scikit-Learn (K-Means Clustering)
* **Environment Management:** Dotenv for secure credential handling

## Data Pipeline Architecture
The project follows the **Medallion Architecture**:
1. **Staging:** Raw ingestion, type casting (timestamps), and Portuguese-to-English translation.
2. **Intermediate:** Aggregation of order items and payment methods to create enriched transaction records.
3. **Marts:** Final Dimension and Fact tables optimized for BI and ML.

## Business Intelligence & KPIs
* **Total Lifetime Revenue:** $15,843,553.24
* **Total Orders Processed:** 99,441
* **Average Order Value (AOV):** $159.33
**Visual:** The analysis includes a monthly revenue growth chart that identifies seasonality and trends in the Olist marketplace using Seaborn.

## Machine Learning: RFM Segmentation
### K-Means Clustering model based on RFM (Recency, Frequency, Monetary) features.
**The Segmentation Logic:** 
* **Recency:** Calculated as days since the customer's last purchase.
* **Frequency:** Total number of orders per unique customer.
* **Monetary:** Total spending per customer.

**Identified Customer Segments:**
* **High-Spenders (Whales):** High monetary contribution.
* **Loyal/Frequent Buyers:** Consistent purchasing behavior.
* **Recent/Average Shoppers:** New or occasional customers with low recency.
* **Churned/Lost Customers:** High recency scores indicating a need for re-engagement.
