<?php
/*
$ipsExceptions = ['79.168.29.156', '192.168.2.38', '192.168.2.20', '192.168.2.21', '192.168.2.22'];
$userIp = $_SERVER['REMOTE_ADDR'];
$localIp = $_SERVER['LOCAL_ADDR'];
$serverSecure = isset($_SERVER['HTTPS']) ? 'https' : 'http';
$serverPath = sprintf("%s://%s", $serverSecure, $_SERVER['SERVER_NAME']);
$serverUrl = sprintf("%s%s", $serverPath, $_SERVER['REQUEST_URI']);

$urlvalida = '/'.'ramlagos.com'.'/';
$url = '://'.$_SERVER['HTTP_HOST'];

$dev = 0;
if (preg_match($urlvalida, $url)) {
	$dev = 1;
}

if (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] != "on") {
	header("Location: $serverUrl");
	exit;
}
*/

// if (in_array($userIp, $ipsExceptions) || (in_array($localIp, $ipsExceptions))) {
// 	ini_set('display_errors', 1);
// 		error_reporting(E_ERROR | E_WARNING | E_PARSE);
// }


function call_http_request(string $webservice, string $type = 'get', array $params = []) {
    $ch = curl_init();

    curl_setopt($ch, CURLOPT_URL, $webservice);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);

    if ($type == 'post') {
        curl_setopt($ch, CURLOPT_POST, true);

        if (count($params)) {
            curl_setopt($ch, CURLOPT_POSTFIELDS, $params);
        }
    }

    $response = curl_exec($ch);
    curl_close($ch);

    return $response;
}

function isJson($string) {
    json_decode($string);
    return (json_last_error() == JSON_ERROR_NONE);
}

function checkEncode($field) {
	return mb_check_encoding ( $field, 'UTF-8' ) ? $field : utf8_encode($field);
}

function PHPMail($webservices, $from, $to, $subject, $body, array $attachments = []) {
	$from = checkEncode($from);
	$to = checkEncode($to);
	$subject = checkEncode($subject);
	$body = checkEncode($body);

	foreach ($attachments as $key => $value) {
		$value['file'] = checkEncode($value['file']);
		$value['fileName'] = checkEncode($value['fileName']);

		$attachments[$key] = $value;
	}

	$emailParams = [
		'to' => $to,
		'from' => $from,
		'subject' => $subject,
		'body' => $body,
		'attachments' => $attachments
	];

	$serParams = [
		'params' => json_encode($emailParams)
	];

	$webService = sprintf('%s/email_service.cfc?method=sendEmail', $webservices);

	$sendEmail = call_http_request($webService, 'post', $serParams);

	$return = json_decode($sendEmail);

	return $return;
}

function dump($var) {
	echo '<pre style="background-color: white;">';
	print_r($var);
	echo '</pre>';
}



?>