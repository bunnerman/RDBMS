CREATE TABLE Sailors
(
    s_id INT PRIMARY KEY,
    s_name VARCHAR(30),
    rating INT,
    age INT
);
CREATE TABLE Boats
(
    b_id INT PRIMARY KEY,
    b_name VARCHAR(30),
    color VARCHAR(20)
);
CREATE TABLE Reserves
(
    s_id INT,
    b_id INT,
    reserve_day DATE,
    FOREIGN KEY (s_id) REFERENCES Sailors(s_id),
    FOREIGN KEY (b_id) REFERENCES Boats(b_id)
);

INSERT INTO Sailors VALUES
(1, 'John', 4, 30),
(2, 'Arthur', 5, 33),
(3, 'Jack', 3, 54),
(4, 'Thomas', 1, 23),
(5, 'Bob', 2, 57);

INSERT INTO Boats VALUES
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

-- 1) Sailor Info who reserved Boat 101
SELECT Sailors.* FROM Sailors
INNER JOIN Reserves ON Reserves.S_id = Sailors.S_id
WHERE b_id = 101;

-- 2) Info of reservation of whoever has the name 'Bob'
SELECT s_name, b_name, reserve_day FROM Reserves
INNER JOIN Boats ON Reserves.b_id = Boats.b_id
INNER JOIN Sailors ON Reserves.s_id = Sailors.s_id
WHERE s_name = 'Bob';

-- 3) Names of sailors with red boat reservations and ORDER BY age
SELECT age, S_name, color, reserve_day FROM Reserves
INNER JOIN Boats ON Reserves.b_id = Boats.b_id
INNER JOIN Sailors ON Reserves.s_id = Sailors.s_id
WHERE color = 'Red'
ORDER BY Age;

-- 4) Names of Sailors who have reserved at least one boat
SELECT DISTINCT s_name FROM Reserves
INNER JOIN Sailors ON Reserves.s_id = Sailors.s_id;

-- 5) IDs and Names of sailors who reserved 2 different boats on the same day
SELECT Sailors.s_id, Sailors.s_name, Reserves1.reserve_day, Reserves1.b_id AS Boat1, Reserves2.b_id AS Boat2
FROM Sailors
INNER JOIN Reserves AS Reserves1 ON Sailors.s_id = Reserves1.s_id
INNER JOIN Reserves AS Reserves2 ON Sailors.s_id = Reserves2.s_id
AND Reserves1.reserve_day = Reserves2.reserve_day
AND Reserves1.b_id < Reserves2.b_id;
