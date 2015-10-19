SELECT b1.businessID, b1.businessName, COUNT(r1.rating) AS noOfReviews 
FROM (
  Business b1 INNER JOIN Reviews r1
  ON b1.businessID = r1.businessID
)
WHERE NOT EXISTS(
  SELECT *
  FROM Reviews r2, Business b2
  WHERE r2.rating < 5
  AND r2.businessID = b1.businessID
)
GROUP BY b1.businessID, b1.businessName
HAVING COUNT(r1.rating) > 10;
