<!--- include header section --->
<cfset LOCAL.headerData = {
    'id'        :'header',
    'artname'   :'cowork_header',
    'location'  :'2'
}>
<cfmodule template="../includes/inc_header.cfm" attributeCollection="#LOCAL.headerData#"/>

<!--- include about section --->
<cfset LOCAL.aboutData = {
    'artName'   :'cowork_about',
    'bgClass'   :'bg-light',
    'title'     :'#APPLICATION.articles_gateway.getContentSnippets('cowork_about_title')#'
}>
<cfmodule template="../includes/inc_about.cfm" attributeCollection="#LOCAL.aboutData#"/>

<!--- include portfolio section --->
<cfset LOCAL.portfolioData = {
    'id'        :'coworkspace',
    'location'  :'2',
    'class'     :'bg-primary'
}>
<cfmodule template="../includes/inc_portfolio.cfm" attributeCollection="#LOCAL.portfolioData#"/>

<!--- include services section --->
<cfset LOCAL.serviceData = {
    'id'        :'offers',
    'location'  :'2',
    'title'     :'#APPLICATION.articles_gateway.getContentSnippets('cowork_ofertas_title')#'
}>
<cfmodule template="../includes/inc_services.cfm" attributeCollection="#LOCAL.serviceData#"/>

<!--- include price section --->
<cfset LOCAL.priceData = {
    'id'        :'prices',
    'artName'   :'cowork_price',
    'Location'  :'2',
    'title'     :'#APPLICATION.articles_gateway.getContentSnippets('cowork_price_title')#'
}>
<cfmodule template="../includes/inc_prices.cfm" attributeCollection="#LOCAL.priceData#"/>

<!--- include contacts section --->
<cfset LOCAL.contactsData = {
    'id'        :'contact',
    'artName'   :'contacts',
    'Location'  :'2',
    'title'     :'#APPLICATION.articles_gateway.getContentSnippets('contacts_title')#',
    'class'     :'bg-primary'
}>
<cfmodule template="../includes/inc_contacts.cfm" attributeCollection="#LOCAL.contactsData#"/>
