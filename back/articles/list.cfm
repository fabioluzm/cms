<cfset VARIABLES.getArticles = application.articles_gateway.read(
	params = {
		artType = URL.artType
	}
)>

<cfset VARIABLES.getArtType = APPLICATION.articles_types_gateway.read(
	params = {
		attId = URL.artType
	}
)>

<cfoutput>

<cfsavecontent variable="content">
	<cfif VARIABLES.getArticles.recordCount>
		<div class="table-responsive-lg">
			<table class="table table-striped table-bordered table-hover">
				<thead class="thead-light">
					<tr><th style="width: 25%">
						Nome
					</th><th style="width: 75%">
						Descrição
					</th></tr>
				</thead>

				<tbody>
					<cfloop query="getArticles">
						<tr style="cursor: pointer;" onclick="goPage('../articles/detail.cfm?artId=#artId#&artType=#artType#')"><td>
							<span style="font-weight: bold; color: ##495057">
								#artName#
							</span>
						</td><td>
							#artDesc#
						</td></tr>
					</cfloop>
				</tbody>
			</table>
		</div>
	<cfelse>
		<cfmodule template="../cftemplates/CT_pageNoRecordsMessage.cfm" content="#VARIABLES.getArtType.attNameFull#">
	</cfif>
</cfsavecontent>

<cfset VARIABLES.pageData = {
	'icon' 	:'#VARIABLES.getArtType.attIcon#',
	'title' :'#VARIABLES.getArtType.attNameFull#',
	'nav' 	:[
				{
					'link' 	:'../articles/add.cfm?artType=#URL.artType#',
					'icon' 	:'fa fa-plus-circle',
					'target':'_self',
					'desc' 	:'Adicionar'
				}
			],
	'content':VARIABLES.content
}>

<cfmodule template="../cftemplates/CT_pageTemplate.cfm" pageData="#VARIABLES.pageData#">

</cfoutput>
