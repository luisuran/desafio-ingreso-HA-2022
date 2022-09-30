<?php

// Leo archivo last_year.json
$archivo = file_get_contents(__DIR__ . '/../last_year.json');
$datos = json_decode($archivo);

// Inicializo matriz de dias
$dias = array();

// Recorro los datos
foreach ($datos as $dato) {
    $inicio = $dato[0];
    $fin = $dato[1];

    while ($inicio < $fin) {
        if ($inicio > 30 && $inicio < 334) {    // Ignoro los meses de diciembre y enero

            $inicioActualizado = $inicio > 364 ? $inicio - 365 : $inicio;    // Si es el ultimo dia del año, lo paso al primero
            
            // Si no existe el dia lo agrego a la matriz
            if (!isset($dias[$inicioActualizado])) {
                $dias[$inicioActualizado] = 1;
            } else { // Sino sumo uno al dia
                $dias[$inicioActualizado]++;
            }
        }

        $inicio++;
    }
}

// Ordeno la matriz por menor cantidad de avistamientos
asort($dias);

// Obtengo el primer elemento
$dia = key($dias);

// Calculo fecha correspondiente
$fecha = date('d/m/Y', strtotime('1/1/2022 + ' . $dia . ' days'));

echo "El mejor día para dar salir es el día $dia, que corresponde al $fecha." . PHP_EOL;