<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>Page Title</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel='stylesheet' type='text/css' media='screen' href='main.css'>
    <script src='main.js'></script>
    <!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
</head>
<body>

    
<ul class="nav ">
    <li class="nav-item dropdown" >
      <a class="nav-link active dropdown-toggle" data-bs-toggle="dropdown" aria-current="page" href="#">Mascotas</a>
      <ul class="dropdown-menu">
        <li ><a  class="dropdown-item" href="FormMacota.html">Ingresesar mascota</a></li>
        <li class="dropdown-item" ><a  class="dropdown-item" href="MuestraMascotas.php">Lista Mascotas</a></li>
        <li class="dropdown-item"><a class="dropdown-item" href="vacunacion.php">Buscar datos de mascota</a></li>
        <li class="dropdown-item"><a class="dropdown-item" href="DetalleVacuna.php">Vista detallada</a></li>
      </ul>
    </li>
    <li class="nav-item dropdown">
      <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false">Clientes</a>
      <ul class="dropdown-menu">
        <li class="dropdown-item" ><a class="dropdown-item" href="FormClientes.html">Ingresar Cliente</a></li>
        <li class="dropdown-item"><a class="dropdown-item" href="MuestraClientes.php">Mostrar Clientes</a></li>
      </ul>
    </li>
    <li class="nav-item dropdown">
      <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false">Administracion</a>
      <ul class="dropdown-menu">
        <li class="dropdown-item" ><a class="dropdown-item" href="Bitacora mascota.php">Modificacion Macotas</a></li>
        <li class="dropdown-item"><a class="dropdown-item" href="AuditaRole.php">Control de roles</a></li>
        <li class="dropdown-item"><a class="dropdown-item" href="salario.php">Control de Salario</a></li>
      </ul>
    </li>
  </ul>

  <?php
      require "conexionBaseDatos.php";
      $conn = new Conexion();
      $llamaMetodo = $conn->Conectar();
  
  
      
      $sql =" SELECT * FROM LISTA_CLIENTES";
      $stmt = $llamaMetodo -> prepare($sql);
      $stmt -> execute();
      
      imprimeDatos($stmt);

      function ImprimeDatos($stmt)
            {
                imprimeTabla($stmt);
            }
            
            function imprimeTabla($stmt)
            {
              echo "<table class='table'>";
              echo "<thead>";
              echo "<tr>";
              echo "<th scope='col'>Cliente</th>";
              echo "<th scope='col'>Nombre Macota</th>";
              echo "<th scope='col'>Raza</th>";
              echo "<th scope='col'>Animal</th>";
              echo "<th scope='col'>Nombre de vacuna</th>";
              echo "</tr>";
              echo "</thead>";
                if (true) {
                    echo "<tbody>";
                    echo "<tr>";
                    while ($row = $stmt->fetch()) {
                        
                        echo "<th scope='row'>".$row["NOMBRE COMPLETO"]."</th>";
                        echo "<td>".$row['NOMBRE_MASCOTA']."</td>";
                        echo "<td>".$row['RAZA']."</td>";
                        echo "<td>".$row['TIPO_ANIMAL']."</td>";
                        echo "<td>".$row['NOMBRE_VACUNA']."</td>";
                        
                        echo "</tr>";
                    }
                } else {
                    echo "<tr>";
                    echo " <th> No se pueden mostrar las citas aún, dado que no hay registros </th>";
                    echo "</tr>";
                    //    echo "0 Filas";
                }
                echo "</tbody>";
                echo "</table>";
            }
          

  ?>


  
    
        
      <!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
    

</body>
</html>