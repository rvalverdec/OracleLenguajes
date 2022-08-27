<?php
require_once('conexionBaseDatos.php');
$conn = new Conexion();
$llamaMetodo = $conn->conectar();


$raza = obtieneInfo("raza");
$peso = obtieneInfo("peso");
$edad = obtieneInfo("edad");
$id = obtieneInfo("idCliente");
$nombreMascota = obtieneInfo("nombreMascota");
$animal = obtieneInfo("animal");

function obtieneInfo($var){
    if(!isset($_REQUEST[$var])){

    }else{
        $retorna = $_REQUEST[$var];

    }

    return $retorna;

}



    
try{
    $sql = " CALL P_INSERTA_MASCOTA('$nombreMascota','$raza', '$animal', $peso, $edad, $id)";
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