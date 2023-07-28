/* SOLUTION 1 */
SELECT round(count(first_order.customer_id) / (
  SELECT count(distinct customer_id)
  FROM Delivery) * 100, 2) AS immediate_percentage 
FROM (
  SELECT customer_id, min(order_date) AS f_ord_dt
  FROM Delivery 
  GROUP BY customer_id
) first_order, Delivery del
WHERE del.customer_pref_delivery_date = first_order.f_ord_dt
AND del.customer_id = first_order.customer_id
