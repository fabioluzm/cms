<cfif isDefined("FORM.fieldNames")>
	<cftry>
        
        <cfset FORM.imgLocation = (structKeyExists(FORM, 'imgLocation') ? FORM.imgLocation : 0)>
        <cfset FORM.imgSlideShow = (structKeyExists(FORM, 'imgSlideShow') ? 1 : 0)>
        <cfset FORM.imgBanner    = (structKeyExists(FORM, 'imgBanner') ? 1 : 0)>
        <cfset FORM.imgPortfolio = (structKeyExists(FORM, 'imgPortfolio') ? 1 : 0)>
        <cfset FORM.imgTeam      = (structKeyExists(FORM, 'imgTeam') ? 1 : 0)>

		<cffile action="upload" filefield="imgPath" destination="#application.app_uploads_images#" result="newImage" nameconflict="makeunique">

		<cfset FORM.imgPath = VARIABLES.newImage.serverfile>

		<cfset VARIABLES.newImg = APPLICATION.images_catalog_gateway.create(FORM)>

		<cfset SESSION.sysMsg = 'A imagem foi adicionada com sucesso.'>
		<cfset SESSION.sysMsgLevel = 1>

		<cfset redirect('back/gallery/detail.cfm?imgId=#VARIABLES.newImg.imgId#')>
	<cfcatch>
		<cfset SESSION.sysMsg = getErrorMessage(cfcatch)>
		<cfset SESSION.sysMsgLevel = 3>
	</cfcatch>
	</cftry>
</cfif>

<cfoutput>
    <cfsavecontent variable="content">
            <input type="hidden" name="action" value="1">

            <div class="form-row">
                <div class="form-group col-md-6">
                    <label for="imgLabel"> Título <small>*</small></label>
                    <input type="text" class="form-control" id="imgLabel" name="imgLabel" placeholder="Título da imagem" required>
                    <small class="invalid-feedback">Adicione um título.</small>
                </div>
                
                <div class="form-group col-md-6">
                    <label for="imgDesc"> Descrição <small>*</small></label>
                    <input type="text" class="form-control" id="imgDesc" name="imgDesc" placeholder="Descrição da imagem" required>
                    <small class="invalid-feedback">Adicione a descrição.</small>
                </div>
            </div>

            <div class="form-row">
                <div class="form-group col-md-6">
                    <label for="imgPath"> Escolha uma imagem <small>*</small></label>
                    <input type="file" class="form-control-file" id="imgPath" name="imgPath" accept="image/*" placeholder="Escolha a imagem para upload" required>
                    <small class="invalid-feedback">Escolha uma imagem para fazer upload.</small>
                </div>
            </div>
            
            <div class="form-group">
                <label class="">Usar como:</label>
                
                <div class="form-row pl-2">
                    <div class="form-check">
                        <input type="checkbox" class="form-check-input" name="imgSlideShow" id="imgSlideShow">
                        <label class="form-check-label" for="imgSlideShow">Slideshow</label>
                    </div>
                </div>
                
                <div class="form-row pl-2">
                    <div class="form-check">
                        <input type="checkbox" class="form-check-input" name="imgBanner" id="imgBanner">
                        <label class="form-check-label" for="imgBanner">Banner</label>
                    </div>
                </div>
                    
                <div class="form-row pl-2">
                    <div class="form-check">
                        <input type="checkbox" class="form-check-input" name="imgPortfolio" id="imgPortfolio">
                        <label class="form-check-label" for="imgPortfolio">Portefólio</label>
                    </div>
                </div>
                    
                <div class="form-row pl-2">
                    <div class="form-check">
                        <input type="checkbox" class="form-check-input" name="imgTeam" id="imgTeam">
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
                            <input type="checkbox" class="form-check-input" name="imgLocation" id="page#LOCAL.getPages.pageId#" value="#LOCAL.getPages.pageId#">
                            <label class="form-check-label" for="page#LOCAL.getPages.pageId#">#LOCAL.getPages.pageName#</label>
                        </div>
                    </div>
                </cfloop>
            </div>

            <cfmodule template="../cftemplates/CT_pageNoteMandatoryFields.cfm">

            <hr>

            <div class="form-row">
                <div class="form-group w-100 text-right">
                    <button class="myBtn btn btn-info" type="button" onclick="goPage('list.cfm')">
                        <i class="fa fa-undo"></i>
                        <span>&nbsp;Voltar</span>
                    </button>

                    <button class="myBtn btn btn-success" type="submit">
                        <i class="fa fa-check"></i>
                        <span class="hidden-xs">&nbsp;Guardar</span>
                    </button>
                </div>
            </div>
    </cfsavecontent>

    <cfset VARIABLES.formData = {
        'icon' 	:'fa fa-images',
        'title' :'Nova Imagem',
        'nav' 	:[
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