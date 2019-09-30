<cfset VARIABLES.getPages = APPLICATION.pages_gateway.read(URL)>
<cfset VARIABLES.getMetatags = APPLICATION.metatags_gateway.read({mtLocation = URL.pageId})>

<cfif isdefined("form.fieldnames")>

    <cfset FORM.pageId = URL.pageId>
    <cfset FORM.mtLocation = URL.pageId>
    <cfset FORM.mtId = VARIABLES.getMetatags.mtId>
    
    <cfdirectory action="list" directory="#APPLICATION.app_uploads_images#social_network\" recurse="false" name="fileName" filter="#VARIABLES.getMetatags.mtOgImage#">
    
    <cfif FORM.action EQ 1>
        <cftry>
            <cfif structKeyExists(FORM, 'mtOgImage') AND LEN(FORM.mtOgImage)>
                <cffile action="upload" filefield="mtOgImage" destination="#application.app_uploads_images#social_network\" result="newImage" nameconflict="makeunique">

                <cfif FILENAME.recordCount>
                    <cffile action="delete" file="#APPLICATION.app_uploads_images#social_network\#VARIABLES.getMetatags.mtOgImage#">
                </cfif>

                <cfset FORM.mtOgImage = VARIABLES.newImage.serverfile>
            <cfelse>
                <cfset FORM.mtOgImage = VARIABLES.getMetatags.mtOgImage>
            </cfif>
            
            <cfset APPLICATION.pages_gateway.update(FORM)>
            <cfset APPLICATION.metatags_gateway.update(FORM)>
            
            <cfset SESSION.sysMsg = 'A informação da página foi alterada com sucesso.'>
            <cfset SESSION.sysMsgLevel = 1>

            <cfset redirect('back/pages/list.cfm')>
        <cfcatch>
            <cfset SESSION.sysMsg = getErrorMessage(CFCATCH)>
            <cfset SESSION.sysMsgLevel = 3>
        </cfcatch>
        </cftry>
    <cfelse>
        <cftry>
            <cfset APPLICATION.pages_gateway.delete(FORM)>
            <cfset APPLICATION.metatags_gateway.delete(FORM)>
            <cffile action="delete" file="#APPLICATION.app_uploads_images#social_network\#VARIABLES.getMetatags.mtOgImage#">
            
            <cfset SESSION.sysMsg = 'A página foi eliminada com sucesso.'>
            <cfset SESSION.sysMsgLevel = 1>

            <cfset redirect('back/pages/list.cfm')>
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

        <div class="tab">
            <a class="tablinks active" onclick="openTab(event, 'mainTab')">Principal</a>
            <a class="tablinks" onclick="openTab(event, 'seoTags')">SEO Metatags</a>
            <a class="tablinks" onclick="openTab(event, 'socialTags')">Social Metatags</a>
        </div>
        
        <div id="mainTab" class="tabcontent">
            <div class="form-row">
                <div class="form-group col-md-6">
                    <label for="pageName">Nome <small>*</small></label>
                    <input type="text" class="form-control" id="pageName" name="pageName" placeholder="Adicione o nome da página" value="#getPages.pageName#" required>
                    <small class="invalid-feedback">Adicione o nome da página.</small>
                </div>
                
                <div class="form-group col-md-6">
                    <label for="pageStatus">Estado <small>*</small></label>
                    <select class="form-control" id="pageStatus" name="pageStatus" required>
                        <option value="" selected>Escolha uma opção</option>
                        <option value="0"<cfif getPages.pageStatus EQ "0">selected</cfif>>Rascunho</option>
                        <option value="1"<cfif getPages.pageStatus EQ "1">selected</cfif>>Publicada</option>
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
                    <input type="text" class="form-control" id="mtAuthor" name="mtAuthor" value="#VARIABLES.getMetatags.mtAuthor#" placeholder="">
                </div>
                
                <div class="form-group col-md-6">
                    <label for="mtRevised">Revisão</label>
                    <input type="date" class="form-control" id="mtRevised" name="mtRevised" value="#VARIABLES.getMetatags.mtRevised#" placeholder="">
                </div>
            </div>
            
            <div class="form-row">
                <div class="form-group col-md-6">
                    <label for="mtKeywords">Keywords</label>
                    <textarea class="form-control" id="mtKeywords" name="mtKeywords" rows="5" placeholder="">#VARIABLES.getMetatags.mtKeywords#</textarea>
                </div>
                
                <div class="form-group col-md-6">
                    <label for="mtDescription">Descrição</label>
                    <textarea class="form-control" id="mtDescription" name="mtDescription" rows="5" placeholder="">#VARIABLES.getMetatags.mtDescription#</textarea>
                </div>
            </div>
            
            <cfmodule template="../cftemplates/CT_pageNoteMandatoryFields.cfm">
        </div>
        
        <div id="socialTags" class="tabcontent">
            <div class="form-row">
                <div class="form-group col-md-4">
                    <label for="mtOgTitle">Title</label>
                    <input type="text" class="form-control" id="mtOgTitle" name="mtOgTitle" value="#VARIABLES.getMetatags.mtOgTitle#" placeholder="">
                </div>
                
                <div class="form-group col-md-4">
                    <label for="mtOgSitename">Sitename</label>
                    <input type="text" class="form-control" id="mtOgSitename" name="mtOgSitename" value="#VARIABLES.getMetatags.mtOgSitename#" placeholder="">
                </div>
                
                <div class="form-group col-md-4">
                    <label for="mtOgType">Type</label>
                    <input type="text" class="form-control" id="mtOgType" name="mtOgType" value="#VARIABLES.getMetatags.mtOgType#" placeholder="">
                </div>
            </div>

            <div class="form-group">
                <label for="mtOgDesc">Description</label>
                <textarea class="form-control" id="mtOgDesc" name="mtOgDesc" rows="5" placeholder="">#VARIABLES.getMetatags.mtOgDesc#</textarea>
            </div>

            <div class="form-row">
                <div class="form-group col-md-6">
                    <label for="mtOgImgType">Image type</label>
                    <input type="text" class="form-control" id="mtOgImgType" name="mtOgImgType" value="#VARIABLES.getMetatags.mtOgImgType#" placeholder="">
                </div>
                
                <div class="form-group col-md-6">
                    <label for="mtOgImage">Image</label>
                    <input type="file" class="form-control-file" id="mtOgImage" name="mtOgImage" placeholder="">
                    <span>#VARIABLES.getMetatags.mtOgImage#</span>
                </div>
            </div>
            
            <div class="form-row">
                <div class="form-group col-md-6">
                    <label for="mtOgImgWidth">Image Width</label>
                    <input type="text" class="form-control" id="mtOgImgWidth" name="mtOgImgWidth" value="#VARIABLES.getMetatags.mtOgImgWidth#" placeholder="">
                </div>
            
                <div class="form-group col-md-6">
                    <label for="mtOgImgHeight">Image Height</label>
                    <input type="text" class="form-control" id="mtOgImgHeight" name="mtOgImgHeight" value="#VARIABLES.getMetatags.mtOgImgHeight#" placeholder="">
                </div>
            </div>
            
            <div class="form-row">
                <div class="form-group col-md-6">
                    <label for="mtOgUrl">URL</label>
                    <input type="url" class="form-control" id="mtOgUrl" name="mtOgUrl" value="#VARIABLES.getMetatags.mtOgUrl#" placeholder="https://example.com">
                </div>
            
                <div class="form-group col-md-6">
                    <label for="mtCanonical">Canonical Url</label>
                    <input type="url" class="form-control" id="mtCanonical" name="mtCanonical" value="#VARIABLES.getMetatags.mtCanonical#" placeholder="https://example.com">
                </div>
            </div>
            
            <cfif structKeyExists(VARIABLES.getMetatags, 'mtOgImage') AND LEN(VARIABLES.getMetatags.mtOgImage)>
                <cfset LOCAL.displayData = {
                    'styleClass'    :'page-heading mt-5',
                    'iconClass'     :{
                                        'style' :'heading-icon',
                                        'type'  :' fa fa-images'
                                    },
                    'title'         :'Imagem de Amostra',
                    'imgPath'       :'#APPLICATION.uri_uploads_images#/social_network',
                    'image'         :'#VARIABLES.getMetatags.mtOgImage#',
                    'alert'         :'Sem imagem disponível.'
                }>
                
                <cfmodule template="../cftemplates/CT_imageTemplate.cfm" attributeCollection="#LOCAL.displayData#"/>
            </cfif>
            
            <cfmodule template="../cftemplates/CT_pageNoteMandatoryFields.cfm">        
        </div>

        <div class="form-row pt-3">
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
    </cfsavecontent>


    <cfset VARIABLES.formData = {
        'icon'     :'fas fa-file-alt',
        'title' :'Detalhes da Página',
        'nav'     :[
                    {
                        'link'     :'../pages/add.cfm',
                        'icon'     :'fa fa-plus-circle',
                        'target':'_self',
                        'desc'     :'Adicionar'
                    },
                    {
                        'link'     :'../pages/list.cfm',
                        'icon'     :'fa fa-list',
                        'target':'_self',
                        'desc'     :'Pesquisar'
                    }
                ],
        'content':VARIABLES.content
    }>

    <cfmodule template = "../cftemplates/CT_formTemplate.cfm" formData="#VARIABLES.formData#">

</cfoutput>