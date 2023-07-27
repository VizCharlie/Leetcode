/* SOLUTION 1 */
SELECT name 
FROM Employee 
WHERE id IN (
  SELECT managerID 
  FROM Employee 
  GROUP BY managerId 
  HAVING count(*) >= 5
  );


/* SOLUTION 2 */
WITH emp as (
  SELECT managerid, COUNT(managerid) as mid_count 
  FROM employee
  GROUP BY managerid
  HAVING mid_count >= 5)
SELECT name 
FROM employee e, emp
WHERE e.id = emp.managerid


/* SOLUTION 3 */
WITH emp as (
  SELECT managerid, COUNT(managerid) as mid_count 
  FROM employee
  GROUP BY managerid
  HAVING mid_count >= 5)
SELECT name 
FROM employee e
INNER JOIN emp
ON e.id = emp.managerid
