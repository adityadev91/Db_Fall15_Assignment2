SELECT b1.businessID, b1.businessName
FROM Business b1
WHERE 1<(
  SELECT AVG(r1.rating) AS AvgRating1
  FROM reviews r1
  WHERE r1.businessID = b1.businessID
  AND EXTRACT(
    MONTH FROM r1.publishDate
  ) = 6
  AND EXTRACT(
    YEAR FROM r1.publishDate
  ) = 2011
  GROUP BY b1.businessID
  )-(
  SELECT AVG(r2.rating) AS AvgRating2
  FROM reviews r2
  WHERE r2.businessID = b1.businessID
  AND EXTRACT(
    MONTH FROM r2.publishDate
  ) = 5
  AND EXTRACT(
    YEAR FROM r2.publishDate
  ) = 2011
GROUP BY b1.businessID
);