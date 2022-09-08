use Northwind
-- 
select year(OrderDate) as a�o, DATEPART(QUARTER, OrderDate) as trimestre,
round(sum(od.Quantity*od.UnitPrice-(od.Quantity*od.UnitPrice*od.Discount)),2) as recaudacion
from Orders as o inner join [Order Details] as od on od.OrderID=o.OrderID
group by YEAR(OrderDate), DATEPART(QUARTER, OrderDate)
order by a�o, trimestre

select year(OrderDate) as a�o, DATEPART(QUARTER, OrderDate) as trimestre,
round(sum(od.Quantity*od.UnitPrice-(od.Quantity*od.UnitPrice*od.Discount)),2) as recaudacion
from Orders as o inner join [Order Details] as od on od.OrderID=o.OrderID
group by YEAR(OrderDate), DATEPART(QUARTER, OrderDate)
having round(sum(od.Quantity*od.UnitPrice-(od.Quantity*od.UnitPrice*od.Discount)),2)>140000
order by a�o, trimestre

--calcular las recaudaciones por a�os y por mes 
select year(OrderDate) as a�o, DATEPART(MONTH, OrderDate) as mes,
round(sum(od.Quantity*od.UnitPrice-(od.Quantity*od.UnitPrice*od.Discount)),2) as recaudacion
from Orders as o inner join [Order Details] as od on od.OrderID=o.OrderID
group by YEAR(OrderDate), DATEPART(MONTH, OrderDate)
order by a�o, mes

-- recaudacinoes por a��
select year(OrderDate) as a�o,
round(sum(od.Quantity*od.UnitPrice-(od.Quantity*od.UnitPrice*od.Discount)) / COUNT(distinct MONTH(OrderDate)),2) as recaudacion
from Orders as o inner join [Order Details] as od on od.OrderID=o.OrderID
group by YEAR(OrderDate)
order by a�o

--otra cosa
select year(OrderDate) as a�o,
round(sum(od.Quantity*od.UnitPrice-(od.Quantity*od.UnitPrice*od.Discount)),2) as recaudacion
from Orders as o inner join [Order Details] as od on od.OrderID=o.OrderID
group by YEAR(OrderDate)
order by a�o

select year(orderdate), count(distinct DATEPART(month, OrderDate))
from Orders
group by year(orderdate)






