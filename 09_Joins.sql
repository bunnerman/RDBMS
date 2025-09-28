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

-- 1) IDs of sailors who reserved a red or green boat
SELECT DISTINCT Sailors.s_id FROM Reserves
INNER JOIN Sailors ON Reserves.s_id = Sailors.s_id
INNER JOIN Boats ON Reserves.b_id = Boats.b_id
WHERE color = 'Red' OR color = 'Green';

-- 2) Find the name and age of the youngest sailor (without using subquery I assume)
SELECT S1.s_name, S1.age FROM Sailors S1
LEFT JOIN Sailors S2 ON S1.age > S2.age
WHERE S2.s_id IS NULL;

-- 3) Count number of different sailor names
SELECT COUNT(s_name) FROM Sailors;

-- 4) Average age of sailors for each rating level
SELECT rating, AVG(age) FROM Sailors
GROUP BY rating
ORDER BY rating;

-- 5) Average age of sailors for each rating level with at least 2 sailors
INSERT INTO Sailors VALUES
(6, 'Mike', 3, 40),
(7, 'Dave', 3, 28);

SELECT rating, AVG(age) FROM Sailors
GROUP BY rating
HAVING COUNT(*) >= 2
ORDER BY rating;
