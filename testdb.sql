CREATE DATABASE testDB;
USE testDB;

CREATE TABLE student(
    uid DECIMAL(3, 0) NOT NULL PRIMARY KEY,
    name VARCHAR(30),
    score DECIMAL(3,2)
);

INSERT INTO student VALUES(1, 'alice', 0.1);
INSERT INTO student VALUES(2, 'bob', 0.4);

SELECT * FROM student;

DROP USER IF EXISTS 'sujaya'@'localhost';

-- Create the user
CREATE USER 'sujaya'@'localhost' IDENTIFIED BY 'Password0!';

-- Grant all privileges on the testDB database to the new user
GRANT ALL ON testDB.* TO 'sujaya'@'localhost';

-- Change the authentication method of the user to use mysql_native_password
ALTER USER 'sujaya'@'localhost' IDENTIFIED WITH mysql_native_password BY 'Password0!';