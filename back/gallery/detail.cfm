<cfset VARIABLES.imageCatalog = APPLICATION.images_catalog_gateway.read(URL)>

<cfif isDefined("FORM.fieldNames")>
	<cfdirectory action="list" directory="#APPLICATION.app_uploads_images#" recurse="false" name="fileName" filter="#VARIABLES.imageCatalog.imgPath#">

	<cfset FORM.imgId = URL.imgId>

	<cfif FORM.action EQ "1">
		<cftry>
        
			<cfif FORM.imgPath EQ "">
				<cfset FORM.imgPath = VARIABLES.imageCatalog.imgPath>
			<cfelse>
				<cffile action="upload" filefield="FORM.imgPath" destination="#APPLICATION.app_uploads_images#" result="newImage" nameconflict="makeunique">

				<cfif FILENAME.recordCount>
					<cffile action="delete" file="#APPLICATION.app_uploads_images##VARIABLES.imageCatalog.imgPath#">
				</cfif>

				<cfset FORM.imgPath = VARIABLES.newImage.serverfile>
			</cfif>
            
            <cfset FORM.imgLocation = (structKeyExists(FORM, 'imgLocation') ? FORM.imgLocation : 0)>

            <cfset FORM.imgSlideShow = (structKeyExists(FORM, 'imgSlideShow') ? 1 : 0)>
            <cfset FORM.imgBanner    = (structKeyExists(FORM, 'imgBanner') ? 1 : 0)>
            <cfset FORM.imgPortfolio = (structKeyExists(FORM, 'imgPortfolio') ? 1 : 0)>
            <cfset FORM.imgTeam      = (structKeyExists(FORM, 'imgTeam') ? 1 : 0)>

			<cfset APPLICATION.images_catalog_gateway.update(FORM)>

			<cfset SESSION.sysMsg = 'A informação da imagem foi alterada com sucesso.'>
			<cfset SESSION.sysMsgLevel = 1>

			<cfset redirect('back/gallery/detail.cfm?imgId=#URL.imgId#')>
		<cfcatch>
			<cfset SESSION.sysMsg = getErrorMessage(cfcatch)>
			<cfset SESSION.sysMsgLevel = 3>
		</cfcatch>
		</cftry>
	<cfelse>
		<cftry>
			<cfset APPLICATION.images_catalog_gateway.delete(form)>

			<cfif FILENAME.recordCount>
				<cffile action="delete" file="#APPLICATION.app_uploads_images##VARIABLES.imageCatalog.imgPath#">
			</cfif>

			<cfset SESSION.sysMsg = 'A imagem foi apagada com sucesso.'>
			<cfset SESSION.sysMsgLevel = 1>

			<cfset  redirect('back/gallery/list.cfm')>
		<cfcatch>
			<cfset SESSION.sysMsg = getErrorMessage(cfcatch)>
			<cfset SESSION.sysMsgLevel = 3>
		</cfcatch>
		</cftry>
	</cfif>
</cfif>

<cfoutput>

