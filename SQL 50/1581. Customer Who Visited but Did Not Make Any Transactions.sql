/* SOLUTION 1*/
SELECT vis.customer_id, count(vis.customer_id) as count_no_trans 
FROM Visits vis
LEFT JOIN Transactions txn
ON vis.visit_id = txn.visit_id
WHERE txn.transaction_id is null
GROUP BY vis.customer_id;


/* SOLUTION 2*/
WITH data AS (
  SELECT vis.visit_id, vis.customer_id, txn.transaction_id
  FROM Visits vis
  LEFT JOIN Transactions txn
  ON vis.visit_id = txn.visit_id
)
SELECT customer_id, count(customer_id) as count_no_trans 
FROM data
WHERE transaction_id is null
GROUP BY customer_id;
