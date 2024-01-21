<?php
define('HOST', 'localhost');
define('USER', 'root');
define('PASS', '');
define('DB', 'db_uas');
$connect = mysqli_connect(HOST, USER, PASS, DB) or die('Not Connect');
?>


<?php
//For Running
$username = $_POST['username'];
$password = $_POST['password'];

//For Testing
//$username = 'akhyar';
//$password = 'akhyar';

$queryResult = $connect->query("SELECT * FROM user
WHERE username='" . $username . "' and password='" . $password . "'");
$result = array();

while ($fetchData = $queryResult->fetch_assoc()) {
    $result[] = $fetchData;
}

//Send back data to Flutter
if ($result) {
    echo json_encode($result);
} else {
    echo json_encode('');
}
?>