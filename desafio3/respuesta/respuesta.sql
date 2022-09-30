create table responsables (
    id int not null auto_increment,
    nombre varchar(255) not null,
    primary key (id)
);


alter table avistamientos add column id_responsable int not null;
alter table avistamientos add column hora timestamp not null;

alter table movimientos_recursos add column id_responsable int not null;



-- Persona que más titanes mató durante el año 2020
select responsables.nombre, count(responsables.nombre) as cantidad from responsables
inner join movimientos_recursos on responsables.id = movimientos_recursos.id_responsable
inner join muertes ON movimientos_recursos.id_muerte = muertes.id
where year(muertes.fecha) = 2020
group by responsables.nombre
order by cantidad desc
limit 1;