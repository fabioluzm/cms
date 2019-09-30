
<cfif isDefined("FORM.fieldNames")>
	<cftry>
		<cfset VARIABLES.newPage = APPLICATION.pages_gateway.create(FORM)>
        
        <cfset FORM.mtLocation = VARIABLES.newPage.pageId>
        
        <cfif structKeyExists(FORM, 'mtOgImage') AND LEN(FORM.mtOgImage)>
            <cffile action="upload" filefield="mtOgImage" destination="#application.app_uploads_images#social_network\" result="newImage" nameconflict="makeunique">
            <cfset FORM.mtOgImage = VARIABLES.newImage.serverfile>
        </cfif>
        
		<cfset VARIABLES.newMeta = APPLICATION.metatags_gateway.create(FORM)>

        <cfset SESSION.sysMsg = 'Página adicionada com sucesso.'>
		<cfset SESSION.sysMsgLevel = 1>

		<cfset redirect('back/pages/list.cfm')>
	<cfcatch>
		<cfset SESSION.sysMsg = getErrorMessage(CFCATCH)>
		<cfset SESSION.sysMsgLevel = 3>
	</cfcatch>
	</cftry>
</cfif>

<cfoutput>

<cfsavecontent variable="content">

    <div class="tab">
        <a class="tablinks active" onclick="openTab(event, 'mainTab')">Principal</a>
        <a class="tablinks" onclick="openTab(event, 'seoTags')">SEO Metatags</a>
        <a class="tablinks" onclick="openTab(event, 'socialTags')">Social Metatags</a>
    </div>
    
    <div id="mainTab" class="tabcontent">
        <div class="form-row">
            <div class="form-group col-md-6">
                <label for="pageName">Nome <small>*</small></label>
                <input type="text" class="form-control" id="pageName" name="pageName" placeholder="Adicione o nome da página" required>
                <small class="invalid-feedback">Adicione o nome da página.</small>
            </div>
            
            <div class="form-group col-md-6">
                <label for="pageStatus">Estado <small>*</small></label>
                
                <select class="form-control" id="pageStatus" name="pageStatus" required>
                    <option value="" selected>Escolha uma opção</option>
                    <option value="0">Rascunho</option>
                    <option value="1">Publicada</option>
                </select>
                <small class="invalid-feedback">Escolha o estado da página.</small>
            </div>
        </div>
        
        <cfmodule template="../cftemplates/CT_pageNoteMandatoryFields.cfm">
    </div>
    
    <div id="seoTags" class="tabcontent">        
        <div class="form-row">
            <div class="form-group col-md-6">
                <label for="mtAuthor">Autor</label>
                <input type="text" class="form-control" id="mtAuthor" name="mtAuthor" placeholder="">
            </div>
            
            <div class="form-group col-md-6">
                <label for="mtRevised">Revisão</label>
                <input type="date" class="form-control" id="mtRevised" name="mtRevised" placeholder="">
            </div>
        </div>
        
        <div class="form-row">
            <div class="form-group col-md-6">
                <label for="mtKeywords">Keywords</label>
                <textarea class="form-control" id="mtKeywords" name="mtKeywords" rows="5" placeholder=""></textarea>
            </div>
            
            <div class="form-group col-md-6">
                <label for="mtDescription">Descrição</label>
                <textarea class="form-control" id="mtDescription" name="mtDescription" rows="5" placeholder=""></textarea>
            </div>
        </div>
        
        <cfmodule template="../cftemplates/CT_pageNoteMandatoryFields.cfm">
    </div>
    
    <div id="socialTags" class="tabcontent">
        <div class="form-row">
            <div class="form-group col-md-4">
                <label for="mtOgTitle">Title</label>
                <input type="text" class="form-control" id="mtOgTitle" name="mtOgTitle" placeholder="">
            </div>
            
            <div class="form-group col-md-4">
                <label for="mtOgSitename">Sitename</label>
                <input type="text" class="form-control" id="mtOgSitename" name="mtOgSitename" placeholder="">
            </div>
            
            <div class="form-group col-md-4">
                <label for="mtOgType">Type</label>
                <input type="text" class="form-control" id="mtOgType" name="mtOgType" placeholder="">
            </div>
        </div>

        <div class="form-group">
            <label for="mtOgDesc">Description</label>
            <textarea class="form-control" id="mtOgDesc" name="mtOgDesc" rows="5" placeholder=""></textarea>
        </div>

        <div class="form-row">
            <div class="form-group col-md-6">
                <label for="mtOgImgType">Image type</label>
                <input type="text" class="form-control" id="mtOgImgType" name="mtOgImgType" placeholder="">
            </div>
            
            <div class="form-group col-md-6">
                <label for="mtOgImage">Image</label>
                <input type="file" class="form-control-file" id="mtOgImage" name="mtOgImage" placeholder="">
            </div>
        </div>
        
        <div class="form-row">
            <div class="form-group col-md-6">
                <label for="mtOgImgWidth">Image Width</label>
                <input type="text" class="form-control" id="mtOgImgWidth" name="mtOgImgWidth" placeholder="">
            </div>
        
            <div class="form-group col-md-6">
                <label for="mtOgImgHeight">Image Height</label>
                <input type="text" class="form-control" id="mtOgImgHeight" name="mtOgImgHeight" placeholder="">
            </div>
        </div>
        
        <div class="form-row">
            <div class="form-group col-md-6">
                <label for="mtOgUrl">URL</label>
                <input type="url" class="form-control" id="mtOgUrl" name="mtOgUrl" placeholder="https://example.com">
            </div>
        
            <div class="form-group col-md-6">
                <label for="mtCanonical">Canonical Url</label>
                <input type="url" class="form-control" id="mtCanonical" name="mtCanonical" placeholder="https://example.com">
            </div>
        </div>
        
        <cfmodule template="../cftemplates/CT_pageNoteMandatoryFields.cfm">        
    </div>

	<div class="form-row pt-3">
		<div class="form-group w-100 text-right">
			<button class="myBtn btn btn-info" type="button" onclick="goPage('list.cfm')">
				<i class="fa fa-undo"></i>
				<span>&nbsp;Voltar</span>
			</button>

			<button class="myBtn btn btn-success" type="submit">
				<i class="fa fa-check"></i>
				<span>&nbsp;Guardar</span>
			</button>
		</div>
	</div>
</cfsavecontent>

<cfset VARIABLES.formData = {
	'icon' 	:'fas fa-file-alt',
	'title' :'Nova Página',
	'nav' 	:[
				{
					'link' 	:'../pages/list.cfm',
					'icon' 	:'fa fa-list',
					'target':'_self',
					'desc' 	:'Pesquisar'
				}
			],
	'content': VARIABLES.content
}>

<cfmodule template = "../cftemplates/CT_formTemplate.cfm" formData="#variables.formData#">

</cfoutput>
