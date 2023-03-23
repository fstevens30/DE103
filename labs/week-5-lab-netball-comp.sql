CREATE DATABASE netball_competition

USE netball_competition;

CREATE TABLE person (
	person_id SMALLINT IDENTITY PRIMARY KEY,
	first_name VARCHAR(20),
	last_name VARCHAR(40)
	);

CREATE TABLE location (
	code 