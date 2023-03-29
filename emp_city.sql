CREATE TABLE city (
                      city_id BIGSERIAL NOT NULL PRIMARY KEY,
                      city_name VARCHAR(50) NOT NULL
);

ALTER TABLE employee
    ADD city_id BIGINT NULL;

ALTER TABLE employee
    ADD FOREIGN KEY (city_id) REFERENCES city (city_id);

INSERT INTO city (city_name)
VALUES ('Seoul'),
       ('New-York'),
       ('Chicago'),
       ('Moscow'),
       ('London');

UPDATE employee
SET city_id = 1
WHERE id = 1;

UPDATE employee
SET city_id = 2
WHERE id = 2;

UPDATE employee
SET city_id = 3
WHERE id = 3;

UPDATE employee
SET city_id = 5
WHERE id = 4;

UPDATE employee
SET city_id = 2
WHERE id = 5;

SELECT first_name, last_name, city_name
FROM employee
         INNER JOIN city ON employee.city_id = city.city_id;

SELECT city_name, first_name, last_name
FROM city
         LEFT JOIN employee ON city.city_name = employee.city_id;

SELECT first_name, city_name
FROM employee
         FULL JOIN city ON employee.city_id = city.city_id;

SELECT first_name, city_name
FROM employee
         CROSS JOIN city;

SELECT city_name
FROM city
         LEFT JOIN employee ON city.city_id = employee.city_id
WHERE employee.first_name IS NULL
  AND employee.last_name IS NULL;