<?php include 'configs.php'; ?>

<!DOCTYPE html>
<html lang="en">

<head>
	<title>Reis & Marreiros, Lda - Custom Software development</title>

	<meta name="keywords" content="software development, custom software development, custom software solutions, software solutions, software company, web development, web design, lagos, faro, reis&marreiros, reis marreiros, software web, seo reismarreiroslda, reismarreiroslda, co-work space, co-work">
	<meta name="description" content="Reis & Marreiros Lda, it's a company which main objective is to develop customized software, focusing the needs of each client.">
	<meta name="author" content="Reis & Marreiros,Lda - https://www.reismarreiroslda.com">

	<!-- social meta tags -->
	<meta property="og:image" content="<?php echo $serverPath; ?>/img/facebookPreview.png">
	<meta property="og:locale" content="en">
	<meta property="og:title" content="Reis & Marreiros, Lda - Custom Software Development">
	<meta property="og:description" content="Reis & Marreiros Lda, it's a company which main objective is to develop customized software, focusing the needs of each client.">
	<?php include 'header.php'; ?>

</head>

<body id="page-top">
	<nav id="mainNav" class="navbar navbar-default navbar-fixed-top">
		<div class="container-fluid" style="background-color: #00acdd;">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse">
					<span class="sr-only">Toggle navigation</span> Menu <i class="fa fa-bars"></i>
				</button>
				<a href="#header">
					<div class="logoNavBar">
						<img class="logonav" src="img/logosite_.png">
					</div>
				</a>
				<a class="navbar-brand hidden-xs page-scroll" href="#header" style="padding-left: 25px;">Reis & Marreiros Lda</a>
			</div>

			<div class="navbar-social nav navbar-nav">
				<a class="nav-social" href="mailto:info@reismarreiroslda.com"><i class="fa fa-envelope-square"></i></a>
				<a class="nav-social" target="_blank" rel="noopener noreferrer" href="https://www.facebook.com/reismarreiroslda"><i class="fab fa-facebook-square"></i></a>
				<a class="nav-social" target="_blank" rel="noopener noreferrer" href="https://www.linkedin.com/company/reismarreiroslda/"><i class="fab fa-linkedin"></i></a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse" id="navbar-collapse">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#about">About</a></li>
					<li><a href="#services">Services</a></li>
					<li><a href="#portfolio">Portfolio</a>
					<li><a href="#team">Team</a></li>
					<li><a href="#contact">Contacts</a></li>
					<li><a href="index.php">PT</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<header id="header">
		<div class="header-content">
			<div class="header-content-inner">
				<h1 id="homeHeading">Software development</h1>
				<h2>Customized for all your Needs</h1>
				<!-- <hr>
				<a href="#about" class="btn btn-primary btn-xl page-scroll header-button">Find out more</a> -->
			</div>
		</div>
		<a class="icon-scroll" href="#about">
			<p class="scroll-text">See More</p>
		</a>
	</header>

<?php
	/*<div id="header-contact" tabindex="0" class="header-contact">
		<i class="fa fa-envelope" tabindex="0"></i>

		<form tabindex="0" id="header-contact-form" class="header-contact-form" method="post">
			<input type="email" name="email" placeholder="Send email to receive contact.">
			<button type="submit" onclick="checkPage(1)">Send</button>
		</form>
	</div>*/

	/*<div class="icons">
		<ul>
			<a href="mailto:info@reismarreiroslda.com"><li class="ram-email"><i class="fa fa-envelope-square"></i></li></a>
			<a target="_blank" rel="noopener noreferrer" href="https://www.facebook.com/reismarreiroslda"><li class="ram-facebook"><i class="fab fa-facebook-square"></i></li></a>
			<a target="_blank" rel="noopener noreferrer" href="https://www.linkedin.com/company/reismarreiroslda/"><li class="ram-linkedin"><i class="fab fa-linkedin"></i></li></a>
		</ul>
	</div>*/
