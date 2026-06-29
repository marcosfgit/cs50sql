-- Copied mfa_trigger.db and renamed it mfa_soft_deletions.db
-- sqlite3 mfa_soft_deletions.db

-- Create new column "deleted" on table "collections" to say if it is deleted (1) or not (0)
ALTER TABLE "collections" ADD COLUMN "deleted" INTEGER DEFAULT 0;

-- You can see all values for that new "deleted" column are 0 (DEFAULT)
SELECT * FROM "collections";

-- Instead of deleting from collections (like before), you can simply update the value (1) on the "deleted" column
UPDATE "collections" SET "deleted" = 1
WHERE "title" = 'Farmers working at dawn';

-- You can see now that collection is marked as deleted (1)
SELECT * FROM "collections";

-- To see only the not-deleted ones
SELECT * FROM "collections"
WHERE "deleted" != 1;

-- To see only the deleted ones
SELECT * FROM "collections"
WHERE "deleted" = 1;
