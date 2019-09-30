<cfset VARIABLES.returnVar = {
	'status' = '0',
	'data' = ''
}>

<cftry>
	<!--- include encryption library --->
	<cfinclude template="../libs/passwordEncryptionLib.cfm">

	<cfset VARIABLES.passHashAndSalt = encryptPassword(form.usrPassword)>

	<cfset FORM.usrPassword = VARIABLES.passHashAndSalt.password>
	<cfset FORM.usrSalt = VARIABLES.passHashAndSalt.salt>

	<cfset application.users_gateway.updatePassword(form)>
<cfcatch>
	<cfset VARIABLES.returnVar.status = '1'>
	<cfset VARIABLES.returnVar.data = cfcatch>
</cfcatch>
</cftry>

<cfcontent type="application/json">
<cfoutput>#serializeJSON(VARIABLES.returnVar, 'struct')#</cfoutput>