?>

	<section class="bg-primary" id="about">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 col-lg-offset-2 text-center">
					<h2 class="section-heading">About Us</h2>
					<hr class="light">
					<p class="text-justify text-last-center">Located in Lagos, Algarve, <strong>Reis & Marreiros Lda</strong>, it's a
						company which main objective is to <strong>develop customized software</strong>, focusing the needs of each
						client.<br>
						Our experienced, professional and dedicated team is going to dedicate all effords to ensure you have a <strong>positive
							and 100% satisfactory experience</strong> when acquiring your product.</p>
					<br>
					<a href="#contact" class="page-scroll btn btn-default btn-xl sr-button formshadow">Contact Us!</a>
				</div>
			</div>
		</div>
	</section>

<?php
	/*<section id="pea">
		<div class="container">
			<div class="row">
				<div class="col-md-12 text-center">
					<h2 class="section-heading">Products</h2>
					<hr class="primary">
				</div>
			</div>
		</div>

		<div class="container pea-card">
			<article id="ilustracao-pea" class="container-fluid">

				<div class="row">
					<h2 class="col-xs-12 text-center hidden-md hidden-lg">The simplest management of lost and found in the market</h2>
					<div class="text-center col-xs-12 col-md-6 col-lg-5">
						<img id="logo-pea" src="img/pea/logo.svg" alt="P&A_logo">
					</div>
					<div class="imagens-pea text-center col-xs-12 col-md-6 col-lg-7">
						<img src="img/pea/monitor.svg" alt="monitor_1080p" id="monitor-pea">
						<img src="img/pea/laptop.svg" alt="portatil_720p" id="portatil-pea">
						<img src="img/pea/mobile.svg" alt="movel" id="movel-pea">
					</div>
				</div>
			</article>

			<article id="detalhes-pea" class="container-fluid">
				<div class="row">
					<div class="specs-pea col-md-6 col-lg-5">
						<ul>
							<li class="lista-pea">Controlled and organized management</li>
							<li class="lista-pea">User friendly interface</li>
							<li class="lista-pea">Quick and simple searches</li>
							<li class="lista-pea">Detailed and effective system</li>
							<li class="lista-pea">Modern and responsive design</li>
						</ul>
					</div>

					<div class="col-xs-12 col-md-6 col-lg-7 text-center">
						<h2 class="hidden-xs hidden-sm offset-lg-1">The simplest management of lost and found in the market</h2>

						<a href="#contact" class="cta-pea text-center">Contact us to know more</a>
					</div>
				</div>
			</article>
		</div>
	</section>*/
