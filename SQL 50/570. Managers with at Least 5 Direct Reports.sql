/* ATTEMPT 1: ACCEPTED */
SELECT name 
FROM Employee 
WHERE id IN (
  SELECT managerID 
  FROM Employee 
  GROUP BY managerId 
  HAVING count(*) >= 5
  );


/* ATTEMPT 2: ACCEPTED */
WITH emp as (
  SELECT managerid, COUNT(managerid) as mid_count 
  FROM employee
  GROUP BY managerid
  HAVING mid_count >= 5)
SELECT name 
FROM employee e, emp
WHERE e.id = emp.managerid


/* ATTEMPT 3: ACCEPTED */
WITH emp as (
  SELECT managerid, COUNT(managerid) as mid_count 
  FROM employee
  GROUP BY managerid
  HAVING mid_count >= 5)
SELECT name 
FROM employee e
INNER JOIN emp
ON e.id = emp.managerid
