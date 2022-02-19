create database Transactions;


/*start using the database */
	use Transactions;

/* Create a table called PASSENGER */
CREATE TABLE PASSENGER(
Passenger_name varchar (50) PRIMARY KEY, 
Category varchar (50),
Gender varchar (50),
Boarding_City varchar (50),
Destination_City varchar (50),
Distance int,
Bus_Type varchar(50));

/* Create a table called PRICE */
CREATE TABLE PRICE
(
 Bus_Type varchar (50),
 Distance int,
 Price int
 );

/* Create few records in PASSENGER table */
INSERT INTO PASSENGER VALUES('Sejal','AC','F','Bengaluru','Chennai',350,'Sleeper');
INSERT INTO PASSENGER VALUES('Anmol','Non-AC','M','Mumbai','Hyderabad',700,'Sitting');
INSERT INTO PASSENGER VALUES('Pallavi','AC','F','Panaji','Bengaluru',600,'Sleeper');
INSERT INTO PASSENGER VALUES('Khusboo','AC','F','Chennai','Mumbai',1500,'Sleeper');
INSERT INTO PASSENGER VALUES('Udit','Non-AC','M','Trivandrum','Panaji',1000,'Sleeper');
INSERT INTO PASSENGER VALUES('Ankur','AC','M','Nagpur','Hyderabad',500,'Sitting');
INSERT INTO PASSENGER VALUES('Hemant','Non-AC','M','Panaji','Mumbai',700,'Sleeper');
INSERT INTO PASSENGER VALUES('Manish','Non-AC','M','Hyderabad','Bengaluru',500,'Sitting');
INSERT INTO PASSENGER VALUES('Piyush','AC','M','Pune','Nagpur',700,'Sitting');

COMMIT;

/* Display all the records from the table PASSENGER*/
SELECT * FROM PASSENGER;


/* Create few records in PRICE table */
INSERT INTO PRICE VALUES('Sleeper',350,770);
INSERT INTO PRICE VALUES('Sleeper',500,1100);
INSERT INTO PRICE VALUES('Sleeper',600,1320);
INSERT INTO PRICE VALUES('Sleeper',700,1540);
INSERT INTO PRICE VALUES('Sleeper',1000,2200);
INSERT INTO PRICE VALUES('Sleeper',1200,2640);
INSERT INTO PRICE VALUES('Sleeper',350,434);
INSERT INTO PRICE VALUES('Sitting',500,620);
INSERT INTO PRICE VALUES('Sitting',500,620);
INSERT INTO PRICE VALUES('Sitting',600,744);
INSERT INTO PRICE VALUES('Sitting', 700,868);
INSERT INTO PRICE VALUES('Sitting',1000,1240);
INSERT INTO PRICE VALUES('Sitting',1200,1488);
INSERT INTO PRICE VALUES('Sitting',1500,1860);

COMMIT;

/* Display all the records from the table PRICE*/
SELECT * FROM PRICE;


SELECT Gender,COUNT(1)
FROM Passenger
WHERE Distance >= 600
GROUP BY Gender;


SELECT MIN(Price)
FROM Price
WHERE bus_Type = 'Sleeper';


SELECT Passenger_name FROM Passenger
WHERE Passenger_name LIKE 'S%';


SELECT Passenger_name, Boarding_City, Destination_City, prc.Bus_Type, Price
FROM Passenger pss, Price prc
WHERE pss.Distance = prc.Distance
AND pss.Bus_Type = prc.Bus_Type
GROUP BY Passenger_name;

SELECT Passenger_name, Price
From Passenger pss, Price prc
WHERE pss.Distance = prc.Distance
AND pss.Bus_Type = prc.Bus_Type
AND pss.Bus_Type = 'Sitting'
AND prc.Distance = 1000;


SELECT Bus_Type, Price
FROM Price
WHERE Distance = (SELECT Distance FROM Passenger WHERE Passenger_name = 'Pallavi')
group by Bus_Type;


SELECT DISTINCT Distance FROM Passenger
ORDER BY Distance DESC;

select sum(Distance) from Passenger;


select Passenger_name, (Distance * 100 /( select sum(Distance) from Passenger )) || '%'
from Passenger;


SELECT Distance, Price,
CASE
    WHEN Price >1000 THEN 'Expensive'
    WHEN Price < 1000 AND Price > 500 THEN 'Average Cost'
    ELSE 'Cheap'
END AS Cost_Category
FROM Price;



