/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
 SELECT P.name, C.name
 FROM products as P
 INNER JOIN CATEGORIES AS C 
 ON P.CategoryID = C.CategoryID
 WHERE C.Name = 'Computers';

/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
 SELECT P.name as ProductName, P.price as ProductPrice, R.rating as ProductRating
 FROM products as P
 INNER JOIN reviews as R ON P.ProductID = R.ProductID 
 WHERE R.Rating = 5;
 
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
SELECT E.FirstName, E.MiddleInitial, E.LastName, SUM(S.quantity) AS TOTAL
FROM sales as S
INNER JOIN employees as E ON E.employeeID = S.EmployeeID
GROUP BY E.employeeID
ORDER BY TOTAL desc
LIMIT 1;
 
/* joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT D.name as DepartmentName, C.name as CategoryName 
FROM categories as C
INNER JOIN departments AS D ON C.DepartmentID = D.DepartmentID
WHERE 
	C.Name LIKE '%Appliances%' OR 
    C.Name LIKE '%Games%';
    
/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
SELECT P.Name, SUM(Sales.Quantity) as TotalNumSold, SUM(Sales.PricePerUnit) as TotalPriceSold 
FROM SALES
INNER JOIN products as P ON P.ProductID = Sales.ProductID
WHERE P.Name LIKE '%Eagles: Hotel California%';
/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */


-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return the employeeID, the employee's first and last name, the name of each product, how many of that product they sold */
SELECT E.EmployeeID, E.FirstName, E.LastName, P.Name, SUM(S.Quantity)
FROM sales AS S
INNER JOIN employees AS E ON E.EmployeeID = S.EmployeeID
INNER JOIN products AS P ON  P.ProductID = S.ProductID
GROUP BY E.EmployeeID;

