<?php
require_once('conexionBaseDatos.php');
$conn = new Conexion();
$llamaMetodo = $conn->conectar();


$raza = obtieneInfo("raza");
$peso = obtieneInfo("peso");
$edad = obtieneInfo("edad");
$id = obtieneInfo("idCliente");
$nombreMascota = obtieneInfo("nombreMascota");

function obtieneInfo($var){
    if(!isset($_REQUEST[$var])){

    }else{
        $retorna = $_REQUEST[$var];

    }

    return $retorna;

}



    
try{
    $sql = "insert into mascota(raza,peso,edad,id_cliente, nombre) values (?,?,?,?,?)";
    $stmt = $llamaMetodo->prepare($sql);


    
    $stmt->bindParam(1, $raza);
    $stmt->bindParam(2, $peso);
    $stmt->bindParam(3, $edad);
    $stmt->bindParam(4, $id);
    $stmt->bindParam(5, $nombreMascota);



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