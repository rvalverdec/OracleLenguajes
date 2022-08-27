<?php
require_once('conexionBaseDatos.php');
$conn = new Conexion();
$llamaMetodo = $conn->conectar();

$nombre = obtieneInfo("nombre");
$apellido1 = obtieneInfo("apellido1");
$telefono = obtieneInfo("telefono");
$correo = obtieneInfo("correo");
$apellido2 =  obtieneInfo("apellido2");

function obtieneInfo($var){
    if(!isset($_REQUEST[$var])){

    }else{
        $retorna = $_REQUEST[$var];

    }

    return $retorna;

}

    

    
try{
    $sql = "call P_INSERTA_CLIENTE ('$correo','$telefono','$nombre','$apellido1','$apellido2')";
    $stmt = $llamaMetodo->prepare($sql);



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