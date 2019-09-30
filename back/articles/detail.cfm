<cfset VARIABLES.getArticles = APPLICATION.articles_gateway.read(URL)>
<cfset VARIABLES.getImages = APPLICATION.articles_images_gateway.readAll(URL)>

<cfset VARIABLES.getArtType = APPLICATION.articles_types_gateway.read(
	params = {
		attId = URL.artType
	}
)>

<cfif isdefined("form.fieldnames")>
	<cfset FORM.artId = URL.artId>
	<cfset FORM.artType = URL.artType>

	<cfif FORM.action EQ 1>
		<cftry>
        
            <cfset FORM.artLocation = (structKeyExists(FORM, 'artLocation') ? FORM.artLocation : 0)>

			<cfif structKeyExists(FORM, "imgId")>
				<cfset VARIABLES.imgList = {
					'idList' = FORM.imgId,
					'artId' = URL.artId
				}>

				<cfset APPLICATION.articles_images_gateway.deleteImage(VARIABLES.imgList)>

				<cfquery name="image" dbtype="query">
					SELECT artId, imgId
					FROM VARIABLES.getImages
					WHERE artId = #URL.artId#
				</cfquery>

				<cfset VARIABLES.listImgId = valueList("VARIABLES.image.imgId")>

				<cfloop list="#VARIABLES.imgList.idList#" item="imgIdLoop">

					<cfif NOT listFind(VARIABLES.listImgId, imgIdLoop)>

						<cfset VARIABLES.priIds = {
							'imgId': imgIdLoop,
							'artId': FORM.artId
						}>

						<cfset APPLICATION.articles_images_gateway.create(VARIABLES.priIds)>

					</cfif>
				</cfloop>
			<cfelse>
				<cfset APPLICATION.articles_images_gateway.delete(FORM)>
			</cfif>
                        
			<cfset APPLICATION.articles_gateway.update(FORM)>
            
            <cfset SESSION.sysMsg = (findNoCase('parceria', VARIABLES.getArtType.attName) OR findNoCase('social network', VARIABLES.getArtType.attName) ? '#VARIABLES.getArtType.attName# alterada com sucesso.' : '#VARIABLES.getArtType.attName# alterado com sucesso.')>

			<cfset SESSION.sysMsgLevel = 1>

			<cfset redirect('back/articles/list.cfm?artType=#URL.artType#')>
		<cfcatch>
			<cfset SESSION.sysMsg = getErrorMessage(CFCATCH)>
			<cfset SESSION.sysMsgLevel = 3>
		</cfcatch>
		</cftry>
	<cfelse>
		<cftry>
			<cfset APPLICATION.articles_gateway.delete(FORM)>
            
            <cfset SESSION.sysMsg = (findNoCase('parceria', VARIABLES.getArtType.attName) OR findNoCase('social network', VARIABLES.getArtType.attName) ? '#VARIABLES.getArtType.attName# eliminada com sucesso.' : '#VARIABLES.getArtType.attName# eliminado com sucesso.')>
			<!--- <cfset session.sysMsg = 'The #VARIABLES.getArtType.attName# was deleted!'> --->
			<cfset SESSION.sysMsgLevel = 1>

			<cfset redirect('back/articles/list.cfm?artType=#URL.artType#')>
		<cfcatch>
			<cfset SESSION.sysMsg = getErrorMessage(CFCATCH)>
			<cfset SESSION.sysMsgLevel = 3>
		</cfcatch>
		</cftry>
	</cfif>
</cfif>

<cfoutput>

