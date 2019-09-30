<!--- <?php include 'configs.php'; ?> --->
<cfoutput>
    <!DOCTYPE html>    
    <html lang="#(structKeyExists(URL, 'lang') AND findNoCase('en', URL.lang) ? 'en' : 'pt')#" id="page-top">
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta charset="UTF-8">
        
        <cfif findNoCase('teste', ARGUMENTS.targetPage)>
            <cfset LOCAL.pageData = {
                'title'     :'Teste Page',
                'location'  :'28'
            }>
        
        <cfelseif findNoCase('cowork', ARGUMENTS.targetPage)>
            <cfset LOCAL.pageData = {
                'title'     :'#APPLICATION.articles_gateway.getContentSnippets('cowork_page_title')#',
                'location'  :'2'
            }>
        
        <cfelseif findNoCase('perdidosachados', ARGUMENTS.targetPage)>
            <cfset LOCAL.pageData = {
                'title'     :'#APPLICATION.articles_gateway.getContentSnippets('pea_page_title')#',
                'location'  :'3'
            }>
        
        <cfelse>
            <cfset LOCAL.pageData = {
                'title'     :'#APPLICATION.articles_gateway.getContentSnippets('homepage_title')#',
                'location'  :'1'
            }>
        </cfif>
        
        <cfmodule template="includes/inc_metaTags.cfm" attributeCollection="#LOCAL.pageData#"/>

        <link rel="icon" href="#APPLICATION.images#/favicon.png" type="image/png">
        
        <!--- css modules --->
        <link href="#APPLICATION.asset_modules#/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="#APPLICATION.asset_modules#/fontawesome/5.8.1/css/all.min.css">
        
        <!--- custom css --->
        <link href="#APPLICATION.css#/creative.css" rel="stylesheet">
    
        <cfif findNoCase('cowork', ARGUMENTS.targetPage)>
            <link href="#APPLICATION.css#/cowork.css" rel="stylesheet">        
        <cfelseif findNoCase('perdidosachados', ARGUMENTS.targetPage)>
            <link href="#APPLICATION.css#/pea.css" rel="stylesheet">
        </cfif>
    </head>
</cfoutput>

<body>
    <cfif NOT findNoCase('perdidosachados', ARGUMENTS.targetPage)>
        <cfinclude template="includes/inc_navBar.cfm">
    </cfif>
    
    <!--- <cfif findNoCase('cowork', ARGUMENTS.targetPage)>
        <cfset LOCAL.getHeader = APPLICATION.articles_images_gateway.readAll({artName = 'cowork_header', artLocation = '2'})>
    <cfelse>
        <cfset LOCAL.getHeader = APPLICATION.articles_images_gateway.readAll({artName = 'homepage_header', artLocation = '1'})>
    </cfif>
    
    <cfset LOCAL.headerData = {
        'id'          :'header',
        'image'       :'#APPLICATION.uri_uploads_images#/#LOCAL.getHeader.imgPath#',
        'description' :'#LOCAL.getHeader.artDesc#',
        'btnName'     :'#LOCAL.getHeader.artLinkName#',
        'btnLink'     :'#LOCAL.getHeader.artLink#'
    }>
    
    <cfmodule template="includes/inc_header.cfm" attributeCollection="#LOCAL.headerData#"> --->