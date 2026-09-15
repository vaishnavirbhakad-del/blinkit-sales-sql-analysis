# Blinkit Sales SQL Analysis

SQL data analysis project using Blinkit sales data to analyze revenue, product performance, outlet characteristics, and customer ratings.

# Project Overview

This project analyzes Blinkit sales data using SQL in SQLite.

The objective is to understand sales performance, product categories, outlet characteristics, customer ratings, and pricing patterns.

# Tools & Technologies

- SQL
- SQLite
- DB Browser for SQLite
- GitHub

# Dataset

The dataset contains Blinkit outlet and item-level sales information.

Key columns include:

- Item Identifier
- Item Weight
- Item Fat Content
- Item Visibility
- Item Type
- Item MRP
- Outlet Identifier
- Outlet Establishment Year
- Outlet Size
- Outlet Location Type
- Outlet Type
- Item Outlet Sales
- Item Rating

# Data Cleaning

The following data-cleaning steps were performed using SQL:

1. Standardized inconsistent Item Fat Content values.
2. Converted `LF` and `low fat` into `Low Fat`.
3. Converted `reg` into `Regular`.
4. Handled missing Item Weight values using the average weight of the corresponding Item Type.
5. Performed data-quality checks for missing and duplicate values.

# KPIs

The project calculates the following key performance indicators:

# 1. Total Sales Revenue

Calculates the total revenue generated across all outlets.

# 2. Average Sales per Item

Calculates the average sales value per item.

# 3. Average Customer Rating

Calculates the average customer rating across items.

# 4. Total Number of Items

Counts the total number of records/items in the dataset.

# Business Analysis

# Q1. Sales by Fat Content

Analyzes whether customers purchase more Low Fat or Regular products.

# Q2. Sales by Item Type

Identifies which item categories generate the highest revenue.

# Q3. Sales by Outlet Size

Compares sales performance across Small, Medium, and Large outlets.

# Q4. Sales by Location Tier

Compares performance across Tier 1, Tier 2, and Tier 3 locations.

# Q5. Sales by Outlet Type

Analyzes sales performance across different outlet types.

# Q6. Sales by MRP Price Range

Groups products into different price ranges and compares their sales performance.

# Q7. Outlet Type and Location Combination

Identifies the best-performing combinations of outlet type and location.

## Key Business Questions

This analysis aims to answer:

- What is the total revenue generated across all outlets?
- Do Low Fat or Regular items generate more sales?
- Which item categories generate the most revenue?
- Which outlet size performs best?
- Which location tier performs better?
- Which outlet type generates the highest sales?
- Which MRP price range performs best?
- Which outlet type and location combination performs best?

# Project Findings

The analysis helps identify:

- Overall revenue performance
- Customer preference between Low Fat and Regular products
- Top-performing product categories
- Best-performing outlet sizes
- Performance differences between Tier 1, Tier 2, and Tier 3 locations
- Best-performing outlet types
- Highest-performing MRP price ranges

# SQL File

All SQL queries used for data cleaning, data-quality checks, KPI calculations, and business analysis are available in:

`Blinkit_Analysis.sql`

## Project Structure
│
├── Blinkit_Analysis.sql
└── README.md
│
├── Blinkit_Analysis.sql
└── README.md
