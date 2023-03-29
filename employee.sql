CREATE TABLE employee(
                         id BIGSERIAL NOT NULL PRIMARY KEY,
                         first_name VARCHAR(50) NOT NULL,
                         last_name VARCHAR(50) NOT NULL,
                         gender VARCHAR(6) NOT NULL,
                         age INT NOT NULL
);

INSERT INTO employee(first_name, last_name, gender, age)
VALUES
    ('Jennie', 'Kim', 'female', 27),
    ('Dom', 'Toretto', 'male', 30),
    ('Elon', 'Musk', 'female', 51),
    ('Johnny', 'Depp', 'male', 59),
    ('Paul', 'Walker', 'male', 32);


SELECT first_name AS Имя,
       last_name AS Фамилия
FROM employee;

SELECT * FROM employee
WHERE age < 30 or age > 50;

SELECT * FROM employee
WHERE age BETWEEN 30 and 50;

SELECT * FROM employee
ORDER BY last_name DESC;

SELECT * FROM employee
WHERE first_name LIKE '____';

UPDATE employee
SET first_name = 'Elon'
WHERE id = 2;

UPDATE employee
SET first_name = 'Johnny'
WHERE id = 5;

SELECT first_name AS Имя,
       SUM(age) AS Суммарный_возраст
FROM employee
GROUP BY first_name;

SELECT first_name AS Имя,
       age AS Самый_молодой
FROM employee
WHERE age = (
    SELECT MIN(age)
    FROM employee
);

SELECT first_name AS Имя,
       COUNT(first_name) AS Тезки,
       MAX(age) AS Максимальный_возраст
FROM employee
GROUP BY first_name
HAVING COUNT(first_name) > 1
ORDER BY MAX(age);