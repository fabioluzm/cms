<!---
	Checkbox image module - v1.0.0

	This 4 alias column keys are mandatory
	in order for the module to work
--->
<cfset VARIABLES.newKeyList = "depId,modId,modPath,modLabel">
<cfset VARIABLES.columns = ATTRIBUTES.dbConn.GetColumnNames()>
<cfset VARIABLES.columnList = arrayToList(variables.columns)>

<cfset VARIABLES.columnIndex = "">

<cfloop list="#ATTRIBUTES.dbKeyList#" item="currKey">
	<cfset VARIABLES.columnIndex = listAppend(variables.columnIndex, listFindNoCase(variables.columnList, currKey))>
</cfloop>

<cfset VARIABLES.columns = ListToArray(variables.columnList)>

<cfloop list="#ATTRIBUTES.dbKeyList#" item="currKey" index="currIndex">
	<cfset VARIABLES.columns[ listGetAt(variables.columnIndex, currIndex)] = listGetAt(variables.newKeyList, currIndex)>
</cfloop>

<cfset ATTRIBUTES.dbConn.SetColumnNames(variables.columns)>

<CFOUTPUT>
	<div class="#ATTRIBUTES.styleClass#">
		<i class="
			<cfloop collection="#ATTRIBUTES.icon#" item="currIcon">
				#ATTRIBUTES.icon[currIcon]#
			</cfloop>">
		</i>

		<span>#ATTRIBUTES.moduleTitle#</span>
	</div>

	<cfif ATTRIBUTES.dbConn.recordCount>
		<div class="row">
			<cfloop query="#ATTRIBUTES.dbConn#">
				<div class="col-md-3 mb-3">

					<input type="checkbox" id="img_#ATTRIBUTES.dbConn.modId#" name="imgId" value="#ATTRIBUTES.dbConn.modId#" class="rcb" <cfif depId EQ ATTRIBUTES.urlId>checked</cfif>>

					<label for="img_#ATTRIBUTES.dbConn.modId#" class="shadow-lg rcb-label">
						<img src="#APPLICATION.app_images#/loader.gif" data-src="#application.uri_uploads_images#/#ATTRIBUTES.dbConn.modPath#" alt="img_#ATTRIBUTES.dbConn.modId#" class="rcb-img">
						<br>
						<p class="text-center header p-2 mb-0">#ATTRIBUTES.dbConn.modLabel#</p>
					</label>

				</div>
			</cfloop>
		</div>
	<cfelse>
		<p class="alert alert-info">#ATTRIBUTES.alert#</p>
	</cfif>
</CFOUTPUT>