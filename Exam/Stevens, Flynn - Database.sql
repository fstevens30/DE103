/* Database Final Exam - Flynn Stevens */

USE master;

GO

DROP DATABASE IF EXISTS stamp_collection;

GO 

CREATE DATABASE stamp_collection;

GO

USE stamp_collection;

GO

CREATE TABLE country (
	name VARCHAR(50) PRIMARY KEY,
	currency VARCHAR(50) NOT NULL
	);

CREATE TABLE designer (
	id SMALLINT PRIMARY KEY IDENTITY,
	first_name VARCHAR(20) NOT NULL,
	last_name VARCHAR(30) NOT NULL,
	company VARCHAR(50) NULL
	);

CREATE TABLE condition (
	description VARCHAR(20) PRIMARY KEY
	);

CREATE TABLE stamp_series (
	country_name VARCHAR(50) FOREIGN KEY REFERENCES country(name),
	name VARCHAR(50),
	release_date DATE NOT NULL,
	designer_id SMALLINT NOT NULL,
	FOREIGN KEY (designer_id) REFERENCES designer(id),
	-- Composite PK
	CONSTRAINT pk_stamp_series PRIMARY KEY (country_name, name)
	);

CREATE TABLE stamp (
	country_name VARCHAR(50),
	stamp_series_name VARCHAR(50),
	denomination VARCHAR(20),
	purchase_price DECIMAL(8,2) NOT NULL,
	condition_description VARCHAR(20) NOT NULL,
	FOREIGN KEY (country_name, stamp_series_name) REFERENCES stamp_series(country_name, name),
	FOREIGN KEY (condition_description) REFERENCES condition(description),
	-- Composite PK
	CONSTRAINT pk_stamp PRIMARY KEY (country_name, stamp_series_name, denomination)
	);
