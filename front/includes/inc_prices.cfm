<!--- Prevent the module from rendering twice --->
<cfif thisTag.executionMode EQ "end">
  <cfexit method="exittag" />
</cfif>
<!--- <cfdump var="#APPLICATION.articles_gateway.read({artName='contacts',artLocation='2'})#" format="html" abort="true" metainfo="yes"> --->
<cfoutput>
    <!--- Get the about info from the articles table --->
    <cfset LOCAL.getPrice = APPLICATION.articles_gateway.read({artName = '#ATTRIBUTES.artName#', artLocation = '#ATTRIBUTES.location#'})>
    
    <cfsavecontent variable="content">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 col-lg-offset-2 text-center">
					<div class="text-muted text-justify text-last-center">                    
                    
                        #LOCAL.getPrice.artDesc#
                    
                    </div>
					<cfif structKeyExists(LOCAL.getPrice, 'artLink') AND LEN(LOCAL.getPrice.artLinkName)>
                        <a href="#LOCAL.getPrice.artLink#" class="page-scroll btn btn-primary btn-xl sr-button formshadow">#LOCAL.getPrice.artLinkName#</a>
                    </cfif>
				</div>
			</div>
		</div>

    </cfsavecontent>
    
    <cfset VARIABLES.sectionData = {
        'id'        :'#ATTRIBUTES.id#',
        'title'     :'#ATTRIBUTES.title#',
        'class'     :'#(structKeyExists(ATTRIBUTES, 'class') ? ATTRIBUTES.class : '')#',
        'content'   :VARIABLES.content        
    }>
    <cfmodule template="../cftemplates/CT_sectionTemplate.cfm" attributeCollection="#VARIABLES.sectionData#"/>
</cfoutput>