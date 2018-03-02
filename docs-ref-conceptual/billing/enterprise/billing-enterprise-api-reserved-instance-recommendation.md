---
title: Azure Billing Enterprise APIs - Reserved Instance Recommendation| Microsoft Docs
description: Get Reserved Instance purchase recommendation based on past usage.
services: ''
documentationcenter: ''
author: manshuk
manager: manshuk
editor: ''
tags: billing

ms.assetid: 3e817b43-0696-400c-a02e-47b7817f9b77
ms.service: billing
ms.devlang: na
ms.topic: article
ms.tgt_pltfrm: na
ms.workload: billing
ms.date: 02/27/2018
ms.author: manshuk

---
# Reserved instance purchase recommendation APIs for enterprise customers

The Reserved Instance recommendations API looks at Customer's 7, 30 or 60 days virtual machine usage and offers Single and Shared Purchase recommendations.


## Request for shared reserved instance recommendations
Common header properties that need to be added are specified [here](https://docs.microsoft.com/azure/billing/billing-enterprise-api). 

|Method | Request URI|
|-|-|
|GET| https://consumption.azure.com/v2/enrollments/{enrollmentNumber}/SharedReservationRecommendations?lookBackPeriod=7

## Response
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

|Property Name| Type| Description
|-|-|-|
|lookBackPeriod|string|String representing number of past usage days. It can either last7days, last30days or last60days|
|meterId|string |The Meterid of the resource that should be purchased|
|skuName|string |This is the Azure Resource Manager SKU that needs to be purchased|
|term|string| P1Y for 1 year and P3Y for 3 years|
|region|string| Region where Reserved instance should be purchased|
|costWithNoRI|string| Total current cost|
|recommendedQuantity|decimal| Total Reserved Instance Quantity that should be purchased|
|totalCostWithRI|decimal| Total Cost if Recommended Quantity was purchased|
|netSavings|decimal| Net Savings within 7, 30 or 60 days|
|firstUsageDate|decimal| First time the Recommended VM was run.|



## Request for single reserved instance recommendations
Common header properties that need to be added are specified [here](https://docs.microsoft.com/azure/billing/billing-enterprise-api). 

|Method | Request URI|
|-|-|
|GET| https://consumption.azure.com/v2/enrollments/{enrollmentNumber}/SingleReservationRecommendations?lookBackPeriod=7

## Response

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

|Property Name| Type| Description
|-|-|-|
|subscriptionId|string|SubscriptionId for which Reserved Instance should be purchased|
|lookBackPeriod|string|String representing number of past usage days. It can either last7days, last30days or last60days|
|meterId|string |The Meterid of the resource that should be purchased|
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

* [Purchase Reserved Instance](https://docs.microsoft.com/en-us/azure/virtual-machines/windows/prepay-reserved-vm-instances)

* [Billing Periods API](billing-enterprise-api-billing-periods.md)

* [Usage Detail API](billing-enterprise-api-usage-detail.md) 

* [Marketplace Store Charge API](billing-enterprise-api-marketplace-storecharge.md) 

* [Price Sheet API](billing-enterprise-api-pricesheet.md)