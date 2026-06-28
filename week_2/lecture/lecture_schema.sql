CREATE TABLE "riders" (
    "id",
    "name"
);

CREATE TABLE "stations" (
    "id",
    "name",
    "line"
);

CREATE TABLE "visits" (
    "rider_id",
    "station_id"
);

DROP TABLE "riders";
DROP TABLE "stations";
DROP TABLE "visits";

-- Execute again all the CREATE TABLE

DROP TABLE "riders";

ALTER TABLE "visits" RENAME TO "swipes";
ALTER TABLE "swipes" ADD COLUMN "ttpe" TEXT;
ALTER TABLE "swipes" RENAME COLUMN "ttpe" TO "type";
ALTER TABLE "swipes" DROP COLUMN "type";

DROP TABLE "stations";
DROP TABLE "swipes";