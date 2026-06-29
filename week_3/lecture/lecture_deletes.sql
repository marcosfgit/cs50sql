-- Insert more two rows to then start deleting
INSERT INTO "collections" ("title", "accession_number", "acquired")
VALUES
('Tile Lunette', '06.2437', '1906-11-08'),
('Statuette of a shrew', '01.105', '1901-02-11');

-- Delete Spring outing
DELETE FROM "collections" WHERE "title" = 'Spring outing';

-- Change "acquired" that has missing field to NULL for the next delete
UPDATE "collections"
SET "acquired" = NULL
WHERE "id" = 4;

-- Delete Imaginative landscape that is the only one that has "acquired" NULL
DELETE FROM "collections" WHERE "acquired" IS NULL;

-- Delete only the rows prior to 1909
DELETE FROM "collections" WHERE "acquired" < '1909-01-01';


-- Now with the new mfa_artists.db, tried to delete a row that has a FOREIGN KEY on another table
DELETE FROM "artists" WHERE "name" = 'Unidentified artist';
-- FOREIGN KEY constraint failed

-- First delete the association on the "created table"
DELETE FROM "created" WHERE "artist_id" = (
    SELECT "id" FROM "artists" WHERE "name" = 'Unidentified artist'
);

-- Now I can delete with the other delete command
DELETE FROM "artists" WHERE "name" = 'Unidentified artist';


-- Now with the new mfa_artists_on_cascade.db, will delete one row and ON CASCADE automatically delete the association also
DELETE FROM "artists" WHERE "name" = 'Unidentified artist';