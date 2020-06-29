<?php

$date = date('dMYHis');
if (!empty($_POST['ss'])) {
error_log("Screenshot Received" . "\r\n", 3, "log.log");
$data=$_POST['ss'];
$encodedData = str_replace(' ','+',$data);
$decodedData =  base64_decode($encodedData);
file_put_contents("screenshots/screenshot-".$date,$decodedData);
exit();

}


?>
