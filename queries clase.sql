use Northwind
-- 
select year(OrderDate) as año, DATEPART(QUARTER, OrderDate) as trimestre,
round(sum(od.Quantity*od.UnitPrice-(od.Quantity*od.UnitPrice*od.Discount)),2) as recaudacion
from Orders as o inner join [Order Details] as od on od.OrderID=o.OrderID
group by YEAR(OrderDate), DATEPART(QUARTER, OrderDate)
order by año, trimestre

select year(OrderDate) as año, DATEPART(QUARTER, OrderDate) as trimestre,
round(sum(od.Quantity*od.UnitPrice-(od.Quantity*od.UnitPrice*od.Discount)),2) as recaudacion
from Orders as o inner join [Order Details] as od on od.OrderID=o.OrderID
group by YEAR(OrderDate), DATEPART(QUARTER, OrderDate)
having round(sum(od.Quantity*od.UnitPrice-(od.Quantity*od.UnitPrice*od.Discount)),2)>140000
order by año, trimestre

--calcular las recaudaciones por años y por mes 
select year(OrderDate) as año, DATEPART(MONTH, OrderDate) as mes,
round(sum(od.Quantity*od.UnitPrice-(od.Quantity*od.UnitPrice*od.Discount)),2) as recaudacion
from Orders as o inner join [Order Details] as od on od.OrderID=o.OrderID
group by YEAR(OrderDate), DATEPART(MONTH, OrderDate)
order by año, mes

-- recaudacinoes por añó
select year(OrderDate) as año,
round(sum(od.Quantity*od.UnitPrice-(od.Quantity*od.UnitPrice*od.Discount)) / COUNT(distinct MONTH(OrderDate)),2) as recaudacion
from Orders as o inner join [Order Details] as od on od.OrderID=o.OrderID
group by YEAR(OrderDate)
order by año

--otra cosa
select year(OrderDate) as año,
round(sum(od.Quantity*od.UnitPrice-(od.Quantity*od.UnitPrice*od.Discount)),2) as recaudacion
from Orders as o inner join [Order Details] as od on od.OrderID=o.OrderID
group by YEAR(OrderDate)
order by año

select year(orderdate), count(distinct DATEPART(month, OrderDate))
from Orders
group by year(orderdate)






