<cfoutput>
	<section id="pea-page" class="pea-page">
		<div class="container">
			<div class="row">
				<div class="form-pea col-xs-12 col-sm-offset-1 col-sm-10 col-md-offset-4 col-md-8 col-lg-offset-5 col-lg-6">
					<div class="form-header">
						<img src="#APPLICATION.images#/pages/pea/logo.svg" alt="Perdidos & Achados" class="col-xs-offset-2 col-xs-8 col-sm-offset-3 col-sm-6 col-md-offset-0 col-md-6 col-lg-5">

						<h1 class="col-xs-12 col-md-6 col-lg-7">#APPLICATION.articles_gateway.getContentSnippets('peaPage_title')#</h1>
					</div>

                    <cfmodule template="../includes/inc_peaForm.cfm">

				    <p class="footer text-center"><a href="#APPLICATION.server_root_uri#" class="pea-cprght">Reis & Marreiros, Lda</a> <sup>&copy;</sup> #year(now())#. Todos os direitos reservados!</p>
				</div>
			</div>
		</div>
	</section>
</cfoutput>