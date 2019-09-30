<CFCOMPONENT>

<CFFUNCTION NAME="init">
	<CFRETURN this>
</CFFUNCTION>

<CFFUNCTION NAME="create">
	<CFARGUMENT NAME="params" TYPE="struct" REQUIRED="true">

	<CFQUERY NAME="query" DATASOURCE="#application.ds#">
		INSERT INTO metatags (
            mtKeywords,
            mtDescription,
            mtAuthor,
            mtRevised,
            mtOgTitle,
            mtOgSitename,
            mtOgType,
            mtOgDesc,
            mtOgUrl,
            mtCanonical,
            mtOgImage,
            mtOgImgType,
            mtOgImgWidth,
            mtOgImgHeight,
            mtLocation
		) VALUES (
			'#ARGUMENTS.params.mtKeywords#',
			'#ARGUMENTS.params.mtDescription#',
			'#ARGUMENTS.params.mtAuthor#',
			'#ARGUMENTS.params.mtRevised#',
			'#ARGUMENTS.params.mtOgTitle#',
			'#ARGUMENTS.params.mtOgSitename#',
			'#ARGUMENTS.params.mtOgType#',
			'#ARGUMENTS.params.mtOgDesc#',
			'#ARGUMENTS.params.mtOgUrl#',
			'#ARGUMENTS.params.mtCanonical#',
			'#ARGUMENTS.params.mtOgImage#',
			'#ARGUMENTS.params.mtOgImgType#',
			'#ARGUMENTS.params.mtOgImgWidth#',
			'#ARGUMENTS.params.mtOgImgHeight#',
			#ARGUMENTS.params.mtLocation#
		)
	</CFQUERY>

	<CFQUERY NAME="query" DATASOURCE="#application.ds#">
		SELECT LAST_INSERT_ID() AS mtId
	</CFQUERY>

	<CFRETURN query>
</CFFUNCTION>

<CFFUNCTION NAME="read">
	<CFARGUMENT NAME="params" TYPE="struct" REQUIRED="false">

	<CFQUERY NAME="query" DATASOURCE="#application.ds#">
		SELECT	mtId,
                mtKeywords,
                mtDescription,
                mtAuthor,
                mtRevised,
                mtOgTitle,
                mtOgDesc,
                mtOgSitename,
                mtOgType,
                mtOgUrl,
                mtCanonical,
                mtOgImage,
                mtOgImgType,
                mtOgImgWidth,
                mtOgImgHeight,
                mtLocation
		FROM metatags
		WHERE 1 = 1
			<CFIF isDefined("ARGUMENTS.params.mtId")>
				AND mtId = #ARGUMENTS.params.mtId#
			</CFIF>

            <CFIF isDefined("ARGUMENTS.params.mtLocation") AND len(ARGUMENTS.params.mtLocation)>
                AND mtLocation = #ARGUMENTS.params.mtLocation#
            </CFIF>
		
        ORDER BY mtId
	</CFQUERY>

	<CFRETURN query>
</CFFUNCTION>

<CFFUNCTION NAME="update">
	<CFARGUMENT NAME="params" TYPE="struct" REQUIRED="true">

	<CFQUERY NAME="query" DATASOURCE="#application.ds#">
		UPDATE metatags SET
            mtKeywords = '#ARGUMENTS.params.mtKeywords#',
            mtDescription = '#ARGUMENTS.params.mtDescription#',
            mtAuthor = '#ARGUMENTS.params.mtAuthor#',
            mtRevised = '#ARGUMENTS.params.mtRevised#',
            mtOgTitle = '#ARGUMENTS.params.mtOgTitle#',
            mtOgDesc = '#ARGUMENTS.params.mtOgDesc#',
            mtOgSitename = '#ARGUMENTS.params.mtOgSitename#',
            mtOgType = '#ARGUMENTS.params.mtOgType#',
            mtOgUrl = '#ARGUMENTS.params.mtOgUrl#',
            mtCanonical = '#ARGUMENTS.params.mtCanonical#',
            mtOgImage = '#ARGUMENTS.params.mtOgImage#',
            mtOgImgType = '#ARGUMENTS.params.mtOgImgType#',
            mtOgImgWidth = '#ARGUMENTS.params.mtOgImgWidth#',
            mtOgImgHeight = '#ARGUMENTS.params.mtOgImgHeight#',
            mtLocation = #ARGUMENTS.params.mtLocation#
		WHERE mtId = #ARGUMENTS.params.mtId#
	</CFQUERY>

	<CFRETURN>
</CFFUNCTION>

<CFFUNCTION NAME="delete">
	<CFARGUMENT NAME="params" TYPE="struct" REQUIRED="true">

	<CFQUERY NAME="query" DATASOURCE="#application.ds#">
		DELETE FROM metatags
		WHERE mtId = #ARGUMENTS.params.mtId#
	</CFQUERY>

	<CFRETURN>
</CFFUNCTION>

</CFCOMPONENT>