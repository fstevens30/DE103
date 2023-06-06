USE master;

GO

DROP DATABASE IF EXISTS magazines2023;

GO

CREATE DATABASE magazines2023;

GO

USE magazines2023;

GO

CREATE TABLE author (
	author_id SMALLINT IDENTITY PRIMARY KEY,
	last_name VARCHAR(20) NOT NULL,
	first_name VARCHAR(20) NOT NULL,
	);

CREATE TABLE subscriber (
	subscriber_id SMALLINT IDENTITY PRIMARY KEY,
	first_name VARCHAR(20) NOT NULL,
	last_name VARCHAR(20) NOT NULL,
	street_address VARCHAR(40) NOT NULL,
	suburb VARCHAR(30) NULL,
	city VARCHAR(20) NOT NULL,
	postcode VARCHAR(4) NOT NULL,
	);

CREATE TABLE publisher (
	publisher_name VARCHAR(50) PRIMARY KEY,
	street_address VARCHAR(40) NOT NULL,
	suburb VARCHAR(30) NULL,
	city VARCHAR(20) NOT NULL,
	postcode VARCHAR(4) NOT NULL,
	);

CREATE TABLE magazine (
	title VARCHAR(50) PRIMARY KEY,
	frequency VARCHAR(10) NOT NULL,
	annual_subscription DECIMAL(5, 2) NOT NULL,
	publisher_name VARCHAR(50) NOT NULL,
	);

CREATE TABLE subscription (
	subscriber_id SMALLINT FOREIGN KEY REFERENCES subscriber(subscriber_id),
	magazine_title VARCHAR(50) FOREIGN KEY REFERENCES magazine(title),
	valid_from DATE NOT NULL,
	valid_to DATE NULL,
	CONSTRAINT subscription_pk PRIMARY KEY (subscriber_id, magazine_title, valid_from),
	);

CREATE TABLE article (
    title VARCHAR(255) NOT NULL,
	magazine_title VARCHAR(50) FOREIGN KEY REFERENCES magazine(title),
	date_submitted DATE NOT NULL,
	CONSTRAINT article_pk PRIMARY KEY (title, magazine_title),
	);

CREATE TABLE article_author (
	article_title VARCHAR(255),
    magazine_title VARCHAR(50),
    author_id SMALLINT,
    FOREIGN KEY (article_title, magazine_title) REFERENCES article(title, magazine_title),
    FOREIGN KEY (author_id) REFERENCES author(author_id),
    CONSTRAINT article_author_pk PRIMARY KEY (article_title, article_magazine_title, author_id),
    );