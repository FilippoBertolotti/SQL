-- 1. mostrare per ogni department (basta id), il totale degli employee che ci lavorano, ordinato in
-- modo decrescente
SELECT COUNT(*) AS Totle_Employee, IDdepartments
FROM employees e
GROUP BY IDdepartments
ORDER BY Totle_Employee DESC;
-- 2. mostrare per ogni department, il totale degli employee che ci lavorano, ordinato in modo
-- decrescente
SELECT COUNT(*) AS Totle_Employee, d.ID, d.department_name
FROM employees e
JOIN departments d ON e.IDdepartments = d.ID
GROUP BY d.ID
ORDER BY Totle_Employee DESC;
-- 3. mostrare per ogni department che ha più di 5 employee, il totale degli employee che ci
-- lavorano, ordinato in modo crescente
SELECT COUNT(*) AS Totle_Employee, d.ID
FROM employees e
JOIN departments d ON e.IDdepartments = d.ID
GROUP BY d.ID
HAVING Totle_Employee > 5
ORDER BY d.ID;
-- 4. mostrare per ogni department, il massimo e il minimo dei salari pagati
SELECT MAX(e.salary) AS Salario_Massimo, MIN(e.salary) AS Salario_Minimo, d.ID
FROM employees e
JOIN departments d ON e.IDdepartments = d.ID
GROUP BY d.ID;
-- 5. mostrare per ogni department, la somma e la media (arrotondata a 2 cifre) dei salari pagati
SELECT ROUND(AVG(e.salary),2) AS Salario_Medio, d.ID
FROM employees e
JOIN departments d ON e.IDdepartments = d.ID
GROUP BY d.ID;
-- 6. mostrare per ogni manager (basta id) che ne ha più di 4, il numero ordinato decrescente dei
-- suoi sottoposti
SELECT COUNT(*) AS Totle_Employee, e2.ID
FROM employees e
JOIN employees e2 ON e.IDmanager = e2.ID
GROUP BY e2.ID
HAVING Totle_Employee > 4
ORDER BY e2.ID;
-- 7. mostrare i dipartimenti (basta id) che hanno la somma dei salari compresa tra 20000 e 30000 euro, ordinati in modo crescente
SELECT d.ID, SUM(e.salary) as Somma_Salari
FROM departments d
JOIN employees e ON e.IDdepartments = d.ID
GROUP BY d.ID
HAVING SUM(e.salary) BETWEEN 20000 AND 30000
ORDER BY Somma_Salari ASC;
-- 8. mostrare i dipartimenti che hanno la media dei salari compresa tra 5000 e 7000 euro, ordinati in modo crescente
SELECT d.ID, AVG(e.salary) as Media_Salari
FROM departments d
JOIN employees e ON e.IDdepartments = d.ID
GROUP BY d.ID
HAVING AVG(e.salary) BETWEEN 5000 AND 7000
ORDER BY d.ID ASC;
-- 9. mostrare i country che hanno i codici US, UK e CN e le relative locations
SELECT c.country_name, c.country_id, GROUP_CONCAT(l.ID SEPARATOR "\n") AS Locations
FROM countries c
JOIN locations l ON l.IDcountries = c.ID
WHERE c.country_id IN ('US', 'UK', 'CN')
GROUP BY c.ID;
-- 10. mostrare, ordinati, i country che non hanno locations
SELECT c.country_name
FROM countries c
LEFT JOIN locations l ON l.IDcountries = c.ID
WHERE l.ID IS NULL;
-- 11. mostrare region, country e le relative locations di quei country che hanno i codici IT, DE, CA e FR
SELECT r.region_name, GROUP_CONCAT(CONCAT(c.country_id," ",c.country_name) SEPARATOR "\n") as Locations, GROUP_CONCAT(l.ID SEPARATOR "\n") as Locations
FROM regions r
JOIN countries c ON c.IDregions = r.ID
JOIN locations l ON l.IDcountries = c.ID
WHERE c.country_id IN ('IT', 'DE', 'CA', 'FR')
GROUP BY r.ID;
-- 12. mostrare per ogni department il totale degli employee che ci lavorano
SELECT d.ID, COUNT(DISTINCT e.ID) AS Numero_Dipendenti
FROM departments d
JOIN employees e ON e.IDdepartments = d.ID
GROUP BY d.ID;