<cfsavecontent variable="content">
	<input type="hidden" name="action" value="1">
    
    <cfset LOCAL.artNameLabel = (findNoCase('parceria', VARIABLES.getArtType.attName) OR findNoCase('social network', VARIABLES.getArtType.attName) OR findNoCase('serviço', VARIABLES.getArtType.attName) ? 'Nome' : 'Título')>
	
    <div class="form-row">
		<div class="form-group col-md-6">
			<label for="artname">#LOCAL.artNameLabel# <small>*</small></label>
			<input type="text" class="form-control" id="artname" name="artName" value="#VARIABLES.getArticles.artName#" placeholder="Add the #VARIABLES.getArtType.attName# Title" required>
			<small class="invalid-feedback">Add the Article Title!</small>
		</div>

		<div class="form-group col-md-6">
			<label for="artStatus">Estado <small>*</small></label>
			<select class="form-control" id="artStatus" name="artStatus" required>
				<option value="" selected>Escolha uma opção</option>
				<option value="0" <cfif getArticles.artStatus EQ "0">selected</cfif>>Inativo</option>
				<option value="1" <cfif getArticles.artStatus EQ "1">selected</cfif>>Ativo</option>
			</select>
			<small class="invalid-feedback">escolha um estado.</small>
		</div>
	</div>

	<div class="form-group">
		<label for="artDesc">Descrição <small>*</small></label>
		<textarea class="form-control" id="artDesc" name="artDesc" placeholder="Adicione a descrição" required>#VARIABLES.getArticles.artDesc#</textarea>
		<small class="invalid-feedback">Adicione a descrição.</small>
	</div>

	<cfif URL.artType EQ 2>
		<div class="form-group">
			<label for="artIconClass">Nome da classe / Código do icone</label>
			<input type="text" class="form-control" id="artIconClass" name="artIconClass" value="#VARIABLES.getArticles.artIconClass#" placeholder="Adicione o nome da classe / código do icone">
			<small>Veja os icones disponiveis aqui. Escolha o mais indicado e copie o seu código. <a href="https://fontawesome.com/icons?d=listing&m=free" target="_blank">Icones</a>!</small>
		</div>
	</cfif>

	<div class="form-row">
        <div class="form-group col-md-6">
            <label for="artIconClass">Nome do link</label>
            <input type="text" class="form-control" id="artLinkName" name="artLinkName" value="#VARIABLES.getArticles.artLinkName#" placeholder="Adicione o nome do link">
        </div>

        <div class="form-group col-md-6">
            <label for="artIconClass">Link</label>
            <input type="text" class="form-control" id="artLink" name="artLink" value="#VARIABLES.getArticles.artLink#" placeholder="Adicione um link">
        </div>
    </div>
    
    <cfif URL.artType EQ 1 OR URL.artType EQ 2>
        <div class="form-group">
            <label class="">Usar em:</label>
            <cfset LOCAL.getPages = APPLICATION.pages_gateway.read({pageStatus = 1})>
            
            <cfloop query="LOCAL.getPages">
                <div class="form-row pl-2">
                    <div class="form-check">
                        <input type="checkbox" class="form-check-input" name="artLocation" id="page#LOCAL.getPages.pageId#" value="#LOCAL.getPages.pageId#" <cfif listFind(VARIABLES.getArticles.artLocation, LOCAL.getPages.pageId)>checked</cfif>>
                        <label class="form-check-label" for="page#LOCAL.getPages.pageId#">#LOCAL.getPages.pageName#</label>
                    </div>
                </div>
            </cfloop>
        </div>
    </cfif>

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
				<span>Guardar</span>
			</button>
		</div>
	</div>

	<cfif URL.artType NEQ 2 AND URL.artType NEQ 6>
		<cfset VARIABLES.imgModuleData = {
			'moduleTitle'	:'Catálogo de Imagens',
			'dbConn'		:VARIABLES.getImages,
			'urlId'			:URL.artId,
			'dbKeyList'		:'artId,imgId,imgPath,imgLabel',
			'styleClass'	:'page-heading mt-5 mb-3',
			'icon'			:{
								'style'	:'heading-icon',
								'class'	:'fa fa-images'
							},
			'alert'			:'Sem imagens disponiveis.'
		}>

		<cfmodule template="../gallery/image_module.cfm" attributeCollection="#VARIABLES.imgModuleData#">
	</cfif>

</cfsavecontent>

<cfset LOCAL.formDataTitle = (findNoCase('parceria', VARIABLES.getArtType.attName) OR findNoCase('social network', VARIABLES.getArtType.attName) ? 'Detalhes da #VARIABLES.getArtType.attName#' : 'Detalhes do #VARIABLES.getArtType.attName#')>

<cfset VARIABLES.formData = {
	'icon' 	:'#VARIABLES.getArtType.attIcon#',
	'title' :'#LOCAL.formDataTitle#',
	'nav' 	:[
				{
					'link' 	:'../articles/add.cfm?artType=#URL.artType#',
					'icon' 	:'fa fa-plus-circle',
					'target':'_self',
					'desc' 	:'Adicionar'
				},
				{
					'link' 	:'../articles/list.cfm?artType=#URL.artType#',
					'icon' 	:'fa fa-list',
					'target':'_self',
					'desc' 	:'Pesquisar'
				}
			],
	'content':VARIABLES.content
}>

<cfmodule template = "../cftemplates/CT_formTemplate.cfm" formData="#VARIABLES.formData#">

</cfoutput>

<script>
	$(document).ready(function() {
		var $artDesc = $('#artDesc');

		$artDesc.summernote({
			lang: 'pt-PT'
			, height: 300
			, placeholder: $artDesc.attr('placeholder')
		});
	})
</script>
