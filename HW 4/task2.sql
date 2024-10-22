-- Use the correct database
USE pet_database;

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
