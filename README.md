# TheLook: Sales Performance Dashboard

[**View the Interactive Dashboard Here:**](https://public.tableau.com/app/profile/firza.pradipta.atalla/viz/thelook_dashboard/TheLook?publish=yes)

https://github.com/user-attachments/assets/00fdb21e-9023-4226-b8c0-e3c548b60ed5

## Project Overview
This project transforms raw e-commerce data from TheLook into an executive-level sales tracker. The pipeline built using dbt, processes transactional data to deliver high-level revenue trends, profitability metrics, and geographic performance clearly. 

## Key Findings

- **Overall performance**: The business generated **$8.09M** in total sales and **$4.20M** in gross profit over the period, reflecting a healthy **51.89% profit margin** across **135.8K units sold** to **66K customers**.

- **Seasonal spike in August**: Monthly revenue trended steadily upward from January through July, then spiked sharply in August (nearly 2x the prior month) before dropping back to baseline in September and holding steady through year-end. This suggests a strong seasonal event or promotional period worth investigating and potentially replicating.

- **Category concentration**: **Outerwear** and **Jeans** are the top two categories by sales, together outperforming Sweaters, Suits & Coats, and Swim combined. Gross profit scales proportionally with sales across all five categories, indicating consistent margins rather than one category subsidizing another.

- **Order fulfillment health**: Of all orders placed, **~25% (14.94% Cancelled + 10.01% Returned)** did not result in a completed sale. This is a meaningful share worth monitoring — reducing cancellations/returns by even a few points could have a direct, sizable impact on realized revenue.

- **Geographic concentration risk**: **China** and the **United States** together account for roughly **56%** of total sales ($2.77M and $1.82M respectively), with a steep drop-off to Brasil, South Korea, and the UK. This concentration means performance is closely tied to just two markets.

- **Brand profitability leaders**: **Calvin Klein** is the most profitable brand by a clear margin ($78K), followed by **Diesel**, **Carhartt**, **7 For All Mankind**, and **True Religion** — all denim/apparel-focused brands, aligning with Jeans and Outerwear being the top-performing categories.

## Tech Stack
* **Data Warehouse:** Google BigQuery (Source: `thelook_ecommerce` dataset)
* **Data Transformation:** dbt (data build tool)
* **Business Intelligence:** Tableau Public

## Data Architecture & dbt Modeling
The data foundation is modeled in dbt utilizing static `.hyper` extracts to comply with Tableau Public's sharing constraints and separate data sources to prevent cross-join duplication.
