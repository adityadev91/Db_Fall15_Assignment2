SELECT yu1.yelpID, yu1.firstName, yu1.lastName, SUM(r1.votes_useful) AS usefulCount
FROM YelpUser yu1, Reviews r1
WHERE r1.author = yu1.yelpID
GROUP BY yu1.yelpID, yu1.firstName, yu1.lastName
HAVING SUM(r1.votes_useful)= (
  SELECT MAX(SUM(r2.votes_useful))
  FROM Reviews r2
  GROUP BY r2.author
);
