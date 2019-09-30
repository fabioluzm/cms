<CFCOMPONENT>

<CFFUNCTION NAME="init">
	<CFRETURN this>
</CFFUNCTION>

<CFFUNCTION NAME="create">
	<CFARGUMENT NAME="params" TYPE="struct" REQUIRED="true">

	<CFQUERY NAME="query" DATASOURCE="#application.ds#">
		INSERT INTO systeminfo (
			sysAddress,
			sysCoordinates,sysCoordinatesApi,
			sysCoordinatesApi,
			sysMail,
			sysPhone,
            sysSchedule
		) VALUES (
			'#ARGUMENTS.params.sysAddress#',
			'#ARGUMENTS.params.sysCoordinates#',
			'#ARGUMENTS.params.sysCoordinatesApi#',
			'#ARGUMENTS.params.sysMail#',
			#ARGUMENTS.params.sysPhone#,
			'#ARGUMENTS.params.sysSchedule#'
		)
		</CFQUERY>

		<CFQUERY NAME="query" DATASOURCE="#application.ds#">
			SELECT LAST_INSERT_ID() AS sysId
		</CFQUERY>

	<CFRETURN query>
</CFFUNCTION>

<CFFUNCTION NAME="read">
	<CFARGUMENT NAME="params" TYPE="struct" REQUIRED="false">

	<CFQUERY NAME="query" DATASOURCE="#application.ds#">
		SELECT 	sysId,
				sysAddress,
				sysCoordinates,
				sysCoordinatesApi,
				sysPhone,
				sysMail,
                sysSchedule
		FROM systeminfo
		WHERE 1 = 1
			<CFIF isDefined("ARGUMENTS.params.sysId")>
				AND sysId = #ARGUMENTS.params.sysId#
			</CFIF>
	</CFQUERY>

	<CFRETURN query>
</CFFUNCTION>

<CFFUNCTION NAME="update">
	<CFARGUMENT NAME="params" TYPE="struct" REQUIRED="true">
	<CFARGUMENT NAME="sysId" TYPE="numeric" REQUIRED="true">

	<cfif NOT structCount(ARGUMENTS.params)>
		<cfthrow message="no params defined!">
	</cfif>

	<cfset LOCAL.listOfCols = 'sysId,sysAddress,sysCoordinates,sysCoordinatesApi,sysPhone,sysMail,sysSchedule'>

	<CFQUERY NAME="query" DATASOURCE="#application.ds#">
		UPDATE systeminfo SET

			<cfset LOCAL.counter = 0>

			<cfloop collection="#ARGUMENTS.params#" index="key">
				<cfif listFind(LOCAL.listOfCols, key)>
					<cfif LOCAL.counter GT 0>
						,
					</cfif>

					<cfset LOCAL.counter += 1>

					#key# = <cfqueryparam value="#ARGUMENTS.params[key]#">
				</cfif>
			</cfloop>
		WHERE sysId = #ARGUMENTS.sysId#
	</CFQUERY>

	<CFRETURN>
</CFFUNCTION>

<CFFUNCTION NAME="delete">
	<CFARGUMENT NAME="sysId" TYPE="numeric" REQUIRED="true">

	<CFQUERY NAME="query" DATASOURCE="#application.ds#">
		DELETE FROM systeminfo
		WHERE sysId = #ARGUMENTS.params.sysId#
	</CFQUERY>

	<CFRETURN>
</CFFUNCTION>

</CFCOMPONENT>