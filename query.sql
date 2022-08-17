create database Empresa
go 

use Empresa
go

create table Producto(
	IdProducto int primary key,
	Nombre_producto varchar(80),
	Precio money,
) 
go

create table Orden(
	IdOrden int primary key,
	IdCliente int,
	Fecha date,
)
go

create table Cliente(
	IdCliente int primary key,
	Nombre varchar (80),
	Estado varchar (80),
)
go

create table Detalle_Orden(
	IdOrden int not null,
	IdProducto int not null,
	Cantidad int,
	Precio_venta money
)
go

alter table Orden
add foreign key(IdCliente)
references Cliente(IdCliente)

alter table Detalle_Orden
add foreign key (IdProducto)
references Producto(IdProducto)

alter table Detalle_Orden
alter column IdOrden int not null

alter table Detalle_Orden
alter column IdProducto int not null

alter table Detalle_Orden
add primary key (IdOrden, IdProducto)

--drop database Empresa
