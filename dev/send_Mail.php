<?php include ('configs.php'); ?>

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

# $button
# 0 = formulario
# 1 - email snippet

/*
	$toOurEmail = "info@reismarreiroslda@gmail.com";
	if ($dev == 1)
		$toOurEmail = "reismarreiroslda@gmail.com";
*/
    $ourEmail = "noreply@reismarreiroslda.com";
    $assuntoMail = "Reis e Marreiros: " . $assunto;
    $clientEmail = $email;


	switch ($button) {
		case 0:
			switch ($lang) {
				case 'pt':
					$returnmsg = "Obrigado pela sua mensagem, " . $nome . ". Entraremos em contacto brevemente.";
					$msg = "Foi recebida a seguinte mensagem: <br> Nome: " . $nome . "<br> E-mail: " . $email . "<br> Assunto: " . $assunto . "<br> Serviço: " . $servicos . "<br> Descrição: " . $descricao;
					$returnAssuntoMail = "Auto-Reply - Reis & Marreiros, Lda: " . $assunto;
					$error = "O email não pode ser enviado. Por favor tente mais tarde.";
					break;

				case 'en':
					$returnmsg = "Thank you for your message, " . $nome . ". We will do our best to come back to you soon.";
					$msg = "Name: " . $nome . "<br> E-mail: " . $email . "<br> Subject: " . $assunto . "<br> Service: " . $servicos . "<br> Description: " . $descricao;
					$returnAssuntoMail = "Auto-Reply - Reis & Marreiros, Lda: " . $assunto;
					$error = "Email could not be sent. Please try again later.";
					break;
			}
			break;
		case 1:
			switch ($lang) {
				case 'pt':
					$returnmsg = "Obrigado pelo seu interesse nos nossos serviços. <br> O seu pedido de contacto foi recebido e entraremos em contacto consigo brevemente.";
					$msg = "Foi recebido o seguinte e-mail para pedido de contacto:<br> " . $email;
					$returnAssuntoMail = "Auto-Reply - Reis & Marreiros, Lda: Pedido de Contacto.";
					$error = "O email não pode ser enviado. Por favor tente mais tarde.";
					break;

				case 'en':
					$returnmsg = "Thank you for your interessent in our services. <br> Your request for contact has been received and we are going to do our best to come back to you soon";
					$msg = "The following e-mail was sent for a follow-up contact:<br> " . $email;
					$returnAssuntoMail = "Auto-Reply - Reis & Marreiros, Lda: Contact Request.";
					$error = "Email could not be sent. Please try again later.";
					break;
			}
			break;
	}

/*
	$sendMail = mail($toOurEmail, $returnAssuntoMail, $msg, $clientEmail);

	if (!$sendMail)
	throw new Exception($error);

	$sendReply = mail($email, $returnAssuntoMail, $returnmsg, $ourEmail);

	if (!$sendReply)
	throw new Exception($error);

	$statData->data = $returnmsg;
*/

$sendMail = PHPMail($webservices, $clientEmail, $systemEmail, $assuntoMail, $msg);

	if ($sendMail->error)
		throw new Exception($error);

	$sendReply = PHPMail($webservices, $ourEmail, $clientEmail, "Auto-Reply: Reis e Marreiros", $returnmsg);

	if ($sendReply->error)
		throw new Exception($error);

    $statData->data = $returnmsg;

} catch (Exception $e) {
	$statData->status = 1;
	$statData->data = $e->getMessage();
}

echo json_encode((array) $statData);

?>
