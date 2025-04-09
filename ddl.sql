drop database if exists seneca;
create database seneca;
use seneca;


create table profesor (
    id_profe int auto_increment primary key,
    nombre varchar(100) not null,
    apellidos varchar(100),
    email varchar(100)
);

create table centro (
    id_centro int auto_increment primary key,
    nombre varchar(100)not null,
    direccion varchar(200),
    tlf varchar(20),
    id_profe int,
    constraint fk_profe foreign key (id_profe) references profesor(id_profe) on delete cascade on update cascade
);

create table asignatura (
    id_asig int auto_increment primary key,
    nombre varchar(100)not null,
    curso varchar(50),
    id_profe int,
    constraint fk_asignatura_profesor foreign key (id_profe) references profesor(id_profe) on delete cascade on update cascade
);

create table ra (
    id_ra int auto_increment primary key,
    criterio varchar(100),
    descripcion text,
    id_asig int,
    constraint fk_ra_asignatura foreign key (id_asig) references asignatura(id_asig) on delete cascade on update cascade
);

create table criterio_evaluacion (
    id_ce int auto_increment primary key,
    nombre varchar(100),
    descripcion text,
    ponderacion decimal(5,2),
    id_ra int,
    constraint fk_criterio_ra foreign key (id_ra) references ra(id_ra) on delete cascade on update cascade
);

create table falta_asistencia (
    id_falta int auto_increment primary key,
    fecha date,
    motivo text
 );

create table alumno (
    id_alumno int auto_increment primary key,
    nombre varchar(100)not null,
    apellidos varchar(100),
    dni varchar(20) unique,
    fecha_nac date,
    id_falta int,
    constraint fk_falta foreign key (id_falta) references falta_asistencia(id_falta) on delete cascade on update cascade
);

create table matricula (
    id_matricula int auto_increment primary key,
    id_alumno int,
    id_asig int,
    fecha_matricula date,
    constraint fk_matricula_alumno foreign key (id_alumno) references alumno(id_alumno) on delete cascade on update cascade,
    constraint fk_matricula_asignatura foreign key (id_asig) references asignatura(id_asig) on delete cascade on update cascade
);

create table tarea (
    id_tarea int auto_increment primary key,
    nombre varchar(100) not null,
    tipo varchar(50),
    fecha date,
    estado varchar(20)
);

create table nota (
    id_nota int auto_increment primary key,
    valor_nota decimal(5,2) check 
    (valor_nota >=0 and valor_nota <=10),
    id_alumno int,
    id_tarea int,
    id_ce int,
    constraint fk_nota_alumno foreign key (id_alumno) references alumno(id_alumno) on delete cascade on update cascade,
    constraint fk_ce foreign key (id_ce) references criterio_evaluacion(id_ce) on delete cascade on update cascade,
    constraint fk_nota_tarea foreign key (id_tarea) references tarea(id_tarea) on delete cascade on update cascade
);

