CREATE TABLE "users" (
    "id" INTEGER,
    "first_name" TEXT,
    "last_name" TEXT,
    "username" TEXT,
    "password" TEXT,
    PRIMARY KEY("id")
);

CREATE TABLE "schools" (
    "id" INTEGER,
    "name" TEXT,
    "type" TEXT,
    "location" TEXT,
    "year" INTEGER,
    PRIMARY KEY("id")
);

CREATE TABLE "companies" (
    "id" INTEGER,
    "name" TEXT,
    "industry" TEXT,
    "location" TEXT,
    PRIMARY KEY("id")
);

CREATE TABLE "connections" (
    "user1_id" INTEGER,
    "user2_id" INTEGER,
    PRIMARY KEY("user1_id", "user2_id"),
    FOREIGN KEY("user1_id") REFERENCES "users"("id"),
    FOREIGN KEY("user2_id") REFERENCES "users"("id")
);

CREATE TABLE "school_connections" (
    "user_id" INTEGER,
    "school_id" INTEGER,
    "start_date" NUMERIC,
    "end_date" NUMERIC,
    "degree" TEXT,
    PRIMARY KEY("user_id", "school_id", "start_date"),
    FOREIGN KEY("user_id") REFERENCES "users"("id"),
    FOREIGN KEY("school_id") REFERENCES "schools"("id")
);

CREATE TABLE "company_connections" (
    "user_id" INTEGER,
    "company_id" INTEGER,
    "start_date" NUMERIC,
    "end_date" NUMERIC,
    "title" TEXT,
    PRIMARY KEY("user_id", "company_id", "start_date"),
    FOREIGN KEY("user_id") REFERENCES "users"("id"),
    FOREIGN KEY("company_id") REFERENCES "companies"("id")
);
