<CFFUNCTION NAME="redirect">
	<CFARGUMENT NAME="uri" TYPE="string" REQUIRED="true"/>

	<CFLOCATION URL="#application.server_root_uri#/#arguments.uri#">
</CFFUNCTION>

<CFFUNCTION NAME="getErrorMessage">
	<CFARGUMENT NAME="exception" TYPE="struct" REQUIRED="true"/>

	<CFRETURN len(arguments.exception.message)? arguments.exception.message : arguments.exception.detail>
</CFFUNCTION>

<CFFUNCTION NAME="trimAll">
	<CFARGUMENT NAME="myCollection" TYPE="struct" REQUIRED="true">

	<CFLOOP COLLECTION="#myCollection#" INDEX="key">
		<CFSET myCollection[key] = trim(myCollection[key])>
	</CFLOOP>

	<CFRETURN myCollection>
</CFFUNCTION>

<cfscript>

/**
 * Removes HTML from the string.
 * v2 - Mod by Steve Bryant to find trailing, half done HTML.
 * v4 mod by James Moberg - empties out script/style blocks
 * v5 mod by dolphinsboy
 *
 * @param string      String to be modified. (Required)
 * @return Returns a string.
 * @author Raymond Camden (ray@camdenfamily.com)
 * @version 4, October 4, 2010
 */
function stripHTML(str) {
    // remove the whole tag and its content
    var list = "style,script,noscript";
    for (var tag in list){
        str = reReplaceNoCase(str, "<s*(#tag#)[^>]*?>(.*?)","","all");
    }

    str = reReplaceNoCase(str, "<.*?>","","all");
    //get partial html in front
    str = reReplaceNoCase(str, "^.*?>","");
    //get partial html at end
    str = reReplaceNoCase(str, "<.*$","");

    return trim(str);

}

</cfscript>



<CFFUNCTION NAME="getIcon">
    <CFARGUMENT NAME="label" TYPE="string" REQUIRED="true">

    <CFSET VARIABLES.type = 'glyphicon-list'>

    <CFIF findNoCase('add', arguments.label)>
        <CFSET VARIABLES.type = 'glyphicon-plus'>
    <CFELSEIF findNoCase('edit', arguments.label)>
        <CFSET VARIABLES.type = 'glyphicon-pencil'>
    <CFELSEIF findNoCase('sort', arguments.label)>
        <CFSET VARIABLES.type = 'glyphicon-sort'>
    <CFELSEIF findNoCase('delete', arguments.label)>
        <CFSET VARIABLES.type = 'glyphicon-remove'>
    <CFELSEIF findNoCase('save', arguments.label)>
        <CFSET VARIABLES.type = 'glyphicon-ok'>
    <CFELSEIF findNoCase('clone', arguments.label)>
        <CFSET VARIABLES.type = 'glyphicon-check'>
    <CFELSEIF findNoCase('widgets', arguments.label)>
        <CFSET VARIABLES.type = 'glyphicon-wrench'>
    <CFELSEIF findNoCase('slider', arguments.label)>
        <CFSET VARIABLES.type = 'glyphicon-film'>
    <CFELSEIF findNoCase('gallery', arguments.label)>
        <CFSET VARIABLES.type = 'glyphicon-picture'>
    <CFELSEIF findNoCase('social', arguments.label)>
        <CFSET VARIABLES.type = 'glyphicon-heart-empty'>
    <CFELSEIF findNoCase('rooms', arguments.label)>
        <CFSET VARIABLES.type = 'glyphicon-bed'>
    <CFELSEIF findNoCase('back', arguments.label)>
        <CFSET VARIABLES.type = 'glyphicon-arrow-left'>
    <CFELSEIF findNoCase('features', arguments.label)>
        <CFSET VARIABLES.type = 'glyphicon-tags'>
    <CFELSEIF findNoCase('member', arguments.label)>
        <CFSET VARIABLES.type = 'glyphicon-user'>
    <CFELSEIF findNoCase('Report', arguments.label)>
        <CFSET VARIABLES.type = 'glyphicon-save-file'>
    </CFIF>

    <CFRETURN '<span class="glyphicon #VARIABLES.type#"></span>'>
</CFFUNCTION>


<CFFUNCTION NAME="populateObject">
    <CFARGUMENT NAME="data" TYPE="struct" REQUIRED="true">
    <CFARGUMENT NAME="obj" TYPE="struct" REQUIRED="true">

    <CFSET var currObj = duplicate(arguments.obj)>


    <CFLOOP COLLECTION="#arguments.data#" ITEM="key">
        <CFIF isDefined("currObj[key]")>
            <CFSET currObj[key] = arguments.data[key]>
        </CFIF>
    </CFLOOP>

    <CFRETURN currObj>
</CFFUNCTION>