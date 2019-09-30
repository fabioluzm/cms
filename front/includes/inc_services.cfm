<!--- Prevent the module from rendering twice --->
<cfif thisTag.executionMode EQ "end">
  <cfexit method="exittag" />
</cfif>

<cfoutput>
    <cfsavecontent variable="content">
        <cfset LOCAL.getServices = APPLICATION.articles_gateway.read({artType = 2, artlocation = '#ATTRIBUTES.location#'})>

        <div class="container">
            <div class="row">        
                <cfloop query="#LOCAL.getServices#">
                    <div class="col-lg-6 col-md-6 text-center">
                        <div class="service-box">
                            <i class="fa fa-4x #LOCAL.getServices.artIconClass# text-primary"></i>
                            <h3>#LOCAL.getServices.artName#</h3>
                            <div class="text-muted text-justify text-last-center">#LOCAL.getServices.artDesc#</div>
                        </div>

                        <cfif structKeyExists(LOCAL.getServices, 'artLink') AND LEN(LOCAL.getServices.artLink)>
                            <button class="btn inf formshadow" onclick="#LOCAL.getServices.artLink#">#LOCAL.getServices.artLinkName#</button>
                        </cfif>
                    </div><!-- ./col -->        
                </cfloop>       
            </div><!-- ./row -->
        </div><!-- ./container -->
    </cfsavecontent>

    <cfset VARIABLES.sectionData = {
        'id'        :'#ATTRIBUTES.id#',
        'title'     :'#ATTRIBUTES.title#',
        'content'   :VARIABLES.content        
    }>

    <cfmodule template="../cftemplates/CT_sectionTemplate.cfm" attributeCollection="#VARIABLES.sectionData#"/>
</cfoutput>