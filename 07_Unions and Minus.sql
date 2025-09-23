DROP TABLE Customers;
DROP TABLE Orders;
DROP TABLE Shippings;

CREATE TABLE Dept
(
    Dept_no int PRIMARY KEY,
    Dept_name varchar(30)
);

CREATE TABLE Emp
(
    E_no int PRIMARY KEY,
    E_name varchar(30),
    E_address varchar(30),
    E_ph_no int,
    Dept_no int,
    Designation varchar(30),
    Salary int,
    FOREIGN KEY (Dept_no) REFERENCES Dept(Dept_no)
);

INSERT INTO Dept
VALUES
(10, 'IT'),
(20, 'Administration'),
(30, 'Operations'),
(40, 'Finance'),
(50, 'PR and Sales');

INSERT INTO Emp
VALUES
(1, 'Sita', 'Baner', 1234, 10, 'IT Professional', 3500000),
(2, 'Tom', 'Kothrud', 1235, 20, 'President', 7000000),
(3, 'Steven', 'Shivajinagar', 1452, 10, 'Developer', 3200000),
(4, 'Hank', 'PCMC', 1334, 30, 'Janitor', 1000000),
(5, 'Harsh', 'Balewadi', 1245, 10, 'MGR', 1000000);

SELECT Dept_no FROM Emp
UNION
SELECT Dept_no FROM Dept;

SELECT Dept_no FROM Emp
UNION ALL
SELECT Dept_no FROM Dept;

SELECT Dept_no FROM Dept
EXCEPT -- or MINUS
SELECT Dept_no FROM Emp;
