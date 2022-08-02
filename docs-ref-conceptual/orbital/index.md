# Azure Orbital Earth Observation REST API
Azure Orbital Earth Observation allows you to schedule contacts with spacecrafts on a pay-as-you-go basis to ingest data from the spacecraft, monitor the spacecraft health and status, or transmit commands to the spacecraft. Incoming data is delivered to your private virtual network allowing it to be processed or stored in Azure.

Once [onboarding](https://docs.microsoft.com/en-us/azure/orbital/orbital-preview) is completed, the Azure Orbital Earth Observation REST API's will enable you to create, delete, manage, and list ground stations, [spacecrafts](https://docs.microsoft.com/en-us/azure/orbital/register-spacecraft), [contact profiles](https://docs.microsoft.com/en-us/azure/orbital/contact-profile), and [contacts](https://docs.microsoft.com/en-us/azure/orbital/schedule-contact).

The following information is common to all tasks that you might do using these REST APIs:  
-   Use the URI `https://management.azure.com/`.
-   Replace `{api-version}` with `2022-03-01`.
-   Replace `{subscriptionId}` with your subscription identifier in the URI. This value is a GUID unique to your subscription, such as `c1be1141-a7c9-4aac-9608-3c2e2f1152c3`.  Locate the subscription ID using the [Azure portal subscriptions blade](https://portal.azure.com/#blade/Microsoft_Azure_Billing/SubscriptionsBlade).
-   Replace `{resourceGroupName}` with the resource group. For more information, see [Using Resource groups to manage your Azure resources](https://azure.microsoft.com/documentation/articles/azure-preview-portal-using-resource-groups/).  
-   Set the Content-Type header to `application/json`.
-   Set the Authorization header to a JSON Web Token that you obtain from Azure Active Directory. For more information, see [Authenticating Azure Resource Manager requests](https://msdn.microsoft.com/library/azure/dn790557.aspx).


The general flow is as follows:
- Create your spacecraft in a supported region such as `westus2` and go through the authorization process defined in the onboarding steps.
- Create a contact profile in the same region as the spacecraft.
   - The contact profile references a subnet ARM resource ID [delegated](https://docs.microsoft.com/en-us/azure/virtual-network/manage-subnet-delegation) to the `Microsoft.Orbital/orbitalGateways` in the same Azure Virtual Network as the contact profile endpoint IP addresses. The subnet delegated to Orbital must be at least a class C subnet, and not have IP addresses attached to any resource.
   - Optionally, an Event Hub can be provided in the contact profile to receive telemetry during the pass. The *"Azure Orbital Resource Provider"* must be [granted](https://docs.microsoft.com/en-us/azure/event-hubs/authorize-access-azure-active-directory) the *"Azure Event Hubs Data Sender"* role.
- List the available contacts with the spacecraft from an authorized ground station.
- Create a contact in a time window where the spacecraft is visible from a given ground station.
- Receive the data in the endpoints provided in the contact profile.

You can find more information on the [Azure Orbital](https://azure.microsoft.com/en-us/services/orbital/) page.
