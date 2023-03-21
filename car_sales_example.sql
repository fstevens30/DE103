-- Welcome to my first SQL script.

-- Create a database called car_sales
CREATE DATABASE car_sales; 

-- Make sure we are using the car_sales database
USE car_sales;

-- Create a table called cars
CREATE TABLE car (
    registration_number VARCHAR(8) PRIMARY KEY,
    make VARCHAR(50),
    model VARCHAR(50),
);

-- Create a table called salesperson
CREATE TABLE salesperson (
    salesperson_id SMALLINT IDENTITY PRIMARY KEY, -- The identity keyword will automatically create a unique number for each row
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    commission_percentage TINYINT, -- This is a small number, so we can use the TINYINT data type
);

-- Create a table called car_sales
CREATE TABLE car_sale (
    car_registration_number FOREIGN KEY REFERENCES car(registration_number),
    salesperson_id FOREIGN KEY REFERENCES salesperson(salesperson_id),
    date_sold DATE,
    sale_price DECIMAL(8,2), -- 8 digits in total, 2 after the decimal point, max value 999999.99
    CONSTRAINT car_sale_pk PRIMARY KEY (salesperson_id, registration_number, sale_date) -- This is a composite primary key
);

-- Insert some data into the cars table
USE car_sales 
INSERT INTO car (registration_number, make, model) VALUES ('ABC123', 'Toyota', 'Corolla');

-- Inserting multiple rows
USE car_sales
INSERT INTO car VALUES ('DEF234', 'Subaru', 'Impreza'), ('GHI345', 'Volvo', 'XC-90');

-- Inserting data into the salesperson table
USE car_sales
INSERT INTO salesperson (first_name, last_name, commission_percentage) VALUES ('Hemi', 'Brown', 5), ('Janet', 'Jones', 6);

-- Inserting data into the car_sale table
USE car_sales
INSERT INTO car_sale (car_registration_number, salesperson_id, date_sold, sale_price) 
    VALUES  ('ABC123', 1, '2018-01-01', 10000.00),
            ('DEF234', 2, '2018-01-02', 20000.00),
            ('GHI345', 1, '2018-01-03', 30000.00),
            ('ABC123', 2, '2018-01-04', 40000.00),
            ('DEF234', 1, '2018-01-05', 50000.00),
            ('GHI345', 2, '2018-01-06', 60000.00);