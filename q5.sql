SELECT DISTINCT yu1.YelpID, yu1.firstName, yu1.lastName, COUNT(DISTINCT(b1.businessState)) AS statesTravelled
FROM YelpUser yu1, Reviews r1, Business b1
WHERE yu1.yelpID = r1.author
AND b1.businessID = r1.businessID
GROUP BY yu1.YelpID, yu1.firstName, yu1.lastName
HAVING COUNT(DISTINCT(b1.businessState)) > 5
ORDER BY statesTravelled DESC, yu1.yelpID;
