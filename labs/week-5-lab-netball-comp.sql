CREATE DATABASE netball_competition

USE netball_competition;

CREATE TABLE person (
	person_id INT IDENTITY PRIMARY KEY,
	first_name VARCHAR(20) NOT NULL,
	last_name VARCHAR(40) -- Last name can be null as some cultures have different naming conventions 
	);

CREATE TABLE location (
    code INT(4) PRIMARY KEY,
	description VARCHAR(80) NOT NULL
	);

CREATE TABLE club (
	club_name VARCHAR(50) PRIMARY KEY,
	);

CREATE TABLE team (
	team_name VARCHAR(50) PRIMARY KEY
	FOREIGN KEY (club_name) REFERENCES club(club_name)
	);

CREATE TABLE team_member (
	person_id INT FOREIGN KEY REFERENCES person(person_id),
	team_name VARCHAR(50) FOREIGN KEY REFERENCES team(team_name),
	CONSTRAINT team_member_pk PRIMARY KEY (person_id, team_name),
	position VARCHAR(2) NOT NULL -- Is 2 because netball positions are GK, GD, WD, WA, C, GA and GS
	);

CREATE TABLE club_role (
	club_name VARCHAR(50) FOREIGN KEY REFERENCES club(club_name),
	person_id INT FOREIGN KEY REFERENCES person(person_id),
	role VARCHAR(20) PRIMARY KEY,
	CONSTRAINT club_role_pk PRIMARY KEY (club_name, person_id, role)
	);
