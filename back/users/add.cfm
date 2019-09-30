<cfif session.cstData.usrAdmin GT 1>
	<cfset redirect('back/users/detail.cfm?usrId=#session.cstData.usrId#')>
</cfif>

<cfif isDefined("form.fieldNames")>
	<cftry>
		<!--- include encryption library --->
		<cfinclude template="../libs/passwordEncryptionLib.cfm">

		<cfset VARIABLES.passHashAndSalt = encryptPassword(form.usrPassword)>

		<cfset FORM.usrPassword = VARIABLES.passHashAndSalt.password>
		<cfset FORM.usrSalt = VARIABLES.passHashAndSalt.salt>

		<cfset VARIABLES.newUser = application.users_gateway.create(form)>

		<cfset session.sysMsg = 'The user, #form.usrName#, was created sucessfully!'>
		<cfset session.sysMsgLevel = 1>

		<cfset redirect('back/users/detail.cfm?usrId=#newUser.usrId#')>
	<cfcatch>
		<cfset session.sysMsg = getErrorMessage(cfcatch)>
		<cfset session.sysMsgLevel = 3>
	</cfcatch>
	</cftry>
</cfif>

<cfoutput>

<cfsavecontent variable="content">
	<div class="form-group">
		<label for="usrName">User Name <small>*</small></label>
		<input type="text" class="form-control" id="usrName" name="usrName" placeholder="Add User Name" required>
		<small class="invalid-feedback">Add User Name!</small>
	</div>
	<div class="form-row">
		<div class="form-group col-md-6">
			<label for="usrEmail">User Email <small>*</small></label>
			<input type="email" class="form-control" id="usrEmail" name="usrEmail" placeholder="Add User Email" required>
			<small class="invalid-feedback">Add User Email!</small>
		</div>

		<div class="form-group col-md-6">
			<label for="usrPassword">User Password <small>*</small></label>
			<input type="password" class="form-control" id="usrPassword" name="usrPassword" placeholder="Add User Password" autocomplete="new-password" required pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[^a-zA-Z0-9])[^,~\^]{8,30}"/>
			<small class="invalid-feedback">The password needs to have 8 characters, one upper case letter and another lower case letter, one number and one symbol. Warning, the following characters are not allowed ^ , ou ~.</small>
		</div>
	</div>

	<cfmodule template="../cftemplates/CT_pageNoteMandatoryFields.cfm">

	<hr>

	<div class="form-row">
		<div class="form-group w-100 text-right">
			<button class="myBtn btn btn-info" type="button" onclick="goPage('list.cfm')">
				<i class="fa fa-undo"></i>
				<span>Back</span>
			</button>

			<button class="myBtn btn btn-success" type="submit">
				<i class="fa fa-check"></i>
				<span>Save</span>
			</button>
		</div>
	</div>
</cfsavecontent>

<cfset VARIABLES.formData = {
	'icon' 	:'fa fa-users',
	'title' :'New User',
	'nav' 	:[
				{
					'link' 	:'../users/list.cfm',
					'icon' 	:'fa fa-list',
					'target':'_self',
					'desc' 	:'Search'
				},
			],
	'content':variables.content
}>

<cfmodule template = "../cftemplates/CT_formTemplate.cfm" formData="#variables.formData#">

</cfoutput>
