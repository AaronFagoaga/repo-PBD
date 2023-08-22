--DESARROLLO EJERCICIOS DE CLASE - AARON FAGOAGA - U20210154 --

-- 1. Seleccione todos los datos de la tabla Departament del schema HumanResources.
SELECT * FROM HumanResources.Department
GO
-- 2. Seleccione un agrupamiento de los nombres de grupos que existen en la tabla Departament del schema HumanResources. 
SELECT GroupName FROM HumanResources.Department GROUP BY GroupName
GO

-- 3. Seleccione todos los departamentos ordenándolos en orden descendente. 
SELECT * FROM HumanResources.Department ORDER BY DepartmentID DESC
GO

-- 4. Seleccione todos los departamentos ordenándolos en orden ascendente.
SELECT * FROM HumanResources.Department ORDER BY DepartmentID ASC
GO
-- 5. Seleccione todos los empleados de la tabla Employee del schema Human Resources.
SELECT P.BusinessEntityID, P.FirstName, P.LastName FROM HumanResources.Employee E 
INNER JOIN Person.Person P ON E.BusinessEntityID = P.BusinessEntityID
GO
-- 6. Seleccione todos los empleados de la tabla Employee del schema Human Resources donde el género sea masculino. 
SELECT P.BusinessEntityID, P.FirstName, P.LastName, E.Gender FROM HumanResources.Employee E 
INNER JOIN Person.Person P ON E.BusinessEntityID = P.BusinessEntityID
WHERE E.Gender = 'M'
GO

-- 7. Seleccione todos los empleados de la tabla Employee del schema Human Resources donde el nivel de organización sea mayor a 3. 
SELECT P.BusinessEntityID, P.FirstName, P.LastName, E.OrganizationLevel FROM HumanResources.Employee E 
INNER JOIN Person.Person P ON E.BusinessEntityID = P.BusinessEntityID
WHERE E.OrganizationLevel > 3
GO

-- 8. Seleccione todos los empleados de la tabla Employee del schema Human Resources donde el nivel de organización sea mayor e igual a 2 y que el género sea femenino.
SELECT P.BusinessEntityID, P.FirstName, P.LastName, E.OrganizationLevel FROM HumanResources.Employee E 
INNER JOIN Person.Person P ON E.BusinessEntityID = P.BusinessEntityID
WHERE E.OrganizationLevel >= 2 AND E.Gender = 'F'
GO

-- 9. Selección los campos BusinessEntityID,NationalIDNumber de la tabla Employee del schema Human Resources donde los jobtitle sean Marketing Assistant o Design Engineer. 
SELECT P.BusinessEntityID, P.FirstName, E.NationalIDNumber, E.JobTitle FROM HumanResources.Employee E 
INNER JOIN Person.Person P ON E.BusinessEntityID = P.BusinessEntityID
WHERE E.JobTitle = 'Marketing Assistant' OR E.JobTitle = 'Design Engineer'
GO

-- 10. Seleccionar todos los empleados de la tabla Employee del schema Human Resources que estén entre la fecha de nacimiento de 1 de enero de 1969  y 31 de diciembre de 1972.
SELECT P.BusinessEntityID, P.FirstName, E.BirthDate FROM HumanResources.Employee E 
INNER JOIN Person.Person P ON E.BusinessEntityID = P.BusinessEntityID
WHERE E.BirthDate BETWEEN '1969-1-1' AND '1972-12-31'
GO

-- 11. De la tabla Employee del schema Human Resources Calcule el total de ah pagar por horas de vacacion si se conece que cada hora cuesta $8.00. 
SELECT P.BusinessEntityID, P.FirstName, E.VacationHours, (E.VacationHours * 8.00) AS 'Pay for Vacations' FROM HumanResources.Employee E 
INNER JOIN Person.Person P ON E.BusinessEntityID = P.BusinessEntityID
GO

-- 12. De la tabla Production.ProductSubcategory muestre cuantas subcategorías hay registradas por categoría.
SELECT ProductCategoryID, COUNT(ProductSubcategoryID) AS 'Sub Categories' FROM Production.ProductSubcategory GROUP BY ProductCategoryID
GO

-- 13. De la tabla Sales.Customer mostrar cuantos clientes existen registrados por territorios. 
SELECT TerritoryID, COUNT(CustomerID) AS 'Customers' FROM Sales.Customer GROUP BY TerritoryID
GO

-- 14. De la tabla sales.SalesOrderHeader mostrar la suma total del Sub Total de compra según el IdCustomer que se coloque. 
SELECT CustomerID, SUM(SubTotal) AS 'SubTotal Total' FROM Sales.SalesOrderHeader WHERE CustomerID = '29825' GROUP BY CustomerID
GO
-- 15. De la tabla Sales. CreditCard mostrar cuantas tarjetas según su tipo están registradas en el sistema.
SELECT CardType, COUNT(CreditCardID) AS 'Cards' FROM Sales.CreditCard GROUP BY CardType
GO

-- 16. De la tabla Sales.SalesOrderDetail evaluar Linea total de compra que es el total de la compra , si la compra es mayor de $1000.00 realizar un descuento del 10% y mostrar el nuevo total a pagar si es mayor $1500.00 realizar un descuento del 14% y mostrar el nuevo total a pagar si es mayor de $2000.00 realizar un descuento del 18% y mostrar el nuevo total a pagar. 
SELECT LineTotal AS "Total Order", 
CASE
    WHEN LineTotal > 2000 THEN LineTotal * 0.82
    WHEN LineTotal > 1500 THEN LineTotal * 0.86
    WHEN LineTotal > 1000 THEN LineTotal * 0.90
	ELSE LineTotal
    END AS "Total to Pay"
FROM Sales.SalesOrderDetail
GO