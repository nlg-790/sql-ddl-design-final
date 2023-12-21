-- -- from the terminal run:
-- -- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

CREATE TABLE planets
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbital_period_in_years FLOAT NOT NULL,
  orbits_around TEXT NOT NULL,
  galaxy TEXT NOT NULL,
  moons TEXT[]
);

INSERT INTO planets (name, orbital_period_in_years, orbits_around, galaxy)
VALUES
  ('Earth', 1.00, 'The Sun', 'Milky Way'),
  ('Mars', 1.88, 'The Sun', 'Milky Way'),
  ('Venus', 0.62, 'The Sun', 'Milky Way'),
  ('Neptune', 164.8, 'The Sun', 'Milky Way'),
  ('Proxima Centauri b', 0.03, 'Proxima Centauri', 'Milky Way'),
  ('Gliese 876 b', 0.23, 'Gliese 876', 'Milky Way');


CREATE TABLE moons (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  planet_id INT,
  FOREIGN KEY (planet_id) REFERENCES planets(id)
);

-- Earth's Moon
INSERT INTO moons (name, planet_id) VALUES ('The Moon', 1);

-- Mars' Moons
INSERT INTO moons (name, planet_id) VALUES ('Phobos', 2);
INSERT INTO moons (name, planet_id) VALUES ('Deimos', 2);

-- Neptune's Moons
INSERT INTO moons (name, planet_id) VALUES ('Naiad', 4);
INSERT INTO moons (name, planet_id) VALUES ('Thalassa', 4);
INSERT INTO moons (name, planet_id) VALUES ('Despina', 4);
INSERT INTO moons (name, planet_id) VALUES ('Galatea', 4);
INSERT INTO moons (name, planet_id) VALUES ('Larissa', 4);
INSERT INTO moons (name, planet_id) VALUES ('S/2004 N 1', 4);
INSERT INTO moons (name, planet_id) VALUES ('Proteus', 4);
INSERT INTO moons (name, planet_id) VALUES ('Triton', 4);
INSERT INTO moons (name, planet_id) VALUES ('Nereid', 4);
INSERT INTO moons (name, planet_id) VALUES ('Halimede', 4);
INSERT INTO moons (name, planet_id) VALUES ('Sao', 4);
INSERT INTO moons (name, planet_id) VALUES ('Laomedeia', 4);
INSERT INTO moons (name, planet_id) VALUES ('Psamathe', 4);
INSERT INTO moons (name, planet_id) VALUES ('Neso', 4);


