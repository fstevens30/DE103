/* Query 1 */
SELECT * FROM Supplier WHERE Country = 'Germany';

/* Query 2 */
SELECT * FROM Product WHERE Discontinued = 1;

/* Query 3 */
SELECT * FROM Employee
	ORDER BY LastName, FirstName;

/* Query 4 */
SELECT ProductID, ProductName, CategoryName FROM Product;

/* Query 5 */
SELECT * FROM Product WHERE UnitPrice > 50;

/* Query 6 */
SELECT * FROM Orders WHERE ShippedDate IS NULL;

/* Query 7 */
SELECT COUNT(*) AS 'Number of Products' FROM Product;

/* Query 8 */
SELECT MAX(UnitsInStock) AS 'Highest Number of Units in Stock' FROM Product;

/* Query 9 */
SELECT * FROM Orders
	INNER JOIN Employee
	ON Employee.EmployeeID = Orders.EmployeeID;

/* Query 10 */
SELECT FirstName, LastName FROM Employee e
	INNER JOIN EmployeeTerritory et
	ON e.EmployeeID = et.EmployeeID
	WHERE et.TerritoryDescription = 'Boston';

/* Query 11 */
CREATE VIEW Product_view AS
	SELECT ProductID, ProductName, SupplierID, CategoryName FROM Product;

SELECT * FROM Product_view;

/* Query 12 */
SELECT ProductName, UnitsInStock, UnitsOnOrder FROM Product
	WHERE UnitsInStock < UnitsOnOrder;

/* Query 13 */
SELECT AVG(UnitPrice) AS 'Average Price', CategoryName FROM Product
	GROUP BY CategoryName;

/* Query 14 */
SELECT e.FirstName, e.LastName, e.Address, e.City, e.Region FROM Employee e
	INNER JOIN Orders o
	ON o.EmployeeID = e.EmployeeID
	WHERE ShipCountry = 'Belgium';

/* Query 15 */
SELECT CONCAT(FirstName, ' ', LastName), City FROM Employee
	WHERE City LIKE 'S%'

/* Query 16 */
SELECT c.CompanyName, COUNT(o.OrderID) AS 'Total Orders Placed' FROM Customer c
	INNER JOIN Orders o
	ON c.CustomerID = o.CustomerID
	GROUP BY c.CompanyName;

/* Query 17 */
SELECT Country, COUNT(CustomerID) AS 'Total Customers' FROM Customer
	GROUP BY Country
	ORDER BY COUNT(CustomerID) DESC;

/* Query 18 */
CREATE VIEW Employee_region_view AS
	SELECT e.LastName, e.FirstName, et.TerritoryDescription, t.RegionDescription FROM Employee e
		INNER JOIN EmployeeTerritory et
		ON e.EmployeeID = et.EmployeeID
		INNER JOIN Territory t
		ON et.TerritoryDescription = t.TerritoryDescription;

SELECT * FROM Employee_region_view;


/* Query 19 */
SELECT e.FirstName, e.LastName, c.CompanyName, c.ContactName, c.City, s.CompanyName AS 'Shipper Name' FROM Employee e
	INNER JOIN Orders o
	ON e.EmployeeID = o.EmployeeID
	INNER JOIN Shipper s
	ON o.ShipperID = s.ShipperID
	INNER JOIN Customer c
	ON o.CustomerID = c.CustomerID
	WHERE c.City = 'Bruxelles' AND s.CompanyName = 'Speedy Express';