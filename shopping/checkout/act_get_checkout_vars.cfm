
<!--- CFWebstore, version 6.50 --->

<!--- This template runs the basket totals and initializes the shipping array --->

<!--- Calculates the total price, weight and items in the order and sets TotalShip using these according to the type of shipping used by the store. Called from shopping.checkout  --->

<cfparam name="refresh_vars" default="no">

<cfif NOT isDefined("Session.CheckoutVars") OR refresh_vars IS "yes">

	<cfset CheckoutVars = Application.objCheckout.getCheckoutVars(qry_get_basket, ShipSettings.ShipType, ShipSettings.UseDropShippers)>
		
	<cflock scope="SESSION" timeout="15" type="EXCLUSIVE">
		<cfset Session.CheckoutVars = CheckoutVars>
	</cflock>

</cfif>

<!--- <cfdump var="#Session.CheckoutVars#"> --->

<!--- Set return variables --->
<cfscript>
	TotalShip = Session.CheckoutVars.TotalShip;
	FreightCost = Session.CheckoutVars.FreightCost;
</cfscript>

