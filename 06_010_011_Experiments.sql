----Assignment 6----

CREATE TABLE Emp
(
    E_no int PRIMARY KEY,
    E_name varchar(30),
    E_address varchar(30),
    E_ph_no int,
    Dept_no int,
    Dept_name varchar(30),
    Job_id int,
    Designation varchar(30),
    Salary int,
    Doj date
);

INSERT INTO Emp
VALUES
(1, 'Sita', 'Baner', 1234, 10, 'IT', 1, 'IT Professional', 3500000, '1981-05-01'),
(2, 'Tom', 'Kothrud', 1235, 20, 'HR', 2, 'President', 7000000, '1981-12-03'),
(3, 'Steven', 'Shivajinagar', 50, 101, 'IT', 3, 'Developer', 3000000, '1981-12-17'),
(4, 'Hank', 'PCMC', 1334, 30, 'Finance', 4, 'Analyst', 1000000, '1980-01-19'),
(5, 'Harsh', 'Balewadi', 1245, 10, 'Admin', 5, 'MGR', 1000000, '1982-09-12');

SELECT E_no, E_name, Doj FROM Emp
WHERE Doj IN ('1981-05-01', '1981-12-03', '1981-12-17', '1980-01-19');

SELECT E_no, E_name, Dept_no FROM Emp   
WHERE Dept_no IN (10, 20);

SELECT E_no, E_name FROM Emp
WHERE E_name LIKE 'S%';

SELECT E_no, E_name FROM Emp
WHERE E_name LIKE 'H____';

SELECT E_no, E_name FROM Emp
WHERE Designation NOT IN ('President', 'MGR')
ORDER BY Salary;

----Assignment 10----

CREATE TABLE Emp
(
    E_no int PRIMARY KEY,
    E_name varchar(30),
    E_address varchar(30),
    E_ph_no int,
    Dept_no int,
    Dept_name varchar(30),
    Job_id int,
    Designation varchar(30),
    Salary int,
    Doj date,
    Working_under varchar(30)
);

INSERT INTO Emp
VALUES
(1, 'Sita', 'Baner', 1234, 10, 'IT', 1, 'IT Professional', 3500000, '1981-05-01', 'Adam'),
(2, 'Tom', 'Kothrud', 1235, 20, 'HR', 2, 'HR Manager', 1500000, '1981-12-03', 'Harsh'),
(3, 'Steven', 'Shivajinagar', 5130, 10, 'IT', 3, 'Developer', 3000000, '1981-12-17', 'Adam'),
(4, 'Hank', 'PCMC', 1334, 30, 'Finance', 4, 'Analyst', 1000000, '1980-01-19', 'Harsh'),
(5, 'Harsh', 'Balewadi', 1245, 40, 'Admin', 5, 'MGR', 1000000, '1982-09-12', 'CEO'),
(6, 'Jack', 'Hinjawadi', 1889, 30, 'Finance', 6, 'Analyst', 2800000, '1972-08-16', 'Adam'),
(7, 'Adam', 'Vimannagar', 1773, 40, 'Admin', 7, 'MGR', 1200000, '1962-08-12', 'CEO'),
(8, 'Steve', 'Koregaon Park', 1321, 10, 'IT', 8, 'Developer', 1800000, '1976-02-19', 'Harsh');

SELECT Dept_name, SUM(Salary) AS Labour_burden_costs FROM Emp
GROUP BY Dept_name; 

SELECT MIN(Salary) AS Minimum_paid, E_name FROM Emp
GROUP BY Working_under;

SELECT Dept_name, COUNT(E_no) AS Employees_working FROM Emp
GROUP BY Dept_name;

SELECT * FROM Emp
ORDER BY Salary;

SELECT E_name, Salary, Dept_name FROM Emp
WHERE Salary > 1600000 -- Original is 16000, modified to match table
ORDER BY Dept_name;

----Assignment 11----

CREATE TABLE Sailors
(
    S_id INT PRIMARY KEY,
    S_name VARCHAR(30),
    Rating INT,
    Age INT
);

CREATE TABLE Boats
(
    B_id INT PRIMARY KEY,
    B_name VARCHAR(30),
    Color VARCHAR(30)
);

CREATE TABLE Reserves
(
    S_id INT,
    B_id INT,
    B_date DATE,
    FOREIGN KEY (S_id) REFERENCES Sailors(S_id),
    FOREIGN KEY (B_id) REFERENCES Boats(B_id)
);

INSERT INTO Sailors (s_id, s_name, rating, age) VALUES
(1, 'John', 4, 30),
(2, 'Arthur', 5, 33),
(3, 'Jack', 3, 54),
(4, 'Thomas', 1, 23),
(5, 'Bob', 2, 57);

INSERT INTO Boats (b_id, b_name, color) VALUES
(101, 'Boat One', 'Red'),
(102, '2nd Boat', 'Blue'),
(103, 'Third Boat', 'Green'),
(104, 'Boat 4th', 'White'),
(105, 'The 5th Boat', 'Red');

INSERT INTO Reserves VALUES
(1, 101, '2025-07-12'),
(2, 103, '2025-02-05'),
(3, 102, '2025-02-12'),
(2, 105, '2025-03-15'),
(5, 104, '2025-04-01'),
(1, 102, '2025-04-18'),
(2, 101, '2025-05-06'),
(3, 105, '2025-05-21'),
(3, 103, '2025-06-10'),
(1, 104, '2025-07-12');

SELECT * FROM Sailors
WHERE S_id IN 
(
    SELECT S_id
    FROM Reserves
    WHERE B_id = 101
);

SELECT S_name FROM Sailors
WHERE S_id IN 
(
    SELECT S_id
    FROM Reserves
    WHERE B_id IN 
    (
        SELECT B_id
        FROM Boats
        WHERE Color = 'Red'
    )
)
ORDER BY Age;

SELECT DISTINCT S_id
FROM Reserves
WHERE B_id IN 
(
    SELECT B_id
    FROM Boats
    WHERE Color IN ('Red', 'Green')
);

INSERT INTO Sailors VALUES
(6, 'Mike', 3, 40),
(7, 'Dave', 3, 28);
SELECT Rating, AVG(Age) AS Avg_Age FROM Sailors
GROUP BY Rating
HAVING COUNT(S_id) >= 2;
