# Olist E-Commerce: End-to-End Analytics Engineering Pipeline

## Executive Summary
This project represents a full-stack analytics pipeline, transforming raw retail data from Olist (Brazil) into a production-ready environment. The workflow spans cloud data warehousing in Snowflake, transformation via dbt, and behavioral analysis using Machine Learning in Python.

## The Tech Stack
* **Cloud Warehouse:** Snowflake
* **Transformation:** dbt Core (Medallion Architecture)
* **Analysis & Visualization:** Python (Pandas, Matplotlib, Seaborn, Folium)
* **Machine Learning:** Scikit-Learn (K-Means Clustering), mlxtend (Apriori Algorithm)
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

---

## Phase 1: Machine Learning & RFM Segmentation
**K-Means Clustering model based on RFM (Recency, Frequency, Monetary) features.**

**The Segmentation Logic:** 
* **Recency:** Calculated as days since the customer's last purchase.
* **Frequency:** Total number of orders per unique customer.
* **Monetary:** Total spending per customer.

**Identified Customer Segments:**
* **High-Spenders (Whales):** High monetary contribution.
* **Loyal/Frequent Buyers:** Consistent purchasing behavior.
* **Recent/Average Shoppers:** New or occasional customers with low recency.
* **Churned/Lost Customers:** High recency scores indicating a need for re-engagement.

---

## Phase 2: Market Basket Analysis
**Association Rule Mining using the Apriori Algorithm.**

**The Logic:** Pivoted sparse e-commerce transaction data into a binary matrix to calculate Support, Confidence, and Lift metrics for product combinations across the marketplace.

**Key Insights:**
* **The "Cross-Sell" Opportunity (Lift: 1.118):** Customers purchasing `Home Comfort` items are 1.11x more likely to also buy `Bed Bath Table` products than random chance. This justifies implementing a targeted "Frequently Bought Together" UI widget on the checkout page.
* **The "Anti-Pattern" (Lift: 0.680):** `Construction Tools` and `Furniture Decor` actively repel each other in the shopping cart. Marketing spend should not be wasted on cross-promoting these specific categories together.

---

## Phase 3: Geospatial Revenue Mapping
**Interactive Spatial Visualization using Folium.**

**The Logic:** Joined aggregated financial metrics (from Snowflake via dbt) with standardized latitude/longitude coordinates to render a dark-mode heat map of the Brazilian e-commerce landscape.

**Key Insights:**
* **The Southeast Concentration:** Revenue and order volume are overwhelmingly concentrated in the southeastern states, specifically around São Paulo (SP) and Rio de Janeiro (RJ). 
* **Logistics Strategy:** For a platform like Olist, optimizing warehouse locations and shipping carrier partnerships in these high-density southeast corridors is critical for margin improvement, while northern/western states may require specialized "long-haul" logistics strategies.