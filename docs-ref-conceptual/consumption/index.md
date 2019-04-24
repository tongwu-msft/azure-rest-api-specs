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
  * Forecasts
  * Balances
  * Tags
  * Cost Tags
* Enterprise and Web Direct Customers
  * Reservation Details
  * Reservation Summaries
  * Marketplace Charges
  * Usage Details
  * Reservation Recommendations

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
| [Budgets](xref:management.azure.com.consumption.budgets) | Provides operations to set, update, and delete budgets at a Subscription or resource group scope. Supports cost and usage budgets.
  [Price Sheet](xref:management.azure.com.consumption.pricesheet) | Provides operations to get price sheet for Enterprise Subscriptions and Billing accounts.
  [Marketplace Charges](xref:management.azure.com.consumption.marketplaces) | Provides operations to get usage information for marketplace resources on subscription or Enterprise Billing accounts.
  [Usage Details](xref:management.azure.com.consumption.usagedetails) | Provides operations to get usage information on subscription or Enterprise Billing accounts. |
  [Reservation Details](xref:management.azure.com.consumption.reservationsdetails) | Provides operations to get reservation detailed usage for Pay as you go and Enterprise Subscriptions. |
  [Reservation Summaries](xref:management.azure.com.consumption.reservationssummaries) | Provides operations to get reservation summary usage for Pay as you go and Enterprise Subscriptions. |
  [Reservation Recommendations](xref:management.azure.com.consumption.reservationrecommendations) | Provides operations to get reservation recommendations for Pay as you go and Enterprise Subscriptions. |
  [Forecasts](xref:management.azure.com.consumption.forecasts) | Provides operations to get usage forecasts for Enterprise Subscriptions. |
  [Balances](xref:management.azure.com.consumption.getbalancesbybillingaccount) | Provides operations to get balances and summaries for Enterprise Billing Accounts. |
  [Tags](xref:management.azure.com.consumption.tags) | Provides operations to get tags info for Enterprise Subscriptions. |
  [Cost Tags](xref:management.azure.com.consumption.costtags) | Provides operations for reading and writing cost tags for Enterprise Subscriptions. |

## Working with billing periods and date ranges
[Usage Details](xref:management.azure.com.consumption.usagedetails) and [Marketplace Charges](xref:management.azure.com.consumption.marketplaces) accept billing period or date ranges for defining the start and end dates for the usage data.

Here is the API behavior based on billing periods and date ranges in request.

| Billing period present in request | Start date present in request | End date present in request | API behavior |
|-----------------------------------|-------------------------------|-----------------------------|----------------------------|
| no | no | no | Data for current billing period is returned in response |
| no | yes | no | Data for current billing period is returned in response |
| no | no | yes | Data for current billing period is returned in response |
| no | yes | yes | Data for specified Start and End Date is returned in response |
| yes | no | no | Data for specified billing period is returned in response |
| yes | yes | no | Data for specified billing period is returned in response |
| yes | no | yes | Data for specified billing period is returned in response |
| yes | yes | yes | Data for specified Start and End Date is returned in response, supplied billing period is ignored |

Maximum allowed date range is 12 months in one request and data is available from May 1, 2014 or later.

### Getting list of billing periods
For providing a valid billing period in request, client should first get a list of available billing periods by subscription, using following API

       GET https://management.azure.com/subscriptions/{subscriptionId}/providers/Microsoft.Billing/billingPeriods?api-version=2017-04-24-preview

Using this list, client can pick a specific billing period to get consumption data.

## Late Arriving Data

To accommodate third party services that have delays in reporting usage, the reported the usage date  (usage report date) is set to the time at which the usage data was sent as opposed to when the actual usage took place (that is, consumption time).

 As a result, the usage will be rated for and applied to the reported time. In order to represent the actual consumption time, the *properties.AdditionalProperties* field will now contain two additional properties *ConsumptionBeginTime* and *ConsumptionEndTime*  that correspond to the actual consumption time window.

These changes will result in a few scenarios that will need to be addressed when calling the usage details API:

 1. **Month End Reporting**: For usage that occurred during a month but reported during the next month, customers will need to look at the *additionalProperties* field to allocate the usage to the appropriate month if needed.

 2. **Query Usage details**: When querying the usage details API by a date range, the query only applies to usage report date and not the consumption time in the *additionalProperties* field. For customers looking to map usage details to invoices, this update does not affect the process as the invoice will process the usage based on the usage report date. For customers looking to map usage details to a specific calendar date/month, this update is a breaking change and for these scenarios the usage report date cannot be used  and the date that the usage occurred (that is, the consumption date) in the *additionalProperties* section must be used.

    

Sample Call for Additional Details:

       GET https://management.azure.com/subscriptions/{subscriptionId}/providers/Microsoft.Consumption/usageDetails?api-version=2018-03-31&$expand=properties/additionalProperties

Sample Response snippet:

        "properties":{
            "billingPeriodId":"/subscriptions/{subscriptionid}/providers/Microsoft.Billing/billingPeriods/20180501",
            "usageStart":"2018-05-01T00:00:00.0000000Z",
            "usageEnd":"2018-05-01T23:59:59.0000000Z
            instanceId":"/subscriptions/{subscriptionid}/resourceGroups/{resourcegroup}/providers/Microsoft.Cdn/profiles/{profile}",
            "instanceName":"{id}",
            "instanceLocation":"SouthCentralUS",
            "meterId":"6b88ada0-cbc0-4874-be0e-23004f8b4de7",
            "usageQuantity":0.002065,
            "pretaxCost":0,
            "currency":"USD",
            "additionalProperties":"{
                \"Provider\": \"1\",
                \"ConsumptionBeginTime\": \"2018-05-01T19:00:00\",
                \"ConsumptionEndTime\": \"2018-05-01T20:00:00\"
                }",



## See also

For more information about using this API in one of the language-specific SDKs, visit the following

[Azure Consumption Python SDK](/python/api/overview/azure/consumption?view=azure-python)

[Azure Consumption CLI](/cli/azure/consumption?view=azure-cli-latest)

[Azure Consumption .NET SDK](/dotnet/api/overview/azure/consumption/management?view=azure-dotnet)

[Azure Consumption NodeJS SDK](/javascript/api/overview/azure/consumption?view=azure-node-2.2.0)

[Azure Consumption Ruby SDK](https://rubygems.org/gems/azure_mgmt_consumption)
