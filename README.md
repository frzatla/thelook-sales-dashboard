# TheLook: Sales Performance Dashboard

**View the Interactive Dashboard Here:** [Insert Tableau Public Link Here]

![Dashboard Screenshot](Insert Path/Link to Screenshot Here)

## Project Overview
This project transforms raw e-commerce data into an executive-level financial health and cross-selling tracker. Moving beyond initial market basket analysis, the pipeline processes granular transactional data to deliver high-level revenue trends, profitability metrics, and geographic performance without bloated business jargon[cite: 1]. 

## Tech Stack
* **Data Warehouse:** Google BigQuery (Source: `thelook_ecommerce` dataset)[cite: 1]
* **Data Transformation:** dbt (data build tool)[cite: 1]
* **Business Intelligence:** Tableau Public[cite: 1]

## Data Architecture & dbt Modeling
The data foundation is modeled in dbt utilizing static `.hyper` extracts to comply with Tableau Public's sharing constraints and separate data sources to prevent cross-join duplication[cite: 1]. 

**Phase 1: Market Basket Analysis (Completed)**
* **Staging Layer:** Configured `stg_order_items` and `stg_products`[cite: 1]. 
* **Intermediate Layer:** Built `int_total_orders`, `int_item_frequencies`, and `int_basket_summary` to prepare denominators for Apriori probability calculations[cite: 1].
* **Mart Layer:** Deployed `fct_association_rules` to calculate Support and Confidence percentages for directional category pairings, and `fct_baskets` to track `total_items` and `basket_value` at the order grain[cite: 1].

**Phase 2: Executive Revenue Dashboard**
* **Staging & Fact:** Brought in `stg_users` and `stg_events`[cite: 1]. Built `fct_sales` unifying order items, products, and users to calculate item-level profitability and append regional geographic mapping[cite: 1].
* **Aggregations:** Built `agg_monthly_financials` to pre-aggregate top-level KPIs for monthly trend lines and category breakdowns to optimize dashboard performance[cite: 1].

## Dashboard Design & Layout Structure
The dashboard relies on a grid-based "card" design utilizing a light grey background container that anchors individual white visualization sheets featuring subtle borders and consistent padding[cite: 1]. Visual scaffolding (axis rulers, grid dividers, zero lines) has been stripped away for a clean, floating aesthetic[cite: 1].

**Key Visualizations:**
* **KPI Banner:** Independent sheets (Gross Profit, Total Sales, Quantity Sold, Profit Margin) placed in a distributed horizontal container for uniform alignment[cite: 1].
* **Monthly Revenue Trend:** Dual-axis line/area chart[cite: 1].
* **Total Sales vs Gross Profit by Category:** A bar-in-bar chart nesting Gross Profit directly inside Total Sales to reflect the mathematical relationship without inflating totals[cite: 1].
* **Top Products by Sale:** Horizontal bar chart structured to prevent text truncation, with custom number formatting for Millions (M) and Thousands (K)[cite: 1]. 
* **Top Events:** Sleek lollipop chart mapping the customer engagement funnel[cite: 1].
* **Sales by Traffic Source:** Dual-axis donut chart utilizing direct mark labels to maximize space[cite: 1].
* **Top Countries By Sales:** Minimal "data bar" table acting as a ranked text list supported by subtle in-cell background bars[cite: 1].