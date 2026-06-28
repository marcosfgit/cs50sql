CREATE TABLE "passengers" (
    "id" INTEGER,
    "first_name" TEXT,
    "last_name" TEXT,
    "age" INTEGER,
    PRIMARY KEY("id")
);

CREATE TABLE "checkins" (
    "id" INTEGER,
    "passenger_id" INTEGER,
    "flight_id" INTEGER,
    "datetime" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY("id"),
    FOREIGN KEY("passenger_id") REFERENCES "passengers"("id"),
    FOREIGN KEY("flight_id") REFERENCES "flights"("id")
);

CREATE TABLE "airlines" (
    "id" INTEGER,
    "name" TEXT,
    "concourse" TEXT,
    PRIMARY KEY("id")
);

CREATE TABLE "flights" (
    "id" INTEGER,
    "flight_number" INTEGER,
    "airline_id" INTEGER,
    "departure_airport_id" INTEGER,
    "arrival_airport_id" INTEGER,
    "departure_datetime" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "arrival_datetime" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY("id"),
    FOREIGN KEY("airline_id") REFERENCES "airlines"("id"),
    FOREIGN KEY("departure_airport_id") REFERENCES "airports"("id"),
    FOREIGN KEY("arrival_airport_id") REFERENCES "airports"("id")
);

CREATE TABLE "airports" (
    "id" INTEGER,
    "code" TEXT,
    PRIMARY KEY("id")
);
