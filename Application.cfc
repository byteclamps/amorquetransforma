<cfcomponent displayname="Application" output="true" hint="Handles the application">
	<cfset THIS.Name = "Amor que transforma">
	<cfset THIS.ApplicationTimeout = CreateTimeSpan(30, 0, 0, 0)>
	<cfset THIS.SessionManagement = true>
	<cfset THIS.SetClientCookies = true>
	<cfset THIS.ClientManagement = true>
	<cfset THIS.SessionTimeout = CreateTimeSpan(0, 1, 0, 0)>
	<cfset THIS.Timezone = "America/Santo_Domingo">

    <cffunction  name="onApplicationStart"  access="remote" returntype="boolean" output="false" >
        <cfset application.PAGE_TITLE = ".:: FUNDACIÓN AMOR QUE TRANSFORMA ::.">

        <!--- Application environments --->
        <cfset application.APPLICATION_ENVIRONMENT_DEVELOPMENT = 1>
        <cfset application.APPLICATION_ENVIRONMENT_PRODUCTION = 2>

        <!--- Current state of application --->
        <cfset application.APPLICATION_CURRENT_ENVIRONMENT = application.APPLICATION_ENVIRONMENT_PRODUCTION>

        <!--- Load host file depending on environment --->
		<cfif application.APPLICATION_CURRENT_ENVIRONMENT eq application.APPLICATION_ENVIRONMENT_DEVELOPMENT>
			<cfinclude template="host.cfm" />
		<cfelse>
			<cfinclude template="production_host.cfm" />
		</cfif>

	    <!---<!---setting coldfusion to work with UTC Time--->--->
		<cfset tzObj=createObject("java","java.util.TimeZone")>
		<cfset tz = tzObj.getTimeZone("GMT +0")>
        <cfset temp = tzObj.setDefault(tz)>

        <!---Time Zones Array--->
        <cfset application.TimeZone = createObject("component","timeZone")>
        <!---2 dimention array, pos x,1: ID, pos x,2: Formated ID, pos x,3: info--->
		<cfset application.availableTimeZones = application.TimeZone.getAvailableTZ()>

		<!--- Application current url value --->
		<cfset application.APPLICATION_CURRENT_URL = "">

		<!--- Default option for selects --->
		<cfset application.OPTION_VALUE_DEFAULT = -1>

		<cfset application.OPTION_VALUES[application.OPTION_VALUE_DEFAULT] = "Seleccione una opción">

		<!--- Default application currency --->
		<cfset application.CURRENCY = "$RD ">

		<!--- Applications errors --->
		<cfset application.APPLICATION_ERROR_UPDATE_CLIENT = 1>
		<cfset application.APPLICATION_ERROR_INVALID_METHOD_OPERATION = 78450>
		<cfset application.APPLICATION_ERROR_USER_NOT_FOUND = 12450>
		<cfset application.APPLICATION_ERROR_SESSION_HAS_EXPIRED = 14533>
		<cfset application.APPLICATION_ERROR_USER_ACCOUNT_INACTIVE = 9272>
		<cfset application.APPLICATION_ERROR_PASSWORD_INCORRECT = 56854>
		<cfset application.APPLICATION_ERROR_RECAPTCHA_ERROR = 54362>
		<cfset application.APPLICATION_ERROR_CAPTCHA_ERROR = 54363>
		<cfset application.APPLICATION_RECOVER_PASSWORD_EMPTY_EMAIL = 76342>
		<cfset application.APPLICATION_RECOVER_PASSWORD_EMAIL_WRONG_FORMAT = 78659>
		<cfset application.APPLICATION_RECOVER_PASSWORD_EMAIL_NOT_FOUND = 74532>
		<cfset application.APPLICATION_RECOVER_PASSWORD_EMAIL_INACTIVE = 79043>

		<cfset application.APPLICATION_ERRORS = structnew()>
		<cfset application.APPLICATION_ERRORS[application.APPLICATION_ERROR_UPDATE_CLIENT] = "Necesita actualizar la aplicación. Consulte con el administrador.">
		<cfset application.APPLICATION_ERRORS[application.APPLICATION_ERROR_INVALID_METHOD_OPERATION] = "No tiene permitido realizar esta operación.">
		<cfset application.APPLICATION_ERRORS[application.APPLICATION_ERROR_USER_NOT_FOUND] = "Usuario no existe en nuestra base de datos">
		<cfset application.APPLICATION_ERRORS[application.APPLICATION_ERROR_SESSION_HAS_EXPIRED] = "La sesión ha expirado. Porfavor inicie sesión nuevamente.">
		<cfset application.APPLICATION_ERRORS[application.APPLICATION_ERROR_USER_ACCOUNT_INACTIVE] = "El usuario está inactivo. Contacte al administrador del sistema para mas información.">
		<cfset application.APPLICATION_ERRORS[application.APPLICATION_ERROR_PASSWORD_INCORRECT] = "La contraseña introducida es incorrecta.">
		<cfset application.APPLICATION_ERRORS[application.APPLICATION_ERROR_RECAPTCHA_ERROR] = "No seleccionó correctamente el recaptcha. Intente de nuevo.">
		<cfset application.APPLICATION_ERRORS[application.APPLICATION_ERROR_CAPTCHA_ERROR] = "El código digitado no coincide con el código de la imagen mostrada. Intente de nuevo.">
		<cfset application.APPLICATION_ERRORS[application.APPLICATION_RECOVER_PASSWORD_EMPTY_EMAIL] = "No ha proporcionado un correo electrónico. Porfavor verifique de nuevo.">
		<cfset application.APPLICATION_ERRORS[application.APPLICATION_RECOVER_PASSWORD_EMAIL_WRONG_FORMAT] = "El correo proporcionado no tiene el formato correcto. Porfavor revise.">
		<cfset application.APPLICATION_ERRORS[application.APPLICATION_RECOVER_PASSWORD_EMAIL_NOT_FOUND] = "El correo proporcionado no está registrado en nuestro sistema. Porfavor revise.">
		<cfset application.APPLICATION_ERRORS[application.APPLICATION_RECOVER_PASSWORD_EMAIL_INACTIVE] = "El correo proporcionado pertenece a una cuenta que actualmente está inactiva. Contacte al administrador del sistema para mas información.">

		<!--- Applications messages --->
		<cfset application.APPLICATION_MESSAGE_PASSWORD_REQUESTED = 1>

		<cfset application.LATEST_LOG = structnew()>

		<!--- Paypal application Https codes --->
		<cfset application.PAYPAL_HTTP_CODE_200 = 200>
		<cfset application.PAYPAL_HTTP_CODE_201 = 201>
		<cfset application.PAYPAL_HTTP_CODE_202 = 202>
		<cfset application.PAYPAL_HTTP_CODE_204 = 204>

		<cfset application.PAYPAL_HTTP_CODES = structnew()>
		<cfset application.PAYPAL_HTTP_CODES[application.PAYPAL_HTTP_CODE_200] = "La petición fue exitosa.">
		<cfset application.PAYPAL_HTTP_CODES[application.PAYPAL_HTTP_CODE_201] = "La petición fue exitosa y el recurso fue creado.">
		<cfset application.PAYPAL_HTTP_CODES[application.PAYPAL_HTTP_CODE_202] = "La petición fue aceptada pero será ejecutada mas adelante.">
		<cfset application.PAYPAL_HTTP_CODES[application.PAYPAL_HTTP_CODE_204] = "La petición fue exitosa pero no trajo respuesta.">

		<cfset now = toUTCApplication(now())>

		<!--- Email configuration --->
		<cfset application.EMAIL_SERVER = "mail.lucee-guhex-com.vps.ezhostingserver.com">
		<cfset application.EMAIL_USERNAME = "info@elinetransportation.com">
		<cfset application.EMAIL_PASSWORD = "Dhgndjs&erufdgwe*2wdufHfgkdfu&43534tfdyuj">
		<cfset application.EMAIL_PORT = 587>

        <cfreturn true />
    </cffunction>

    <cffunction name="onSessionEnd" returntype="void" hint="This function handles the session ends">
    	<cfargument name="sessionScope">
    	<cfargument name="applicationScope">

    	<cfset structClear(sessionScope)>
    </cffunction>

    <cffunction name="onRequestStart" hint="This function calls itself on every request">
    	<cfargument name="targetPage" required="true">

    	<cfset setTimezone("America/Santo_Domingo")>
    	<cfset setLocale("spanish (dominican republic)")>

    	<cfreturn true>
    </cffunction>

    <cffunction name="toUTCApplication" access="private" output="no" returntype="date">
    	<cfargument displayname="nonUTCDate" name="nonUTCDate" hint="The date in the timezoned format" required="yes" type="date">
        <cfargument displayname="timezone" name="timezone" hint="Java timezone of the timezoned date." required="no" default="America/Santo_Domingo"  type="string">
    	<cfset var cal = "">
        <cfset var theDate = "">
    	<cfset var utc = "">
        <cfset var utcFormat = "">
        <cfset var other = "">
        <cfset var otherFormat = "">
        <cfset var zone = "">
    	<cfset nonUTCDate = DateFormat(nonUTCDate,"yyyy-mm-dd") & ' ' & TimeFormat(nonUTCDate,"HH:mm:ss.LLL")>
    	<cfobject type="Java" class="java.util.Calendar" name="cal">
    	<cfset theDate=cal.getInstance()>
        <cfobject type="Java" class="java.text.SimpleDateFormat" name="utc">
        <cfset utcFormat = utc.init("yyyy-MM-dd HH:mm:ss.SSS")>
        <cfobject type="Java" class="java.text.SimpleDateFormat" name="other">
        <cfset otherFormat = other.init("yyyy-MM-dd HH:mm:ss.SSS")>
        <cfobject type="Java" class="java.util.TimeZone" name="zone">
        <cfset utcFormat.setTimeZone(zone.getTimeZone("GMT+0"))>
        <cfset otherFormat.setTimeZone(zone.getTimeZone(timezone))>
        <cfset theDate.setTime(otherFormat.parse(nonUTCDate))>
        <cfreturn utcFormat.format(theDate.getTime())>
    </cffunction>
</cfcomponent>


