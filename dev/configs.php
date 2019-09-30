<?php

include_once 'lib.php';
include_once 'portfolio.php' ;
include_once 'team.php';

$serverSecure = isset($_SERVER['HTTPS']) ? 'https' : 'http';
$serverPath = sprintf("%s://%s", $serverSecure, $_SERVER['SERVER_NAME']);
$serverUrl = sprintf("%s%s", $serverPath, $_SERVER['REQUEST_URI']);

if (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] != "on") {
	header("Location: $serverUrl");
 	exit;
}

session_start();

$userIp = $_SERVER['REMOTE_ADDR'];
//$localIp = $_SERVER['LOCAL_ADDR'];

$webservices = 'http://services.reismarreiroslda.com/';
$systemEmail = "reismarreiroslda@gmail.com@gmail.com";

if (isset($_GET['flush'])) {
	unset($_SESSION['ipsExceptions']);
}

// Get RAM Ips definitions - Begin

if (!isset($_SESSION['ipsExceptions'])) {
    $getRAMIps = call_http_request(sprintf('%s/IPS_service.cfc?method=IPSservices', $webservices));

    $_SESSION['ipsExceptions'] = [];

    if (isJson($getRAMIps)) {
        $data = json_decode($getRAMIps);
        $_SESSION['ipsExceptions'] = $data->data;
    }
}

// Get RAM Ips definitions - End

if (strpos($_SERVER['HTTP_HOST'], 'localhost') > -1 || strpos($_SERVER['HTTP_HOST'], '127.0.0.1') > -1) {
	$webservices = 'http://dev.ramlagos.com/services';
	$systemEmail = "reismarreiroslda@gmail.com";

} else if (strpos($_SERVER['HTTP_HOST'], 'ramlagos.com') > -1) {
	$webservices = 'http://dev.ramlagos.com/services';
	$systemEmail = "reismarreiroslda@gmail.com";
}

if (in_array($userIp, $_SESSION['ipsExceptions'])) {
	$systemEmail = "reismarreiroslda@gmail.com";
}
?>
