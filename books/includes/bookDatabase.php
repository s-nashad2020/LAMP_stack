<?php
$servername = "127.0.0.1";
$username = "root";
$password = "root";
$dbname = "mysqldb";

$bookconn = mysqli_connect($servername, $username, $password, $dbname );
// Check connection
if (!$bookconn) {
    die("Connection failed: " . mysqli_connect_error());
}

?>