INSERT INTO "collections" ("id", "title", "accession_number", "acquired")
VALUES (1, 'Profusion of flowers', '56.257', '1956-04-12');

INSERT INTO "collections" ("id", "title", "accession_number", "acquired")
VALUES (2, 'Farmers working at dawn', '11.6152', '1911-08-03');

-- Insert without "id" because PRIMARY KEY is incremental
INSERT INTO "collections" ("title", "accession_number", "acquired")
VALUES ('Spring outing', '14.76', '1914-01-08');

-- UNIQUE constraint failed on "accession_number"
INSERT INTO "collections" ("title", "accession_number", "acquired")
VALUES ('Spring outing', '14.76', '1914-01-08');

-- NOT NULL constraint failed on "title"
INSERT INTO "collections" ("title", "accession_number", "acquired")
VALUES (NULL, NULL, '1900-01-10');

-- Insert two rows at once
INSERT INTO "collections" ("title", "accession_number", "acquired")
VALUES
('Imaginative landscape', '56.496', NULL),
('Peonies and butterfly', '06.1899', '1906-01-01');


-- Remove the DB to start over
-- rm mfa.db

-- Create the DB again
-- sqlite3 mfa.db

-- Read the schema again
-- .read schema.sql

-- Import the csv file into the DB (skip 1 is to skip the headers first row from the csv file; refer also csv file's name and the column's name)
-- .import --csv --skip 1 mfa.csv collections


-- Now we want to import mfa_2.csv that does not have the id column
-- With this command, we don't have skip 1 because we want to take advantage of the header's names
-- With this command, we will create a temp table on our existing mfa.db
-- .import --csv mfa_2.csv temp

-- Now we have two tables (collections and temp), and we will import the data from temp to the collections one
-- But first:
DELETE FROM "collections";

-- And now:
INSERT INTO "collections" ("title", "accession_number", "acquired")
SELECT "title", "accession_number", "acquired" FROM "temp";

-- And in the end DROP the temp table
DROP TABLE "temp";