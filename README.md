Retail Orders ETL

A complete end-to-end data engineering project that extracts retail order data from Kaggle, transforms it using Python (Pandas), and loads it into SQL Server for advanced business intelligence analysis.

📌 Project Overview
The goal of this project is to build a robust ETL pipeline to handle messy retail data. By automating the extraction and cleaning process, the project provides a structured SQL environment to query key performance indicators (KPIs) like profit margins, sales trends, and product performance.

🛠 Tech Stack
Language: Python 3.x

Libraries: Pandas, SQLAlchemy, PyODBC, Kaggle API

Database: Microsoft SQL Server (T-SQL)

Environment: Jupyter Notebook
```
📂 Project Structure
Plaintext
retail_orders_etl/
├── mypj.ipynb          # Jupyter Notebook containing ETL logic
├── SQLQuery2.sql       # SQL script for table creation and analysis
├── orders.csv          # Raw/Sample dataset
└── README.md           # Project documentation
```
🚀 Workflow
1. Data Extraction
Connected to Kaggle using the Kaggle API.

Downloaded the ankitbansal06/retail-orders dataset directly into the project environment.

Extracted the zip file contents to obtain the raw CSV.

2. Data Cleaning & Transformation (Pandas)
Handling Nulls: Identified and handled missing values.

Column Formatting: Converted column names to lower case and replaced spaces with underscores for SQL compatibility.

Feature Engineering: * Calculated Discount based on list price and selling price.

Calculated Sale Price and Profit.

Converted Order Date from object type to datetime format.

Optimization: Dropped unnecessary columns (List Price, Cost Price, etc.) to keep the final table lean.

3. Data Loading
Established a connection to SQL Server using sqlalchemy and pyodbc.

Loaded the cleaned dataframe into the database using the to_sql method with the replace option (initial load) and append logic.

4. SQL Analysis
The following business insights were derived using T-SQL (stored in SQLQuery2.sql):

Top 10 highest revenue-generating products.

Top 5 highest-selling products in each region.

Month-over-month growth comparison for 2022 vs 2023 sales.

Identification of the month with the highest sales for each category.

Sub-category with the highest growth by profit in 2023 compared to 2022.

🏗 Setup & Installation
Clone the repository:
```
Bash
git clone https://github.com/Aswin-dm/retail_orders_etl.git
cd retail_orders_etl
```
Install Dependencies:
```
Bash
pip install pandas sqlalchemy pyodbc kaggle
```
Kaggle API Setup:

Place your kaggle.json file in ~/.kaggle/ (or the appropriate directory for your OS).

Database Configuration:

Ensure SQL Server is running.

Update the connection string in mypj.ipynb with your server and database credentials.

📊 Sample Insights
Once the data is in SQL Server, you can run queries to find:

Profitability: Which category yields the highest margin?

Seasonality: Which months show the highest growth in retail orders?

Author
Aswin DM GitHub
  
