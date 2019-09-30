<cfoutput>    
    <nav id="mainNav" class="navbar navbar-default navbar-fixed-top text-center">
        <div class="container-fluid" style="background-color: ##00acdd;">
            
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="##navbar-collapse">
                    <span class="sr-only">Toggle navigation</span> Menu <i class="fa fa-bars"></i>
                </button>
                <a href="#(findNoCase('cowork', ARGUMENTS.targetPage) ? APPLICATION.server_root_uri : '##page-top')#">
                    <div class="logoNavBar">
                        <img class="logonav" src="#APPLICATION.images#/logosite_.png">
                    </div>
                </a>
                <a class="navbar-brand hidden-xs page-scroll" href="#(findNoCase('cowork', ARGUMENTS.targetPage) ? APPLICATION.server_root_uri : '##page-top')#" style="padding-left: 25px;">Reis & Marreiros Lda</a>
            </div>

            <div class="navbar-social nav navbar-nav">
                <a class="nav-social" href="mailto:info@reismarreiroslda.com"><i class="fa fa-envelope-square"></i></a>
                <a class="nav-social" target="_blank" rel="noopener noreferrer" href="https://www.facebook.com/reismarreiroslda"><i class="fab fa-facebook-square"></i></a>
                <a class="nav-social" target="_blank" rel="noopener noreferrer" href="https://www.linkedin.com/company/reismarreiroslda/"><i class="fab fa-linkedin"></i></a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="navbar-collapse">
                <ul class="nav navbar-nav navbar-right">
                    <cfif findNoCase('cowork', ARGUMENTS.targetPage)>
                        <li><a href="##about">O espaço</a></li>
                        <li><a href="##offers">Ofertas</a></li>
                        <li><a href="##prices">Preçário</a>
                        <li><a href="##contact">Contactos</a></li>
                        
                        <cfif structKeyExists(URL, 'lang') AND URL.lang EQ 'en'>
                            <li><a href="cowork.cfm">PT</a></li>
                        <cfelse>
                            <li><a href="cowork.cfm?lang=en">EN</a></li>
                        </cfif>
                    
                    <cfelse>
                        <li><a href="##about">Sobre</a></li>
                        <li><a href="##services">Serviços</a></li>
                        <li><a href="##portfolio">Portefólio</a>
                        <li><a href="##team">Equipa</a></li>
                        <li><a href="##contact">Contactos</a></li>
                        
                        <cfif structKeyExists(URL, 'lang') AND URL.lang EQ 'en'>
                            <li><a href="home.cfm">PT</a></li>
                        <cfelse>
                            <li><a href="home.cfm?lang=en">EN</a></li>
                        </cfif>
                    </cfif>
                </ul>
            </div>
        </div><!-- /.container-fluid -->
    </nav>
</cfoutput>