---
title: Azure Billing Enterprise APIs - Reserved Instance Recommendation
description: Get Reserved Instance purchase recommendation based on past usage.
author: bandersmsft
ms.reviewer: prkumar
tags: billing
ms.service: cost-management-billing
ms.subservice: enterprise
ms.topic: article
ms.date: 09/15/2021
ms.author: banders

---
# Reserved instance purchase recommendation APIs for enterprise customers

> [!NOTE]
> Microsoft is retiring the Azure Enterprise Reporting APIs. EA customers - please move to the Cost Management APIs. 
> To learn more, see [Migrate from Azure Enterprise Reporting to Microsoft Cost Management APIs overview](/azure/cost-management-billing/automate/migrate-ea-reporting-arm-apis-overview).

The Reserved Instance recommendations API looks at Customer's 7, 30 or 60 days virtual machine usage and offers Single and Shared Purchase recommendations.


## Request for shared reserved instance recommendations

See the [Overview of Reporting APIs for Enterprise customers](/azure/billing/billing-enterprise-api) article to learn about common required header properties.

|Method | Request URI|
|-|-|
|GET| https://consumption.azure.com/v2/enrollments/{enrollmentNumber}/SharedReservationRecommendations?lookBackPeriod=7

## Shared recommendations response

```json
[{
    "lookBackPeriod": "Last7Days",
    "meterId": "2e3c2132-1398-43d2-ad45-1d77f6574933",
    "skuName": "Standard_DS1_v2",
    "term": "P1Y",
    "region": "westus",
    "costWithNoRI": 186.27634908960002,
    "recommendedQuantity": 9,
    "totalCostWithRI": 143.12931642978083,
    "netSavings": 43.147032659819189,
    "firstUsageDate": "2018-02-19T00:00:00"
}
]
```

**Response property definitions**

|Property Name| Type| Description|
|-|-|-|
|lookBackPeriod|string|String representing number of past usage days. It can either last7days, last30days or last60days|
|meterId|string |The Meter ID of the resource that should be purchased|
|skuName|string |This is the Azure Resource Manager SKU that needs to be purchased|
|term|string| P1Y for 1 year and P3Y for 3 years|
|region|string| Region where Reserved instance should be purchased|
|costWithNoRI|string| Total current cost|
|recommendedQuantity|decimal| Total Reserved Instance Quantity that should be purchased|
|totalCostWithRI|decimal| Total Cost if Recommended Quantity was purchased|
|netSavings|decimal| Net Savings within 7, 30 or 60 days|
|firstUsageDate|decimal| First time the Recommended VM was run.|



## Request for single reserved instance recommendations
See the [Overview of Reporting APIs for Enterprise customers](/azure/billing/billing-enterprise-api) article to learn about common required header properties.

|Method | Request URI|
|-|-|
|GET| https://consumption.azure.com/v2/enrollments/{enrollmentNumber}/SingleReservationRecommendations?lookBackPeriod=7

## Single recommendation response

```json
[{
    "subscriptionId": "d143f4db-5a12-46b9-ba15-9bff298b8f45",
    "lookBackPeriod": "Last7Days",
    "meterId": "2e3c2132-1398-43d2-ad45-1d77f6574933",
    "skuName": "Standard_DS1_v2",
    "term": "P1Y",
    "region": "westus",
    "costWithNoRI": 186.27634908960002,
    "recommendedQuantity": 9,
    "totalCostWithRI": 143.12931642978083,
    "netSavings": 43.147032659819189,
    "firstUsageDate": "2018-02-19T00:00:00"
}
]
```

**Response property definitions**

|Property Name| Type| Description|
|-|-|-|
|subscriptionId|string|SubscriptionId for which Reserved Instance should be purchased|
|lookBackPeriod|string|String representing number of past usage days. It can have last7days, last30days, or last60days|
|meterId|string |The Meter ID of the resource that should be purchased|
|skuName|string |This is the Azure Resource Manager SKU that needs to be purchased|
|term|string| P1Y for 1 year and P3Y for 3 years|
|region|string| Region where Reserved instance should be purchased|
|costWithNoRI|string| Total current cost|
|recommendedQuantity|decimal| Total Reserved Instance Quantity that should be purchased|
|totalCostWithRI|decimal| Total Cost if Recommended Quantity was purchased|
|netSavings|decimal| Net Savings within 7, 30 or 60 days|
|firstUsageDate|decimal| First time the Recommended VM was run.|


<br/>

## See also

* [Purchase Reserved Instance](/azure/virtual-machines/windows/prepay-reserved-vm-instances)
* [Billing Periods API](billing-enterprise-api-billing-periods.md)
* [Usage Detail API](billing-enterprise-api-usage-detail.md)
* [Marketplace Store Charge API](billing-enterprise-api-marketplace-storecharge.md)
* [Price Sheet API](billing-enterprise-api-pricesheet.md)
