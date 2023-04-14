use Medium;

CREATE table visit
(date date,
price int,
duration int);

INSERT into visit(date,price,duration) VALUES
('2021-04-01',9,12),('2021-04-01',7,19),('2021-04-01',4,8),
('2020-05-01',6,19),
('2020-05-01',7,20),
('2020-05-01',2,15),
('2020-05-01',4,37),
('2020-05-06',7,24),
('2021-04-01',2,15),
('2021-04-01',4,37),
('2021-04-06',7,24),
('2021-03-11',2,15),
('2021-03-14',4,37),
('2020-04-07',2,15),
('2020-04-04',4,37),
('2020-04-05',7,24),
('2021-03-06',7,24),
('2020-05-01',2,5),
('2020-05-01',4,3),
('2020-05-06',7,4),
('2021-04-01',2,5),
('2021-04-01',4,3),
('2021-04-06',7,2),
('2021-03-11',2,5);
Select * from visit;

--How many people visited the museum each day?

Select date,count(*) as NoOfVisits
From visit
Group By date;

--What is the average price paid for a ticket in a given month?

SELECT
  YEAR(date) AS year,
  MONTH(date) AS month,
  ROUND(AVG(price), 2) AS avg_price
FROM visit
GROUP BY
YEAR(date),MONTH(date)

--Find the average visit duration value for each month. 
--We also want to make sure that the rows are sorted chronologically.

SELECT
  YEAR(date) AS year,
  MONTH(date) AS month,
  ROUND(AVG(duration), 2) AS avg_duration
FROM visit
GROUP BY
YEAR(date),MONTH(date)
ORDER BY YEAR(date),MONTH(date);

--we want to see the average ticket price for each day. 
--However, there’s an extra condition: we don’t want to show days with 1 or fewer visits.
SELECT
AVG(price) as avgprice,date,count(*) as NoOfVisits
FROM visit
GROUP BY date
HAVING count(*)>3

--we only want to show days with more than three visits.
--However, we also want to make sure that visits which are five minutes long
--or shorter are not included in the calculations. 
SELECT date,AVG(duration) as avgprice
FROM visit
WHERE duration>5
GROUP BY date
Having count(*)>3;