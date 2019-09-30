<cfif session.cstData.usrAdmin GT 1>
	<CFSET redirect('back/users/detail.cfm?usrId=#session.cstData.usrId#')>
</cfif>

<CFSET VARIABLES.getUsers = application.users_gateway.read(url)>

<CFOUTPUT>

<CFSAVECONTENT variable="content">
	<CFIF getUsers.recordCount>
		<div class="table-responsive-lg">
			<table class="table table-striped table-bordered table-hover">
				<thead class="thead-light">
					<tr><th>
						Name
					</th><th>
						Email
					</th><th>
						Right
					</th><th>
						Status
					</th></tr>
				</thead>

				<tbody>
					<CFLOOP query="getUsers">
						<cfif usrAdmin GTE 1>
							<tr style="cursor: pointer;" onclick="goPage('../users/detail.cfm?usrId=#usrId#')"><td>
								#usrName#
							</td><td>
								#usrEmail#
							</td><td>
								<CFIF usrAdmin EQ 1>
									Administrator
								<CFELSEIF usrAdmin EQ 2>
									Backoffice
								<CFELSE>
									Author
								</CFIF>
							</td><td>
								<CFIF usrStatus EQ 1>
									Active
								<CFELSE>
									Inactive
								</CFIF>
							</td></tr>
						</cfif>
					</CFLOOP>
				</tbody>
			</table>
		</div>
	<CFELSE>
		<cfmodule template="../cftemplates/CT_pageNoRecordsMessage.cfm" content="users">
	</CFIF>
</CFSAVECONTENT>

<CFSET VARIABLES.pageData = {
	'icon' 	:'fa fa-users',
	'title' :'Utilizadores',
	'nav' 	:[
				{
					'link' 	:'../users/add.cfm',
					'icon' 	:'fa fa-plus-circle',
					'target':'_self',
					'desc' 	:'Add'
				},
			],
	'content':variables.content
}>

<CFMODULE TEMPLATE="../cftemplates/CT_pageTemplate.cfm" pageData="#variables.pageData#">

</CFOUTPUT>
