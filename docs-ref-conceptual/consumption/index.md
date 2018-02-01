---
ms.assetid:
ms.title: Azure Consumption REST APIs
ms.service: consumption
author: vkurpad
ms.author: vikurpad
ms.manager: raphaelc
service_description: To be added..
---


# Azure Consumption

The Azure Consumption APIs give you programmatic access to cost and usage data for your Azure resources. These APIs currently only support Enterprise Enrollments and Web Direct  Subscriptions (with a few exceptions). The APIs are continually updated to support other types of Azure subscriptions.

Azure Consumption APIs provide access to:
* Enterprise Customers Only
  * Price sheet
  * Budgets
* Enterprise and Web Direct Customers
  * Reservation Details
  * Reservation Summaries
  * Marketplace Charges
  * Usage Details

## List of Unsupported Subscription Types
* MS-AZR-0145P (CSP)
* MS-AZR-0146P (CSP)
* MS-AZR-159P (CSP)
* MS-AZR-0036P (sponsored)
* MS-AZR-0143P (sponsored)
* MS-AZR-0015P (internal)
* MS-AZR-0144P (DreamSpark)


## REST Operation Groups

| Operation Group | Description |
|-----------------|-------------|
| [Budgets](~/docs-ref-autogen/consumption/Budgets.yml) | Provides operations to set, update, and delete budgets at a Subscription or resource group scope. Supports cost and usage budgets.
  [Price Sheet](~/docs-ref-autogen/consumption/PriceSheet.yml) | For Enterprise Subscriptions, an API to get the current price sheet.
  [Marketplace Charges](~/docs-ref-autogen/consumption/Marketplaces.yml) | Provides operations to get usage information for marketplace resources on subscription.
  [Usage Details](~/docs-ref-autogen/consumption/UsageDetails.yml) | Provides operations to get usage information on subscription. |
  [Reservation Details](~/docs-ref-autogen/consumption/ReservationsDetails.yml) | Provides operations to get reservation detailed usage for Pay as you go and Enterprise Subscriptions. |
  [Reservation Summaries](~/docs-ref-autogen/consumption/ReservationsSummaries.yml) | Provides operations to get reservation summary usage for Pay as you go and Enterprise Subscriptions. |


## Working with billing periods and date ranges
[Usage Details](~/docs-ref-autogen/consumption/UsageDetails.yml) and [Marketplace Charges](~/docs-ref-autogen/consumption/Marketplaces.yml) accept billing period or date ranges for defining the start and end dates for the usage data.
Here is the API behavior

| Billing period present in request | Start date present in request | End date present in request | API behavior |
|-----------------------------------|-------------------------------|-----------------------------|----------------------------|
| no | no | no | Data for current billing period is returned in response |
| no | yes | no | Data for current billing period is returned in response |
| no | no | yes | Data for current billing period is returned in response |
| no | yes | yes | Data for specified Start and End Date is returned response |
| yes | no | no | Data for specified billing period is returned in response |
| yes | yes | no | Data for specified billing period is returned in response |
| yes | no | yes | Data for specified billing period is returned in response |
| yes | yes | yes | Data for specified Start and End Date is returned response, supplied billing period is ignored |

### Getting list of billing periods
For providing a valid billing period in request, client should first get a list of available billing periods by subscription, using following API
       ` https://management.azure.com/subscriptions/{subscriptionId}/providers/Microsoft.Billing/billingPeriods?api-version=2017-04-24-preview.`
Using this list, client can pick a specific billing period to get consumption data.



## See also

For more information about using this API in one of the language-specific SDKs, visit the following

[Azure Consumption Python SDK](/python/api/overview/azure/consumption?view=azure-python)

[Azure Consumption CLI](/cli/azure/consumption?view=azure-cli-latest)

[Azure Consumption .NET SDK](/dotnet/api/overview/azure/consumption/management?view=azure-dotnet)

[Azure Consumption NodeJS SDK](/javascript/api/overview/azure/consumption?view=azure-node-2.2.0)

[Azure Consumption Ruby SDK](https://rubygems.org/gems/azure_mgmt_consumption)
