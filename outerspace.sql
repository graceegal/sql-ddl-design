
CREATE TABLE stars (
    name TEXT PRIMARY KEY,
    temp_kelvin INT NOT NULL
);

CREATE TABLE planets (
    name TEXT PRIMARY KEY,
    orbital_period_yrs FLOAT NOT NULL,
    star_name TEXT NOT NULL REFERENCES stars
);

CREATE TABLE moons (
    name TEXT PRIMARY KEY,
    planet_name TEXT NOT NULL REFERENCES planets
);


INSERT INTO stars (name, temp_kelvin) VALUES
    ('The Sun', 5800),
    ('Proxima Centauri', 3042),
    ('Gliese 876', 3192);

INSERT INTO planets (name, orbital_period_yrs, star_name) VALUES
    ('Earth', 1.00, 'The Sun'),
    ('Mars', 1.882, 'The Sun'),
    ('Venus', 0.62, 'The Sun'),
    ('Proxima Centauri b', 0.03, 'Proxima Centauri'),
    ('Gliese 876 b', 0.236, 'Gliese 876');

INSERT INTO moons (name, planet_name) VALUES
    ('The Moon', 'Earth'),
    ('Phobos', 'Mars'),
    ('Deimos', 'Mars');


SELECT planets.name, planets.star_name, COUNT(moons.name)
    FROM planets
        LEFT OUTER JOIN moons
            ON planets.name = moons.planet_name
    GROUP BY planets.name
    ORDER BY planets.name;








