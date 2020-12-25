<?php
include 'conn.php';

 $queryResult = $connect->query("SELECT * FROM kategori k JOIN post p ON k.id = p.idkategori JOIN users u ON p.idpenulis = u.id WHERE p.idkategori = k.id");
//$queryResult = $connect->query("SELECT * FROM kategori k JOIN post p ON k.id = p.idkategori WHERE p.idkategori = k.id");

$result = array();

while ($fetchData = $queryResult->fetch_assoc()) {
	# code...
	$result[]=$fetchData;
}

echo json_encode($result);

?>