INSERT INTO Country (CountryID, Name)
VALUES (1, 'Belgium');
INSERT INTO City (CityID, Name, CountryID)
VALUES (1, 'Brussels', 1);
INSERT INTO Attraction (AttractionID, Name, Description, CityID)
VALUES (1, 'Grand Place', 'Historic square in the center of Brussels.', 1);
INSERT INTO Event (EventID, Name, Description, Date, CityID)
VALUES (1, 'Tomorrowland', 'Electronic dance music festival.', '2024-07-21', 1);
INSERT INTO User (UserID, UserName)
VALUES (1, 'JohnDoe');
INSERT INTO Review (ReviewID, UserID, AttractionID, Rating, Comment)
VALUES (1, 1, 1, 5, 'Beautiful place to visit!');
INSERT INTO Review (ReviewID, UserID, EventID, Rating, Comment)
VALUES (2, 1, 1, 4, 'Great music and atmosphere.');
SELECT A.AttractionID, A.Name, A.Description, C.Name AS City
FROM Attraction A
JOIN City C ON A.CityID = C.CityID
WHERE C.Name = 'Brussels';
SELECT R.ReviewID, R.Rating, R.Comment, 
       CASE 
           WHEN R.AttractionID IS NOT NULL THEN 'Attraction: ' || A.Name
           WHEN R.EventID IS NOT NULL THEN 'Event: ' || E.Name
       END AS ReviewedEntity
FROM Review R
LEFT JOIN Attraction A ON R.AttractionID = A.AttractionID
LEFT JOIN Event E ON R.EventID = E.EventID
WHERE R.UserID = 1;
