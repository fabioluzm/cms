<!--- Prevent the module from rendering twice --->
<cfif thisTag.executionMode EQ "end">
    <cfexit method="exittag" />
</cfif>

<cfoutput>
    <cfset LOCAL.getMetaTags = APPLICATION.metatags_gateway.read({mtLocation = "#ATTRIBUTES.location#"})>
        
    <title>#ATTRIBUTES.title#</title>
    
    <meta name="revised" content="#LOCAL.getMetaTags.mtRevised#">
    <meta name="keywords" content="#LOCAL.getMetaTags.mtKeywords#">
    <meta name="description" content="#LOCAL.getMetaTags.mtDescription#">
    <meta name="author" content="#LOCAL.getMetaTags.mtAuthor#">

    <!-- social meta tags -->
    <meta property="og:locale" content="#(structKeyExists(URL, 'lang') AND findNoCase('en', URL.lang) ? 'en' : 'pt-pt')#">
    <meta property="og:title" content="#LOCAL.getMetaTags.mtOgTitle#">
    <meta property="og:description" content="#LOCAL.getMetaTags.mtOgDesc#">
    <meta property="og:site_name" content="#LOCAL.getMetaTags.mtOgSitename#">
    <meta property="og:image" content="#APPLICATION.uri_uploads_images#/social_network/#LOCAL.getMetaTags.mtOgImage#">
    <meta property="og:image:type" content="#LOCAL.getMetaTags.mtOgImgtype#">
    <meta property="og:image:width" content="#LOCAL.getMetaTags.mtOgImgWidth#">
    <meta property="og:image:height" content="#LOCAL.getMetaTags.mtOgImgHeight#">
    <meta property="og:type" content="#LOCAL.getMetaTags.mtOgType#">
    <meta property="og:url" content="#LOCAL.getMetaTags.mtOgUrl#">
    <link rel="canonical" href="#LOCAL.getMetaTags.mtCanonical#">
    <!-- /.social meta tags -->

    <cfif structKeyExists(ATTRIBUTES, 'robots') AND LEN(ATTRIBUTES.robots) AND findNoCase('yes', ATTRIBUTES.robots)>
        <meta name="robots" content="index, follow">
    </cfif>
</cfoutput>