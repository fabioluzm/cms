<cfset SESSION.sysMsg = 'Adeus, #SESSION.cstData.usrName#. Volte brevemente!'>
<cfset SESSION.sysMsgLevel = 1>

<cfset structDelete(SESSION, 'cstData')>

<cfset redirect('back/index.cfm')>