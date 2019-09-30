<CFOUTPUT>

<!DOCTYPE html>
<html lang="pt-pt">
<head>
	<meta charset="utf-8">
	<title>#app.name#</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<link rel="shortcut icon" type="image/png" href="#APPLICATION.app_images#/logo/favicon.png"/>

	<link href="#APPLICATION.app_assets_modules#/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
	<link href="#APPLICATION.app_assets_modules#/fontawesome/5.8.1/css/all.min.css" rel="stylesheet">
	<link href="#APPLICATION.app_assets_modules#/summernote/v0.8.11/summernote-bs4.css" rel="stylesheet">
	<link href="#APPLICATION.app_css#/app.css" rel="stylesheet">
	<link href="#APPLICATION.app_css#/main.css" rel="stylesheet">
	<link href="#APPLICATION.app_css#/login.css" rel="stylesheet">
	<link href="#APPLICATION.app_css#/modal-password.css" rel="stylesheet">
	<link href="#APPLICATION.app_css#/wickedpicker.css" rel="stylesheet">

	<script src="#APPLICATION.app_assets_modules#/jquery/3.4.0/jquery.min.js"></script>
	<script src="#APPLICATION.app_assets_modules#/bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>
	<script src="#APPLICATION.app_assets_modules#/summernote/v0.8.11/summernote-bs4.js"></script>
	<script src="#APPLICATION.app_assets_modules#/summernote/v0.8.11/lang/summernote-pt-PT.js"></script>

	<script src="#APPLICATION.app_assets_modules#/ram/ramModal.js"></script>

	<script src="#APPLICATION.app_js#/app.js"></script>
	<script src="#APPLICATION.app_js#/systemMessage.js"></script>
	<script src="#APPLICATION.app_js#/wickedpicker.js"></script>

	<!-- Bootstrap Date-Picker Plugin -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css"/>

	<!--- <script>

		var container = $('.bootstrap-iso form').length>0 ? $('.bootstrap-iso form').parent() : "body";
		var options_datePicker = {
			format: 'mm/dd/yyyy',
			container: container,
			todayHighlight: true,
			autoclose: true,
		};

		var options_timePicker = {
	        now: "00:00", //hh:mm 24 hour format only, defaults to current time
	        twentyFour: true,  //Display 24 hour format, defaults to false
	        upArrow: 'wickedpicker__controls__control-up',  //The up arrow class selector to use, for custom CSS
	        downArrow: 'wickedpicker__controls__control-down', //The down arrow class selector to use, for custom CSS
	        close: 'wickedpicker__close', //The close class selector to use, for custom CSS
	        hoverState: 'hover-state', //The hover state class to use, for custom CSS
	        title: 'Timepicker', //The Wickedpicker's title,
	        showSeconds: false, //Whether or not to show seconds,
	        timeSeparator: ' : ', // The string to put in between hours and minutes (and seconds)
	        secondsInterval: 1, //Change interval for seconds, defaults to 1,
	        minutesInterval: 1, //Change interval for minutes, defaults to 1
	        beforeShow: null, //A function to be called before the Wickedpicker is shown
	        afterShow: null, //A function to be called after the Wickedpicker is closed/hidden
	        show: null, //A function to be called when the Wickedpicker is shown
	        clearable: false, //Make the picker's input clearable (has clickable "x")
	    };
</script> --->
</head>

<body>
	<cfif NOT VARIABLES.pageIsLogin>
		<header>
			<nav class="navbar navbar-light nav-top">
				<div class="container-fluid">

					<button type="button" class="toggle-menu">
						<i class="fas fa-bars"></i>
					</button>

					<ul class="nav justify-content-end ml-auto">
						<cfif SESSION.cstData.usrAdmin LTE 1>
							<li class="nav-item">
								<a class="nav-link" href="../users/list.cfm">
									<i class="fa fa-users"></i>
									<!--- Utilizadores --->
								</a>
							</li>

							<li class="nav-item">
								<a class="nav-link" href="../users/add.cfm">
									<i class="fa fa-user-plus"></i>
									<!--- Adicionar  --->
								</a>
							</li>
						</cfif>

						<li class="<cfif findNoCase('users', CGI.SCRIPT_name)>active</cfif> nav-item dropdown">
							<a class="nav-link dropdown-toggle" href="##" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								#SESSION.cstData.usrName#
							</a>

							<div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
								<a class="dropdown-item" href="../users/detail.cfm?usrId=#SESSION.cstData.usrId#">
									<i class="fa fa-user-edit"></i>
                                    &nbsp;Perfil
								</a>
								<a class="dropdown-item" href="../system/logout.cfm">
									<i class="fa fa-power-off"></i>
									&nbsp;Sair
								</a>
							</div>
						</d>
					</ul>
				</div>
			</nav>

			<aside class="menu-lateral">
				<a class="nav-link pt-3" href="../system/dashboard.cfm">
					<img src="#APPLICATION.app_images#/logo/logo.png">

					<p class="pt-3">#app.name#</p>
				</a>

				<button type="button" class="toggle-menu">
					<i class="fas fa-bars"></i>
				</button>

				<div class="aside-box">
					<nav class="nav-aside">
						<ul class="list-unstyled">
							<hr>

							<li class="<cfif findNoCase('dashboard', CGI.SCRIPT_name)>active</cfif> nav-item">
								<a class="nav-link" href="../system/dashboard.cfm">
									<i class="fas fa-tachometer-alt"></i>
									Dashboard
								</a>
							</li>

							<hr>

							<cfset LOCAL.getContentTypes = APPLICATION.articles_types_gateway.read()>

							<cfloop query="#LOCAL.getContentTypes#">

								<li class="<cfif findNoCase('artType=#attId#', CGI.SCRIPT_name)>active</cfif> nav-item">
									<a class="nav-link" href="../articles/list.cfm?artType=#attId#">
										<i class="#attIcon#"></i>
										#attNameFull#
									</a>
								</li>

								<hr>

							</cfloop>

							<hr>

							<li class="<cfif findNoCase('gallery', CGI.SCRIPT_name)>active</cfif> nav-item">
								<a class="nav-link" href="../gallery/list.cfm">
									<i class="fa fa-images"></i>
									Galeria
								</a>
							</li>

							<hr>
							
                            <li class="<cfif findNoCase('pages', CGI.SCRIPT_name)>active</cfif> nav-item">
								<a class="nav-link" href="../pages/list.cfm">
									<i class="fa fa-images"></i>
									Páginas
								</a>
							</li>

							<hr>

							<li class="<cfif findNoCase('company', CGI.SCRIPT_name)>active</cfif> nav-item">
								<a class="nav-link" href="../company/detail.cfm?sysId=1">
									<i class="fa fa-address-card"></i>
									Sobre Nós
								</a>
							</li>

							<hr>
						</ul>
					</nav>

					<div class="version">
						<span>
							#APPLICATION.version#
						<span>
					</div>
				</div>
			</aside>
		</header>

		<main>
			<div class="container">
				<div class="myContainer">
					<div class="container-fluid">
	</cfif>

</CFOUTPUT>
