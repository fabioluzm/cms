<!--- Prevent the module from rendering twice --->
<cfif thisTag.executionMode EQ "end">
  <cfexit method="exittag" />
</cfif>

<cfoutput>
    <cfsavecontent variable="content">
        <!--- Get contacts from the articles table --->
        <cfset LOCAL.getContacts = APPLICATION.articles_gateway.read({artName = 'contacts', artlocation = "#(structKeyExists(ATTRIBUTES, 'location') ? ATTRIBUTES.location : '')#"})>
        
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2">
                    <div class="text-justify text-last-center formspace">#LOCAL.getContacts.artDesc#</div>
                </div><!-- /.col -->
            </div><!-- /.row -->

            <div class="row contact-spacing">
                <div class="col-md-5">
                    
                    <!--- Include contact form --->
                    <cfmodule template="includes/inc_contactForm.cfm" formTitle="#LOCAL.getContacts.artLinkName#" location="#(structKeyExists(ATTRIBUTES, 'location') ? ATTRIBUTES.location : '')#"/>
                </div>
                
                <div class="col-md-7">
                    
                    <!--- include company contacts and map --->
                    <cfinclude template="includes/inc_contactCompany.cfm">
                </div><!-- ./col -->
            </div><!-- ./row -->
        </div><!-- ./container -->
    </cfsavecontent>

    <cfset VARIABLES.sectionData = {
        'id'        :'#(structKeyExists(ATTRIBUTES, 'id') ? ATTRIBUTES.id : '')#',
        'title'     :'#(structKeyExists(ATTRIBUTES, 'title') ? ATTRIBUTES.title : '')#',
        'class'     :'#(structKeyExists(ATTRIBUTES, 'class') ? ATTRIBUTES.class : '')#',
        'content'   :VARIABLES.content        
    }>

    <cfmodule template="../cftemplates/CT_sectionTemplate.cfm" attributeCollection="#VARIABLES.sectionData#"/>
</cfoutput>