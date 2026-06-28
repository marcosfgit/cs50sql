
-- *** The Lost Letter ***
-- With this query I know what the id from Anneke's address is
SELECT "id", "address"
FROM "addresses"
WHERE "address" = '900 Somerville Avenue';

-- With this query I can see all packages that were sent from Anneke's address, and the respective contents
SELECT "from_address_id", "id", "contents"
FROM "packages"
WHERE "from_address_id" = (
    SELECT "id"
    FROM "addresses"
    WHERE "address" = '900 Somerville Avenue'
);

-- With this query I see where the package with the Congratulatory Letter was dropped
SELECT "id", "address_id", "action", "timestamp"
FROM "scans"
WHERE "action" = 'Drop' AND "package_id" = (
    SELECT "id"
    FROM "packages"
    WHERE "contents" = 'Congratulatory letter' AND "from_address_id" = (
        SELECT "id"
        FROM "addresses"
        WHERE "address" = '900 Somerville Avenue'
    )
);

-- With this query I see the address where the Congratulatory Letter is at the moment, and its type (it's at 3 W Hill Place, type Residential)
SELECT "id", "address", "type"
FROM "addresses"
WHERE "id" = (
    SELECT "address_id"
    FROM "scans"
    WHERE "action" = 'Drop' AND "package_id" = (
        SELECT "id"
        FROM "packages"
        WHERE "contents" = 'Congratulatory letter' AND "from_address_id" = (
            SELECT "id"
            FROM "addresses"
            WHERE "address" = '900 Somerville Avenue'
        )
    )
);



-- *** The Devious Delivery ***
-- With this query I can see if there are NULL in from_address_id in packages table (there's only one id, and "quack" is a clue to "Duck debugger" content)
SELECT "id", "contents", "from_address_id"
FROM "packages"
WHERE "from_address_id" IS NULL;

-- With this query I can see the id of the address where the package was last dropped
SELECT "id", "address_id", "action", "timestamp"
FROM "scans"
WHERE "action" = 'Drop' AND "package_id" = (
    SELECT "id"
    FROM "packages"
    WHERE "from_address_id" IS NULL
);

-- With this query I can see the address and type where the Duck debugger is at the moment
SELECT "id", "address", "type"
FROM "addresses"
WHERE "id" = (
    SELECT "address_id"
    FROM "scans"
    WHERE "action" = 'Drop' AND "package_id" = (
        SELECT "id"
        FROM "packages"
        WHERE "from_address_id" IS NULL
    )
);


-- *** The Forgotten Gift ***
-- With this query I know what the id from the grandparent's address is
SELECT "id", "address"
FROM "addresses"
WHERE "address" = '109 Tileston Street';

-- With this query I know what the id from the granddaughter's address is
SELECT "id", "address"
FROM "addresses"
WHERE "address" = '728 Maple Place';

-- With this query I can know the id of the package and its contents (Flowers)
SELECT "id", "contents"
FROM "packages"
WHERE "from_address_id" = (
    SELECT "id"
    FROM "addresses"
    WHERE "address" = '109 Tileston Street'
);

-- With this query I can know the id of the driver. Because there is more than one driver, I want only the one with the most recent timestamp
SELECT "driver_id", "timestamp"
FROM "scans"
WHERE "package_id" = (
    SELECT "id"
    FROM "packages"
    WHERE "from_address_id" = (
        SELECT "id"
        FROM "addresses"
        WHERE "address" = '109 Tileston Street'
    )
)
ORDER BY "timestamp" DESC
LIMIT 1;

-- With this query I know the name of the driver (Mikel)
SELECT "name"
FROM "drivers"
WHERE "id" = (
    SELECT "driver_id"
    FROM "scans"
    WHERE "package_id" = (
        SELECT "id"
        FROM "packages"
        WHERE "from_address_id" = (
            SELECT "id"
            FROM "addresses"
            WHERE "address" = '109 Tileston Street'
        )
    )
    ORDER BY "timestamp" DESC
    LIMIT 1
);
