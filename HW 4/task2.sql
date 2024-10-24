-- Use the correct database
USE pet_database;

INSERT INTO petPet VALUES
    ("Fluffy", "Harold", "cat", "F", "1993-02-04", NULL),
    ("Claws", "Gwen", "cat", "M", "1994-03-17", NULL),
    ("Buffy", "Harold", "dog", "F", "1989-05-13", NULL),
    ("Fang", "Benny", "dog", "M", "1990-08-27", NULL),
    ("Bowser", "Diane", "dog", "M", "1979-08-31", "1995-07-29"),
    ("Chirpy", "Gwen", "bird", "F", "1998-09-11", NULL),
    ("Whistler", "Gwen", "bird", NULL, "1997-12-09", NULL),
    ("Slim", "Benny", "snake", "M", "1996-04-29", NULL),
    ('Puffball','Diane','hamster','F','1999-03-30',NULL);

INSERT INTO petEvent VALUES
    ("Fluffy", "1995-05-15", "litter", "4 kittens, 3 female, 1 male"),
    ("Buffy", "1993-06-23", "litter", "5 puppies, 2 female, 3 male"),
    ("Buffy", "1994-06-19", "litter", "3 puppies, 3 female"),
    ("Chirpy", "1999-03-21", "vet", "needed beak straightened"),
    ("Slim", "1997-08-03", "vet", "broken rib"),
    ("Slim", "1997-10-04", "vet", "broken tooth"),
    ("Bowser", "1991-10-12", "kennel", NULL),
    ("Fang", "1991-10-12", "kennel", NULL),
    ("Fang", "1998-08-28", "birthday", "Gave him a new chew toy"),
    ("Claws", "1998-03-17","birthday", "Gave him a new flea collar"),
    ("Whistler", "1998-12-09", "birthday", "First birthday");

-- Insert Hammy into petPet before adding to petEvent
INSERT INTO petPet (petname, owner, species, gender, birth, death)
VALUES ('Hammy', 'Diane', 'hamster', 'M', '2010-10-30', NULL);

-- Insert event for Fluffy (make sure Fluffy exists in petPet first)
-- If Fluffy already exists, this is fine to insert into petEvent
-- If not, ensure Fluffy is in the petPet table
-- For demonstration, let's assume Fluffy already exists in petPet, so no need to insert into petPet

INSERT INTO petEvent (petname, eventdate, eventtype, remark)
VALUES ('Fluffy', '2020-10-15', 'vet', 'antibiotics');

-- Insert Hammy's vet event
INSERT INTO petEvent (petname, eventdate, eventtype, remark)
VALUES ('Hammy', '2020-10-15', 'vet', 'antibiotics');

-- Fluffy had 5 kittens, 2 of which are male
UPDATE petEvent SET remark = '5 kittens (2 male)' WHERE petname = 'Fluffy' AND eventdate = '2020-10-15';

-- Claws broke a rib on 1997-08-03
-- Assuming Claws exists in petPet already. Otherwise, insert Claws first into petPet
INSERT INTO petEvent (petname, eventdate, eventtype, remark)
VALUES ('Claws', '1997-08-03', 'injury', 'broke rib');

-- Puffball died on 2020-09-01. Puffball should exist in petPet already
UPDATE petPet SET death = '2020-09-01' WHERE petname = 'Puffball';

-- Remove Harold's dog from the database due to GDPR. 
-- Assuming Harold's dog is in petPet. Otherwise, you'll get a silent no-op if it doesn't exist
DELETE FROM petPet WHERE petname = 'Buffy';
