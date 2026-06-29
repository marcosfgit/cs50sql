-- Create DB mfa_trigger.db with schema_artists_trigger.sql
-- sqlite3 mfa_trigger.db
-- .read schema_artists_trigger.sql

-- Create transactions table
CREATE TABLE "transactions" (
    "id" INTEGER,
    "title" TEXT,
    "action" TEXT,
    PRIMARY KEY("id")
);

-- Now we don't add data to this table, the triggers will do that for us
CREATE TRIGGER "sell"
BEFORE DELETE ON "collections"
FOR EACH ROW
BEGIN
    INSERT INTO "transactions" ("title", "action")
    VALUES (OLD."title", 'sold');
END;

-- You can see the trigger on the schema
-- .schema

-- See if the trigger is working
DELETE FROM "collections"
WHERE "title" = 'Profusion of flowers';

-- You can now see that the table transactions has data on it
SELECT * FROM "transactions";


-- Create a new trigger buy
CREATE TRIGGER "buy"
AFTER INSERT ON "collections"
FOR EACH ROW
BEGIN
    INSERT INTO "transactions" ("title", "action")
    VALUES (NEW."title", 'bought');
END;

-- I bought back Profusion of flowers
INSERT INTO "collections" ("title", "accession_number", "acquired")
VALUES ('Profusion of flowers', '56.247', '1956-04-12');

-- You can now see that the table transactions has more data on it
SELECT * FROM "transactions";