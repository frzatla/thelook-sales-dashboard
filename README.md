# TheLook: Sales Performance Dashboard

https://github.com/user-attachments/assets/c3356f13-9a19-4587-9a3e-da2f5499ccd9  
[**View the Interactive Dashboard Here:**](https://public.tableau.com/app/profile/firza.pradipta.atalla/viz/TheLookSalesPerformanceDashboard/TheLook?publish=yes)

## Project Overview
This project transforms raw e-commerce data from TheLook into an executive-level sales tracker. The pipeline built using dbt, processes transactional data to deliver high-level revenue trends, profitability metrics, and geographic performance clearly. 

## Key Observations

- The business generated **$8.09M** in total sales and **$4.20M** in gross profit over the period, reflecting a healthy **51.89% profit margin** across **135.8K units sold** to **66K customers**.

- Monthly revenue trended steadily upward from January through July, then spiked sharply in August (nearly 2x the prior month) before dropping back to baseline in September and holding steady through year-end. This suggests a strong seasonal event or promotional period worth investigating and potentially replicating.

- **Outerwear** and **Jeans** are the top two categories by sales, together outperforming Sweaters, Suits & Coats, and Swim combined. Gross profit scales proportionally with sales across all five categories, indicating consistent margins rather than one category dominating another.

- Of all orders placed, **~25% (14.94% Cancelled + 10.01% Returned)** did not result in a completed sale. This is a meaningful share worth monitoring, in the effort to reduce cancellations/returns which would further increase revenue.

- **China** and the **United States** together account for roughly **56%** of total sales ($2.77M and $1.82M respectively), with a steep drop-off to Brasil, South Korea, and the UK. This concentration means performance is closely tied to just two markets.

- **Calvin Klein** is the most profitable brand by a clear margin ($78K), followed by **Diesel**, **Carhartt**, and **7 For All Mankind** — all denim/apparel-focused brands, aligning with Jeans and Outerwear being the top-performing categories.

## Tech Stack
* **Data Warehouse:** Google BigQuery (Source: `thelook_ecommerce` dataset)
* **Data Transformation:** dbt (data build tool)
* **Business Intelligence:** Tableau Public

## Data Architecture & dbt Modeling
The data foundation is modeled in dbt utilizing static `.hyper` extracts to comply with Tableau Public's sharing constraints and separate data sources to prevent cross-join duplication.
