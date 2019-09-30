<CFCOMPONENT>

<CFFUNCTION NAME="init">
	<CFRETURN this>
</CFFUNCTION>

<CFFUNCTION NAME="create">
	<CFARGUMENT NAME="params" TYPE="struct" REQUIRED="true">

	<CFQUERY NAME="query" DATASOURCE="#application.ds#">
		INSERT INTO pages (
			pageName,
			pageStatus
		) VALUES (
			'#ARGUMENTS.params.pageName#',
			#ARGUMENTS.params.pageStatus#
		)
	</CFQUERY>

	<CFQUERY NAME="query" DATASOURCE="#application.ds#">
		SELECT LAST_INSERT_ID() AS pageId
	</CFQUERY>

	<CFRETURN query>
</CFFUNCTION>

<CFFUNCTION NAME="read">
	<CFARGUMENT NAME="params" TYPE="struct" REQUIRED="false">

	<CFQUERY NAME="query" DATASOURCE="#application.ds#">
		SELECT	pageId,
				pageName,
				pageStatus
		FROM pages
		WHERE 1 = 1
			<CFIF isDefined("ARGUMENTS.params.pageId")>
				AND pageId = #ARGUMENTS.params.pageId#
			</CFIF>

            <CFIF isDefined("ARGUMENTS.params.pageName") AND len(ARGUMENTS.params.pageName)>
                AND pageName = '#ARGUMENTS.params.pageName#'
            </CFIF>
            
            <CFIF isDefined("ARGUMENTS.params.pageStatus") AND len(ARGUMENTS.params.pageStatus)>
                AND pageStatus = #ARGUMENTS.params.pageStatus#
            </CFIF>
		
        ORDER BY pageId
	</CFQUERY>

	<CFRETURN query>
</CFFUNCTION>

<CFFUNCTION NAME="update">
	<CFARGUMENT NAME="params" TYPE="struct" REQUIRED="true">

	<CFQUERY NAME="query" DATASOURCE="#application.ds#">
		UPDATE pages SET
			pageName = '#ARGUMENTS.params.pageName#',
			pageStatus = #ARGUMENTS.params.pageStatus#
		WHERE pageId = #ARGUMENTS.params.pageId#
	</CFQUERY>

	<CFRETURN>
</CFFUNCTION>

<CFFUNCTION NAME="delete">
	<CFARGUMENT NAME="params" TYPE="struct" REQUIRED="true">

	<CFQUERY NAME="query" DATASOURCE="#application.ds#">
		DELETE FROM pages
		WHERE pageId = #ARGUMENTS.params.pageId#
	</CFQUERY>

	<CFRETURN>
</CFFUNCTION>

</CFCOMPONENT>