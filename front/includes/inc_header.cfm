<!--- Prevent the module from rendering twice --->
<cfif thisTag.executionMode EQ "end">
  <cfexit method="exittag" />
</cfif>

<cfoutput>
    <cfset LOCAL.getHeader = APPLICATION.articles_images_gateway.readAll({artName = '#ATTRIBUTES.artName#', artLocation = '#ATTRIBUTES.location#'})>

    <header id="#ATTRIBUTES.id#" <cfif structKeyExists(LOCAL.getHeader, 'imgPath') AND LEN(LOCAL.getHeader.imgPath)>style="background-image: url(#APPLICATION.uri_uploads_images#/#LOCAL.getHeader.imgPath#)"</cfif>>
        <div class="header-content">
            <div class="header-content-inner">
                #LOCAL.getHeader.artDesc#
            </div>
        </div>
        
        <cfif structKeyExists(LOCAL.getHeader, 'artLink') AND LEN(LOCAL.getHeader.artLinkName)>
            <cfif structKeyExists(ATTRIBUTES, 'location') AND LEN(ATTRIBUTES.location) AND findNoCase('2', ATTRIBUTES.location)>
                <a href="#LOCAL.getHeader.artLink#" class="header-button"><span></span>#LOCAL.getHeader.artlinkName#</a>
            <cfelse>
                <a class="icon-scroll" href="#LOCAL.getHeader.artLink#">
                    <p class="scroll-text">#LOCAL.getHeader.artLinkName#</p>
                </a>
            </cfif>
        </cfif>        
    </header>
</cfoutput>