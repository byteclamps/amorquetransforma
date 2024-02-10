<cffunction name="printNavigationBar" output="true" returntype="void" returnformat="plain" hint="This function prints the navigation bar for the page">
	<cfargument name="links" type="string" required="true">
	<cfargument name="imagePath" type="string" required="false" default="images/background/4.jpg">

	<cfset links = listToArray(links, ",")>

	<cfif isImageFile(imagePath) eq false>
		<cfset imagePath = 'images/background/4.jpg'>
	</cfif>

	<cfoutput>
		<div class="inner-banner has-base-color-overlay text-center" style="background: url('#imagePath#'); background-repeat: no-repeat; background-position: center; background-size: cover;">
		    <div class="container">
		        <div class="box">
		            <h1>#links[arrayLen(links)]#</h1>
		        </div>
		    </div>
		</div>
		<div class="breadcumb-wrapper">
		    <div class="container">
		        <div class="pull-left">
		            <ul class="list-inline link-list">
		                <li>
		                    <a href="index.cfm">Inicio</a>
		                </li>

		                <cfloop from="1" to="#arrayLen(links)#" index="i">
		                	<cfif i eq arrayLen(links)>
		                		<li>#links[i]#</li>
		                	<cfelse>
		                		<li><a href="##">#links[i]#</a></li>
		                	</cfif>
		                </cfloop>
		            </ul>
		        </div>
		    </div>
		</div>
	</cfoutput>
</cffunction>