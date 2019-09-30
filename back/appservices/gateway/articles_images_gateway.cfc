<CFCOMPONENT>

<CFFUNCTION NAME="init">
	<CFRETURN this>
</CFFUNCTION>

<CFFUNCTION NAME="create">
	<CFARGUMENT NAME="params" TYPE="struct" REQUIRED="true">

	<CFQUERY NAME="query" DATASOURCE="#application.ds#">
		INSERT INTO articlesimages (
			imgId,
			artId
		) VALUES (
			#ARGUMENTS.params.imgId#,
			#ARGUMENTS.params.artId#
		)
	</CFQUERY>

	<CFRETURN>
</CFFUNCTION>

<CFFUNCTION NAME="read">
	<CFARGUMENT NAME="params" TYPE="struct" REQUIRED="false">

	<CFQUERY NAME="query" DATASOURCE="#application.ds#">
		SELECT 	imgId,
				artId
		FROM articlesimages
		WHERE 1 = 1
			<CFIF isDefined("ARGUMENTS.params.imgId")>
				AND imgId = #ARGUMENTS.params.imgId#
			</CFIF>
			<CFIF isDefined("ARGUMENTS.params.artId")>
				AND artId = #ARGUMENTS.params.artId#
			</CFIF>
	</CFQUERY>

	<CFRETURN query>
</CFFUNCTION>

<CFFUNCTION NAME="readAll">
	<CFARGUMENT NAME="params" TYPE="struct" REQUIRED="false">

	<CFQUERY NAME="query" DATASOURCE="#application.ds#">
		SELECT	imc.imgId,
			 	imc.imgLabel,
			 	imc.imgPath,
			 	imc.imgCreationDate,
				imc.imgDesc,
				imc.imgSlideShow,
				imc.imgBanner,
				imc.imgPortfolio,
				imc.imgTeam,
				art.artId,
				art.artName,
				art.artDesc,
				art.creationDate,
				art.artType,
				art.artStatus,
				art.artLocation,
				art.artIconClass,
				art.artLink,
				art.artLinkName
		FROM imagescatalog imc
			LEFT JOIN articlesimages ami ON imc.imgId = ami.imgId
			LEFT JOIN articles art ON art.artId = ami.artId
		WHERE 1 = 1
			<CFIF isDefined("ARGUMENTS.params.artName")>
                AND art.artName = '#ARGUMENTS.params.artName#'
			</CFIF>
			
            <CFIF isDefined("ARGUMENTS.params.artLocation")>
                AND art.artLocation LIKE ('%#ARGUMENTS.params.artLocation#%')
			</CFIF>
			
            <CFIF isDefined("ARGUMENTS.params.artId")>
				AND ami.artId = #ARGUMENTS.params.artId#
				OR (
					ami.imgId NOT IN (
						SELECT imc2.imgId
						FROM imagescatalog imc2
							INNER JOIN articlesimages ami2 ON imc2.imgId = ami2.imgId
							WHERE ami2.artId = #ARGUMENTS.params.artId#
					)
				)
				OR art.artId IS NULL
			</CFIF>

			<CFIF isDefined("ARGUMENTS.params.imgId")>
				AND ami.imgId = #ARGUMENTS.params.imgId#
			</CFIF>

		<CFIF isDefined("ARGUMENTS.params.artId")>
			GROUP BY imc.imgId
			ORDER BY FIELD(ami.artId, "#ARGUMENTS.params.artId#") DESC, imgId
		</CFIF>
	</CFQUERY>

	<CFRETURN query>
</CFFUNCTION>


<CFFUNCTION NAME="update">
	<CFARGUMENT NAME="params" TYPE="struct" REQUIRED="true">

	<CFQUERY NAME="query" DATASOURCE="#application.ds#">
		UPDATE articlesimages SET
			imgId = #ARGUMENTS.params.imgId#,
			artId = #ARGUMENTS.params.artId#
		WHERE imgId = #ARGUMENTS.params.imgId#
		AND	artId = #ARGUMENTS.params.artId#
	</CFQUERY>

	<CFRETURN>
</CFFUNCTION>

<CFFUNCTION NAME="delete">
	<CFARGUMENT NAME="params" TYPE="struct" REQUIRED="true">

	<CFQUERY NAME="query" DATASOURCE="#application.ds#">
		DELETE FROM articlesimages
		WHERE
			<CFIF isDefined("ARGUMENTS.params.artId")>
				artId = #ARGUMENTS.params.artId#
			</CFIF>
	</CFQUERY>

	<CFRETURN>
</CFFUNCTION>

<CFFUNCTION NAME="deleteImage">
	<CFARGUMENT NAME="params" TYPE="struct" REQUIRED="true">

	<CFQUERY NAME="query" DATASOURCE="#application.ds#">
		DELETE FROM articlesimages
		WHERE
			imgId
		NOT IN (#ARGUMENTS.params.idList#)
		AND
			<CFIF isDefined("ARGUMENTS.params.artId")>
				artId = #ARGUMENTS.params.artId#
			</CFIF>
	</CFQUERY>

	<CFRETURN>
</CFFUNCTION>

</CFCOMPONENT>