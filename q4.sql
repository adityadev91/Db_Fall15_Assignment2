SELECT *
FROM (
  SELECT DISTINCT b1.businessID, b1.businessName, COUNT(r1.rating) AS noOfReviews, AVG(r1.rating) AS AvgRating
  FROM Business b1, Reviews r1, BusinessCategory bc1
  WHERE b1.businessCategoryID = bc1.businessCategoryID
  AND bc1.businessCategoryName = 'Breakfast and Brunch'
  AND b1.businessCity = 'San Jose'
  AND b1.businessState = 'CA'
  AND b1.businessID = r1.businessID
  GROUP BY b1.businessID, b1.businessName
  ORDER BY AvgRating DESC, noOfReviews DESC, businessID
)
WHERE ROWNUM <= 10;
