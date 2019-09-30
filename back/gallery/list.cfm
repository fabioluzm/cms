<cfset VARIABLES.imageCatalog = application.images_catalog_gateway.read()>
<!--- <cfdump var="#VARIABLES.imageCatalog#" format="html" abort="true" metainfo="yes"> --->

<cfoutput>

<cfsavecontent variable="content">
	<cfif VARIABLES.imageCatalog.recordCount>
		<div class="row">
			<cfloop query="VARIABLES.imageCatalog">
				<div class="col-md-3 mb-3">

					<div class="card shadow-lg" style="cursor: pointer;" onclick="goPage('../gallery/detail.cfm?imgId=#VARIABLES.imageCatalog.imgId#')">

						<div class="card-body p-3">
							<img src="#APPLICATION.app_images#/loader.gif" data-src="#application.uri_uploads_images#/#VARIABLES.imageCatalog.imgPath#" class="card-img-top" alt="#VARIABLES.imageCatalog.imgPath#">
							<!--- <img src="https://media.giphy.com/media/10KipP0ZVABxKw/giphy.gif" data-src="#application.uri_uploads_images#/#VARIABLES.imageCatalog.imgPath#" class="card-img-top" alt="#VARIABLES.imageCatalog.imgPath#"> --->

							<cfif VARIABLES.imageCatalog.imgSlideShow EQ 1>
								<span class="image-tag">Slideshow</span>
							</cfif>
                            
                            <cfif VARIABLES.imageCatalog.imgBanner EQ 1>
								<span class="image-tag">Banner</span>
							</cfif>
                            
                            <cfif VARIABLES.imageCatalog.imgPortfolio EQ 1>
								<span class="image-tag">Portefólio</span>
							</cfif>
                            
                            <cfif VARIABLES.imageCatalog.imgTeam EQ 1>
								<span class="image-tag">Equipa</span>
							</cfif>
						</div>

						<div class="card-footer text-center header">
							<p class="card-text">#VARIABLES.imageCatalog.imgLabel#</p>
						</div>
					</div>

				</div>
			</cfloop>
		</div>
	<cfelse>
		<cfmodule template="../cftemplates/CT_pageNoRecordsMessage.cfm" content="galery">
	</cfif>
</cfsavecontent>

<cfset VARIABLES.pageData = {
	'icon' 	:'fa fa-images',
	'title' :'Galleria',
	'nav' 	:[
				{
					'link' 	:'../gallery/add.cfm',
					'icon' 	:'fa fa-plus-circle',
					'target':'_self',
					'desc' 	:'Adicionar'
				},
			],
	'content':variables.content
}>

<cfmodule template="../cftemplates/CT_pageTemplate.cfm" pageData="#VARIABLES.pageData#">

</cfoutput>