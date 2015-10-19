SELECT businessID, businessName, businessState, MAX(reviewCount) as reviews
FROM Business b1
WHERE b1.businessCategoryID = (
  SELECT businessCategoryID
  FROM BusinessCategory
  WHERE BusinessCategory.businessCategoryName = 'Bars'
)
AND b1.reviewCount = (
  SELECT MAX (b2.reviewCount)
  FROM Business b2
  WHERE b2.businessState = b1.businessState
)
GROUP BY businessState, businessName, businessID
ORDER BY b1.businessState,
b1.businessID;
