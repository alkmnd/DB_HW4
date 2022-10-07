CREATE TABLE "station" (
  "stat_nr" int PRIMARY KEY,
  "name" varchar NOT NULL
);

CREATE TABLE "room" (
  "room_nr" int PRIMARY KEY,
  "stat_nr" int NOT NULL,
  "beds" int NOT NULL
);

CREATE TABLE "patient" (
  "patient_nr" int PRIMARY KEY,
  "name" varchar NOT NULL,
  "disease" varchar,
  "room_nr" int,
  "from" timestamp,
  "to" timestamp
);

CREATE TABLE "doctor" (
  "id" int PRIMARY KEY,
  "area" varchar NOT NULL,
  "rank" varchar NOT NULL
);

CREATE TABLE "caregivers" (
  "id" int PRIMARY KEY,
  "qualification" varchar NOT NULL
);

CREATE TABLE "station_personell" (
  "pers_nr" int PRIMARY KEY,
  "stat_nr" int NOT NULL,
  "name_number" int NOT NULL
);

CREATE TABLE "treats" (
  "pers_nr" int NOT NULL,
  "patient_nr" int NOT NULL
);

ALTER TABLE "room" ADD FOREIGN KEY ("stat_nr") REFERENCES "station" ("stat_nr");

ALTER TABLE "station_personell" ADD FOREIGN KEY ("stat_nr") REFERENCES "station" ("stat_nr");

ALTER TABLE "station_personell" ADD FOREIGN KEY ("pers_nr") REFERENCES "caregivers" ("id");

ALTER TABLE "station_personell" ADD FOREIGN KEY ("pers_nr") REFERENCES "doctor" ("id");

ALTER TABLE "treats" ADD FOREIGN KEY ("pers_nr") REFERENCES "doctor" ("id");

ALTER TABLE "treats" ADD FOREIGN KEY ("patient_nr") REFERENCES "patient" ("patient_nr");

ALTER TABLE "patient" ADD FOREIGN KEY ("room_nr") REFERENCES "room" ("room_nr");