<cfsavecontent variable="content">

	<cfset VARIABLES.displayData = {
		'styleClass':'page-heading mt-5',
		'iconClass'	:{
						'style'	:'heading-icon',
						'type'	:' fa fa-images'
					},
		'title'		:'Catálogo de Imagens',
		'alert'		:'Sem imagem disponível.'
	}>


	<input type="hidden" name="action" value="1">
    
    <div class="form-row">
        <div class="form-group col-md-6">
            <label for="imgLabel"> Título <small>*</small></label>
            <input type="text" class="form-control" id="imgLabel" name="imgLabel" value="#VARIABLES.imageCatalog.imgLabel#" placeholder="Título da imagem" required>
            <small class="invalid-feedback">Adicione um título.</small>
        </div>
        
        <div class="form-group col-md-6">
            <label for="imgDesc"> Categoria <small>*</small></label>
            <input type="text" class="form-control" id="imgDesc" name="imgDesc" value="#VARIABLES.imageCatalog.imgDesc#" placeholder="Categoria da imagem" required>
            <small class="invalid-feedback">Adicione a descrição.</small>
        </div>
    </div>

    <div class="form-row">
        <div class="form-group col-md-6">
            <label for="imgPath"> Escolha uma imagem <small>*</small></label>
            <input type="file" class="form-control-file" id="imgPath" name="imgPath" accept="image/*">
            <small class="invalid-feedback">Escolha uma imagem para fazer upload.</small>
        </div>
    </div>
        
    <div class="form-group">            
        <label>Usar como:</label>
        
        <div class="form-row pl-2">
            <div class="form-check">
                <input type="checkbox" class="form-check-input" name="imgSlideShow" id="imgSlideShow" <cfif VARIABLES.imageCatalog.imgSlideShow EQ 1>checked</cfif>>
                <label class="form-check-label" for="imgSlideShow">Slideshow</label>
            </div>
        </div>
        
        <div class="form-row pl-2">
            <div class="form-check">
                <input type="checkbox" class="form-check-input" name="imgBanner" id="imgBanner" <cfif VARIABLES.imageCatalog.imgBanner EQ 1>checked</cfif>>
                <label class="form-check-label" for="imgBanner">Banner</label>
            </div>
        </div>
        
        <div class="form-row pl-2">
            <div class="form-check">
                <input type="checkbox" class="form-check-input" name="imgPortfolio" id="imgPortfolio" <cfif VARIABLES.imageCatalog.imgPortfolio EQ 1>checked</cfif>>
                <label class="form-check-label" for="imgPortfolio">Portefólio</label>
            </div>
        </div>
        
        <div class="form-row pl-2">
            <div class="form-check">
                <input type="checkbox" class="form-check-input" name="imgTeam" id="imgTeam" <cfif VARIABLES.imageCatalog.imgTeam EQ 1>checked</cfif>>
                <label class="form-check-label" for="imgTeam">Equipa</label>
            </div>
        </div>
    </div>
    
    <div class="form-group">
        <label class="">Usar em:</label>
        <cfset LOCAL.getPages = APPLICATION.pages_gateway.read({pageStatus = 1})>
        
        <cfloop query="LOCAL.getPages">
            <div class="form-row pl-2">
                <div class="form-check">
                    <input type="checkbox" class="form-check-input" name="imgLocation" id="page#LOCAL.getPages.pageId#" value="#LOCAL.getPages.pageId#" <cfif listFind(VARIABLES.imageCatalog.imgLocation, LOCAL.getPages.pageId)>checked</cfif>>
                    <label class="form-check-label" for="page#LOCAL.getPages.pageId#">#LOCAL.getPages.pageName#</label>
                </div>
            </div>
        </cfloop>
    </div>
    
	<cfmodule template="../cftemplates/CT_pageNoteMandatoryFields.cfm">

	<hr>

	<div class="form-row">
		<div class="form-group w-100 text-right">
			<button class="myBtn btn btn-danger" type="button" onclick="deleteIt(form)">
				<i class="fa fa-trash-alt"></i>
				<span class="hidden-xs">&nbsp;Apagar</span>
			</button>


			<button class="myBtn btn btn-success" type="submit">
				<i class="fa fa-check"></i>
				<span class="hidden-xs">&nbsp;Guardar</span>
			</button>
		</div>
	</div>

	<div class="offset-md-4 col-md-4">
		<div class="#VARIABLES.displayData.styleClass#">
			<i class="
				<cfloop collection="#VARIABLES.displayData.iconClass#" item="class">
					#VARIABLES.displayData.iconClass[class]#
				</cfloop>">
			</i>
			<span>#VARIABLES.displayData.title#</span>
		</div>

		<cfif VARIABLES.imageCatalog.recordCount>
			<div class="card shadow">
				<div class="card-body p-3">
					<img src="#APPLICATION.app_images#/loader.gif" data-src="#APPLICATION.uri_uploads_images#/#VARIABLES.imageCatalog.imgPath#" class="card-img-top" alt="#VARIABLES.imageCatalog.imgPath#">
				</div>
				<div class="card-footer text-center header">
					<p class="card-text">#VARIABLES.imageCatalog.imgLabel# - #VARIABLES.imageCatalog.imgDesc#</p>
				</div>
			</div>

		<cfelse>
			<p class="alert alert-info text-center mt-2">#VARIABLES.displayData.alert#</p>
		</cfif>
	</div>

</cfsavecontent>

<cfset VARIABLES.formData = {
	'icon' 	:'#VARIABLES.displayData.iconClass.type#',
	'title' :'Detalhes da Imagem',
	'nav' 	:[
				{
					'link' 	:'../gallery/add.cfm',
					'icon' 	:'fa fa-plus-circle',
					'target':'_self',
					'desc' 	:'Adicionar'
				},
				{
					'link' 	:'../gallery/list.cfm',
					'icon' 	:'fa fa-list',
					'target':'_self',
					'desc' 	:'Pesquisar'
				},
			],
	'content':VARIABLES.content
}>

<cfmodule template = "../cftemplates/CT_formTemplate.cfm" formData="#VARIABLES.formData#">

</cfoutput>