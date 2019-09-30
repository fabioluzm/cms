<cfcomponent>

	<cfset this.name = "RAM Website">
	<cfset app.name = "Reis & Marreiros, Lda.">

	<cfset this.rootDir = listFirst(CGI.script_name, '/')>

	<cfif findNoCase('reismarreiros', this.rootDir)>
		<cfset this.mappings[ "/appservices" ] = "#this.rootDir#\back\appservices">
		<cfset this.mappings[ "/modules" ] = "/#this.rootDir#/back/assets/modules">
	<cfelse>
		<cfset this.mappings[ "/appservices" ] = "\back\appservices">
		<cfset this.mappings[ "/modules" ] = "/back/assets/modules">
	</cfif>


	<cffunction name="onApplicationStart">
        <cfinclude template="../gttDevConfig.cfm">
		
        <cfset APPLICATION.version = 'v1.0.0'>
		
        <!--- Load gateways - begin --->

			<cfdirectory
				directory = "#expandPath("/appservices/gateway")#"
				action = "list"
				name="LOCAL.listOfGateways">

			<cfloop query="#LOCAL.listOfGateways#">
				<cfset LOCAL.gatewayName = ListFirst(name, '.')>

				<cfset APPLICATION[LOCAL.gatewayName] = createObject('component', 'appservices.gateway.#LOCAL.gatewayName#').init()>
			</cfloop>

		<!--- Load gateways - end --->

		<cfif findNoCase('localhost', CGI.SERVER_NAME) OR findNoCase('127.0.0.1', CGI.SERVER_NAME)>
			<cfset APPLICATION.server_root_uri = 'http://#CGI.server_name#:#cgi.server_port#/front'>
			<cfset APPLICATION.server_root = '/front'>
			<cfset APPLICATION.ds  = '#LOCAL.datasource#'>
			<cfset APPLICATION.onLiveServer = -2>
			<cfset APPLICATION.serverName = 'Localhost'>

		<cfelseif findNoCase('reismarreiroslda2.ramlagos.com', CGI.HTTP_HOST) or findNoCase('test.ramlagos.com', CGI.HTTP_HOST)>
			<cfif findNoCase('test.ramlagos.com', CGI.HTTP_HOST)>
				<cfset APPLICATION.server_root_uri = 'http://#CGI.SERVER_NAME#/reismarreiroslda2/front'>
				<cfset APPLICATION.server_root = '/reismarreiroslda2/front'>
				<cfset APPLICATION.ds  = 'reismarreiroslda2_test'>
			<cfelse>
				<cfset APPLICATION.server_root_uri = 'http://#CGI.SERVER_NAME#/front'>
				<cfset APPLICATION.server_root = '/front'>
				<cfset APPLICATION.ds  = 'reismarreiroslda2'>
			</cfif>
			<cfset APPLICATION.onLiveServer = 0>
			<cfset APPLICATION.serverName = 'Testing'>

		<cfelseif findNoCase('ram', CGI.HTTP_HOST)>
			<cfset APPLICATION.server_root_uri = 'http://#CGI.SERVER_NAME#/reismarreiroslda2/front'>
			<cfset APPLICATION.server_root = '/reismarreiroslda2/front'>
			<cfif findNoCase('pl.ramlagos.com', CGI.HTTP_HOST)>
				<cfset APPLICATION.ds  = 'reismarreiroslda2_pl'>
				<cfset APPLICATION.onLiveServer = 1>
				<cfset APPLICATION.serverName = 'PreLive'>
			<cfelse>
				<cfset APPLICATION.ds  = 'LOCAL.dsnName'>
				<cfset APPLICATION.onLiveServer = 0>
				<cfset APPLICATION.serverName = 'Development'>
			</cfif>

		<cfelseif findNoCase('reismarreiroslda2.com/reismarreiroslda2', CGI.request_url)>
			<cfset APPLICATION.server_root_uri = 'https://#CGI.SERVER_NAME#/reismarreiroslda2/front'>
			<cfset APPLICATION.server_root = '/reismarreiroslda2/front'>
			<cfset APPLICATION.ds  = 'reismarreiroslda2'>
			<cfset APPLICATION.onLiveServer = 1>
			<cfset APPLICATION.serverName = ''>

		<cfelse>
			<cfset APPLICATION.server_root_uri = 'https://#CGI.HTTP_HOST#/front'>
			<cfset APPLICATION.server_root = '/front'>
			<cfset APPLICATION.ds  = 'reismarreiroslda2'>
			<cfset APPLICATION.onLiveServer = 1>
			<cfset APPLICATION.serverName = ''>
		</cfif>

		<cfset APPLICATION.assets = "#APPLICATION.server_root#/assets">
		<cfset APPLICATION.asset_modules = '#this.mappings[ "/modules" ]#'>
		<cfset APPLICATION.css = "#APPLICATION.assets#/css">
		<cfset APPLICATION.js = "#APPLICATION.assets#/js">
		<cfset APPLICATION.fonts = "#APPLICATION.assets#/fonts">
		<cfset APPLICATION.images = "#APPLICATION.assets#/images">

		<cfset APPLICATION.uri_uploads_images = '#APPLICATION.server_root#/../userData/images'>
	</cffunction>


	<!--- <cffunction name="onRequestStart">
		<cfargument name="targetPage" type="string" required="true">

		<cfset onApplicationStart()>
	</cffunction> --->


	<cffunction name="onRequest">
		<cfargument name="targetPage" type="string" required="true">

		<cfif (isDefined("URL.flush") AND URL.flush EQ 1) OR NOT structKeyExists(APPLICATION, 'version')>
			<cfset onApplicationStart()>

            <!--- <cfinclude template="../gttDevConfig.cfm"> --->
		</cfif>

		<cfif findNoCase('home', CGI.request_url) AND NOT structKeyExists(URL, 'lang') >
			<cfset VARIABLES.page = '#APPLICATION.server_root#/system/home.cfm'>
		<cfelseif findNoCase('home', CGI.request_url) AND URL.lang EQ 'en'>
			<cfset VARIABLES.page = '#APPLICATION.server_root#/system/home_en.cfm'>
		<cfelseif findNoCase('cowork', CGI.request_url)>
			<cfset VARIABLES.page = '#APPLICATION.server_root#/system/cowork.cfm'>
		<cfelseif findNoCase('perdidosachados', CGI.request_url)>
			<cfset VARIABLES.page = '#APPLICATION.server_root#/system/perdidosachados.cfm'>
		<cfelseif findNoCase('teste', CGI.request_url)>
			<cfset VARIABLES.page = '#APPLICATION.server_root#/system/teste.cfm'>
		<cfelse>
			<cfset VARIABLES.page = '#APPLICATION.server_root#/system/home.cfm'>
		</cfif>

		<cfset LOCAL.getAllContent = APPLICATION.articles_gateway.read({ artStatus = 1 })>
		<cfset LOCAL.getAllImages = APPLICATION.articles_images_gateway.readAll()>

		<cfinclude template="cftemplates/CT_header.cfm">
		<cfinclude template="#VARIABLES.page#">
		<cfinclude template="cftemplates/CT_footer.cfm">
	</cffunction>


</cfcomponent>
