<CFOUTPUT>
	<form method="post" class="form needs-validation" id="form" role="form" enctype="multipart/form-data" novalidate autocomplete="off">
	<CFIF NOT caller.pageIsLogin>
		<messageBox></messageBox>
		<div class="panel panel-default">
			<div class="page-heading">
				<div class="row">
					<div class="col">

						<i class="heading-icon #ATTRIBUTES.formData.icon#"></i>
						<span>#ATTRIBUTES.formData.title#</span>

						<CFIF isDefined("ATTRIBUTES.formData.nav") && isArray(ATTRIBUTES.formData.nav)>
							<div class="float-right">
								<CFLOOP ARRAY="#ATTRIBUTES.formData.nav#" ITEM="currNav" INDEX="currNavIndex">
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
				</div>
			</div>

			<div class="page-body">
				#ATTRIBUTES.formData.content#
			</div>
		</div>
	<CFELSE>
		<div class="row">
			<div class="col form-group">
				<div class="card" style="">
					<div class="card-body">
                        <messageBox></messageBox>
						
                        <div class="card-title header clearfix">
                            <img class="float-left" src="#ATTRIBUTES.formData.img#">
							<span class="float-right">#ATTRIBUTES.formData.title#</span>
						</div>

						<div class="card-text">

							#ATTRIBUTES.formData.content#

							<div class="text-center header login-footer">
								<span> 
                                    &copy; #YEAR(NOW())#
									#APPLICATION.applicationname#

									<CFIF application.serverName NEQ "Live">
										- #application.serverName#
									</CFIF>
									<!---
									<CFIF APPLICATION.onLiveServer EQ 0> - Test<CFELSEIF APPLICATION.onLiveServer LT 0> - Dev </CFIF>
									--->
								<span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	</CFIF>
	</form>
</CFOUTPUT>