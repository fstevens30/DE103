-- Creating the Database
CREATE DATABASE one_hundred_albums;

-- Using the Database
USE one_hundred_albums;

-- Creating the Tables

-- Artist Table
CREATE TABLE artist (
    id SMALLINT IDENTITY PRIMARY KEY,
    name VARCHAR(50)
);

-- Producer Table
CREATE TABLE producer (
    id SMALLINT IDENTITY PRIMARY KEY,
    name VARCHAR(50)
);

-- Album Table
CREATE TABLE album (
    artist_id SMALLINT FOREIGN KEY REFERENCES artist(id),
    name VARCHAR(50) PRIMARY KEY,
    release_date DATE,
    length TIME,
    producer_id SMALLINT FOREIGN KEY REFERENCES producer(id),
    record_label VARCHAR(50),
    CONSTRAINT album_pk PRIMARY KEY (artist_id, name, release_date)
);

-- Album Track Table
CREATE TABLE album_track (
    artist_id SMALLINT FOREIGN KEY REFERENCES artist(id),
    album_name VARCHAR(50) FOREIGN KEY REFERENCES album(name),
    track_name VARCHAR(50),
    track_number TINYINT,
    CONSTRAINT album_track_pk PRIMARY KEY (artist_id, album_name, track_name)
);

-- Genre Table
CREATE TABLE genre (
    artist_id SMALLINT FOREIGN KEY REFERENCES artist(id),
    album_name VARCHAR(50) FOREIGN KEY REFERENCES album(name),
    genre VARCHAR(50),
    CONSTRAINT genre_pk PRIMARY KEY (artist_id, album_name, genre)
);
