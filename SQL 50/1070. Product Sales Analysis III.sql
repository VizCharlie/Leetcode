/* SOLUTION 1 */
WITH MinYears AS (
    SELECT product_id, MIN(year) AS min_year
    FROM sales
    GROUP BY product_id
)
SELECT s.product_id, s.year as first_year, s.quantity, s.price
FROM sales s
INNER JOIN MinYears m ON s.product_id = m.product_id AND s.year = m.min_year;


/* SOLUTION 2 */
SELECT product_id, year as first_year, quantity, price
FROM (
    SELECT product_id, year, quantity, price,
           RANK() OVER (PARTITION BY product_id ORDER BY year) AS r
    FROM sales
) ranked_sales
WHERE r = 1;


/* SOLUTION 3 */
SELECT product_id, year as first_year, quantity, price
FROM sales
WHERE (product_id, year) IN (
    SELECT product_id, min(year)
    FROM sales
    GROUP BY product_id
);
