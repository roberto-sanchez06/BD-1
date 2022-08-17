create database Taller 

use Taller 

create table Cliente(
	IdCliente int primary key identity (0,1),
	Primer_Nombre varchar (80),
	Primar_Apellido varchar (80),
	Cedula varchar (80),
	Correo varchar (80),
)
go

create table Mecanico(
	IdMecanico int primary key identity (0,1),
	Primer_Nombre varchar (80),
	Primer_Apellido varchar (80),
	Cedula varchar (80),
	Correo varchar (80),
)
go

create table Servicio(
	IdServicio int primary key identity (0,1),
	Descripcion varchar (80),
	Precio money,
	Tipo_Mantenimiento varchar (80)
)
go

create table Vehiculo(
	IdVehiculo int primary key identity (0,1),
	IdCliente int,
	Marca varchar (50),
	Modelo varchar (50),
	Año int 
)
go

create table Repuesto(
	IdRepuesto int primary key identity (0,1),
	Titulo varchar (80),
	Descripcion varchar (100),
	Marca varchar (50),
	Modelo varchar (50),
	Precio money,
)
go

create table Mantenimiento(
	IdMantenimiento int primary key identity (0,1),
	IdVehiculo int,
	Fecha_Ingreso date,
	Fecha_Salida date,
)
go

create table Servicio_Mantenimiento(
	IdServicio_Mantenimiento int primary key identity (0,1),
	IdMantenimiento int,
	IdServicio int,
	IdMecanico int,
	Costo money,
)
go

create table Servicio_Repuesto(
	IdServicio_Mantenimiento int not null,
	IdRepuesto int not null,
	Costo money,
	Cantidad int,
	primary key (IdServicio_Mantenimiento, IdRepuesto)
)
go

--drop table Servicio_Repuesto

alter table Vehiculo
add foreign key (IdCliente) references Cliente(IdCliente)

alter table Mantenimiento
add foreign key (IdVehiculo) references Vehiculo(IdVehiculo)

alter table Servicio_Mantenimiento
add foreign key (IdMantenimiento) references Mantenimiento(IdMantenimiento)

alter table Servicio_Mantenimiento 
add foreign key (IdMecanico) references Mecanico(IdMecanico)

alter table Servicio_Mantenimiento 
add foreign key (IdServicio) references Servicio(IdServicio)

alter table Servicio_Repuesto 
add foreign key (IdServicio_Mantenimiento) references Servicio_Mantenimiento(IdServicio_Mantenimiento)

alter table Servicio_Repuesto 
add foreign key (IdRepuesto) references Repuesto(IdRepuesto)

Backup database Taller
to disk = 'D:\Algo\RespaldoTaller.bak'
