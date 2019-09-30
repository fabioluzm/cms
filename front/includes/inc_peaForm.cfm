<cfif isDefined('FORM.fieldnames')>
    <cfset LOCAL.mailData = {
        'name'      :'#FORM.name#',
        'email'     :'#FORM.email#',
        'message'   :'#FORM.message#',
        'phone'     :'#FORM.phone#',
        'company'   :'#FORM.company#',
        'location'  :'Perdidos e Achados'
    }>
    
    <cfmodule template="includes/inc_sendMail.cfm" attributeCollection="#LOCAL.mailData#">
</cfif>

<cfoutput>        
    <form id="pea-contact" method="POST" autocomplete="off">
        <div class="row">
            <div class="form-group col-xs-12">
                <label for="name">Nome <small>*</small></label>
                <input type="text" name="name" id="name" class="form-control" placeholder="Nome completo" required>
            </div>

            <div class="form-group col-xs-12">
                <label for="email">Email <small>*</small></label>
                <input type="text" name="email" id="email" class="form-control" placeholder="E-mail" required>
            </div>

            <div class="form-group col-xs-12 col-md-6">
                <label for="company">Empresa</label>
                <input type="text" name="company" id="company" placeholder="Empresa (Opcional)" class="form-control">
            </div>

            <div class="form-group col-xs-12 col-md-6">
                <label for="phone">Telefone</label>
                <input type="text" name="phone" id="phone" placeholder="Contacto (Opcional)" class="form-control">
            </div>

            <div class="form-group col-xs-12">
                <label for="message">Mensagem</label>
                <textarea name="message" id="message" class="form-control" placeholder="Deixe aqui a sua mensagem (Opcional)" rows="3"></textarea>
            </div>

            <div class="checkbox">
                <label>
                    <input type="checkbox" name="datacheck" id="datacheck" required>
                    Autorizo a utilização dos meus dados pessoais de acordo com a finalidade descrita na Política de Privacidade deste website. <small>*</small>
                </label>
            </div>

            <div class="form-group col-xs-12">
                <cfmodule template="../../back/cftemplates/CT_pageNoteMandatoryFields.cfm">
            </div>

            <button type="submit" onclick="validateForm()" class="btn col-xs-offset-1 col-xs-10 col-sm-offset-2 col-sm-8 col-md-offset-6 col-md-6">Solicite uma demonstração</button>
        </div>
    </form>
</cfoutput>