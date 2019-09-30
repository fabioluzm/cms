<?php

$statData = (object) array(
	'status' => '0',
	'data' => ''
);

try {
	if (count($_REQUEST) == 0)
	throw new Exception(
		"Erro inesperado! Por favor tente mais tarde.\n\n
		Unexpected Error! Please try again later."
	);

	foreach ($_REQUEST as $key => $value) {
		$_REQUEST[$key] = htmlspecialchars($value);
		$_REQUEST[$key] = trim($value);
	}

	extract($_REQUEST);


	if ($email == 'fabiomoreira.ram@gmail.com') {

		$toOurEmail = "fabiomoreira.ram@gmail.com";
		$ourEmail = "From: noreply@fabiomoreira.ram.com";

	} else if ($email == 'desmilessanctum@gmail.com') {

		$toOurEmail = "desmilessanctum@gmail.com";
		$ourEmail = "From: noreply@desmilessanctum.com";

	} else {

		$toOurEmail = "info@reismarreiroslda.com";
		$ourEmail = "From: noreply@reismarreiroslda.com";

	}

	$clientEmail = "From: " . $email;


	switch ($lang) {
		case 'pt':
			$returnmsg = "Obrigado pela sua mensagem, " . $nome . ". Entraremos em contacto brevemente.";
			$msg = "Foi recebida a seguinte mensagem: \nNome: " . $nome . "\nE-mail: " . $email . "\nEmpresa: " . $empresa . "\nContacto: " . $telefone . "\nMensagem: " . $mensagem;
			$error = "O email não pode ser enviado. Por favor tente mais tarde.";
			break;

			case 'en':
			$returnmsg = "Thank you for your message, " . $nome . ". We will do our best to come back to you soon.";
			$msg = "Name: " . $nome . "\nE-mail: " . $email . "\nCompany: " . $empresa . "\nContact: " . $telefone . "\nMessage: " . $mensagem;
			$error = "Email could not be sent. Please try again later.";
			break;
		}

		$returnAssuntoMail = 'Auto-Reply - Reis & Marreiros, Lda: "Aplicação Perdidos & Achados"';


	$peaSendMail = mail($toOurEmail, $returnAssuntoMail, $msg, $clientEmail);

	if (!$peaSendMail)
	throw new Exception($error);

	$sendReply = mail($email, $returnAssuntoMail, $returnmsg, $ourEmail);

	if (!$sendReply)
	throw new Exception($error);

	$statData->data = $returnmsg;

}

catch (Exception $e) {
	$statData->status = 1;
	$statData->data = $e->getMessage();
}

echo json_encode((array) $statData);

?>
