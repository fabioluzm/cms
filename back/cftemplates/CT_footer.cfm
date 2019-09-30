<CFOUTPUT>

<CFIF NOT VARIABLES.pageIsLogin>
				</div><!-- end container-fluid -->
			</div><!-- end myContainer -->
		</div><!-- end container -->
	</main>

	<footer class="footer">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<span>#application.applicationname# &copy; #YEAR(NOW())#<span>
				</div>
			</div>
		</div>
	</footer>
</CFIF>

<script type="text/javascript">
	var heartBeat = {
		uriBeat: '#application.server_root_uri#/back/system/heartBeat_api.cfm',

		setup: function() {
			var self = this;

			window.setTimeout(function() {
				self.call();
			}, 300000)
		},

		call: function() {
			var self = this;

			$.get(self.uriBeat);
		}
	}

	window.onload = function() {
		<CFPARAM NAME="SESSION.sysMsg" DEFAULT="">
		<CFPARAM NAME="SESSION.sysMsgLevel" DEFAULT="0">

		<CFSET SESSION.sysMsg = jsStringFormat(SESSION.sysMsg)>

		sysMessage.init();

		<CFOUTPUT>
			sysMessage.set('#SESSION.sysMsg#', #SESSION.sysMsgLevel#);

			<CFSET structDelete(SESSION, 'sysMsg')>
			<CFSET structDelete(SESSION, 'sysMsgLevel')>
		</CFOUTPUT>

		sysMessage.render();

		heartBeat.setup();
	}
    
    window.setTimeout(function() {
        var allimages = document.getElementsByTagName('img');

        for (var i=0; i<allimages.length; i++) {
            var currImage = allimages[i];

            if (currImage.getAttribute('data-src')) {
                currImage.setAttribute('src', currImage.getAttribute('data-src'));
            }
        }
    }, 1000);
</script>

</body>
</html>

</CFOUTPUT>
