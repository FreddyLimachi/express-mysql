CREATE DATABASE IF NOT EXISTS company;

USE company;

CREATE TABLE employees (
    id INT (11) NOT NULL AUTO_INCREMENT,
    name VARCHAR(45) DEFAULT NULL,
    salary INT(11) DEFAULT NULL,
    PRIMARY KEY(id)
);

INSERT INTO employees values
    (null, 'Ryan Ray', 20000),
    (null, 'Joe McMilan', 40000),
    (null, 'John Carter', 50000);


DELIMITER $

CREATE PROCEDURE add_edit_employee (IN _id INT, IN _name VARCHAR(45), IN _salary INT)
BEGIN
    IF _id = 0 THEN
        INSERT INTO employees VALUES (null, _name, _salary);
        SET _id = LAST_INSERT_ID();
    ELSE
        UPDATE employees SET name = _name, salary = _salary WHERE id = _id;
    END IF;

    SELECT _id AS id;
END $$

DELIMITER ;