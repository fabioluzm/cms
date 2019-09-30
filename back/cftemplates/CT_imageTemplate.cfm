<!--- Prevent the module from rendering twice --->
<cfif thisTag.executionMode EQ "end">
    <cfexit method="exittag" />
</cfif>

<cfoutput>
    <div class="offset-md-4 col-md-4">
		<div class="#ATTRIBUTES.styleClass#">
			<i class="
				<cfloop collection="#ATTRIBUTES.iconClass#" item="class">
					#ATTRIBUTES.iconClass[class]#
				</cfloop>">
			</i>
			<span>#ATTRIBUTES.title#</span>
		</div>
        
        <cfif structKeyExists(ATTRIBUTES, 'image') AND LEN(ATTRIBUTES.image)>
			<div class="card shadow">
				<div class="card-body p-3">
					<img src="#APPLICATION.app_images#/loader.gif" data-src="#ATTRIBUTES.imgPath#/#ATTRIBUTES.image#" class="card-img-top" alt="#ATTRIBUTES.image#">
				</div>
			</div>

		<cfelse>
			<p class="alert alert-info text-center mt-2">#ATTRIBUTES.alert#</p>
		</cfif>
	</div>
</cfoutput>