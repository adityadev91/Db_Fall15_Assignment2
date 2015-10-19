SELECT *
FROM (
  SELECT DISTINCT b1.businessID, b1.businessName, AVG(r1.rating) AS Score, COUNT(b1.reviewCount) AS noOfReviews
  FROM Business b1, Reviews r1, BusinessCategory bc1
  WHERE b1.businessCategoryID = bc1.businessCategoryID
  AND bc1.businessCategoryName = 'Burgers'
  AND b1.businessCity = 'San Jose'
  AND b1.businessState = 'CA'
  AND b1.businessID = r1.businessID
  GROUP BY b1.businessID, b1.businessName
  ORDER BY Score DESC, noOfReviews DESC, b1.businessID
)
WHERE rowNum <= 5;