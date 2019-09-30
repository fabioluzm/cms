function is_email(field) {
	return (field.indexOf('@') > -1 && field.indexOf('.') > -1);
}

function checkPage(button) {
	var frm = document.getElementById('contactus'),
	    from = document.getElementById('header-contact-form'),
		lang = document.documentElement.lang;

	switch (lang) {
		case 'pt-pt':
			 var language = 'pt',
			     error_general = 'Por favor insira todos os campos!',
			     error_servicos = 'Por favor escolha o serviço que deseja!',
			     error_email = 'Por favor insira um email válido!';
			break;
		case 'en':
			var language = 'en',
			     error_general = 'All fields are required!',
			     error_servicos = 'Please choose the service you desire!',
			     error_email = 'Please insert a valid email!';
			break;
	}

	switch (button) {
		case 0:
			var data = {
				'nome': frm.nome.value,
				'email': frm.email.value,
				'servicos': frm.servicos.value,
				'assunto': frm.assunto.value,
				'descricao': frm.descricao.value,
				'lang': language,
				'button': button
			}
			// if (frm.servicos.selectedIndex == 0) {
			// 	alert(error_servicos);
			// 	return false;
			// }
			if (frm.servicos.value == 0) {
				alert(error_servicos);
				return false;
			}
			break;
		case 1:
			var data = {
				'email': from.email.value,
				'lang': language,
				'button': button
			}
			break;
	}

	for (key in data) {
		if (data[key].length == 0) {
			alert(error_general);
			return false;
		}
	}

	if (!is_email(data['email'])) {
		alert(error_email);
		return true;
	}

	sendMail(data);
}

function sendMail(data) {
	$.post('send_Mail.php', data, function(res) {
		alert(res.data);
		if (res.status == 0) {
			$('#contactus')[0].reset();
			// $('#header-contact-form')[0].reset();
			$('html, body').animate({ scrollTop: 0 }, "slow");
		}
	}, 'json');
}

$('.header-contact, .header-contact i, .header-contact-form, .header-contact-form input').on('focus', function() {
    $(this).parents('.header-contact').css("margin-right", "0");
});

$('.header-contact').on('mouseover', function() {
	$(this).parents('.header-contact').css("margin-right", "0");
});

$('.header-contact, .header-contact i, .header-contact-form, .header-contact-form input').on('blur', function() {
	$(this).parents('.header-contact').css("margin-right", "-305px");
});

$('.header-contact').click(function() {
	$('.header-contact-form input').focus();
});

$('.header-contact').on('mouseover', function() {
	$('.header-contact-form input').focus();
});
