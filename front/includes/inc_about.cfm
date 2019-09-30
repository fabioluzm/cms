<!--- Prevent the module from rendering twice --->
<cfif thisTag.executionMode EQ "end">
  <cfexit method="exittag" />
</cfif>

<cfoutput>
    <cfsavecontent variable="content">
        <!--- Get the about info from the articles table --->
        <cfset LOCAL.getAbout = APPLICATION.articles_gateway.read({artname = '#ATTRIBUTES.artName#'})>

        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2 text-center">
                    
                    <div class="text-justify text-last-center">
                        #LOCAL.getAbout.artDesc#
                    </div>
                    
                    <br><br>
                    
                    <cfif structKeyExists(LOCAL.getAbout, 'artLink') AND LEN(#LOCAL.getAbout.artLinkName#)>
                        <cfset LOCAL.btnBg = (findNoCase('bg-primary', ATTRIBUTES.bgClass) ? 'btn-default' : 'btn-primary')>
                        
                        <a href="#LOCAL.getAbout.artLink#" class="page-scroll btn #LOCAL.btnBg# btn-xl sr-button formshadow">#LOCAL.getAbout.artLinkName#</a>
                    </cfif>
                </div>
            </div>
        </div>
    </cfsavecontent>
    
    <cfset VARIABLES.sectionData = {
        'id'        :'about',
        'title'     :'#ATTRIBUTES.title#',
        'class'     :'#ATTRIBUTES.bgClass#',
        'content'   :VARIABLES.content        
    }>
    <cfmodule template="../cftemplates/CT_sectionTemplate.cfm" attributeCollection="#VARIABLES.sectionData#"/>
</cfoutput>