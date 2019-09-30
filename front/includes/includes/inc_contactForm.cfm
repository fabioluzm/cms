<!--- Prevent the module from rendering twice --->
<cfif thisTag.executionMode EQ "end">
    <cfexit method="exittag" />
</cfif>

<cfif isDefined('FORM.fieldnames')>
    
    <cfset LOCAL.mailData = {
        'name'      :'#FORM.name#',
        'email'     :'#FORM.email#',
        'services'  :'#FORM.services#',
        'message'   :'#FORM.message#',
        'subject'   :'#FORM.subject#',
        'location'  :'#findNoCase("cowork", ARGUMENTS.targetPage) ? "Cowork" : "Reis & Marreiros, Lda"#'
    }>
    <cfmodule template="includes/inc_sendMail.cfm" attributeCollection="#LOCAL.mailData#"/>
</cfif>

<form id="contactus" class="form-horizontal">
    <div class="row downSpace">
        <div class="col-md-10 col-md-offset-2 text-center">
            <fieldset>
                <legend class="formlegend"><cfoutput>#ATTRIBUTES.formTitle#</cfoutput></legend>
            </fieldset>
        </div>
    </div>

    <div class="form-group row formspace">
        <label class="col-md-2 control-label">Nome:</label>
        <div class="col-md-10">
            <input type="text" name="name" class="text-area-size form-control formshadow" required>
        </div>
    </div>

    <div class="form-group row formspace">
        <label class="col-md-2 control-label">Email:</label>
        <div class="col-md-10">
            <input type="email" name="email" class="text-area-size form-control formshadow" required>
        </div>
    </div>
    
    <cfif structKeyExists(ATTRIBUTES, 'location') AND LEN(ATTRIBUTES.location)>
        <div class="form-group row formspace">
            <label class="col-md-2 control-label">Serviços:</label>
            <div class="col-md-10">
                <select name="services" class="form-control formshadow" required>
                    
                    <cfif findNoCase('2', ATTRIBUTES.location)>
                        <option value="" hidden>Escolha uma opção</option>
                        <option value="Co-Work" selected>Co-Work Space</option>
                    
                    <cfelseif findNoCase('1', ATTRIBUTES.location)>
                        <option value="">Escolha uma opção</option>
                        <option value="Desenvolvimento">Desenvolvimento</option>
                        <option value="Webpages">Páginas Web</option>
                        <option value="Outros">Outros</option>
                    </cfif>
                </select>
            </div>
        </div>
    </cfif>

    <div class="form-group row formspace">
        <label class="col-md-2 control-label">Assunto:</label>
        <div class="col-md-10">
            <input type="text" name="subject" class="text-area-size form-control formshadow" required>
        </div>
    </div>

    <div class="form-group row formspace">
        <label class="col-md-2 control-label">Descrição:</label>
        <div class="col-md-10">
            <textarea id="formContent" name="message" rows="5" class="text-area-size form-control formshadow" required></textarea>
        </div>
    </div>

    <div class="row text-center formspace">
        <div class="col-md-8 col-md-offset-3">
            <input class="btn btn-default sr-button btn-form formshadow downSpace" type="submit" value="Enviar" onclick="validateForm();">
        </div>
    </div>
</form>