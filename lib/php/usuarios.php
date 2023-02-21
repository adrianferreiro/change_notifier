<?php
header("Content-Type: application/json");
$json = file_get_contents('php://input');
$data = json_decode($json);
$accion = $data->accion ?? '';
$correo = $data->correo ?? '';
//pasamos a minúscula
$correo = strtolower($correo);

include "conexion.php";
switch($accion){
    case 'buscar_usuario':
        $sentenciaSQL = $pdo->prepare("SELECT id_usuario, apellido, nombre from usuarios WHERE activo like 'S' AND correo like '$correo'");
        $sentenciaSQL->execute();
        $resultado=$sentenciaSQL->fetchAll(PDO::FETCH_ASSOC);
        if (json_encode($resultado)=='[]'){
            print_r('{"codigo": "0", "detalles": [{"mensaje": "No hay usuarios para mostrar."}]}');
        }else{
            print_r('{"codigo": "1", "detalles": '  .json_encode($resultado).  '}');
        }
        break;
}
?>