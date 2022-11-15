CREATE TABLE cars(
                        car_id serial PRIMARY KEY,
                        model VARCHAR (255) UNIQUE NOT NULL,
                        year INT NOT NULL,
                        details TEXT NOT NULL
);

INSERT INTO cars (model, year, details) values ('BMW', 2010, 'details');
INSERT INTO cars (model, year, details) values ('Mercedes', 2011, 'details');
INSERT INTO cars (model, year, details) values ('Audi', 2012, 'details');
INSERT INTO cars (model, year, details) values ('Volkswagen', 2013, 'details');
INSERT INTO cars (model, year, details) values ('Skoda', 2014, 'details');
