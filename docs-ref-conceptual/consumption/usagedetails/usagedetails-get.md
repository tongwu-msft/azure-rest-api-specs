---
title: "Get usage details for provided scope"
author: vkurpad
ms.date: 2017-11-21
ms.prod: azure
ms.service: consumption
ms.topic: reference
ms.assetid:
ms.author: vikurpad
manager: rapahelc
---

# Get usage detail information for a provided scope (Subscription, Resource Group)    
    
## Request    
 
For information about getting started with Azure REST operations including request authentication, see [Azure REST API Reference](../../../index.md).    
    
| Method | Request URI |    
|------------|-----------------|    
| GET | `https://management.azure.com/{scope}/providers/Microsoft.Consumption/usageDetails` |    
    
| Parameter | Description |
| --------- | ----------- |
| scope | Scope is the aggregation node the request is being rolled up to. Scope can take multiple values like  /subscriptions/{subscriptionId} or /subscriptions/{subscriptionId}/providers/Microsoft.Billing/billingPeriods/{billingPeriodName} for billing periods|
| subscriptionId | The identifier of your subscription where the availability set is located. |
| resourceGroup | The name of the resource group that contains the availability set. |
| billingPeriodName | The name of the billing period. |
| $expand | Value used to expand the properties/additionalProperties or properties/meterDetails |
| $filter | OData Filter criteria to limit data returned |
| $skiptoken | Pagination. If the previous operation returned a partial result, the nextlink element will contain a skiptoken  |
| $top | Value used to expand the properties/additionalProperties or properties/meterDetails |

     
    
## Response    
    
Status code: If successful, the operation returns 200 (OK); otherwise 404 (Not Found) is returned.    
    
```    
{
"id": "/subscriptions/subid/providers/Microsoft.Consumption/usageDetails/usageDetailsId1",
"name": "usageDetailsId1",
"type": "Microsoft.Consumption/usageDetails",
"tags": {
    "env": "newdep",
    "dev": "tools"
},
"properties": {
    "billingPeriodId": "/subscriptions/subid/providers/Microsoft.Billing/billingPeriods/201702",
    "invoiceId": "/subscriptions/subid/providers/Microsoft.Billing/invoices/201703-123456789",
    "usageStart": "2017-02-13T00:00:00Z",
    "usageEnd": "2017-02-13T23:59:59Z",
    "instanceName": "shared1",
    "instanceId": "/subscriptions/subid/resourceGroups/Default-Web-eastasia/providers/Microsoft.Web/sites/shared1",
    "instanceLocation": "eastasia",
    "currency": "USD",
    "usageQuantity": 0.00328,
    "billableQuantity": 0.00328,
    "pretaxCost": 0.67,
    "isEstimated": false,
    "meterId": "fe167397-a38d-43c3-9bb3-8e2907e56a41"
}
}
    
```    
    
| Element name | Description |    
|--------------|-------------|    
| UsageDetailProperties.billingPeriodId  | The id of the billing period resource that the usage belongs to.|    
| UsageDetailProperties.invoiceId | The id of the invoice resource that the usage belongs to. |    
| UsageDetailProperties.usageStart | The start of the date time range covered by the usage detail. |    
| UsageDetailProperties.usageEnd | "The end of the date time range covered by the usage detail. |
| UsageDetailProperties.instanceName | The name of the resource instance that the usage is about. |
| UsageDetailProperties.instanceId | The uri of the resource instance that the usage is about. |    
| UsageDetailProperties.instanceLocation | The location of the resource instance that the usage is about. |    
| UsageDetailProperties.currency | The ISO currency in which the meter is charged, for example, USD. |    
| UsageDetailProperties.usageQuantity | The quantity of usage. |
| UsageDetailProperties.billableQuantity | The quantity of usage. |
| UsageDetailProperties.pretaxCost | The amount of cost before tax. |
| UsageDetailProperties.isEstimated | The estimated usage is subject to change. |
| UsageDetailProperties.meterId | The meter id. |
| UsageDetailProperties.meterDetails | The details about the meter. By default this is not populated, unless it's specified in $expand. |
