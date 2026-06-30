SELECT * FROM "collections";

-- Add the "deleted" column for Soft Deletions to table "collections"
ALTER TABLE "collections"
ADD COLUMN "deleted" INTEGER DEFAULT 0;

-- Soft delete 'Farmers working at dawn'
UPDATE "collections" SET "deleted" = 1
WHERE "title" = 'Farmers working at dawn';

-- See only collections that have not been deleted
SELECT * FROM "collections"
WHERE "deleted" = 0;

-- Create a view without the "deleted" column and only showing the collections that have not been deleted
CREATE VIEW "current_collections" AS
SELECT "id", "title", "accession_number", "acquired"
FROM "collections"
WHERE "deleted" = 0;

-- Now to see the view recently created
SELECT * FROM "current_collections";


-- Now, if you want to delete something on the view, you cannot (cannot modify current_collections because it is a view)
DELETE FROM "current_collections"
WHERE "title" = 'Imaginative landscape';

-- But you can do this instead. Create a trigger with INSTEAD OF DELETE
CREATE TRIGGER "delete"
INSTEAD OF DELETE ON "current_collections"
FOR EACH ROW
BEGIN
    UPDATE "collections" SET "deleted" = 1
    WHERE "id" = OLD."id";
END;

-- Now, I can delete from the view "current_collections" (it returns no error now)
DELETE FROM "current_collections"
WHERE "title" = 'Imaginative landscape';

-- And then see the view
SELECT * FROM "current_collections";


-- Now we want to do the same for INSERTING a new collection into the "current_collections" View
-- Problem is: if we reacquire a collection that had "deleted" = 1, we just want to flip it to 0, not insert a new row
-- We will use TRIGGER with a conditional for this
-- P.S.: If we want to INSERT some new rows that aren't in our collections as "deleted", we need another TRIGGER for that (not in this file)
CREATE TRIGGER "insert_when_exists"
INSTEAD OF INSERT ON "current_collections"
FOR EACH ROW
WHEN NEW."accession_number" IN (
    SELECT "accession_number"
    FROM "collections"
)
BEGIN
    UPDATE "collections" SET "deleted" = 0
    WHERE "accession_number" = NEW."accession_number";
END;

-- To try this
INSERT INTO "current_collections" ("title", "accession_number", "acquired")
VALUES ('Imaginative landscape', '56.496', NULL);

-- To see the "current_collections" View
SELECT * FROM "current_collections";

