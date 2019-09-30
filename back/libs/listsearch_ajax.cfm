<CFPROCESSINGDIRECTIVE SUPPRESSWHITESPACE="yes">

<CFPARAM NAME="URL.usrName" DEFAULT="">

<CFSET VARIABLES.searchParams = {
	'page' = URL.page,
	'limit' = URL.limit,
	'minLimit' = URL.minLimit
}>

<cfswitch expression="#URL.origin#">
	<cfcase value="users">
		<cfparam name="URL.usrName" default="">
		<cfparam name="URL.usrEmail" default="">
		<cfparam name="URL.usrStatus" default="0">

		<cfset VARIABLES.tempInfo = {
			'usrName' = URL.usrName,
			'usrEmail' = URL.usrEmail,
			'usrStatus' = URL.usrStatus
		}>

		<cfset structAppend(VARIABLES.searchParams, VARIABLES.tempInfo)>

		<cfset VARIABLES.results = APPLICATION.users_gateway.read(VARIABLES.searchParams)>

		<cfloop query="VARIABLES.results.data">
			<cfif usrAdmin EQ 1>
				<cfset VARIABLES.results.data['usrAdmin'][currentRow] = "Administrator">
			<cfelseif usrAdmin EQ 2>
				<cfset VARIABLES.results.data['usrAdmin'][currentRow] = "Backoffice">
			<cfelse>
				<cfset VARIABLES.results.data['usrAdmin'][currentRow] = "Author">
			</cfif>

			<cfif usrStatus EQ 1>
				<cfset VARIABLES.results.data['usrStatus'][currentRow] = "Active">
			<cfelse>
				<cfset VARIABLES.results.data['usrStatus'][currentRow] = "Inactive">
			</cfif>
		</cfloop>

		<cfset VARIABLES.returnVar = {
			'error' = '0',
			'data' = {
						'users' : deserializeJSON(serializeJson(variables.results.data, 'struct'))
					},
			'total' = VARIABLES.results.total,
			'message' = ''
		}>
	</cfcase>

	<cfcase value="categories">
		<cfparam name="URL.catName" default="">
		<cfparam name="URL.catType" default="">
		<cfparam name="URL.catLink" default="">

		<cfset VARIABLES.tempInfo = {
			'catName' = URL.catName,
			'catType' = URL.catType,
			'catLink' = URL.catLink
		}>

		<cfset structAppend(VARIABLES.searchParams, VARIABLES.tempInfo)>

		<cfset VARIABLES.results = APPLICATION.categories_gateway.read(VARIABLES.searchParams)>

		<cfloop query="VARIABLES.results.data">
			<cfif not catType>
				<cfset VARIABLES.results.data['catType'][currentRow] = "Categoria Inativa">
			<cfelse>
				<cfset VARIABLES.results.data['catType'][currentRow] = "Categoria Ativa">
			</cfif>
		</cfloop>

		<cfset VARIABLES.returnVar = {
			'error' = '0',
			'data' = {
						'categories' : deserializeJSON(serializeJson(results.data, 'struct'))
					},
			'total' = results.total,
			'message' = ''
		}>
	</cfcase>

	<cfcase value="products">
		<cfparam name="URL.proName" default="">
		<cfparam name="URL.proDesc" default="">

		<cfset VARIABLES.tempInfo = {
			'proName' = URL.proName,
			'proDesc' = URL.proDesc
		}>

		<cfset structAppend(VARIABLES.searchParams, VARIABLES.tempInfo)>

		<cfset VARIABLES.results = application.products_categories_gateway.readAllProducts(VARIABLES.searchParams)>

		<cfloop query="VARIABLES.results.data">
			<cfif catId EQ "">
				<cfset VARIABLES.results.data['catName'][currentRow] = "Este produto não esta associado a nenhuma categoria!">
			</cfif>
		</cfloop>

		<cfset VARIABLES.returnVar = {
			'error' = '0',
			'data' = {
						'products' : deserializeJSON(serializeJson(results.data, 'struct'))
					},
			'total' = results.total,
			'message' = ''
		}>
	</cfcase>

	<cfcase value="articles">
		<cfparam name="URL.artName" default="">
		<cfparam name="URL.artStatus" default="">

		<cfset VARIABLES.tempInfo = {
			'artName' = URL.artName,
			'artStatus' = URL.artStatus
		}>

		<cfset structAppend(VARIABLES.searchParams, VARIABLES.tempInfo)>

		<cfset VARIABLES.results = APPLICATION.articles_gateway.read(VARIABLES.searchParams)>

		<cfset VARIABLES.returnVar = {
			'error' = '0',
			'data' = {
						'articles' : deserializeJSON(serializeJson(results.data, 'struct'))
					},
			'total' = results.total,
			'message' = ''
		}>
	</cfcase>
</cfswitch>

<CFCONTENT TYPE="application/json">
<CFOUTPUT>#serializeJson(VARIABLES.returnVar, 'struct')#</CFOUTPUT>
</CFPROCESSINGDIRECTIVE>
