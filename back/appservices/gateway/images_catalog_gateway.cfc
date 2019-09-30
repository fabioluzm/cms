<CFCOMPONENT>

<CFFUNCTION NAME="init">
	<CFRETURN this>
</CFFUNCTION>

<CFFUNCTION NAME="create">
	<CFARGUMENT NAME="params" TYPE="struct" REQUIRED="true">

	<CFQUERY NAME="query" DATASOURCE="#application.ds#">
		INSERT INTO imagescatalog (
			imgLabel,
			imgPath,
			imgDesc,
			imgSlideShow,
            imgBanner,
            imgPortfolio,
            imgTeam,
            imgLocation
		) VALUES (
			'#ARGUMENTS.params.imgLabel#',
			'#ARGUMENTS.params.imgPath#',
			'#ARGUMENTS.params.imgDesc#',
			#ARGUMENTS.params.imgSlideShow#,
			#ARGUMENTS.params.imgBanner#,
			#ARGUMENTS.params.imgPortfolio#,
			#ARGUMENTS.params.imgTeam#,
			'#ARGUMENTS.params.imgLocation#'
		)
	</CFQUERY>

	<CFQUERY NAME="query" DATASOURCE="#application.ds#">
		SELECT LAST_INSERT_ID() AS imgId
	</CFQUERY>

	<CFRETURN query>
</CFFUNCTION>

<CFFUNCTION NAME="read">
	<CFARGUMENT NAME="params" TYPE="struct" REQUIRED="false">

	<CFQUERY NAME="query" DATASOURCE="#application.ds#">

		SELECT	imgId,
				imgLabel,
				imgPath,
				imgDesc,
				imgSlideShow,
                imgBanner,
                imgPortfolio,
                imgTeam,
                imgLocation,
				imgCreationDate
		FROM imagescatalog
		WHERE 1 = 1
			<CFIF isDefined("ARGUMENTS.params.imgId")>
				AND imgId = #ARGUMENTS.params.imgId#
			</CFIF>
            
			<CFIF isDefined("ARGUMENTS.params.imgSlideShow")>
				AND imgSlideShow = #ARGUMENTS.params.imgSlideShow#
			</CFIF>
            
			<CFIF isDefined("ARGUMENTS.params.imgBanner")>
				AND imgBanner = #ARGUMENTS.params.imgBanner#
			</CFIF>
            
			<CFIF isDefined("ARGUMENTS.params.imgPortfolio")>
				AND imgPortfolio = #ARGUMENTS.params.imgPortfolio#
			</CFIF>
            
			<CFIF isDefined("ARGUMENTS.params.imgTeam")>
				AND imgTeam = #ARGUMENTS.params.imgTeam#
			</CFIF>
			
            <CFIF isDefined("ARGUMENTS.params.imgLocation")>
				AND imgLocation LIKE ('%#ARGUMENTS.params.imgLocation#%')
			</CFIF>

			ORDER BY
                imgLocation ASC,
                imgSlideShow DESC,
                imgBanner DESC,
                imgPortfolio DESC,
                imgTeam DESC;
	</CFQUERY>

	<CFRETURN query>
</CFFUNCTION>

<CFFUNCTION NAME="update">
	<CFARGUMENT NAME="params" TYPE="struct" REQUIRED="true">

	<CFQUERY NAME="query" DATASOURCE="#application.ds#">
		UPDATE imagescatalog SET
			imgLabel = '#ARGUMENTS.params.imgLabel#',
			imgPath = '#ARGUMENTS.params.imgPath#',
			imgDesc = '#ARGUMENTS.params.imgDesc#',
			imgLocation = '#ARGUMENTS.params.imgLocation#',
			imgSlideShow = #ARGUMENTS.params.imgSlideShow#,
			imgBanner = #ARGUMENTS.params.imgBanner#,
			imgPortfolio = #ARGUMENTS.params.imgPortfolio#,
			imgTeam = #ARGUMENTS.params.imgTeam#
		WHERE imgId = #ARGUMENTS.params.imgId#
	</CFQUERY>

	<CFRETURN>
</CFFUNCTION>

<CFFUNCTION NAME="delete">
	<CFARGUMENT NAME="params" TYPE="struct" REQUIRED="true">

	<CFQUERY NAME="query" DATASOURCE="#application.ds#">
		DELETE FROM imagescatalog
		WHERE imgId = #ARGUMENTS.params.imgId#
	</CFQUERY>

	<CFRETURN>
</CFFUNCTION>

</CFCOMPONENT>