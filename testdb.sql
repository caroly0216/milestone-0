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

-- Check if username or email already exists
SELECT COUNT() FROM user WHERE username = 'new_username' OR email = 'new_email';
-- If the count is 0, insert the new user
INSERT INTO user (username, email, password, Fname, Lname, createdAt, updatedAt)
VALUES ('new_username', 'new_email', 'hashed_password', 'First_Name', 'Last_Name', NOW(), NOW());

-- Check if the username and password match
SELECT COUNT() FROM user WHERE username = 'input_username' AND password = 'input_password';

-- Retrieve viewing history for a specific user
SELECT Title, watchedAt, rating FROM ViewingHistory
JOIN Title ON ViewingHistory.titleId = Title.titleId
WHERE ViewingHistory.userId = 'user_id';

-- Search for titles matching a query
SELECT titleId, primaryTitle FROM Title
WHERE primaryTitle LIKE '%search_query%';

