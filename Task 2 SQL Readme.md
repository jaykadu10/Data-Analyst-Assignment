# Part 2: SQL – Query Writing

## Objective

The objective of this task is to write clean, readable, and efficient SQL queries
to answer key business performance questions using the given sales dataset.

## Business Questions Covered

The SQL file includes queries to answer the following:

1. Total net sales and total quantity sold by platform for the last 30 days
2. Month-over-month sales growth by platform
3. Top 5 products by net sales within each category
4. Average Selling Price (ASP) by platform and category
5. Return rate (%) by platform

## Approach

- Used aggregation functions such as `SUM`, `COUNT`, and `AVG`.
- Applied `GROUP BY` and `PARTITION BY` to analyze data by platform, category, and product.
- Used date filtering to calculate last 30 days sales and month-over-month growth.
- Window functions are used for ranking and growth calculations.
- Queries are written in a readable and optimized format.

## Output

- Each query returns a summarized result set answering a specific business question.
- Results can be directly used for reporting and dashboard creation.

## Submission Details

- All queries are included in a single `.sql` file.
- Queries are separated with comments for clarity.

## Notes

- SQL syntax follows standard ANSI SQL.
- Minor adjustments may be needed based on database engine (MySQL / PostgreSQL).

