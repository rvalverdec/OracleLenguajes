<?php
	
	class Conexion{
		private $db = 'oci:dbname=orcl';
		private $user = 'Douglas';
		private $pass = 'DFfma09yd';


		public function Conectar(){
			
			try{
				$base = new PDO($this->db, $this->user, $this->pass);
				$base -> exec("SET CARACTER SET utf8");

				if($base){
					
					return $base;
				}
			}catch(Exeption $e){
				echo "No se pudo conectar a la base de datos: ".$e->getMessage();
			}

		}
	}
	
?>