SELECT businessID, businessCategoryID, businessName
FROM Business
WHERE businessCategoryID NOT LIKE (
  SELECT businessCategoryID
  FROM BusinessCategory
  WHERE businessCategoryName
  LIKE '%Coffee%'
)
AND businessName
LIKE '%Coffee%'
ORDER BY businessID;
