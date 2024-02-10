<cfset returnData = structnew()>
<cfset returnData.ERROR = false>

<cfif full_name eq ''>
	<cfset returnData.ERROR = true>
	<cfset returnData.ERROR_MESSAGE = "Necesitas proporcionar tu nombre completo.">
	<cfoutput>#serializeJSON(returnData)#</cfoutput>
</cfif>

<cfif email eq ''>
	<cfset returnData.ERROR = true>
	<cfset returnData.ERROR_MESSAGE = "Necesitas proporcionar tu correo electrónico.">
	<cfoutput>#serializeJSON(returnData)#</cfoutput>
</cfif>

<cfif isValid("email", email) eq false>
	<cfset returnData.ERROR = true>
	<cfset returnData.ERROR_MESSAGE = "El correo electrónico proporcionado no es válido.">
	<cfoutput>#serializeJSON(returnData)#</cfoutput>
</cfif>

<cfif phone eq ''>
	<cfset returnData.ERROR = true>
	<cfset returnData.ERROR_MESSAGE = "Necesitas proporcionar tu número telefónico.">
	<cfoutput>#serializeJSON(returnData)#</cfoutput>
</cfif>

<cfif subject eq ''>
	<cfset returnData.ERROR = true>
	<cfset returnData.ERROR_MESSAGE = "Necesitas proporcionar un tema.">
	<cfoutput>#serializeJSON(returnData)#</cfoutput>
</cfif>

<cfif content_message eq ''>
	<cfset returnData.ERROR = true>
	<cfset returnData.ERROR_MESSAGE = "Necesitas proporcionar el mensaje para enviar.">
	<cfoutput>#serializeJSON(returnData)#</cfoutput>
</cfif>

<cfif returnData.ERROR eq false>
	<cfmail
		from="#email#"
		subject="#subject#"
		to="amorquetransforma@hotmail.com"
		username="#application.EMAIL_USERNAME#"
		password="#application.EMAIL_PASSWORD#"
		port="#application.EMAIL_PORT#"
		server="#application.EMAIL_SERVER#"
		type="html">

		<cfoutput>
			Tema de prueba
		</cfoutput>
	</cfmail>

	<cfset returnData.MESSAGE = "Se ha enviado un correo hacia el equipo de la fundación amor que transforma. En breve será atendido.">
	<cfoutput>#serializeJSON(returnData)#</cfoutput>
</cfif>
