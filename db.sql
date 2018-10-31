DROP TABLE IF EXISTS Artist;
DROP TABLE IF EXISTS ArtObj;
DROP TABLE IF EXISTS Insurance;

CREATE TABLE IF NOT EXISTS Artist (
  ArtistID int NOT NULL AUTO_INCREMENT,
  Name varchar(138) NOT NULL,
  PRIMARY KEY (ArtistID)
);

CREATE TABLE IF NOT EXISTS ArtObj (
  ArtObjID int NOT NULL AUTO_INCREMENT,
  Type varchar(16) NOT NULL,
  ArtistID int NULL,
  PRIMARY KEY (ArtObjID),
  FOREIGN KEY (ArtistID)
        REFERENCES Artist(ArtistID)
);

CREATE TABLE IF NOT EXISTS Insurance (
  ArtObjID int NOT NULL,
  Year int NOT NULL,
  Premium float NOT NULL,
  PRIMARY KEY (ArtObjID, Year),
  FOREIGN KEY (ArtObjID)
        REFERENCES ArtObj(ArtObjID)
);

INSERT INTO Artist (Name) VALUES ("John"), ("Michael"), ("Sophie");
INSERT INTO ArtObj (Type, ArtistID) VALUES ("Sculpture", 1), ("Painting", 3), ("Landmark", NULL);
INSERT INTO Insurance (ArtObjID, Year, Premium) VALUES (1, 2007, 10000), (2, 2008, 3000), (1,2006, 5000);
