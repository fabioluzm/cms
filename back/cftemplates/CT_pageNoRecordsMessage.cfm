<cfoutput>
    <p class="alert alert-info">Sem #ATTRIBUTES.content# para mostrar.</p>
    <p class="alert alert-info">Clique no ícone &nbsp;<i class="fa fa-plus-circle"></i>&nbsp; para adicionar #(structKeyExists(ATTRIBUTES, 'subContent') AND LEN(ATTRIBUTES.subContent) ? ATTRIBUTES.subContent : ATTRIBUTES.content)#.</p>
</cfoutput>
