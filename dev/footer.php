	<link rel="stylesheet" href="assets/font-awesome5.7.2/css/all.min.css">
	<!-- <link href="vendor/magnific-popup/magnific-popup.min.css" rel="stylesheet"> -->

	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
	<script src="vendor/scrollreveal/scrollreveal.min.js"></script>
	<!-- <script src="vendor/magnific-popup/jquery.magnific-popup.min.js"></script> -->
	<script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
	<script src="utils.js"></script>

	<?php if (!in_array($userIp, $_SESSION['ipsExceptions'])) { ?>
		<script async src='https://www.googletagmanager.com/gtag/js?id=UA-120667200-1'></script>
		<script>
			window.dataLayer = window.dataLayer || [];
			function gtag(){dataLayer.push(arguments);}
			gtag('js', new Date());
			gtag('config', 'UA-120667200-1');
		</script>
	<?php } ?>

	<script>
		//window.addEventListener('load', function() {
		window.setTimeout(function() {
			var allimages = document.getElementsByTagName('img');

			for (var i=0; i<allimages.length; i++) {
				var currImage = allimages[i];

				if (currImage.getAttribute('data-src')) {
					currImage.setAttribute('src', currImage.getAttribute('data-src'));
				}
			}
		}, 1500);
		//}, false)
	</script>
</body>
</html>
