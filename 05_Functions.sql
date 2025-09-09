CREATE TABLE Emp
(
    E_no INT PRIMARY KEY,
    E_name VARCHAR(30),
    E_address VARCHAR(50),
    E_ph_no INT,
    Dept_no INT,
    Dept_name VARCHAR(30),
    Job_id INT,
    Designation VARCHAR(30),
    Salary INT,
    Working_for VARCHAR(30),
    Doj DATE
);

INSERT INTO Emp 
VALUES
(1, 'Bob', 'Baner', 1234, 101, 'IT', 1, 'IT Professional', 3500000, 'Manager', '1985-06-15'),
(2, 'Tom', 'Kothrud', 1235, 102, 'HR', 2, 'Manager', 7000000, 'CEO', '1978-03-20'),
(3, 'Jack', 'Shivajinagar', 5312, 101, 'IT', 3, 'Developer', 3000000, 'Manager', '1993-01-10'),
(4, 'Ethan', 'PCMC', 1334, 103, 'Finance', 4, 'Analyst', 1000000, 'Head Director', '1972-11-25'),
(5, 'Adam', 'Balewadi', 1245, 104, 'Admin', 5, 'Clerk', 1000000, 'Assistant Supervisor', '1995-08-12');

SELECT E_no, E_name, Salary 
FROM Emp 
WHERE Working_for = 'Manager';

SELECT * FROM Emp
WHERE Salary > 
(
    SELECT MAX(Salary) FROM Emp
    WHERE Designation = 'IT Professional'
);

SELECT E_no, E_name, Designation FROM Emp
WHERE Doj >= '1981-01-01'
ORDER BY Designation;

SELECT E_name, TIMESTAMPDIFF(YEAR, Doj, CURDATE()) AS Experience, Salary / 365 AS Daily_salary 
FROM Emp;

SELECT E_no, E_name, Designation FROM Emp 
WHERE Designation IN ('Clerk', 'Analyst');