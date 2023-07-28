/* SOLUTION 1 */
SELECT prod.product_name, sale.year, sale.price
FROM Sales sale
LEFT JOIN Product prod
ON sale.product_id = prod.product_id
