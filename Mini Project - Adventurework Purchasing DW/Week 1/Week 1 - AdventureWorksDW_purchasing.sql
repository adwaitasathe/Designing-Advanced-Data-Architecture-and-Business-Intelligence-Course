/*
1 - Ranked order of Vendors by purchase amount $
*/

select rank() over (order by sum(a.OrderQty*a.UnitPrice) desc) as Rank,  
       c.Name, 
	   sum(a.OrderQty*a.UnitPrice) as 'TotalAmount' 
from Purchasing.PurchaseOrderDetail a
join Purchasing.PurchaseOrderHeader b 
  on a.PurchaseOrderID = b.PurchaseOrderID
join Purchasing.Vendor c 
  on b.VendorID = c.BusinessEntityID
group by c.Name

/*
2 - Ranked order of Vendors by purchase amount $ o Ranked order of products purchased by amount $ 
▪ By category 
*/
select rank() over (order by sum(a.OrderQty*a.UnitPrice) desc) as Rank,  
       e.Name as'Category', 
	   sum(a.OrderQty*a.UnitPrice) as 'TotalAmount' 
from Purchasing.PurchaseOrderDetail a
join Purchasing.PurchaseOrderHeader b 
  on a.PurchaseOrderID = b.PurchaseOrderID
join Production.Product c 
  on a.ProductID = c.ProductID
join Production.ProductSubcategory d 
  on c.ProductSubcategoryID = d.ProductSubcategoryID
join Production.ProductCategory e 
  on d.ProductCategoryID = e.ProductCategoryID
group by e.Name

-- By subcategory 
select rank() over   (order by sum(a.OrderQty*a.UnitPrice) desc) as Rank,  
       d.Name as 'SubCategory', 
	   sum(a.OrderQty*a.UnitPrice) as 'TotalAmount' 
from Purchasing.PurchaseOrderDetail a
join Purchasing.PurchaseOrderHeader b 
  on a.PurchaseOrderID = b.PurchaseOrderID
join Production.Product c 
  on a.ProductID = c.ProductID
join Production.ProductSubcategory d 
  on c.ProductSubcategoryID = d.ProductSubcategoryID
group by d.Name

--By product model (top 20) 

select top 20 rank() over   (order by sum(a.OrderQty*a.UnitPrice) desc) as Rank,  
	   d.Name as 'Model', 
	   sum(a.OrderQty*a.UnitPrice) as 'TotalAmount'
from Purchasing.PurchaseOrderDetail a
join Purchasing.PurchaseOrderHeader b 
  on a.PurchaseOrderID = b.PurchaseOrderID
join Production.Product c 
  on a.ProductID = c.ProductID
join Production.ProductModel d 
  on c.ProductModelID = d.ProductModelID
group by d.Name

-- By product (top 20) 
select top 20 rank() over (order by sum(a.OrderQty*a.UnitPrice) desc) as Rank,  
	   c.Name,
	   sum(a.OrderQty*a.UnitPrice) as 'TotalAmount' 
from   Purchasing.PurchaseOrderDetail a
join Purchasing.PurchaseOrderHeader b 
  on a.PurchaseOrderID = b.PurchaseOrderID
join Production.Product c 
  on a.ProductID = c.ProductID
group by c.Name

/*
3 - List of employees who purchased products with phone, email & address 
*/
select e.LastName+', '+e.FirstName as FullName,
	   e.PhoneNumber,
	   e.EmailAddress,
	   e.AddressLine1,
	   e.AddressLine2 
from Purchasing.PurchaseOrderHeader a
join HumanResources.Employee d 
  on a.EmployeeID = d.BusinessEntityID
join HumanResources.vEmployee e 
  on d.BusinessEntityID = e.BusinessEntityID
group by a.EmployeeID,e.LastName,e.FirstName,e.PhoneNumber,e.EmailAddress,e.AddressLine1,e.AddressLine2

/*
4- List of employees who purchased products with pay rate & raises (SCD) 
*/
SELECT DISTINCT concat(pe.FirstName, ' ', pe.LastName) AS 'Employee Name',
                eph.Rate,
                eph.RateChangeDate,
                sum(totaldue) AS 'Total Amount'
FROM Purchasing.PurchaseOrderDetail AS pod
JOIN Purchasing.PurchaseOrderHeader AS poh 
  ON poh.PurchaseOrderID=pod.PurchaseOrderID
JOIN Person.Person AS pe 
  ON pe.BusinessEntityID= poh.EmployeeID
JOIN HumanResources.Employee AS e 
  ON pe.BusinessEntityID=e.BusinessEntityID
JOIN Person.PersonPhone AS pp 
  ON pp.BusinessEntityID=pe.BusinessEntityID
JOIN Person.EmailAddress AS ea 
  ON ea.BusinessEntityID=pe.BusinessEntityID
JOIN Person.BusinessEntity AS be 
  ON pe.BusinessEntityID=be.BusinessEntityID
JOIN Person.BusinessEntityAddress AS bea 
  ON bea.BusinessEntityID=be.BusinessEntityID
JOIN Person.Address AS ad 
  ON bea.AddressID=ad.AddressID
JOIN HumanResources.EmployeePayHistory AS eph 
  ON e.BusinessEntityID=eph.BusinessEntityID
GROUP BY concat(pe.FirstName, ' ', pe.LastName), eph.Rate, eph.RateChangeDate
ORDER BY [Total Amount]DESC;

/*
5- List of purchasing vendor contacts with vendor name, phone, email & address 
*/
select b.Name as VendorName,
	   a.PhoneNumber,
	   a.EmailAddress,
       b.AddressLine1,
	   b.AddressLine2 
from Purchasing.vVendorWithContacts a
join Purchasing.vVendorWithAddresses b 
  on a.BusinessEntityID = b.BusinessEntityID
group by b.Name,a.PhoneNumber,a.EmailAddress,b.AddressLine1,b.AddressLine2 

/*
6- List of product prices by product order by product and SCD effective ascending 
*/
select a.Name as 'Product Name',
       b.StartDate,
       b.ModifiedDate,
       b.EndDate,
       b.ListPrice
from Production.Product as a
join Production.ProductListPriceHistory as b 
  on b.ProductID = a.ProductID
group by a.Name,b.StartDate,b.ModifiedDate,b.EndDate,b.ListPrice
order by a.Name

/*
7- List of standard costs by product order by product and SCD effective ascending
*/
select p.Name as 'Product Name',
       pch.StartDate,
       pch.ModifiedDate,
       pch.EndDate,
       pch.StandardCost
from Production.Product as p
join Production.ProductCostHistory as pch 
  on pch.ProductID = p.ProductID
group by p.Name,pch.StartDate,pch.ModifiedDate,pch.EndDate,pch.StandardCost
order by p.Name