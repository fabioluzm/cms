<!--- Get company info from the system table --->
<cfset LOCAL.getSysInfo = APPLICATION.system_gateway.read()>

<cfoutput>
    <cfif structKeyExists(LOCAL.getSysInfo, 'sysCoordinatesApi') AND LEN(LOCAL.getSysInfo.sysCoordinatesApi)>
        <iframe class="downSpace rammap embed-respo-gal-item" src="#LOCAL.getSysInfo.sysCoordinatesApi#" allowfullscreen></iframe>
    </cfif>

    <div class="row downSpace text-center ramsocialnetwork">
        <div class="col-md-4">
            <div class="social">
                <a href="mailto:#LOCAL.getSysInfo.sysMail#" class="contact-btn">
                    <img src="#APPLICATION.images#/icons/mailinv_.svg" height="40" class="downSpace ramicon">
                </a>
            </div>
            
            <p class="formspace">#LOCAL.getSysInfo.sysMail#</p>
        </div><!-- ./col -->

        <div class="col-md-4">
            <div class="social">
                <a target="_blank" rel="noopener noreferrer" href="#LOCAL.getSysInfo.sysCoordinates#" class="contact-btn">
                    <img src="#APPLICATION.images#/icons/gpsinv_.svg" height="40" class="downSpace ramicon">
                </a>
            </div>
            
            <p class="formspace">#LOCAL.getSysInfo.sysAddress#</p>
        </div><!-- ./col -->

        <div class="col-md-4">
            <div class="social">
                <a href="tel:+351#LOCAL.getSysInfo.sysPhone#" class="contact-btn">
                    <img src="#APPLICATION.images#/icons/phoneinv_.svg" height="40" class="downSpace ramicon">
                </a>
            </div>
            
            <p class="formspace"><span class="ramphone">#LOCAL.getSysInfo.sysPhone#</span><br>#LOCAL.getSysInfo.sysSchedule#</p>
        </div><!-- ./col -->
    </div><!-- /.row -->
</cfoutput>