?>

	<section id="services">
		<div class="container">
			<div class="row">
				<div class="col-md-12 text-center">
					<h2 class="section-heading">Services</h2>
					<hr class="primary">
				</div>
			</div>
		</div>

		<div class="container">
			<div class="row">
				<div class="col-lg-6 col-md-6 text-center">
					<div class="service-box">
						<i class="fa fa-4x fa-laptop text-primary sr-icons"></i>
						<h3>Software Development</h3>
						<p class="text-muted text-justify text-last-center">We develop, design and customize software solutions based on your
							needs.</p>
						<?php /*<button class="btn .btn-default inf formshadow" onclick="location.href='desenvolvimento_en.html'">Know More</button>*/ ?>
					</div>
				</div>

				<div class="col-lg-6 col-md-6 text-center">
					<div class="service-box">
						<i class="fa fa-4x fa-building text-primary sr-icons"></i>
						<h3>Web Design | Web Development</h3>
						<p class="text-muted text-justify text-last-center">We design, develop and build creative and fully responsive
							websites to fit all the needs.</p>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-lg-6 col-md-6 text-center">
					<div class="service-box">
						<i class="fas fa-4x fa-clipboard-check text-primary sr-icons"></i>
						<h3>Technical Consultancy</h3>
						<p class="text-muted text-justify text-last-center">Personalized customer support in the selection of software solutions.</p>
					</div>
				</div>

				<div class="col-lg-6 col-md-6 text-center">
					<div class="service-box">
						<i class="fas fa-4x fa-keyboard text-primary sr-icons"></i>
						<h3>Outsourcing</h3>
						<p class="text-muted text-justify text-last-center">We have at your service a team of professionals qualified in PHP, ColdFusion<sup>&reg;</sup> and Lucee.</p>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-lg-6 col-md-6 text-center">
					<div class="service-box">
						<i class="fas fa-4x fa-binoculars text-primary sr-icons"></i>
						<h3>SEO</h3>
						<p class="text-muted text-justify text-last-center">Websites optimization for better search engine ranking, and increase your site visibility.</p>
					</div>
				</div>

				<div class="col-lg-6 col-md-6 text-center">
					<div class="service-box">
						<i class="fas fa-4x fa-id-card text-primary sr-icons"></i>
						<h3>Professional Email</h3>
						<p class="text-muted text-justify text-last-center">Professional email creation to increase your communications credibility, and make the recipient feel safe about it.</p>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-lg-6 col-md-6 text-center">
					<div class="service-box">
						<i class="fa fa-4x fa-users text-primary sr-icons"></i>
						<h3>Co-Work Space</h3>
						<p class="text-muted text-muted text-justify text-last-center">Work in a relaxed and pleasant environment with
							perfect harmony to manage your project or business.</p>
					</div>
					<button class="btn inf formshadow" onclick="location.href='coworkspace_en.php'">Know More</button>
				</div>

				<div class="col-lg-6 col-md-6 text-center">
					<div class="service-box">
						<i class="fa fa-4x fa-wifi text-primary sr-icons"></i>
						<h3>5G WiFi Spot</h3>
						<p class="text-muted text-justify text-last-center">Keep a worldwide connection by using the maximum speed and
							stability of our 5G WiFi network.</p>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section id="portfolio">
		<div class="container-fluid">
			<div class="row no-gutter popup-gallery">
				<div class="container-fluid">
					<div class="text-center">
						<h2 class="section-heading">Portfolio</h2>
						<hr class="primary">
					</div>
				</div>

				<?php portfolioLang(1); ?>
			</div>
		</div>
	</section>

	<section id="team">
		<div class="container">
			<div class="row">
				<div class="col-12 text-center">
					<h2 class="section-heading">Our Team</h2>
					<hr class="primary">
				</div>
			</div>

			<div class="row">
				<?php teamLang(1); ?>
			</div>
		</div>
	</section>

	<section id="contact" class="bg-primary">
		<div class="container">
			<div class="row downSpace">
				<div class="col-lg-8 col-lg-offset-2">
					<h2 class="section-heading text-center downSpace">Contacts</h2>
					<hr class="light">
					<p class="text-justify text-last-center formspace">Contact us with your need and we will <strong class="strcontact">build
							a customized solution</strong> for you.<br>The limit is your imagination!</p>
				</div>
			</div>

			<div class="row contact-spacing">
				<!-- map+forum grid  -->
				<div class="col-md-5">
					<!-- forum grid  -->

					<form id="contactus" class="form-horizontal">
						<div class="row downSpace">
							<div class="col-md-8 col-md-offset-3 text-center">
								<legend class="formlegend">Contact Us!</legend>
							</div>
						</div>
						<div class="form-group row formspace">
							<label class="col-md-2 control-label">Name:</label>
							<div class="col-md-10">
								<input type="text" name="nome" class="text-area-size form-control formshadow">
							</div>
						</div>
						<div class="form-group row formspace">
							<label class="col-md-2 control-label">Email:</label>
							<div class="col-md-10">
								<input type="email" name="email" class="text-area-size form-control formshadow">
							</div>
						</div>
						<div class="form-group row formspace">
							<label class="col-md-2 control-label">Service:</label>
							<div class="col-md-10">
								<select name="servicos" class="form-control formshadow">
									<option value="0">Choose one Option</option>
									<option value="Desenvolvimento">Software Development</option>
									<option value="Paginas Web">Web Design/Development</option>
									<option value="Outros">Other</option>
								</select>
							</div>
						</div>
						<div class="form-group row formspace">
							<label class="col-md-2 control-label">Subject:</label>
							<div class="col-md-10">
								<input type="text" name="assunto" class="text-area-size form-control formshadow">
							</div>
						</div>
						<div class="form-group row formspace">
							<label class="col-md-2 control-label">Message:</label>
							<div class="col-md-10">
								<textarea id="formContent" name="descricao" rows="5" class="text-area-size form-control formshadow"></textarea>
							</div>
						</div>
						<div class="row text-center formspace">
							<div class="col-md-8 col-md-offset-3">
								<input class="btn btn-default sr-button btn-form formshadow downSpace" type="button" value="Send" ONCLICK="checkPage(0)">
							</div>
						</div>
					</form>
				</div>
				<!-- /.form grid  -->

				<div class="col-md-7">
					<!-- map grid  -->
					<iframe class="downSpace rammap" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3182.3535318121303!2d-8.67961468427636!3d37.0967011798885!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0xd1b3190fc321ed5%3A0x2dd2e2ced1990fe1!2sReis+%26+Marreiros%2C+Lda!5e0!3m2!1spt-PT!2spt!4v1538562694975"
					 height="400px" width="100%" frameborder="0" allowfullscreen class="embed-responsive-item"></iframe>
					<div class="row downSpace text-center ramsocialnetwork">
						<!-- network grid  -->
						<div class="col-md-4">
							<div class="social">
								<a href="mailto:info@reismarreiroslda.com" class="contact-btn"><img src="" data-src="img/icon_/mailinv_.svg" height="40"
									 class="downSpace ramicon"></a>
							</div>
							<p class="formspace">info@reismarreiroslda.com</p>
						</div>
						<div class="col-md-4">
							<div class="social">
								<a target="_blank" rel="noopener noreferrer" href="https://goo.gl/maps/LdCwxuPUuEL2" class="contact-btn"><img src="" data-src="img/icon_/gpsinv_.svg" height="40"
									 class="downSpace ramicon"></a>
							</div>
							<p class="formspace">Rua Brito Camacho<br>Lt 41, Cave frente<br>8600-534 Lagos</p>
						</div>
						<div class="col-md-4">
							<div class="social">
								<a href="tel:+351932427033" class="contact-btn"><img src="" data-src="img/icon_/phoneinv_.svg" height="40" class="downSpace ramicon"></a>
							</div>
							<p class="formspace"><span class="ramphone">93 2427 033</span><br>Mon
								- Fri, 9AM - 6PM</p>
						</div>
					</div><!-- /.network grid  -->
				</div><!-- /.map grid  -->
			</div><!-- /.map+forum grid -->
		</div>
		<div class="echo"></div>
	</section>

	<footer class="bg-primary upperspace">
		<div class="container text-center">
			<div class="cprght">
				<div>
					<a target="_blank" rel="noopener noreferrer" href="https://www.facebook.com/reismarreiroslda"><i class="fab fa-facebook-square fa-3x social"></i></a>
					<a target="_blank" rel="noopener noreferrer" href="https://www.linkedin.com/company/reismarreiroslda/"><i class="fab fa-linkedin fa-3x social"></i></a>
					<a href="mailto:info@reismarreiroslda.com"><i class="fa fa-envelope-square fa-3x social downSpace"></i></a>
				</div>
				<!-- Copyright -->
				<p class="downSpace"><a href="https://www.reismarreiroslda.com/index_en.php" class="footer-wslink">Reis & Marreiros, Lda</a> &copy; <?php echo date("Y"); ?>. All Rights Reserved!</p>
				<!-- Copyright -->
			</div>
		</div>
	</footer>

	<!--Start of Tawk.to Script-->
	<script>
		var Tawk_API = Tawk_API || {},
			Tawk_LoadStart = new Date();
		(function () {
			var s1 = document.createElement("script"),
				s0 = document.getElementsByTagName("script")[0];
			s1.async = true;
			s1.src = 'https://embed.tawk.to/5c73baf13341d22d9ce5f159/1d4i8actd';
			s1.charset = 'UTF-8';
			s1.setAttribute('crossorigin', '*');
			s0.parentNode.insertBefore(s1, s0);
		})();
	</script>
	<!--End of Tawk.to Script-->

<?php include 'footer.php'; ?>
