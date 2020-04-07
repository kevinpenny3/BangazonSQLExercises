-- 1) order by department name
SELECT e.FirstName, e.LastName, e.IsSupervisor, e.DepartmentId, d.Name
FROM Employee e 
LEFT JOIN Department d 
ON e.DepartmentId = d.id
GROUP BY e.FirstName, e.LastName, e.IsSupervisor, e.DepartmentId, d.Name
ORDER BY d.Name;

-- 1a) order by employee last name
SELECT e.FirstName, e.LastName, e.IsSupervisor, e.DepartmentId, d.Name
FROM Employee e 
LEFT JOIN Department d 
ON e.DepartmentId = d.id
GROUP BY e.FirstName, e.LastName, e.IsSupervisor, e.DepartmentId, d.Name
ORDER BY e.LastName;

-- 1b) orderby employee first name
SELECT e.FirstName, e.LastName, e.IsSupervisor, e.DepartmentId, d.Name
FROM Employee e 
LEFT JOIN Department d 
ON e.DepartmentId = d.id
GROUP BY e.FirstName, e.LastName, e.IsSupervisor, e.DepartmentId, d.Name
ORDER BY e.FirstName;

-- 2) List each department ordered by budget amount with the highest first
SELECT d.Budget, d.Id, d.Name
FROM Department d
GROUP BY d.Budget, d.Id, d.Name
ORDER BY d.Budget desc;

-- 3) List each department name along with any employees (full name) in that department who are supervisors.
SELECT d.Name, (e.FirstName + ' ' + e.LastName) AS FullName
FROM Department d
LEFT JOIN Employee e
ON e.DepartmentId = d.id
WHERE IsSupervisor = 1
GROUP BY d.Id, d.Name, e.IsSupervisor, (e.FirstName + ' ' + e.LastName);

-- 4) List each department name along with a count of employees in each department.
SELECT d.Name, COUNT(e.DepartmentId) AS 'Employees'
FROM Department d
LEFT JOIN Employee e 
ON d.Id = e.DepartmentId
GROUP BY d.Name;

-- 5) Write a single update statement to increase each department's budget by 20%.
UPDATE Department
SET Budget = Budget * 1.2;

-- 6) List the employee full names for employees who are not signed up for any training programs.
SELECT (e.FirstName + ' ' + e.LastName) AS FullName, et.EmployeeId
FROM Employee e 
LEFT JOIN EmployeeTraining et
ON e.Id = et.EmployeeId
WHERE et.EmployeeId IS Null;
