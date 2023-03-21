-- Welcome to my first SQL script.

-- Create a database called car_sales
CREATE DATABASE car_sales; 

-- Make sure we are using the car_sales database
USE car_sales;

-- Create a table called cars
CREATE TABLE cars (
    registration_number VARCHAR(8) PRIMARY KEY,
    make VARCHAR(50),
    model VARCHAR(50),
);

-- Create a table called salesperson
CREATE TABLE salesperson (
    salesperson_id SMALLINT IDENTITY PRIMARY KEY, -- The identity keyword will automatically create a unique number for each row
    first_name VARCHAR(50),
    last_name VARCHAR(50),
);

-- Create a table called car_sales
CREATE TABLE car_sales (
    car_registration_number FOREIGN KEY REFERENCES cars(registration_number),
    salesperson_id FOREIGN KEY REFERENCES salesperson(salesperson_id),
    date_sold DATE,
    sale_price DECIMAL(8,2), -- 8 digits in total, 2 after the decimal point, max value 999999.99
    CONSTRAINT car_sales_pk PRIMARY KEY (salesperson_id, registration_number, sale_date) -- This is a composite primary key
);

