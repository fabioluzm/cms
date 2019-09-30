<cfif NOT findNoCase('perdidosachados', ARGUMENTS.targetPage)>
    <cfinclude  template="includes/inc_footer.cfm">
</cfif>

	<cfoutput>        
        
        <!--- script modules --->
        <script src="#APPLICATION.asset_modules#/jquery/3.4.0/jquery.min.js"></script>
        <script src="#APPLICATION.asset_modules#/bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
        <script src="#APPLICATION.asset_modules#/scrollreveal/scrollreveal.min.js"></script>
        <script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
        
        <!--- custom scripts --->
        <script src="#APPLICATION.js#/utils.js"></script>

    </cfoutput>

    <!--- 
        <?php if (!in_array($userIp, $_SESSION['ipsExceptions'])) { ?>
            <script async src='https://www.googletagmanager.com/gtag/js?id=UA-120667200-1'></script>
            <script>
                window.dataLayer = window.dataLayer || [];
                function gtag(){dataLayer.push(arguments);}
                gtag('js', new Date());
                gtag('config', 'UA-120667200-1');
            </script>
        <?php } ?>
    --->

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
        
        <!--- // Start of Tawk.to Script	
		var Tawk_API = Tawk_API || {},
			Tawk_LoadStart = new Date();
		
        (function () {
			var s1 = document.createElement("script"),
				s0 = document.getElementsByTagName("script")[0];
			s1.async = true;
			s1.src = 'https://embed.tawk.to/5c73baf13341d22d9ce5f159/default';
			s1.charset = 'UTF-8';
			s1.setAttribute('crossorigin', '*');
			s0.parentNode.insertBefore(s1, s0);
		})();
	    // End of Tawk.to Script --->
	</script>
</body>
</html>
