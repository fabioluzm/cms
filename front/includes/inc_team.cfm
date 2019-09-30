<!--- Prevent the module from rendering twice --->
<cfif thisTag.executionMode EQ "end">
  <cfexit method="exittag" />
</cfif>

<cfoutput>
    <!--- Get the company team images from the images table --->
    <cfset LOCAL.getTeam = APPLICATION.images_catalog_gateway.read({imgTeam = 1, imgLocation = '#ATTRIBUTES.location#'})>
    
    <cfsavecontent variable="content">

         <div class="container">
            <div class="row team-display">
                <cfloop query="#LOCAL.getTeam#" from="1" to="#LOCAL.getTeam.RecordCount#" index="i">
                    
                    <!--- add a class with a minor offset on positions 1,6,11, and so on, to improve the user experience --->
                    <cfset LOCAL.teamStyle = (i EQ 1) ? 'team-offset' : (i MOD 5 EQ 0 + 1) ? 'team-offset' : ''>

                    <div class="col-xs-offset-1 col-xs-10 col-sm-offset-0 col-sm-6 col-md-4 col-lg-2 team-box-img <cfif isDefined('LOCAL.teamStyle')>#LOCAL.teamStyle#"</cfif>">
                        <img src="#APPLICATION.images#/loader.gif" data-src="#APPLICATION.uri_uploads_images#/#LOCAL.getTeam.imgPath[i]#" title="#LOCAL.getTeam.imgLabel[i]#" alt="#LOCAL.getTeam.imgLabel[i]#" class="img-team img-responsive">
                        <h3>#LOCAL.getTeam.imgLabel[i]#</h3>
                        <p class="text-muted">#LOCAL.getTeam.imgDesc[i]#</p>
                    </div>
                </cfloop>
            </div>
        </div>
    </cfsavecontent>

    <cfset VARIABLES.sectionData = {
        'id'        :'#ATTRIBUTES.id#',
        'title'     :'#ATTRIBUTES.title#',
        'content'   :VARIABLES.content        
    }>

    <cfmodule template="../cftemplates/CT_sectionTemplate.cfm" attributeCollection="#VARIABLES.sectionData#"/>
</cfoutput>