create database Practica
go
use Practica 
go

create table Persona(
	nombre varchar (80),
	apellido varchar (80),
	dni int
)

insert into Persona(nombre, apellido, dni) values ('Martin', 'Marquesi', 26125988)
insert into Persona(nombre, apellido, dni) values ('Pablo', 'Marquesi', 25485699)
insert into Persona(nombre, apellido, dni) values ('Roberto', 'Sanchez', 20566401)
insert into Persona(nombre, apellido, dni) values ('Estefania', 'Guissini', 27128064)
insert into Persona(nombre, apellido, dni) values ('Ruben', 'Alegrato', 24238975)
insert into Persona(nombre, apellido, dni) values ('Sandra', 'Britte', 25833669)
insert into Persona(nombre, apellido, dni) values ('Melisa', 'Ardul', 27456224)
insert into Persona(nombre, apellido, dni) values ('Soledad', 'Michelli', 29889656)
insert into Persona(nombre, apellido, dni) values ('Betania', 'Musachegui', 27128765)
insert into Persona(nombre, apellido, dni) values ('Juan', 'Serrat', 28978845)

select * from Persona

backup database Practica
to disk = 'D:\Algo\practica.bak'

--use Practica

select nombre from Persona where apellido='Marquesi'

select nombre
as [Primer nombre]
from Persona
where apellido='Marquesi'

select nombre, dni
from Persona
where dni between 26000000 and 28000000

select nombre 
from Persona
where (nombre like 'P%') or (nombre like '______')

select distinct apellido
from Persona

-- nueva tabla
create table Jugadores(
	dni int,
	Puesto varchar(18),
	nro_camiseta int
)

insert into Jugadores(dni, Puesto ,nro_camiseta) values (26125988, 'Delantero', 9)
insert into Jugadores(dni, Puesto ,nro_camiseta) values (25485699, 'Medio', 5)
insert into Jugadores(dni, Puesto ,nro_camiseta) values (28978845, 'Arquero', 1)
insert into Jugadores(dni, Puesto ,nro_camiseta) values (29789854, 'Defensor', 3)

--repuesta 3.8
select nombre, apellido
from Persona
where apellido='Marquesi'
union
select nombre, apellido
from Persona
where apellido ='Serrat'

-- union elimina duplicados, union all recupera todos

select distinct dni
from Persona
where exists
(select *
from Jugadores
where Persona.dni=Jugadores.dni)

select distinct nombre
from Persona inner join Jugadores
on Persona.dni = Jugadores.dni

select nombre, apellido
from persona where dni
in (select dni from Jugadores)

select nombre, apellido
from persona 
where exists 
(select dni 
from Jugadores
where dni='27128055')

select nombre, apellido
from persona 
where exists 
(select dni 
from Jugadores
where dni='26125988')

select apellido, nombre
from Persona
order by apellido desc, nombre desc

--tabla de jugadores profesionales
create table Pro(
	dni int,
	años_pro int,
	club varchar (20),
	valor_actual int
)

insert into pro values (26125988,5,'All Boys', 1000)
insert into pro values (25485699,2,'All Boys', 2500)
insert into pro values (27126045,3,'Lanus', 12000)
insert into pro values (26958644,4,'Lanus', 6500)
insert into pro values (29120791,1,'Lanus', 450)

select club, SUM(valor_actual) as [Valor total], COUNT(club) as [Numero de jugadores]
from Pro
group by club

select club, MAX(valor_actual) as [Jugador mas caro]
from Pro
group by club 

select club, max(valor_actual) as [Jugador mas caro]
from Pro
group by club
having MAX(valor_actual) > 10000

--use Practica
delete from Persona
where apellido='Britte'

insert into Persona(nombre, dni, apellido)
values ('Sandra', 25483669, 'Britte')

update Jugadores 
set nro_camiseta=7
where nro_camiseta=5

insert into Jugadores
values (26356312, 'Defensor', null)

--creacion de tabla lesionados
create table Lesionado(
	Nombre char (20),
	Apellido char (20),
	TIempo_Inhabit integer 
)
drop table Persona

alter table Jugadores add Nombre char(50)
select * from Jugadores

alter table Jugadores add Apellido char(50)
select * from Jugadores
