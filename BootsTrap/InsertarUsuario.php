<?php
require_once('conexionBaseDatos.php');
$conn = new Conexion();
$llamaMetodo = $conn->conectar();

$nombre = obtieneInfo("nombre");
$apellido1 = obtieneInfo("apellido1");
$telefono = obtieneInfo("telefono");
$correo = obtieneInfo("correo");

function obtieneInfo($var){
    if(!isset($_REQUEST[$var])){

    }else{
        $retorna = $_REQUEST[$var];

    }

    return $retorna;

}



    
try{
    $sql = "INSERT INTO CLIENTE(NOMBRE_CLI, CORREO, TELEFONO, APELLIDO1)VALUES (?,?,?,?)";
$stmt = $llamaMetodo->prepare($sql);


$stmt->bindParam(1, $nombre);
$stmt->bindParam(2, $correo);
$stmt->bindParam(3, $telefono);
$stmt->bindParam(4, $apellido1);



$stmt -> execute();


if($stmt){
   echo "Se completo la insercion";
}else{
   echo "Nel perro";
}
}catch(PDOException $e){
    echo "My Error Type:". $e->getMessage();
}


?>