use seneca;

-- Nota media del RA1 de la asignatura “Bases de datos” por cada alumno
select  
    a.id_alumno,
    a.nombre,
    a.apellidos,
    round(avg(n.valor_nota),1) as nota_media_ra1
from nota n
join criterio_evaluacion ce on n.id_ce = ce.id_ce
join ra r on ce.id_ra = r.id_ra
join asignatura asig on r.id_asig = asig.id_asig
join alumno a on n.id_alumno = a.id_alumno
where r.criterio = 'RA1'
  and asig.nombre = 'Bases de datos'
group by a.id_alumno, a.nombre, a.apellidos;

-- Nombre y apellidos del alumno que ha obtenido mayor nota en cualquier criterio de
-- evaluación de cualquier módulo profesional (o asignatura)
select 
    a.nombre,
    a.apellidos,
    n.valor_nota
from nota n
join alumno a on n.id_alumno = a.id_alumno
where n.valor_nota = (
    select max(valor_nota) from nota
);

-- Nota media de una asignatura cualquiera
select 
    a.nombre as asignatura,
    round(avg(n.valor_nota),1) as nota_media
from asignatura a
join matricula m on a.id_asig = m.id_asig
join nota n on m.id_alumno = n.id_alumno
where a.id_asig = 1  
group by a.nombre;

-- Nota media de expediente académico para cada alumno
select 
    al.nombre as alumno,
    al.apellidos,
    round(avg(n.valor_nota),2) as nota_media_expediente
from alumno al
join matricula m on al.id_alumno = m.id_alumno
join nota n on m.id_alumno = n.id_alumno
group by al.id_alumno, al.nombre, al.apellidos;

-- Muestra el/los RA con mayor número de criterios
select 
    ra.criterio, 
    count(ce.id_ce) as num_criterios
from ra
join criterio_evaluacion ce on ra.id_ra = ce.id_ra
group by ra.id_ra, ra.criterio
order by num_criterios desc
limit 1;

-- Para el alumno cuyo primer ID es 1 muestra la nota final por cada módulo
-- profesional

select 
    a.nombre as asignatura,
    avg(n.valor_nota) as nota_final
from alumno al
join matricula m on al.id_alumno = m.id_alumno
join asignatura a on m.id_asig = a.id_asig
left join nota n on al.id_alumno = n.id_alumno
where al.id_alumno = 1
group by a.id_asig, a.nombre;

-- Muestra todos los RA suspensos para cada alumno. El listado debe incluir nombre
-- completo del alumno, nombre del módulo y descripción del RA
select 
    concat(al.nombre, ' ', al.apellidos) as nombre_completo_alumno,
    a.nombre as nombre_modulo,
    ra.descripcion as descripcion_RA
from alumno al
join nota n on al.id_alumno = n.id_alumno
join criterio_evaluacion ce on n.id_ce = ce.id_ce
join ra on ce.id_ra = ra.id_ra
join asignatura a on ra.id_asig = a.id_asig
where n.valor_nota < 5
order by al.nombre, al.apellidos, a.nombre;

-- Muestra el nombre del profesor que tiene la asignatura con mayor número de
-- suspensos
select 
    p.nombre as nombre_profesor
from asignatura a
join profesor p on a.id_profe = p.id_profe
join ra r on a.id_asig = r.id_asig
join criterio_evaluacion ce on r.id_ra = ce.id_ra
join nota n on ce.id_ce = n.id_ce
where n.valor_nota < 5
group by a.id_asig, p.nombre
order by count(n.id_nota) desc
limit 1;

-- Muestra los alumnos matriculados en el IES Los Alcores
select 
    al.nombre as nombre_alumno,
    al.apellidos as apellidos_alumno,
    al.dni as dni_alumno,
    al.fecha_nac as fecha_nac_alumno
from alumno al
join matricula m on al.id_alumno = m.id_alumno
join asignatura a on m.id_asig = a.id_asig
join profesor p on a.id_profe = p.id_profe
join centro c on p.id_profe = c.id_profe
where c.nombre = 'IES Los Alcores';
