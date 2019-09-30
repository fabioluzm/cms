<cfset VARIABLES.user = application.users_gateway.readById(URL.usrId)>
<cfset VARIABLES.getUser = application.users_gateway.read()>

<cfquery name="getDevId" dbtype="query">
	SELECT usrId
	FROM VARIABLES.getUser
	WHERE usrAdmin = 0
</cfquery>

<cfset VARIABLES.listOfDevIds = valueList(variables.getDevId.usrId)>
<cfset VARIABLES.listOfDevIds = listFind(variables.listOfDevIds, URL.usrId)>

<cfif VARIABLES.listOfDevIds && session.cstData.usrAdmin GT 0>

	<cfset redirect('back/users/detail.cfm?usrId=#session.cstData.usrId#')>

<cfelseif session.cstData.usrId NEQ URL.usrId && session.cstData.usrAdmin GT 1>

	<cfset redirect('back/users/detail.cfm?usrId=#session.cstData.usrId#')>

</cfif>

<cfif isDefined("form.fieldNames")>
	<cfif FORM.action EQ "1">
		<cftry>
			<cfif session.cstData.usrAdmin eq "0">
				<cfset FORM.usrAdmin = "0">
				<cfset FORM.usrStatus = "1">
			</cfif>
			<cfset application.users_gateway.update(form)>

			<cfset session.sysMsg = 'The user "#form.usrName#" was updated!'>
			<cfset session.sysMsgLevel = 1>

			<cfset redirect('back/users/detail.cfm?usrId=#user.usrId#')>
		<cfcatch>
			<cfset session.sysMsg = getErrorMessage(cfcatch)>
			<cfset session.sysMsgLevel = 3>
		</cfcatch>
		</cftry>
	<cfelse>
		<cftry>
			<cfset application.users_gateway.delete(user)>

			<cfset session.sysMsg = 'The user was deleted!'>
			<cfset session.sysMsgLevel = 1>

			<cfset redirect('back/users/list.cfm')>
		<cfcatch>
			<cfset session.sysMsg = getErrorMessage(cfcatch)>
			<cfset session.sysMsgLevel = 3>
		</cfcatch>
		</cftry>
	</cfif>
</cfif>

<cfoutput>

