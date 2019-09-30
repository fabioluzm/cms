<cfcomponent>
	<cfset this.name = 'Reis & Marreiros, Lda. - Backoffice'>
	<cfset app.name = 'Reis & Marreiros, Lda.'>
	<cfset this.applicationTimeout = CreateTimeSpan(0, 1, 0, 0)>
	<cfset this.sessionManagement = true>
	<cfset this.sessionTimeout = CreateTimeSpan(0, 0, 30, 0)>
    

	<cffunction NAME="onApplicationStart">
        <cfinclude template="../gttDevConfig.cfm">
		
        <cfset application.version = 'v1.0.0'>

		<!--- Load gateways - begin --->

			<cfdirectory
				directory = "#expandPath("../appservices/gateway")#"
				action = "list"
				name="LOCAL.listOfGateways">

			<cfloop query="#LOCAL.listOfGateways#">
				<cfset LOCAL.gatewayName = ListFirst(name, '.')>

				<cfset APPLICATION[LOCAL.gatewayName] = createObject('component', 'appservices.gateway.#LOCAL.gatewayName#').init()>
			</cfloop>

		<!--- Load gateways - end --->

		<cfif findNoCase('localhost', CGI.SERVER_NAME) OR findNoCase('127.0.0.1', CGI.SERVER_NAME)>
			<cfset application.server_root_uri = 'http://#CGI.server_name#:#cgi.server_port#'>
            <cfset APPLICATION.ds  = '#LOCAL.datasource#'>
			<!--- <cfset application.ds  = 'reismarreiroslda2_dev'> --->
			<cfset application.onLiveServer = -2>
			<cfset application.serverName = 'Localhost'>

		<cfelseif findNoCase('reismarreiroslda2.ramlagos.com', CGI.HTTP_HOST) or findNoCase('test.ramlagos.com', CGI.HTTP_HOST)>
			<cfif findNoCase('test.ramlagos.com', CGI.HTTP_HOST)>
				<cfset application.server_root_uri = 'http://#CGI.SERVER_NAME#/reismarreiroslda2'>
				<cfset application.ds  = 'reismarreiroslda2_test'>
			<cfelse>
				<cfset application.server_root_uri = 'http://#CGI.SERVER_NAME#'>
				<cfset application.ds  = 'reismarreiroslda2'>
			</cfif>
			<cfset application.onLiveServer = 0>
			<cfset application.serverName = 'Testing'>

		<cfelseif findNoCase('ram', CGI.HTTP_HOST)>
			<cfset application.server_root_uri = 'http://#CGI.SERVER_NAME#/reismarreiroslda2'>
			<cfif findNoCase('pl.ramlagos.com', CGI.HTTP_HOST)>
				<cfset application.ds  = 'reismarreiroslda2_pl'>
				<cfset application.onLiveServer = 1>
				<cfset application.serverName = 'PreLive'>
			<cfelse>
				<cfset application.ds  = 'reismarreiroslda2_dev'>
				<cfset application.onLiveServer = -1>
				<cfset application.serverName = 'Development'>
			</cfif>

		<cfelseif findNoCase('reismarreiroslda2.com/reismarreiroslda2', CGI.request_url)>
			<cfset application.server_root_uri = 'https://#CGI.SERVER_NAME#/reismarreiroslda2'>
			<cfset application.ds  = 'reismarreiroslda2'>
			<cfset application.onLiveServer = 1>
			<cfset application.serverName = ''>

		<cfelse>
			<cfset application.server_root_uri = 'https://#CGI.HTTP_HOST#'>
			<cfset application.ds  = 'reismarreiroslda2'>
			<cfset application.onLiveServer = 1>
			<cfset application.serverName = ''>
		</cfif>

		<cfset application.app_css = '#application.server_root_uri#/back/assets/css'>
		<cfset application.app_js = '#application.server_root_uri#/back/assets/js'>
		<cfset application.app_fonts = '#application.server_root_uri#/back/assets/fonts'>
		<cfset application.app_images = '#application.server_root_uri#/back/assets/img'>
		<cfset application.app_libs = '#application.server_root_uri#/back/libs/'>
		<cfset application.app_assets_modules = '#application.server_root_uri#/back/assets/modules'>
		<cfset application.uri_uploads_images = '#application.server_root_uri#/userData/images'>

		<cfset application.app_folder = getDirectoryFromPath( getCurrentTemplatePath() )>
		<cfset application.app_uploads = '#application.app_folder#..\userData\'>
		<cfset application.app_uploads_temp = '#application.app_folder#\..\userData\temp\'>
		<cfset application.app_uploads_images = '#application.app_folder#\..\userData\images\'>
		<cfset application.uri_uploads = '#application.server_root_uri#/userData/'>

		<cfset application.app_uploads_images_fileSize = 5000000>
	</cffunction>

	<cffunction NAME="onSessionStart">

	</cffunction>

	<cffunction NAME="onRequestStart">
		<cfargument NAME="targetPage" TYPE="string" REQUIRED="true">
			<cfset onApplicationStart()>

		<cfif (isDefined("URL.flush") AND URL.flush EQ 1) OR NOT structKeyExists(APPLICATION, 'version') OR NOT structKeyExists(APPLICATION, 'users_gateway')>
			<cfset onApplicationStart()>

			<cfinclude template="../gttDevConfig.cfm">
		</cfif>

		<cfif (NOT isDefined("session.cstData") AND NOT findNoCase('login.cfm', ARGUMENTS.targetPage) AND NOT findNoCase('_api', ARGUMENTS.targetPage) AND NOT findNoCase('_ajax', ARGUMENTS.targetPage))>
			<CFLOCATION URL='#application.server_root_uri#/back/system/login.cfm'>
		</cfif>

	</cffunction>

	<cffunction NAME="onRequest">
		<cfargument NAME="targetPage" TYPE="string" REQUIRED="true">

		<cfset VARIABLES.pageIsLogin = findNoCase('login.cfm', ARGUMENTS.targetPage)? true : false>
		<cfset VARIABLES.showOnlyRequest = findNoCase('_api', ARGUMENTS.targetPage) or findNoCase('_ajax', ARGUMENTS.targetPage) ? true : false>

		<cfinclude TEMPLATE = "libs/utils.cfm">

		<cfset FORM = trimAll(FORM)>
		<cfset URL = trimAll(URL)>

		<cfif showOnlyRequest>
			<cfinclude TEMPLATE = "#ARGUMENTS.targetPage#">
		<cfelse>
			<cfinclude TEMPLATE = "cftemplates/CT_header.cfm">
			<cfinclude TEMPLATE = "#ARGUMENTS.targetPage#">
			<cfinclude TEMPLATE = "cftemplates/CT_footer.cfm">
		</cfif>
	</cffunction>

	<cffunction NAME="onRequestEnd">

	</cffunction>

	<cffunction NAME="onApplicationEnd">
		<cfargument NAME="ApplicationScope" TYPE="struct" REQUIRED="true">
	</cffunction>

	<cffunction NAME="onError">
		<cfargument NAME="Exception" TYPE="any" REQUIRED="true">
		<cfargument NAME="EventName" TYPE="string" REQUIRED="true">

		<cfdump VAR="#Exception#">
	</cffunction>

</cfcomponent>
