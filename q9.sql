SELECT b1.businessID, b1.businessName, COUNT(r1.rating) AS noOfReviews 
FROM (
  Business b1 INNER JOIN Reviews r1
  ON b1.businessID = r1.businessID
  INNER JOIN YelpUser yu1
  ON r1.author = yu1.yelpID
)
WHERE NOT EXISTS(
  SELECT *
  FROM Reviews r2, Business b2
  WHERE r2.rating < 5
  AND r2.businessID = b1.businessID
  AND r1.author = yu1.yelpID
)
AND NOT EXISTS (
  SELECT vfl1.FriendID
  FROM VoterFriendsList vfl1
  WHERE vfl1.reviewID = r1.reviewID
  GROUP BY vfl1.FriendID
  HAVING COUNT(*) > 1
)
GROUP BY b1.businessID, b1.businessName
HAVING COUNT(r1.rating) > 50;
