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

--restore database Taller
--from disk = 'D:\Algo\RespaldoTaller.bak'
--with replace 

-- parte 2 de la guia

insert into Cliente(Primer_Nombre, Primer_Apellido, Cedula, Correo)
values ('Pedro', 'Romero','001-122112-0029N', 'pedro@gmail.com')

select * from Cliente

insert into Cliente(Primer_Nombre, Primer_Apellido, Cedula, Correo)
values ('Ana', 'Fuentes','001-120394-0259N', 'ana@gmail.com')

exec sp_rename 'Cliente.Primar_Apellido', 'Primer_Apellido'

insert into Cliente(Primer_Nombre, Primer_Apellido, Cedula, Correo)
values ('Ana', 'de Armas','001-190924-0659N', 'ana2@gmail.com')

update Cliente set Correo='pedro@hotmail.com' 
where IdCliente=0

delete from Cliente where IdCliente = 2

delete from Cliente

use master
drop database Taller

restore headeronly from disk ='D:\algo\RespaldoTaller.bak'

restore filelistonly from disk = 'D:\algo\RespaldoTaller.bak'

-- Guia numero 3
restore database Taller
from disk ='D:\algo\RespaldoTaller.bak'
with replace 

use Taller

select * from Cliente

insert into Cliente values ('Larry','Munguia','001-123456-0098V','larrymunguia@gmail.com')

restore headeronly from disk = 'D:\algo\RespaldoTaller.bak'

--restore database Taller
--from disk ='D:\algo\RespaldoTaller.bak'
--with replace 

--use Taller

--select * from Cliente

Backup database Taller to disk = 'D:\algo\RespaldoTaller.bak'
with name = 'Respaldo diferencial de la BD taller',
description = 'Respaldo dif 18/08/22',
differential 

backup log Taller to disk ='D:\algo\RespaldoTaller.bak'

restore headeronly from disk = 'D:\algo\RespaldoTaller.bak'
restore filelistonly from disk = 'D:\algo\RespaldoTaller.bak'

use master
drop database Taller

restore database taller
from disk = 'D:\algo\RespaldoTaller.bak'
with 
move 'Taller' to 'D:\algo\Taller.mdf',
move 'Taller_log' to 'D:\algo\Taller_log.ldf'

use taller
go

select * from Cliente
delete from Cliente where IdCliente = 2

select * from Vehiculo
delete from Vehiculo

use master
exec sp_detach_db taller

exec sp_attach_db taller,
'D:\algo\Taller.mdf',
'D:\algo\Taller_log.ldf'
