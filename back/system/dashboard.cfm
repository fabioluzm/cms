
<cfoutput>

<!--- <messagebox></messagebox> --->

	<cfinclude template = "../gallery/list.cfm">

	<cfif session.cstdata.usrAdmin LTE 1>
		<cfinclude template = "../users/list.cfm">
	</cfif>
</cfoutput>