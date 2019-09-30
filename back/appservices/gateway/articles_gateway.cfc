<CFCOMPONENT>

<CFFUNCTION NAME="init">
	<CFRETURN this>
</CFFUNCTION>

<CFFUNCTION NAME="create">
	<CFARGUMENT NAME="params" TYPE="struct" REQUIRED="true">

	<cfif not structKeyExists(ARGUMENTS.params, 'artIconClass')>
		<cfset ARGUMENTS.params.artIconClass = ''>
	</cfif>

	<cfif not structKeyExists(ARGUMENTS.params, 'artLink')>
		<cfset ARGUMENTS.params.artLink = ''>
	</cfif>

	<cfif not structKeyExists(ARGUMENTS.params, 'artLinkName')>
		<cfset ARGUMENTS.params.artLinkName = ''>
	</cfif>

	<CFQUERY NAME="query" DATASOURCE="#application.ds#">
		INSERT INTO articles (
			artName,
			artDesc,
			artType,
			artStatus,
			artIconClass,
			artLink,
			artLinkName,
            artLocation
		) VALUES (
			'#ARGUMENTS.params.artName#',
			'#ARGUMENTS.params.artDesc#',
			#ARGUMENTS.params.artType#,
			#ARGUMENTS.params.artStatus#,
			'#ARGUMENTS.params.artIconClass#',
			'#ARGUMENTS.params.artLink#',
			'#ARGUMENTS.params.artLinkName#',
			'#ARGUMENTS.params.artLocation#'
		)
	</CFQUERY>

	<CFQUERY NAME="query" DATASOURCE="#application.ds#">
		SELECT LAST_INSERT_ID() AS artId
	</CFQUERY>

	<CFRETURN query>
</CFFUNCTION>

<CFFUNCTION NAME="read">
	<CFARGUMENT NAME="params" TYPE="struct" REQUIRED="false">

	<CFQUERY NAME="query" DATASOURCE="#application.ds#">
		SELECT	artId,
				artName,
				artDesc,
				creationDate,
				artType,
				artStatus,
				artIconClass,
				artLink,
				artLinkName,
                artLocation
		FROM articles
		WHERE 1 = 1
			<CFIF isDefined("ARGUMENTS.params.artId")>
				AND artId = #ARGUMENTS.params.artId#
			<CFELSE>
				<CFIF isDefined("ARGUMENTS.params.artStatus") AND isNumeric(ARGUMENTS.params.artStatus) AND ARGUMENTS.params.artStatus GTE 0>
					AND artStatus = #ARGUMENTS.params.artStatus#
				</CFIF>

				<CFIF isDefined("ARGUMENTS.params.artType") AND isNumeric(ARGUMENTS.params.artType)>
					AND artType = #ARGUMENTS.params.artType#
				</CFIF>

				<CFIF isDefined("ARGUMENTS.params.artName") AND len(ARGUMENTS.params.artName)>
					AND artName = '#ARGUMENTS.params.artName#'
				</CFIF>
				
                <CFIF isDefined("ARGUMENTS.params.artLocation") AND len(ARGUMENTS.params.artLocation)>
					AND artLocation LIKE ('%#ARGUMENTS.params.artLocation#%')
				</CFIF>

				ORDER BY creationDate
			</CFIF>
	</CFQUERY>

	<CFRETURN query>
</CFFUNCTION>

<cffunction name="getContentSnippets" returnType="string">
	<cfargument name="artName" type="string" required="false">

	<cfquery name="qryData" datasource="#APPLICATION.ds#">
		SELECT	artDesc				
		FROM    articles
		WHERE   artType = 6			
        AND     artName = <cfqueryparam value="#ARGUMENTS.artName#"/>
	</cfquery>
    
    <cfset LOCAL.result = qryData.artDesc>
	
    <cfreturn LOCAL.result>
</cffunction>


<CFFUNCTION NAME="update">
	<CFARGUMENT NAME="params" TYPE="struct" REQUIRED="true">

	<cfif not structKeyExists(ARGUMENTS.params, 'artIconClass')>
		<cfset ARGUMENTS.params.artIconClass = ''>
	</cfif>

	<cfif not structKeyExists(ARGUMENTS.params, 'artLink')>
		<cfset ARGUMENTS.params.artLink = ''>
	</cfif>

	<CFQUERY NAME="query" DATASOURCE="#application.ds#">
		UPDATE articles SET
			artName = '#ARGUMENTS.params.artName#',
			artDesc = '#ARGUMENTS.params.artDesc#',
			artType = #ARGUMENTS.params.artType#,
			artStatus = #ARGUMENTS.params.artStatus#,
			artIconClass = '#ARGUMENTS.params.artIconClass#',
			artLink = '#ARGUMENTS.params.artLink#',
			artLinkName = '#ARGUMENTS.params.artLinkName#',
			artLocation = '#ARGUMENTS.params.artLocation#'
		WHERE artId = #ARGUMENTS.params.artId#
	</CFQUERY>

	<CFRETURN>
</CFFUNCTION>

<CFFUNCTION NAME="delete">
	<CFARGUMENT NAME="params" TYPE="struct" REQUIRED="true">

	<CFQUERY NAME="query" DATASOURCE="#application.ds#">
		DELETE FROM articles
		WHERE artId = #ARGUMENTS.params.artId#
	</CFQUERY>

	<CFRETURN>
</CFFUNCTION>

</CFCOMPONENT>