<CFCOMPONENT>

<CFFUNCTION NAME="init">
	<CFRETURN this>
</CFFUNCTION>

<!---
	usrAdmin
	0 = Developer
	1 = Administrator
	2 = Backoffice
	3 = Author

	usrStatus
	0 = Inactive
	1 = Active
--->

<CFFUNCTION NAME="create">
	<CFARGUMENT NAME="params" TYPE="struct" REQUIRED="true">

	<CFQUERY NAME="query" DATASOURCE="#application.ds#">
		INSERT INTO users (
			usrName,
			usrEmail,
			usrPassword,
			usrAdmin,
			usrStatus,
			usrSalt
		) VALUES (
			'#ARGUMENTS.params.usrName#',
			'#ARGUMENTS.params.usrEmail#',
			'#ARGUMENTS.params.usrPassword#',
			3,
			1,
			'#ARGUMENTS.params.usrSalt#'
		)
	</CFQUERY>

	<CFQUERY NAME="query" DATASOURCE="#application.ds#">
		SELECT LAST_INSERT_ID() AS usrId
	</CFQUERY>

	<CFRETURN query>
</CFFUNCTION>

<CFFUNCTION NAME="read">
	<CFARGUMENT NAME="params" TYPE="struct" REQUIRED="false">

	<CFQUERY NAME="query" DATASOURCE="#application.ds#">
		SELECT SQL_CALC_FOUND_ROWS usrId, usrName, usrEmail, usrPassword, usrAdmin, usrStatus, usrSalt
		FROM users
		WHERE 1 = 1
			<CFIF isDefined("ARGUMENTS.params.usrId")>
				AND usrId = #ARGUMENTS.params.usrId#
			<CFELSE>
				<CFIF isDefined("ARGUMENTS.params.usrEmail") AND isDefined("ARGUMENTS.params.usrPassword")>
					AND usrEmail = '#ARGUMENTS.params.usrEmail#'
					<!--- AND usrPassword = '#ARGUMENTS.params.usrPassword#' --->
				<cfelse>
					<CFIF isDefined("ARGUMENTS.params.usrAdmin") AND ARGUMENTS.params.usrAdmin GT 0>
						AND usrAdmin = #ARGUMENTS.params.usrAdmin#
					</CFIF>

					<CFIF isDefined("ARGUMENTS.params.usrStatus") AND ARGUMENTS.params.usrStatus NEQ "0">
						AND usrStatus = #ARGUMENTS.params.usrStatus#
					</CFIF>

					<CFIF isDefined("ARGUMENTS.params.usrName") AND ARGUMENTS.params.usrName NEQ "">
						AND usrName LIKE '%#ARGUMENTS.params.usrName#%'
					</CFIF>

					<CFIF isDefined("ARGUMENTS.params.usrEmail") AND ARGUMENTS.params.usrEmail NEQ "">
						AND usrEmail LIKE '%#ARGUMENTS.params.usrEmail#%'
					</CFIF>
				</CFIF>

				ORDER BY usrStatus
					AND usrAdmin DESC

				<CFIF isDefined('ARGUMENTS.params.page')>
					LIMIT #ARGUMENTS.params.minLimit#, #ARGUMENTS.params.limit#
				</CFIF>
			</CFIF>
	</CFQUERY>

	<CFRETURN query>
</CFFUNCTION>


<CFFUNCTION NAME="readById">
	<CFARGUMENT NAME="usrId" TYPE="numeric" REQUIRED="true">

	<CFSET var user = read(arguments)>

	<CFSET user = serializeJSON(user, 'struct')>
	<CFSET user = deserializeJSON(user)>
	<CFSET user = user[1]>

	<CFRETURN user>
</CFFUNCTION>


<CFFUNCTION NAME="update">
	<CFARGUMENT NAME="params" TYPE="struct" REQUIRED="true">

	<CFQUERY NAME="query" DATASOURCE="#application.ds#">
		UPDATE users SET
			usrName = '#ARGUMENTS.params.usrName#',
			usrEmail = '#ARGUMENTS.params.usrEmail#',
			usrAdmin = #ARGUMENTS.params.usrAdmin#,
			usrStatus = #ARGUMENTS.params.usrStatus#
		WHERE usrId = #ARGUMENTS.params.usrId#
	</CFQUERY>

	<CFRETURN>
</CFFUNCTION>

<CFFUNCTION NAME="updatePassword">
	<CFARGUMENT NAME="params" TYPE="struct" REQUIRED="true">

	<CFQUERY NAME="query" DATASOURCE="#APPLICATION.ds#">
		UPDATE users SET
			usrPassword = '#ARGUMENTS.params.usrPassword#',
			usrSalt = '#ARGUMENTS.params.usrSalt#'
		WHERE usrId = #ARGUMENTS.params.usrId#
	</CFQUERY>

	<CFRETURN>
</CFFUNCTION>

<CFFUNCTION NAME="delete">
	<CFARGUMENT NAME="params" TYPE="struct" REQUIRED="true">

	<CFQUERY NAME="query" DATASOURCE="#application.ds#">
		DELETE FROM users
		WHERE usrId = #ARGUMENTS.params.usrId#
	</CFQUERY>

	<CFRETURN>
</CFFUNCTION>

</CFCOMPONENT>
