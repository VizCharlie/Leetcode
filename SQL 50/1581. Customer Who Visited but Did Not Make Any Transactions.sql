/* SOLUTION 1 */
SELECT vis.customer_id, count(vis.customer_id) as count_no_trans 
FROM Visits vis
LEFT JOIN Transactions txn
ON vis.visit_id = txn.visit_id
WHERE txn.transaction_id is null
GROUP BY vis.customer_id;
