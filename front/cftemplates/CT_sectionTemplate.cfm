<!--- Prevent the module from rendering twice --->
<cfif thisTag.executionMode EQ "end">
  <cfexit method="exittag" />
</cfif>

<cfoutput>
    <section id="#ATTRIBUTES.Id#" <cfif structKeyExists(ATTRIBUTES, 'class') AND LEN(ATTRIBUTES.class)>class="#ATTRIBUTES.class#"</cfif>>
        <cfif structKeyExists(ATTRIBUTES, 'title') and LEN(ATTRIBUTES.title)>
            <div class="container">
                <div class="row">
                    <div class="col-md-12 text-center">
                        <h2 class="section-heading">#ATTRIBUTES.title#</h2>
                        
                        <cfset LOCAL.hrClass = (structKeyExists(ATTRIBUTES, 'class') AND findNoCase('bg-primary', ATTRIBUTES.class) ? 'light' : 'primary')>                       
                        <hr class="#LOCAL.hrClass#">
                            
                    </div><!-- ./col -->
                </div><!-- ./row -->
            </div><!-- ./container -->
        </cfif>
        
        #ATTRIBUTES.content#
    </section>
</cfoutput>