<cfsavecontent variable="content">
	<input type="hidden" name="action" id="action" value="1">
	<input type="hidden" name="usrId" id="usrId" value="#URL.usrId#">

	<div class="form-group">
		<label for="usrName">User Name <small>*</small></label>
		<input type="text" class="form-control" id="usrName" name="usrName" value="#user.usrName#" placeholder="Add User Name" required>
		<small class="invalid-feedback">Add User Name!</small>
	</div>

	<div class="form-row align-items-end">
		<div class="form-group col-md-6">
			<label for="usrEmail">User Email <small>*</small></label>
			<input type="email" class="form-control" id="usrEmail" name="usrEmail" value="#user.usrEmail#" placeholder="Add User Email" required>
			<small class="invalid-feedback">Add User Email!</small>
		</div>

		<div class="form-group col-md-6 text-left">
			<button type="button" class="btn btn-info" onclick="showPasswordModal();">
				<i class="fas fa-key"></i>
				<span>&nbsp;Change Password</span>
			</button>
			<small class="invalid-feedback">Add User Password!</small>
		</div>
	</div>

	<cfif session.cstData.usrAdmin LTE 1>
		<div class="form-row">
			<div class="form-group col-md-6">
				<label for="usrAdmin">Type <small>*</small></label>
				<select class="form-control" id="usrAdmin" name="usrAdmin" <cfif user.usrAdmin EQ 0>disabled</cfif> required>
					<cfif user.usrAdmin EQ 0>
						<option value="0" selected>Developer</option>
					<cfelse>
						<option value="1"<cfif user.usrAdmin EQ "1"> selected</cfif>>Administrator</option>
						<option value="2"<cfif user.usrAdmin EQ "2"> selected</cfif>>Backoffice</option>
						<option value="3"<cfif user.usrAdmin EQ "3"> selected</cfif>>Author</option>
					</cfif>
				</select>
			</div>

			<div class="form-group col-md-6">
				<label for="usrStatus">Status <small>*</small></label>
				<select class="form-control" id="usrStatus" name="usrStatus" <cfif user.usrAdmin EQ 0>disabled</cfif> required>
					<option value="0"<cfif user.usrStatus EQ "0"> selected</cfif>>Inactive</option>
					<option value="1"<cfif user.usrStatus EQ "1" || user.usrAdmin EQ 0> selected</cfif>>Active</option>
				</select>
			</div>
		</div>
	<cfelse>
		<input type="hidden" name="usrAdmin" value="#user.usrAdmin#">
		<input type="hidden" name="usrStatus" value="#user.usrStatus#">
	</cfif>

	<cfmodule template="../cftemplates/CT_pageNoteMandatoryFields.cfm">

	<hr>

	<div class="form-row">
		<div class="form-group w-100 text-right">
			<cfif session.cstData.usrAdmin LTE 1>
				<button class="myBtn btn btn-danger" type="button" onclick="deleteIt(form)">
					<i class="fa fa-trash-alt"></i>
					<span class="hidden-xs">&nbsp;Delete</span>
				</button>
			</cfif>

			<button class="myBtn btn btn-success" type="submit">
				<i class="fa fa-check"></i>
				<span class="hidden-xs">&nbsp;Save</span>
			</button>
		</div>
	</div>

	<script>
		function showPasswordModal() {
			var textToFillModal = '<div class="row">' +
					'<div class="col form-group">' +
						'<label for="usrPassword">New password <small>*</small></label>' +
						'<input type="password" class="form-control" name="usrPassword" placeholder="Add new password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[^a-zA-Z0-9])[^,~\^]{8,30}" required>' +
						'<small class="invalid-feedback">The password needs to have 8 characters, one upper case letter and another lower case letter, one number and one symbol. Warning, the following characters are not allowed ^ , ou ~.</small>' +
					'</div>' +
				'</div>' +

				'<div class="row">' +
					'<div class="col">' +
						'<button type="button" class="btn btn-success float-right" onclick="savePassword();">' +
							'<i class="fa fa-check"></i>' +
							'<span>&nbsp;&nbsp;Save</span>' +
						'</button>' +
					'</div>' +
				'</div>',
				modalParams = {
					modalId: 'savePasswordModal',
					modalContent: '<form class="form needs-validation" id="savePasswordFormModal" novalidate>'
									+ textToFillModal +
									'</form>',
					headerTitle: 'Change Password',
					footerDisplay: false
				};

			modalSystem.createModal(modalParams);
		}

		function savePassword() {
			var savePasswordFormModal = $('##savePasswordFormModal');

			if (!savePasswordFormModal[0].checkValidity()) {
				savePasswordFormModal[0].classList.add('was-validated');
				return false;
			}

			var ajaxLink = 'savepassword_ajax.cfm',
				params = $('##savePasswordFormModal').serialize(),
				params = params + '&usrId=' + $('##usrId').val();

			$.post(ajaxLink, params, function(res, textStatus, xhr) {
				if(res.status == 0 )
					$('##savePasswordModal').modal('hide');
			}, 'json');
		}
	</script>
</cfsavecontent>

<cfif session.cstData.usrAdmin LTE 1>

	<cfset VARIABLES.formData = {
		'icon' 	:'fa fa-user',
		'title' :'"#user.usrName#" Detail',
		'nav' 	:[
					{
						'link' 	:'../users/add.cfm',
						'icon' 	:'fa fa-plus-circle',
						'target':'_self',
						'desc' 	:'Add'
					},
					{
						'link' 	:'../users/list.cfm',
						'icon' 	:'fa fa-list',
						'target':'_self',
						'desc' 	:'Search'
					},
				],
		'content':variables.content
	}>

<cfelse>

	<cfset VARIABLES.formData = {
		'icon' 	:'fa fa-user',
		'title' :'"#user.usrName#" Detail',
		'content':variables.content
	}>

</cfif>

<cfmodule template = "../cftemplates/CT_formTemplate.cfm" formData="#variables.formData#">

</cfoutput>
