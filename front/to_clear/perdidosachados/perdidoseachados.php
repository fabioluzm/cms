<?php include 'configs.php'; ?>
<!DOCTYPE html>
<html lang="pt-pt">

<head>
	<title>Perdidos e Achados - Lagos - Algarve - Portugal - Reis & Marreiros, Lda</title>

	<!-- <meta name="keywords" content="desenvolvimento de software personalizado, empresa de software, software desenvolvimento de sistemas, software, lagos, algarve, reis, marreiros, reis marreiros, reis & marreiros, desenvolvimento de software à medida, informatica, aplicacoes, aplicações, ram, desenvolvimento web, web design">
	<meta name="description" content="Na Reis & Marreiros Lda desenvolvemos lojas online, desenvolvimento de software por medida e webdesign, mediante as necessidades de cada cliente.">
	<meta name="author" content="Web Design|Desenvolvimento de Lojas Online|Desenvolvimento de Software por Medida - Reis & Marreiros, Lda"> -->

	<!-- Facebook Meta Tags -->
	<!-- <meta property="og:image" content="<?php echo $serverPath; ?>/img/facebookPreview.png">
	<meta property="og:locale" content="pt_pt">
	<meta property="og:title" content="Web Design|Desenvolvimento de Lojas Online|Desenvolvimento de Software por Medida - Reis & Marreiros, Lda">
	<meta property="og:description" content="Na Reis & Marreiros,Lda desenvolvemos lojas online, desenvolvimento de software por medida e webdesign, mediante as necessidades de cada cliente."> -->

	<?php include 'header.php'; ?>

	<!-- <link rel="icon" href="favicon.png" type="image/png"/> -->
	<link href="pea/pea.css" rel="stylesheet">
</head>

<body id="page-top">
	<nav id="mainNav" class="navbar navbar-default navbar-fixed-top text-center">
		<div class="container-fluid" style="background-color: #00acdd;">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse">
					<span class="sr-only">Toggle navigation</span> Menu <i class="fa fa-bars"></i>
				</button>
				<a href="index.php">
					<div class="logoNavBar">
						<img class="logonav" src="img/logosite_.png">
					</div>
				</a>
				<a class="navbar-brand hidden-xs page-scroll" href="index.php" style="padding-left: 25px;">Reis & Marreiros Lda</a>
			</div>

			<div class="navbar-social nav navbar-nav">
				<a class="nav-social" href="mailto:info@reismarreiroslda.com"><i class="fa fa-envelope-square"></i></a>
				<a class="nav-social" target="_blank" rel="noopener noreferrer" href="https://www.facebook.com/reismarreiroslda"><i class="fab fa-facebook-square"></i></a>
				<a class="nav-social" target="_blank" rel="noopener noreferrer" href="https://www.linkedin.com/company/reismarreiroslda/"><i class="fab fa-linkedin"></i></a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse" id="navbar-collapse">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="index.php#about">Sobre</a></li>
					<li><a href="index.php#services">Serviços</a></li>
					<li><a href="index.php#portfolio">Portefólio</a>
					<li><a href="index.php#team">Equipa</a></li>
					<li><a href="index.php#contact">Contactos</a></li>
					<?php /* <li><a href="index_en.php">EN</a></li> */ ?>
				</ul>
			</div>
		</div>
	</nav>

	<section id="pea-page" class="pea-page">
		<div class="container">

			<div class="row">
				<div class="form-pea col-xs-12 col-sm-offset-1 col-sm-10 col-md-offset-4 col-md-8 col-lg-offset-5 col-lg-6">
					<div class="form-header">
						<img src="pea/logo.svg" alt="Perdidos & Achados" class="col-xs-offset-2 col-xs-8 col-sm-offset-3 col-sm-6 col-md-offset-0 col-md-6 col-lg-5">

						<h1 class="col-xs-12 col-md-6 col-lg-7">A gestão de perdidos e achados mais simples do mercado</h1>
					</div>

					<form id="pea-contact" method="POST">
						<div class="row">
							<div class="form-group col-xs-12">
								<label for="name">Nome*</label>
								<input type="text" name="name" id="name" class="form-control" placeholder="Nome completo" required>
							</div>

							<div class="form-group col-xs-12">
								<label for="">Email*</label>
								<input type="email" name="email" id="email" class="form-control" placeholder="E-mail válido" required>
							</div>

							<div class="form-group col-xs-12 col-md-6">
								<label for="company">Empresa</label>
								<input type="text" name="comapny" id="company" placeholder="Empresa (Opcional)" class="form-control">
							</div>

							<div class="form-group col-xs-12 col-md-6">
								<label for="phone">Telefone</label>
								<input type="text" name="phone" id="phone" placeholder="Contacto (Opcional)" class="form-control">
							</div>

							<div class="form-group col-xs-12">
								<label for="message">Mensagem</label>
								<textarea name="message" id="message" class="form-control" placeholder="Deixe aqui a sua mensagem (Opcional)" rows="3"></textarea>
							</div>

							<div class="checkbox">
								<label>
									<input type="checkbox" name="datacheck" id="datacheck" value="1" required>
									Autorizo a utilização dos meus dados pessoais de acordo com a finalidade descrita na Política de Privacidade deste website.
								</label>
							</div>

							<button type="button" onclick="pea_email()" class="btn btn-primary col-xs-offset-1 col-xs-10 col-sm-offset-2 col-sm-8 col-md-offset-6 col-md-6">Solicite uma demonstração</button>
						</div>
					</form>
				<p class="footer text-center"><a href="https://www.reismarreiroslda.com/index_en.php" class="pea-cprght">Reis & Marreiros, Lda</a> &copy; <?php echo date("Y"); ?>. Todos os direitos reservados!</p>
				</div>
			</div>
		</div>
	</section>

	<?php include 'footer.php'; ?>

	<script>
		function pea_email() {
			var peaform = document.getElementById('pea-contact')
				lang = document.documentElement.lang;

			switch (lang) {
				case 'pt-pt':
					var language = 'pt',
						error_general = 'Por favor preencha todos os campos obrigatórios!',
						error_email = 'Por favor insira um email válido!',
						error_privacy = "Aceite a nossa Política de Privacidade antes de continuar!";
					break;

				case 'en':
					var language = 'en',
						error_general = 'Please insert all required fields!',
						error_email = 'Please insert a valid email!',
						error_privacy = "Please check our Privacy Policy before continue!";
					break;
			}

			var data = {
				'nome': peaform.name.value,
				'email': peaform.email.value,
				'empresa': peaform.company.value,
				'telefone': peaform.phone.value,
				'mensagem': peaform.message.value,
				'datacheck': peaform.datacheck.checked,
				'lang': language

			}

			if (data['nome'].length == 0) {
				alert(error_general);
				return false;
			}

			if (data['email'].length == 0) {
				alert(error_general);
				return false;
			}

			if (data['datacheck'] == false) {
				alert(error_privacy);
				return false;
			}


			if (!is_email(data['email'])) {
				alert(error_email);
				return true;
			}

			peaSendMail(data);
		}

		function peaSendMail(data) {
			$.post('pea/peaSendMail.php', data, function(res) {
				alert(res.data);
				if (res.status == 0) {
						$('#pea-contact')[0].reset();
					}
			}, 'json');
		}

	</script>
