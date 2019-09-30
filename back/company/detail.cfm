<cfset VARIABLES.getSystem = APPLICATION.system_gateway.read(URL)>

<cfif isDefined("FORM.fieldNames")>
	<cfif FORM.action EQ "1">
		<cftry>
			<cfset APPLICATION.system_gateway.update(FORM, URL.sysId)>

			<cfset SESSION.sysMsg = 'A informação foi alterada com sucesso.'>
			<cfset SESSION.sysMsgLevel = 1>

			<cfset redirect('back/company/detail.cfm?sysId=#URL.sysId#')>
		<cfcatch>
			<cfset SESSION.sysMsg = getErrorMessage(CFCATCH)>
			<cfset SESSION.sysMsgLevel = 3>

			<cfif listFind("79.168.29.156,81.84.237.217,85.245.55.162,127.0.0.1", CGI.REMOTE_ADDR)>
				<cfdump VAR="#cfcatch#">
				<cfabort>
			</cfif>
		</cfcatch>
		</cftry>
	<cfelse>
		<cftry>
			<cfset APPLICATION.system_gateway.delete(URL.sysId)>

			<cfset SESSION.sysMsg = 'A informação foi eliminada com sucesso.'>
			<cfset SESSION.sysMsgLevel = 1>

			<cfset  redirect('back/company/detail.cfm?sysId=#URL.sysId#')>
		<cfcatch>
			<cfset SESSION.sysMsg = getErrorMessage(CFCATCH)>
			<cfset SESSION.sysMsgLevel = 3>
		</cfcatch>
		</cftry>
	</cfif>
</cfif>

<cfoutput>

<cfsavecontent variable="content">
	<cfset VARIABLES.displayData = {
		'styleClass': 'page-heading mt-5',
		'iconClass': {
			'style': 'heading-icon',
			'type': ' far fa-address-card'
			},
		'title': 'Editar Informação',
		'alert': 'Sem nenhuma informação disponível.'
	}>

	<cfif VARIABLES.getSystem.recordCount>
		<div class="table-responsive-lg">
			<table class="table table-striped table-bordered table-hover">
				<thead class="thead-light">
					<tr><th style="width: 40%;">
						Morada
					</th><th style="width: 20%;">
						E-mail
					</th><th style="width: 20%;">
						Telefone
					</th><th style="width: 20%;">
						Horário
					</th></tr>
				</thead>

				<tbody>
					<CFLOOP query="VARIABLES.getSystem">
						<tr><td>
							#sysAddress#
						</td><td>
							#sysMail#
						</td><td>
							#sysPhone#
						</td><td>
							#sysSchedule#
						</td></tr>
					</CFLOOP>
				</tbody>
			</table>

			<!--- <table class="table table-striped table-bordered table-hover">
				<thead class="thead-light">
					<tr><th>
						Google Maps Link
					<!--- </th><th>
						Social Networks --->
					</th></tr>
				</thead>

				<tbody>
					<CFLOOP query="VARIABLES.getSystem">
						<tr><td>
							#sysCoordinates#
						</td></tr>
					</CFLOOP>
				</tbody>
			</table> --->
            
            <iframe class="col-12" height="300" src="#VARIABLES.getSystem.sysCoordinatesApi#" allowfullscreen></iframe>
		</div>
	<CFELSE>
		<p class="alert alert-info">#VARIABLES.displayData.alert#</p>
	</cfif>

	<cfif SESSION.cstData.usrAdmin LTE 1>
		<div class="#VARIABLES.displayData.styleClass# mb-3">
			<i class="
				<cfloop collection="#VARIABLES.displayData.iconClass#" item="class">
					#VARIABLES.displayData.iconClass[class]#
				</cfloop>">
			</i>
			<span>#VARIABLES.displayData.title#</span>
		</div>

		<input type="hidden" name="action" value="1">

		<div class="form-row">
            <div class="form-group col-md-6">
                <label for="sysAddress">Morada <small>*</small></label>
                <input type="text" class="form-control" id="sysAddress" name="sysAddress" value="#VARIABLES.getSystem.sysAddress#" placeholder="Adicione a morada" required>
                <small class="invalid-feedback">Adicione a morada.</small>
            </div>

			<div class="form-group col-md-6">
				<label for="sysMail">E-mail <small>*</small></label>
				<input type="mail" class="form-control" id="sysMail" name="sysMail" value="#VARIABLES.getSystem.sysMail#" placeholder="Adicione o e-mail" required>
				<small class="invalid-feedback">Adicione o e-mail.</small>
			</div>
        </div>

		<div class="form-row">
			<div class="form-group col-md-6">
				<label for="sysPhone">Telefone <small>*</small></label>
				<input type="tel" class="form-control" id="sysPhone" name="sysPhone" value="#VARIABLES.getSystem.sysPhone#" placeholder="Adicione o telefone" required>
				<small class="invalid-feedback">Adicione o telefone.</small>
			</div>
            
            <div class="form-group col-md-6">
				<label for="sysSchedule">Horário <small>*</small></label>
				<input type="text" class="form-control" id="sysSchedule" name="sysSchedule" value="#VARIABLES.getSystem.sysSchedule#" placeholder="Adicione o horário" required>
				<small class="invalid-feedback">Adicione o horário.</small>
			</div>
		</div>

		<div class="form-row">
            <div class="form-group col-md-6">
                <label for="sysCoordinatesApi">Google Maps API Link <small>*</small></label>
                <input type="text" class="form-control" id="sysCoordinatesApi" name="sysCoordinatesApi" value="#VARIABLES.getSystem.sysCoordinatesApi#" placeholder="Adicione o link da API do Google Maps" required>
                <small class="invalid-feedback">Adicione o link para a API do Goggle Maps.</small>
            </div>
            
            <div class="form-group col-md-6">
                <label for="sysCoordinates">Google Maps Link <small>*</small></label>
                <input type="text" class="form-control" id="sysCoordinates" name="sysCoordinates" value="#VARIABLES.getSystem.sysCoordinates#" placeholder="Adicione o link para o Goggle Maps" required>
                <small class="invalid-feedback">Adicione o link para o Goggle Maps.</small>
            </div>
        </div>

		<cfmodule template="../cftemplates/CT_pageNoteMandatoryFields.cfm">

		<hr>

		<div class="form-row">
			<div class="form-group w-100 text-right">
				<button class="myBtn btn btn-success" type="submit">
					<i class="fa fa-check"></i>
					<span class="hidden-xs">&nbsp;Guardar</span>
				</button>
			</div>
		</div>
	</cfif>
</cfsavecontent>

<cfset formData = {
	'icon' = VARIABLES.displayData.iconClass.type,
	'title' = 'Informação',
	'content' = VARIABLES.content
}>

<cfmodule template = "../cftemplates/CT_formTemplate.cfm" formData="#VARIABLES.formData#">

</cfoutput>