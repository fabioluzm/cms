<CFCOMPONENT>

	<CFFUNCTION NAME="init">
		<cfset LOCAL.rowData = [
			{ attId = 1, attName = "Artigo", attNameFull = "Artigos", attIcon = "fa fa-signature" },
			{ attId = 2, attName = "Serviço", attNameFull = "Serviços", attIcon = "fas fa-clipboard-list" },
			{ attId = 3, attName = "Parceria", attNameFull = "Parcerias", attIcon = "fas fa-handshake" },
			{ attId = 4, attName = "Email Template", attNameFull = "Email Templates", attIcon = "fas fa-envelope-open-text" },
			{ attId = 5, attName = "Social Network", attNameFull = "Social Networks", attIcon = "fas fa-share-alt" },
			{ attId = 6, attName = "Content Snippets", attNameFull = "Content Snippets", attIcon = "fas fa-share-alt" }
		]>

		<cfset VARIABLES.data = queryNew("attId,attName,attNameFull,attIcon", "Integer,Varchar,Varchar,Varchar", LOCAL.rowData)>

		<CFRETURN this>
	</CFFUNCTION>


	<CFFUNCTION NAME="read">
		<CFARGUMENT NAME="params" TYPE="struct" REQUIRED="false">

		<CFQUERY NAME="query" DBTYPE="query">
			SELECT	attId,
					attName,
					attNameFull,
					attIcon
			FROM VARIABLES.data
			WHERE 1 = 1
				<CFIF isDefined("ARGUMENTS.params.attId")>
					AND attId = #ARGUMENTS.params.attId#
				</CFIF>
		</CFQUERY>

		<CFRETURN query>
	</CFFUNCTION>

</CFCOMPONENT>