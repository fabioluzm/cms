<cftry>
    <cfset LOCAL.dsnHost = '127.0.0.1'>
    <cfset LOCAL.dsnPort = "3306">
    <cfset LOCAL.dsnName = 'reismarreiroslda2_dev'>
    <cfset LOCAL.dsnDatabase = 'reismarreiroslda2_dev'>
    <cfset LOCAL.dsnUsername = 'root'>
    <cfset LOCAL.dsnPassword = ''>

    <cfset LOCAL.datasource = {
        class: 'com.mysql.jdbc.Driver'
        , bundleName: 'com.mysql.jdbc'
        , bundleVersion: '5.1.40'
        , connectionString: 'jdbc:mysql://#LOCAL.dsnHost#:#LOCAL.dsnPort#/#LOCAL.dsnDatabase#?useUnicode=true&characterEncoding=UTF-8&useLegacyDatetimeCode=true'
        , username: LOCAL.dsnUsername
        , password: LOCAL.dsnPassword
        //, password: "encrypted:5ae372cd9e96a50ed8b350846bc6034346d6d392ddac0cd12265cdb5783cfca5"
        
        // optional settings
        , connectionLimit:100 // default:-1
    }>
    
    <!---  ping DB for conection test --->
    <cfquery name="query" datasource="#LOCAL.datasource#">
        SELECT 1
    </cfquery>

<cfcatch>
    <cftry>        
        <cfset LOCAL.dsnHost = '192.168.2.22'>
        <cfset LOCAL.dsnPort = "3306">
        <cfset LOCAL.dsnName = 'reismarreiroslda2_dev'>
        <cfset LOCAL.dsnDatabase = 'reismarreiroslda2_dev'>
        <cfset LOCAL.dsnUsername = 'ramadmin'>
        <cfset LOCAL.dsnPassword = 'RAMAdmin1!'>
        
        <cfset LOCAL.datasource = {
            class: 'com.mysql.jdbc.Driver'
            , bundleName: 'com.mysql.jdbc'
            , bundleVersion: '5.1.40'
            , connectionString: 'jdbc:mysql://#LOCAL.dsnHost#:#LOCAL.dsnPort#/#LOCAL.dsnDatabase#?useUnicode=true&characterEncoding=UTF-8&useLegacyDatetimeCode=true'
            , username: LOCAL.dsnUsername
            , password: LOCAL.dsnPassword
            //, password: "encrypted:5ae372cd9e96a50ed8b350846bc6034346d6d392ddac0cd12265cdb5783cfca5"
            
            // optional settings
            , connectionLimit:100 // default:-1
        }>
        
        <!---  ping DB for conection test --->
        <cfquery name="query" datasource="#LOCAL.datasource#">
            SELECT 1
        </cfquery>

    <cfcatch>            
        <cfset LOCAL.dsnHost = 'ramlagos.com'>
        <cfset LOCAL.dsnPort = "3306">
        <cfset LOCAL.dsnName = 'reismarreiroslda2_dev'>
        <cfset LOCAL.dsnDatabase = 'reismarreiroslda2_dev'>
        <cfset LOCAL.dsnUsername = 'ramadmin'>
        <cfset LOCAL.dsnPassword = 'RAMAdmin1!'>
        
        <cfset LOCAL.datasource = {
            class: 'com.mysql.jdbc.Driver'
            , bundleName: 'com.mysql.jdbc'
            , bundleVersion: '5.1.40'
            , connectionString: 'jdbc:mysql://#LOCAL.dsnHost#:#LOCAL.dsnPort#/#LOCAL.dsnDatabase#?useUnicode=true&characterEncoding=UTF-8&useLegacyDatetimeCode=true'
            , username: LOCAL.dsnUsername
            , password: LOCAL.dsnPassword
            //, password: "encrypted:5ae372cd9e96a50ed8b350846bc6034346d6d392ddac0cd12265cdb5783cfca5"
            
            // optional settings
            , connectionLimit:100 // default:-1
        }>
    </cfcatch>
    </cftry>
</cfcatch>
</cftry>