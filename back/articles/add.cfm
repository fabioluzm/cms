<cfset VARIABLES.getArtType = APPLICATION.articles_types_gateway.read(
	params = {
		attId = URL.artType
	}
)>

<cfif isDefined("FORM.fieldNames")>
	<cfset FORM.artType = URL.artType>
    
	<cftry>
        <cfset FORM.artLocation = (structKeyExists(FORM, 'artLocation') ? FORM.artLocation : 0)>
		
        <cfset VARIABLES.newArt = application.articles_gateway.create(form)>

        <cfset session.sysMsg = (findNoCase('parceria', VARIABLES.getArtType.attName) ? '#VARIABLES.getArtType.attName# adicionada com sucesso.' : '#VARIABLES.getArtType.attName# adicionado com sucesso.')>
		<cfset session.sysMsgLevel = 1>

		<cfset redirect('back/articles/list.cfm?artType=#URL.artType#')>
	<cfcatch>
		<cfset session.sysMsg = getErrorMessage(cfcatch)>
		<cfset session.sysMsgLevel = 3>
	</cfcatch>
	</cftry>
</cfif>

<cfoutput>

<cfsavecontent variable="content">
	<div class="form-row">
		<div class="form-group col-md-6">
            <cfset LOCAL.artNameLabel = (findNoCase('parceria', VARIABLES.getArtType.attName) OR findNoCase('social network', VARIABLES.getArtType.attName) OR findNoCase('serviço', VARIABLES.getArtType.attName) ? 'Nome' : 'Título')>
            
			<label for="artname">#LOCAL.artNameLabel# <small>*</small></label>
			<input type="text" class="form-control" id="artname" name="artname" placeholder="Adicione um #LOCAL.artNameLabel#" required>
			<small class="invalid-feedback">Adicione um #LOCAL.artNameLabel#.</small>
		</div>

		<div class="form-group col-md-6">
			<label for="artStatus">Estado <small>*</small></label>
			<select class="form-control" id="artStatus" name="artStatus" required>
				<option value="" selected>Escolha uma opção</option>
				<option value="0">Inactivo</option>
				<option value="1">Activo</option>
			</select>
			<small class="invalid-feedback">Escolha um estado.</small>
		</div>
	</div>

	<div class="form-group">
		<label for="artDesc">Descrição</label>
		<textarea class="form-control" id="artDesc" name="artDesc" placeholder="Adicione a descrição" required></textarea>
		<small class="invalid-feedback">Adicione a descrição.</small>
	</div>

	<cfif URL.artType EQ 2>
		<div class="form-group">
			<label for="artIconClass">Nome da classe / Código do icone</label>
			<input type="text" class="form-control" id="artIconClass" name="artIconClass" placeholder="Adicione o nome da classe / código do icone">
		</div>
	</cfif>

	<div class="form-row">
        <div class="form-group col-md-6">
            <label for="artIconClass">Nome do Link</label>
            <input type="text" class="form-control" id="artLinkName" name="artLinkName" placeholder="Adicione o nome do link">
        </div>

        <div class="form-group col-md-6">
            <label for="artIconClass">Link</label>
            <input type="text" class="form-control" id="artLink" name="artLink" placeholder="Adicione o link">
        </div>
    </div>
	
    <cfif URL.artType EQ 1 AND URL.artType EQ 2>
        <div class="form-group">
            <label class="">Usar em:</label>
            
            <cfset LOCAL.getPages = APPLICATION.pages_gateway.read({pageStatus = 1})>
            
            <cfloop query="LOCAL.getPages">
                <div class="form-row pl-2">
                    <div class="form-check">
                        <input type="checkbox" class="form-check-input" name="artLocation" id="page#LOCAL.getPages.pageId#" value="#LOCAL.getPages.pageId#">
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
			<button class="myBtn btn btn-info" type="button" onclick="goPage('list.cfm')">
				<i class="fa fa-undo"></i>
				<span>Voltar</span>
			</button>

			<button class="myBtn btn btn-success" type="submit">
				<i class="fa fa-check"></i>
				<span>Guardar</span>
			</button>
		</div>
	</div>
</cfsavecontent>

<cfset LOCAL.formDataTitle = (findNoCase('parceria', VARIABLES.getArtType.attName) OR findNoCase('social network', VARIABLES.getArtType.attName) ? 'Nova #VARIABLES.getArtType.attName#' : 'Novo #VARIABLES.getArtType.attName#')>

<cfset VARIABLES.formData = {
	'icon' 	:'#VARIABLES.getArtType.attIcon#',
	'title' :'#LOCAL.formDataTitle#',
	'nav' 	:[
				{
					'link' 	:'../articles/list.cfm?artType=#URL.artType#',
					'icon' 	:'fa fa-list',
					'target':'_self',
					'desc' 	:'Pesquisar'
				}
			],
	'content': VARIABLES.content
}>

<cfmodule template = "../cftemplates/CT_formTemplate.cfm" formData="#variables.formData#">

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
