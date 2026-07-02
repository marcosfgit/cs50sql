SELECT * FROM "accounts";

UPDATE "accounts" SET "balance" = "balance" + 10
WHERE "id" = 2;

UPDATE "accounts" SET "balance" = "balance" - 10
WHERE "id" = 1;

-- We made a transaction of 10 from one account to another
-- But if I queried in the middle of the two UPDATE's, I would see a balance error (total 70 instead of 60)
-- This can't happen in a transaction

-- Revert everything
UPDATE "accounts" SET "balance" = "balance" - 10
WHERE "id" = 2;

UPDATE "accounts" SET "balance" = "balance" + 10
WHERE "id" = 1;

-- Correct way for transaction
BEGIN TRANSACTION;
UPDATE "accounts" SET "balance" = "balance" + 10
WHERE "id" = 2;
UPDATE "accounts" SET "balance" = "balance" - 10
WHERE "id" = 1;
COMMIT;


-- Rollback a transaction (in this case it will give a 'CHECK constraint failed' when trying -10 to the zero balance of Alice "id" = 1)
-- After a failed command line, simply write ROLLBACK; and it will revert everything of this transaction
BEGIN TRANSACTION;
UPDATE "accounts" SET "balance" = "balance" + 10
WHERE "id" = 2;
UPDATE "accounts" SET "balance" = "balance" - 10
WHERE "id" = 1;
ROLLBACK;


-- About locks used in isolation
-- If I do this in a terminal
BEGIN EXCLUSIVE TRANSACTION;

-- And then do this in another terminal (like another user accessing the DB)
SELECT * FROM "accounts";
-- I will get a error: database is locked