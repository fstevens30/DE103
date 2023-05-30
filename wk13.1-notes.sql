/* Database Security */

/* Learning outcomes
 - The basic areas of security that need to be addressed
 - How to create logins, users and roles
 - How to restrict access to data and views
*/

-- Create a SQL Server login, this does not give access to any databases
CREATE LOGIN MyTestUser WITH PASSWORD "MyPassword123";

-- Use the database we want to add the user to
USE my_database;

-- Add a database user, using the login we created above so they are linked
CREATE USER MyTestUser;

-- It is good practice to create a role and add the user to that.
CREATE ROLE MyTestRole;
ALTER ROLE MyTestRole ADD MEMBER MyTestUser;

-- Create a basic view
CREATE OR ALTER VIEW test_view AS
    SELECT * FROM my_table;

-- Query the view to test
SELECT * FROM test_view;

-- Grant the user access to the view
GRANT SELECT ON test_view TO MyTestRole;