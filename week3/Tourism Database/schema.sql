CREATE TABLE Country (
    CountryID INT PRIMARY KEY,
    Name VARCHAR(100)
);
CREATE TABLE City (
    CityID INT PRIMARY KEY,
    Name VARCHAR(100),
    CountryID INT,
    FOREIGN KEY (CountryID) REFERENCES Country(CountryID)
);
CREATE TABLE Attraction (
    AttractionID INT PRIMARY KEY,
    Name VARCHAR(100),
    Description TEXT,
    CityID INT,
    FOREIGN KEY (CityID) REFERENCES City(CityID)
);
CREATE TABLE Event (
    EventID INT PRIMARY KEY,
    Name VARCHAR(100),
    Description TEXT,
    Date DATE,
    CityID INT,
    FOREIGN KEY (CityID) REFERENCES City(CityID)
);
CREATE TABLE User (
    UserID INT PRIMARY KEY,
    UserName VARCHAR(100)
);
CREATE TABLE Review (
    ReviewID INT PRIMARY KEY,
    UserID INT,
    AttractionID INT,
    EventID INT,
    Rating INT,
    Comment TEXT,
    FOREIGN KEY (UserID) REFERENCES User(UserID),
    FOREIGN KEY (AttractionID) REFERENCES Attraction(AttractionID),
    FOREIGN KEY (EventID) REFERENCES Event(EventID),
    CHECK (
        (AttractionID IS NOT NULL AND EventID IS NULL) OR 
        (AttractionID IS NULL AND EventID IS NOT NULL)
    )
);
