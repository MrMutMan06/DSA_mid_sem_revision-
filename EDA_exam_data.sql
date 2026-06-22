-- Revising for my mid semester exam 
-- Loading the supply chain data 

create database Business;
use Business; 

create table supply (
	ShipmentID int, Supplier nvarchar(50), Warehouse nvarchar(50), ProductCategory nvarchar(50), TransportMode nvarchar(50), Distance_km int, UnitsShipped int, UnitCost int,
	TransportationCost int, DeliveryTime_Days int, PlannedDays int, IsDelayed int
	);

-- bulk inserting 
bulk insert supply
from 'C:\Users\mrmuturi\Documents\SQL Server Management Studio 22\Mid_sem_revision\SupplyChain_Data.csv'
with ( 
	fieldterminator = ',', -- These commands only work with comma delimited csv files 
	rowterminator = '\n',
	firstrow = 2
);

select * from supply -- To see the whole table 

-- Practice questions 
-- Number 1 
select 
	TransportMode
from supply
where TransportMode = 'Air'; 

-- Number 2 
select 
	IsDelayed
from supply
where IsDelayed = 1;

-- Number 3 
select 
	ShipmentID, 
	Supplier, 
	TransportationCost
from supply
where TransportationCost > 9000;

-- Number 4 
select 
	Supplier, 
	Warehouse
from supply
where Supplier = 'SupplierB' and Warehouse = 'Warehouse2';

-- Number 5 
select 
	Distance_km
from supply
where Distance_km between 1000 and 2000; -- using 'between' for the first time :) 

select * from supply -- To see the whole table 

-- Note: you can use select * when conditionally selecting e.g. 
-- Number 2 with select *
select * -- This is better than selecting IsDelayed only 
from supply
where IsDelayed = 1;

