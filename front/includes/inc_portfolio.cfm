<!--- Prevent the module from rendering twice --->
<cfif thisTag.executionMode EQ "end">
  <cfexit method="exittag" />
</cfif>

<cfoutput>
    <!--- Get the portfolio images from the images table --->
    <cfset LOCAL.getPortfolio = APPLICATION.images_catalog_gateway.read({imgPortfolio = 1, imgLocation='#ATTRIBUTES.location#'})>
    
    <!--- Render the cowork portfolio section --->
    <cfif structKeyExists(ATTRIBUTES, 'location') AND LEN(ATTRIBUTES.location) AND findNoCase('2', ATTRIBUTES.location) >
        <cfsavecontent variable="content">
            <div class="container-fluid">
                <div class="row">
                    <cfloop query="#LOCAL.getPortfolio#">
                        <div class="col-md-6 col-lg-4">
                            <div class="img-cowork">
                                <img class="img-responsive" src="#APPLICATION.images#/loader.gif" data-src="#APPLICATION.uri_uploads_images#/#LOCAL.getPortfolio.imgPath#" title="#LOCAL.getPortfolio.imgLabel#" alt="#LOCAL.getPortfolio.imgLabel#">
                            </div>
                        </div><!-- ./col -->
                    </cfloop>
                </div><!-- ./row -->
            </div><!-- ./container-fluid -->
        </cfsavecontent>
    <cfelse>
        <cfsavecontent variable="content">
            <div class="container-fluid">
                <div class="row no-gutter popup-gallery">
                    <cfloop query="#LOCAL.getPortfolio#">
                        <div class="respo-gal">
                            <div class="gallery">
                                <img src="#APPLICATION.images#/loader.gif" data-src="#APPLICATION.uri_uploads_images#/#LOCAL.getPortfolio.imgPath#" title="#LOCAL.getPortfolio.imgLabel#" alt="#LOCAL.getPortfolio.imgLabel#">
                                <div class="desc">#LOCAL.getPortfolio.imgDesc#</div>
                            </div>
                        </div><!-- ./col -->
                    </cfloop>
                </div><!-- ./row -->
            </div><!-- ./container -->
        </cfsavecontent>
    </cfif>
        
    <cfset VARIABLES.sectionData = {
        'id'        :'#ATTRIBUTES.id#',
        'title'     :'#(structKeyExists(ATTRIBUTES, 'title') ? ATTRIBUTES.title : '')#',
        'class'     :'#(structKeyExists(ATTRIBUTES, 'class') ? ATTRIBUTES.class : '')#',
        'content'   :VARIABLES.content
    }>

    <cfmodule template="../cftemplates/CT_sectionTemplate.cfm" attributeCollection="#VARIABLES.sectionData#"/>
</cfoutput>