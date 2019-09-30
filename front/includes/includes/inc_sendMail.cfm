<!--- Prevent the module from rendering twice --->
<cfif thisTag.executionMode EQ "end">
    <cfexit method="exittag" />
</cfif>
<cfdump var="#ATTRIBUTES#" format="html" abort="true" metainfo="yes">
<cfoutput>
    <cftry>
        <cfmail
            from = "#ATTRIBUTES.email#"
            to = "info@reismarreiroslda.com"
            charset = "utf-8"
            replyto = "#ATTRIBUTES.email#"
            subject = "Contacto via #ATTRIBUTES.location# - Website"
            type = "text"
            priority = "1"
        >
            <cfif structKeyExists(ATTRIBUTES, 'name')>
                Nome: #ATTRIBUTES.name#
            </cfif>
            
            <cfif structKeyExists(ATTRIBUTES, 'email')>
                E-mail: #ATTRIBUTES.email#
            </cfif>
            
            <cfif structKeyExists(ATTRIBUTES, 'services')>
                Serviços: #ATTRIBUTES.services#
            </cfif>
            
            <cfif structKeyExists(ATTRIBUTES, 'subject')>
                Assunto: #ATTRIBUTES.subject#
            </cfif>
            
            <cfif structKeyExists(ATTRIBUTES, 'company')>
                Empresa: #ATTRIBUTES.company#
            </cfif>
            
            <cfif structKeyExists(ATTRIBUTES, 'phone')>
                Contacto: #ATTRIBUTES.phone#
            </cfif>
            
            <cfif structKeyExists(ATTRIBUTES, 'message')>
                Mensagem: #ATTRIBUTES.message#
            </cfif>
        </cfmail>

        <cfmail
            from = "noreplay@reismarreiroslda.com"
            to = "#ATTRIBUTES.email#"
            charset = "utf-8"
            subject = "#ATTRIBUTES.location# - Autoreply"
            type = "text"
            priority = "1"
        >
            Obrigado pelo seu contacto, #ATTRIBUTES.name#. Entraremos em contacto brevemente. Obrigado!
        </cfmail>

        <cfset LOCAL.sysMsg = 'A sua mensagem foi enviada com sucesso! Entraremos em contacto brevemente. Obrigado!'>
        <cfset LOCAL.sysMsgLevel = 1>
        
        <script>alert("#LOCAL.sysMsg#");</script>
    <cfcatch>
        <cfset LOCAL.sysMsg = 'A sua mensagem não pode ser enviada! Volte a carregar a página e tente novamente. Obrigado!'>
        <cfset LOCAL.sysMsgLevel = 3>
        
        <script>alert("#LOCAL.sysMsg#");</script>
    </cfcatch>
    </cftry>
</cfoutput>