CREATE TABLE cars(
                        car_id serial PRIMARY KEY,
                        model VARCHAR (255) UNIQUE NOT NULL,
                        year INT NOT NULL,
                        details TEXT NOT NULL
);

INSERT INTO cars (model, year, details) values ('BMW', 2010, 'BMW is a German automobile, motorcycle and engine manufacturing company founded in 1916. It is one of the best-selling luxury vehicle brands in the world, as well as the world’s 15th-largest producer of motor vehicles, with 2,279,503 vehicles produced in 2015.');
INSERT INTO cars (model, year, details) values ('Mercedes', 2011, 'Mercedes-Benz is a German global automobile marque and a division of Daimler AG. The brand is known for luxury vehicles, buses, coaches, and lorries. The headquarters is in Stuttgart, Baden-Württemberg. The name first appeared in 1926 under Daimler-Benz.');
INSERT INTO cars (model, year, details) values ('Audi', 2012, 'Audi is a German automobile manufacturer that designs, engineers, produces, markets and distributes luxury vehicles. Audi oversees worldwide operations from its headquarters in Ingolstadt, Bavaria, Germany.');
INSERT INTO cars (model, year, details) values ('Volkswagen', 2013, 'Volkswagen is a German automaker founded in 1937 by the German Labour Front, and headquartered in Wolfsburg. It is the flagship marque of the Volkswagen Group, the largest automaker by worldwide sales in 2016 and 2017.');
INSERT INTO cars (model, year, details) values ('Skoda', 2014, 'Škoda Auto is a Czech automobile manufacturer founded in 1895 as Laurin & Klement and headquartered in Mladá Boleslav in the Czech Republic. It is a wholly owned subsidiary of the Volkswagen Group since 1991.');
