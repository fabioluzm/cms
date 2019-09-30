<cfset VARIABLES.getPages = application.pages_gateway.read()>

<cfoutput>

<cfsavecontent variable="content">

	<cfif VARIABLES.getPages.recordCount>
		<div class="table-responsive-lg">
			<table class="table table-striped table-bordered table-hover">
				<thead class="thead-light">
					<tr><th style="width: 50%">
						Nome
					</th><th style="width: 50%">
						Estado
					</th></tr>
				</thead>

				<tbody>
					<cfloop query="VARIABLES.getPages">
						<tr style="cursor: pointer;" onclick="goPage('../pages/detail.cfm?pageId=#pageId#')"><td>
							<span style="font-weight: bold; color: ##495057">
								#pageName#
							</span>
						</td><td>
                            #((VARIABLES.getPages.pageStatus EQ 1) ? 'Publicada' : 'Rascunho')#
						</td></tr>
					</cfloop>
				</tbody>
			</table>
		</div>
	<cfelse>
		<cfmodule template="../cftemplates/CT_pageNoRecordsMessage.cfm" content="páginas" subContent="uma nova página">
	</cfif>
</cfsavecontent>

<cfset VARIABLES.pageData = {
	'icon' 	:'fas fa-file-alt',
	'title' :'Nova Página',
	'nav' 	:[
				{
					'link' 	:'../pages/add.cfm',
					'icon' 	:'fa fa-plus-circle',
					'target':'_self',
					'desc' 	:'Adicionar'
				}
			],
	'content':VARIABLES.content
}>

<cfmodule template="../cftemplates/CT_pageTemplate.cfm" pageData="#VARIABLES.pageData#">

</cfoutput>
