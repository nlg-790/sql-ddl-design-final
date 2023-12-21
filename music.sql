-- -- from the terminal run:
-- -- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

CREATE TABLE artists (
  artist_id SERIAL PRIMARY KEY,
  name TEXT NOT NULL UNIQUE
);

CREATE TABLE albums (
  album_id SERIAL PRIMARY KEY,
  title TEXT NOT NULL UNIQUE,
  release_date DATE NOT NULL,
  artist_id INT,
  producer_id INT
);

CREATE TABLE producers (
  producer_id SERIAL PRIMARY KEY,
  name TEXT NOT NULL UNIQUE
);

CREATE TABLE songs (
  song_id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration_in_seconds INTEGER NOT NULL,
  album_id INT,
  artist_id INT,
  FOREIGN KEY (album_id) REFERENCES albums(album_id),
  FOREIGN KEY (artist_id) REFERENCES artists(artist_id)
);

-- Insert artists
INSERT INTO artists (name) VALUES 
  ('Hanson'), 
  ('Queen'), 
  ('Mariah Carey'), 
  ('Boyz II Men'), 
  ('Lady Gaga'), 
  ('Bradley Cooper'), 
  ('Nickelback'), 
  ('Jay Z'), 
  ('Alicia Keys'), 
  ('Katy Perry'), 
  ('Juicy J'), 
  ('Maroon 5'), 
  ('Christina Aguilera'), 
  ('Avril Lavigne'), 
  ('Destiny''s Child');

-- Insert producers
INSERT INTO producers (name) VALUES 
  ('Dust Brothers'), 
  ('Stephen Lironi'), 
  ('Roy Thomas Baker'), 
  ('Walter Afanasieff'), 
  ('Benjamin Rice'), 
  ('Rick Parashar'), 
  ('Al Shux'), 
  ('Max Martin'), 
  ('Cirkut'), 
  ('Shellback'), 
  ('Benny Blanco'), 
  ('The Matrix'), 
  ('Darkchild');

-- Insert albums with artist and producer IDs
INSERT INTO albums (title, release_date, artist_id, producer_id) VALUES 
  ('Middle of Nowhere', '1997-04-15', 1, 1), 
  ('A Night at the Opera', '1975-10-31', 2, 3), 
  ('Daydream', '1995-11-14', 3, 4), 
  ('A Star Is Born', '2018-09-27', 4, 5), 
  ('Silver Side Up', '2001-08-21', 5, 6), 
  ('The Blueprint 3', '2009-10-20', 6, 7), 
  ('Prism', '2013-12-17', 7, 8), 
  ('Hands All Over', '2011-06-21', 8, 9), 
  ('Let Go', '2002-05-14', 9, 10), 
  ('The Writing''s on the Wall', '1999-11-07', 10, 11);

-- Insert songs with artist and album IDs
INSERT INTO songs (title, duration_in_seconds, album_id, artist_id) VALUES 
  ('MMMBop', 238, 1, 1),
  ('Bohemian Rhapsody', 355, 2, 2),
  ('One Sweet Day', 282, 3, 3),
  ('Shallow', 216, 4, 4),
  ('How You Remind Me', 223, 5, 5),
  ('New York State of Mind', 276, 6, 6),
  ('Dark Horse', 215, 7, 7),
  ('Moves Like Jagger', 201, 8, 8),
  ('Complicated', 244, 9, 9),
  ('Say My Name', 240, 10, 10);
