<cfif isDefined("FORM.fieldNames")>
	<cftry>
		<cfset VARIABLES.getUser = APPLICATION.users_gateway.read(FORM)>

		<!--- include encryption library --->
		<cfinclude template="../libs/passwordEncryptionLib.cfm">

		<cfif NOT VARIABLES.getUser.recordCount OR NOT validatePassword(FORM.usrPassword, VARIABLES.getUser.usrSalt, VARIABLES.getUser.usrPassword)>
			<cfthrow message="As crendeciais inseridas estão incorretas."/>
		</cfif>

		<cfset SESSION.sysMsg = 'Olá, #VARIABLES.getUser.usrName#!'>
		<cfset SESSION.sysMsgLevel = 1>

		<cfset SESSION.cstData = VARIABLES.getUser>

		<cflocation url="dashboard.cfm">
	<cfcatch>
		<cfset SESSION.sysMsg = getErrorMessage(CFCATCH)>
		<cfset SESSION.sysMsgLevel = 3>
	</cfcatch>
	</cftry>
</cfif>

<cfoutput>

<cfsavecontent variable="content">
	<div class="label-login">
		<p class="text-center label-login">Insira as credenciais de acesso para entrar.</p>
	</div>

	<div class="form-group content-box">
		<label for="usrEmail">E-mail <small>*</small></label>
		<input type="email" class="form-control" id="usrEmail" name="usrEmail" placeholder="Insira o email" required>
		<small class="invalid-feedback">Insira o email.</small>
	</div>

	<div class="form-group content-box">
		<label for="usrPassword">Senha <small>*</small></label>
		<input type="password" class="form-control" id="usrPassword" name="usrPassword" placeholder="Insira a senha" autocomplete="new-password" required>
		<small class="invalid-feedback">Insira a senha.</small>
	</div>

	<cfmodule template="../cftemplates/CT_pageNoteMandatoryFields.cfm">

	<div class="float-right content-box mt-4">
		<button class="btn btn-success btn-large" id="signInBtn" type="submit">Entrar</button>
	</div>

	<script src="#APPLICATION.app_js#/systemMessage.js"></script>
	<script src="../assets/js/app.js"></script>

</cfsavecontent>

<cfset VARIABLES.formData = {
	'img' = '#APPLICATION.app_images#/logo/favicon.png',
	'title' = '#APPLICATION.applicationname#',
	'content' = VARIABLES.content
}>

<div class="container main-content-box">
	<div class="row">
		<div class="col-10 col-md-8 col-lg-6 mx-auto">
			<cfmodule template = "../cftemplates/CT_formTemplate.cfm" formData="#VARIABLES.formData#">
		</div>
	</div>
</div>

</cfoutput>
