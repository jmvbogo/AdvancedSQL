--Subquery
--1
--in the FROM
SELECT review.* 
FROM
	(SELECT * 
	FROM PartReviews 		
	WHERE PickUp_ID = '2' 
	)review 
WHERE review.Part_ID = '5'
GO



--Subquery
--2
--in the WHERE
SELECT *
FROM PickUps
WHERE EXISTS
	(SELECT *
	FROM PartReviews
	WHERE PickUp_ID = PickUps.PickUp_ID
	AND Part_ID = 5)


--Subquery
--3
--join

