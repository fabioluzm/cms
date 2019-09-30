<CFOUTPUT>
	<messageBox></messageBox>

	<div class="panel panel-default">
		<div class="page-heading">

			<i class="heading-icon #ATTRIBUTES.pageData.icon#"></i>
			<span>#ATTRIBUTES.pageData.title#</span>

			<CFIF isDefined("ATTRIBUTES.pageData.nav") && isArray(ATTRIBUTES.pageData.nav)>
				<div class="float-right">
					<CFLOOP ARRAY="#ATTRIBUTES.pageData.nav#" ITEM="currNav" INDEX="currNavIndex">
						<a href="#currNav.link#" class="btn btn-info"<CFIF isDefined("currNav.target")> target="#currNav.target#"</CFIF>>
							<i class="pr-1 #currNav.icon#"></i>
							<CFIF isDefined("currNav.desc")>
								<span>#currNav.desc#</span>
							</CFIF>
						</a>
					</CFLOOP>
				</div>
			</CFIF>
		</div>

		<div class="page-body">
			#ATTRIBUTES.pageData.content#
		</div>
	</div>
</CFOUTPUT>
