# TheLook: Sales Performance Dashboard

[**View the Interactive Dashboard Here:**](https://public.tableau.com/app/profile/firza.pradipta.atalla/viz/thelook_dashboard/TheLook?publish=yes)

![Dashboard Screenshot](Insert Path/Link to Screenshot Here)

## Project Overview
This project transforms raw e-commerce data from TheLook into an executive-level sales tracker. The pipeline built using dbt, processes transactional data to deliver high-level revenue trends, profitability metrics, and geographic performance clearly. 

## Tech Stack
* **Data Warehouse:** Google BigQuery (Source: `thelook_ecommerce` dataset)
* **Data Transformation:** dbt (data build tool)
* **Business Intelligence:** Tableau Public

## Data Architecture & dbt Modeling
The data foundation is modeled in dbt utilizing static `.hyper` extracts to comply with Tableau Public's sharing constraints and separate data sources to prevent cross-join duplication.
