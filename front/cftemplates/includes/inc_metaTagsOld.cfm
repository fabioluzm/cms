<cfoutput>
    <meta name="revised" content="09/09/2019">
    
    <cfif findNoCase('perdidosachados', ARGUMENTS.targetPage)>
        <title>#APPLICATION.articles_gateway.getContentSnippets('pea_page_title')#</title>
    <cfelseif findNoCase('cowork', ARGUMENTS.targetPage)>

        <title>#APPLICATION.articles_gateway.getContentSnippets('cowork_page_title')#</title>
        <meta name="keywords" content="">
        <meta name="description" content="">
        <meta name="author" content="">

        <!-- social meta tags -->        
        <meta property="og:locale" content="#(structKeyExists(URL, 'lang') AND findNoCase('en', URL.lang) ? 'en' : 'pt-pt')#">
        <meta property="og:title" content="">
        <meta property="og:description" content="">

    <cfelse>
        <title>#APPLICATION.articles_gateway.getContentSnippets('homepage_title')#</title>

        <meta name="keywords" content="desenvolvimento de software personalizado, empresa de software, software desenvolvimento de sistemas, software, lagos, algarve, reis, marreiros, reis marreiros, reis & marreiros, desenvolvimento de software à medida, informatica, aplicacoes, aplicações, ram, desenvolvimento web, web design">
        <meta name="description" content="Na Reis & Marreiros Lda desenvolvemos lojas online, desenvolvimento de software por medida e webdesign, mediante as necessidades de cada cliente.">
        <meta name="author" content="Web Design|Desenvolvimento de Lojas Online|Desenvolvimento de Software por Medida - Reis & Marreiros, Lda">

        <!-- social meta Tags -->
        <meta property="og:locale" content="#(structKeyExists(URL, 'lang') AND findNoCase('en', URL.lang) ? 'en' : 'pt-pt')#">
        <meta property="og:title" content="Web Design|Desenvolvimento de Lojas Online|Desenvolvimento de Software por Medida - Reis & Marreiros, Lda">
        <meta property="og:description" content="Na Reis & Marreiros,Lda desenvolvemos lojas online, desenvolvimento de software por medida e webdesign, mediante as necessidades de cada cliente.">
    </cfif>
    
    <meta property="og:image" content="#APPLICATION.images#/facebookPreview.png">
    <meta property="og:url" content="#CGI.http_referer#">
    <meta property="og:site_name" content="Reis & Marreiros, Lda">
    <meta property="og:image:type" content="image/png">
    <meta property="og:image:width" content="800">
    <meta property="og:image:height" content="600">
    <meta property="og:type" content="website">
    
    <link rel="canonical" href="#CGI.http_referer#">
    <!-- /.social meta tags -->
    
    <meta name="robots" content="index, follow">
</cfoutput>