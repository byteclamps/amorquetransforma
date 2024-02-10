<cfcomponent displayname="timezone" hint="various timezone functions not included in mx: version 2.1 jul-2005 Paul Hastings (paul@sustainbleGIS.com)" output="No">
<!--- lets try a default INIT method --->
<cfset init()>

<cffunction name="init" output="No" access="public">
	<cfset variables.tzObj=createObject("java","java.util.TimeZone")>
	<cfset variables.tzList = arrayToList(tzObj.getAvailableIDs())>
</cffunction>


<!--- returns a list of timezones available on this server --->
<!---Modify by Oscar Despradel--->
<cffunction name="getAvailableTZ" output="No" returntype="array" access="public">  
	<cfset availableTimeZonesUnformatted = listToArray(variables.tzList)>
	<cfset sortTimeZones = arraysort(availableTimeZonesUnformatted, "text")>
        
	<cfset availableTimeZones = arraynew(2)>
    <cfset index = 0>
    <cfloop index="i" from="1" to="#arrayLen(availableTimeZonesUnformatted)#"> 
        <cfif Find("SystemV", availableTimeZonesUnformatted[i]) eq 0 and Find("Etc", availableTimeZonesUnformatted[i]) eq 0 and Len(availableTimeZonesUnformatted[i]) gt 4>
            <cftry>
        	    <cfset index = index +1>
        	    <cfset availableTimeZones[index][1] = availableTimeZonesUnformatted[i]>
        	    <cfset availableTimeZones[index][2] = formatID(availableTimeZonesUnformatted[i])>
        		<cfset availableTimeZones[index][3] = getLocaleInfo(availableTimeZonesUnformatted[i])>
        	    <cfset availableTimeZones[index][4] = getTZOffset(now(), availableTimeZonesUnformatted[i])>
        	<cfcatch></cfcatch>
            </cftry>
        </cfif>
    </cfloop>   
	<cfreturn availableTimeZones>
</cffunction>

<!---returns the info of a given locale ID--->
<!---Added by Oscar Despradel--->
<cffunction name="getLocaleInfo" output="No" access="public" returntype="string">  
	<cfargument name="thisTZ" default="#tzObj.getDefault().ID#">
    <cfset tz = tzObj.getTimeZone(thisTZ).getDisplayName(true,tzObj.LONG) & ', ' & getRawOffset(thisTZ) & ', DST: ' & usesDST(thisTZ)>
    <cfreturn tz>
</cffunction>

<!---returns a more user friendly version of the locale ID--->
<!---Added by Oscar Despradel--->
<cffunction name="formatID" output="No" access="public" returntype="string">  
	<cfargument name="thisTZ" default="#tzObj.getDefault().ID#">
	<cfreturn Replace(Replace(Replace(thisTZ,"/", ", ", "all"), "_", " ", "all"), "-", " ", "all")>
</cffunction>


<!--- returns a list of timezones available on this server for a given raw offset--->
<cffunction name="getTZByOffset" output="No" returntype="array" access="public">  
	<cfargument name="thisOffset" required="Yes" type="numeric">
	<cfscript>
		var rawOffset=javacast("long",arguments.thisOffset * 3600000);
		var tzList = tzObj.getAvailableIDs(rawOffset);
		return tzList;
	</cfscript>
</cffunction>

<!--- determines if a given timezone uses DST --->
<cffunction name="usesDST" output="No" returntype="boolean" access="public">
	<cfargument name="tz" required="no" default="#tzObj.getDefault().ID#">
	<cfscript>
		return tzObj.getTimeZone(arguments.tz).useDaylightTime();
	</cfscript>
</cffunction>

<!--- returns rawoffset in hours --->
<cffunction name="getRawOffset" output="No" access="public" returntype="numeric">  
	<cfargument name="tZ" required="no" default="#tzObj.getDefault().ID#">
	<cfscript>
		var thisTZ=tzObj.getTimeZone(arguments.tZ);
		return thisTZ.getRawOffset()/3600000;
	</cfscript>
</cffunction>

<!--- returns offset in hours --->
<cffunction name="getTZOffset" output="No" access="public" returntype="numeric">  
	<cfargument name="thisDate" required="no" type="date" default="#now()#">
	<cfargument name="thisTZ" required="no" default="#tzObj.getDefault().ID#">
	<cfscript>
		var timezone=tzObj.getTimeZone(arguments.thisTZ);
		var tYear=javacast("int",Year(arguments.thisDate));
		var tMonth=javacast("int",month(arguments.thisDate)-1); //java months are 0 based
		var tDay=javacast("int",Day(thisDate));
		var tDOW=javacast("int",DayOfWeek(thisDate));	//day of week
		return timezone.getOffset(1,tYear,tMonth,tDay,tDOW,0)/3600000;
</cfscript>
</cffunction>
</cfcomponent>
