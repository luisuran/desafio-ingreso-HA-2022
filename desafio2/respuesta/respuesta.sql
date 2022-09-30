-- 1
SELECT nombre, altura, fecha FROM `titanes`
INNER JOIN `muertes` ON titanes.id = muertes.id_titan
WHERE causa = "Accidente"
ORDER BY fecha;

-- 2
SELECT nombre, altura FROM `titanes`
INNER JOIN `muertes` ON titanes.id = muertes.id_titan
WHERE causa = "Batallón 1"
ORDER BY altura DESC
LIMIT 1;

-- 3
SELECT nombre, altura, fecha as avistamiento FROM titanes
INNER JOIN avistamientos ON titanes.id = avistamientos.id_titan
WHERE titanes.id NOT IN (SELECT id_titan FROM `muertes`)
ORDER BY altura;

-- 4
SELECT id_titan, YEAR(fecha) as año, COUNT(YEAR(fecha)) as avistamientos FROM `avistamientos`
GROUP BY YEAR(fecha)
HAVING COUNT(YEAR(fecha)) > 1;

-- 5
SELECT recursos.nombre, COUNT(recursos.nombre) AS cantidad, recursos.unidad FROM recursos
INNER JOIN movimientos_recursos on recursos.id = movimientos_recursos.id_recurso
INNER JOIN muertes ON movimientos_recursos.id_muerte = muertes.id
INNER JOIN titanes ON muertes.id_titan = titanes.id
GROUP BY recursos.nombre, recursos.unidad;

-- 6
SELECT recursos.nombre FROM recursos
INNER JOIN movimientos_recursos on recursos.id = movimientos_recursos.id_recurso
INNER JOIN muertes ON movimientos_recursos.id_muerte = muertes.id
INNER JOIN titanes ON muertes.id_titan = titanes.id
WHERE titanes.altura = 9
GROUP BY recursos.nombre
ORDER by COUNT(recursos.nombre) DESC
LIMIT 1;

-- 7
SELECT titanes.nombre FROM muertes
INNER JOIN titanes ON muertes.id_titan = titanes.id
INNER JOIN avistamientos ON titanes.id = avistamientos.id_titan
where avistamientos.fecha > muertes.fecha;

-- 8    
Podrían generarse incongruencias entre la fecha de muerte y avistamiento por:
1. Inexactitud en las observaciones.
2. Inexactitud en la carga de datos.
3. Carga de datos errónea intencionalmente.