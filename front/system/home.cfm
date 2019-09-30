<!--- include header section --->
<cfset LOCAL.headerData = {
    'id'          :'header',
    'artname'     :'homepage_header',
    'location'    :'1'
}>
<cfmodule template="../includes/inc_header.cfm" attributeCollection="#LOCAL.headerData#"/>

<!--- include about section --->
<cfset LOCAL.aboutData = {
    'artName'   :'homepage_about',
    'bgClass'   :'bg-primary',
    'title'     :'#APPLICATION.articles_gateway.getContentSnippets('homepage_about_title')#'
}>
<cfmodule template="../includes/inc_about.cfm" attributeCollection="#LOCAL.aboutData#"/>

<!--- include promotional section --->
<cfif NOT structKeyExists(URL, 'lang')>
    <cfinclude template="../includes/inc_pea.cfm">
</cfif>


<!--- include services section --->
<cfset LOCAL.serviceData = {
    'id'        :'services',
    'location'  :'1',
    'title'     :'#APPLICATION.articles_gateway.getContentSnippets('homepage_services_title')#'
}>
<cfmodule template="../includes/inc_services.cfm" attributeCollection="#LOCAL.serviceData#"/>


<!--- include portfolio section --->
<cfset LOCAL.portfolioData = {
    'id'        :'portfolio',
    'location'  :'1',
    'title'     :'#APPLICATION.articles_gateway.getContentSnippets('homepage_portfolio_title')#'
}>
<cfmodule template="../includes/inc_portfolio.cfm" attributeCollection="#LOCAL.portfolioData#"/>

<!--- include team section --->
<cfset LOCAL.teamData = {
    'id'        :'team',
    'location'  :'1',
    'title'     :'#APPLICATION.articles_gateway.getContentSnippets('homepage_team_title')#'
}>
<cfmodule template="../includes/inc_team.cfm" attributeCollection="#LOCAL.teamData#"/>
<!--- <cfinclude template="../includes/inc_team.cfm"> --->

<!--- include contacts section --->
<!--- include contacts section --->
<cfset LOCAL.contactsData = {
    'id'        :'contact',
    'artName'   :'contacts',
    'Location'  :'1',
    'title'     :'#APPLICATION.articles_gateway.getContentSnippets('contacts_title')#',
    'class'     :'bg-primary'
}>
<cfmodule template="../includes/inc_contacts.cfm" attributeCollection="#LOCAL.contactsData#"/>
<!--- <cfinclude template="../includes/inc_contacts.cfm"> --->
