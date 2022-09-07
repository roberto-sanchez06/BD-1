use Northwind

select e.FirstName, count(od.OrderID) as [Productos vendidos]
from Employees as e inner join Orders as o on e.EmployeeID = o.EmployeeID
inner join [Order Details] as od on od.OrderID = o.OrderID
group by e.FirstName
having count(od.OrderID)=4

-- version de clase
select distinct e.FirstName
from Orders as o inner join [Order Details] as od on od.OrderID = o.OrderID
inner join Employees e on e.EmployeeID = o.EmployeeID
group by e.FirstName, o.OrderID
having count(od.OrderID)=4

