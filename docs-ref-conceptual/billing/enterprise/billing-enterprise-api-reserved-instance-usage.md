---
title: Azure Billing Enterprise APIs - Reserved Instance Usage| Microsoft Docs
description: Get Reserved Instance usage.
services: 'billing'
documentationcenter: ''
author: manish-shukla01
manager: manshuk
editor: ''
tags: billing

ms.service: billing
ms.devlang: na
ms.topic: article
ms.tgt_pltfrm: na
ms.workload: billing
ms.date: 05/18/2018
ms.author: manshuk

---
# Get Reserved Instance usage for enterprise customers

The Reserved Instance usage api returns the usage of the Reserved Instance purchases within an enrollment. If there are more than one Reserved Instances in an enrollment, you can get the usage of all the Reserved Instance purchases using this api.


## Request for  Reserved Instance usage details
Common header properties that need to be added are specified [here](https://docs.microsoft.com/azure/billing/billing-enterprise-api). 

|Method | Request URI|
|-|-|
|GET| https://consumption.azure.com/v2/enrollments/{enrollmentNumber}/reservationdetails?startDate={yyyy-mm-dd}&endDate={yyyy-mm-dd}


## Response
```json
[{
	"reservationOrderId": "00000000-0000-0000-0000-000000000000",
	"reservationId": "00000000-0000-0000-0000-000000000000",
	"usageDate": "2018-02-01T00:00:00",
	"skuName": "Standard_F2s",
	"instanceId": "/subscriptions/00000000-0000-0000-0000-000000000000/resourcegroups/resourvegroup1/providers/microsoft.compute/virtualmachines/VM1",
	"totalReservedQuantity": 18.000000000000000,
	"reservedHours": 432.000000000000000,
	"usedHours": 400.000000000000000
}
```
**Response property definitions**

|Property Name| Type| Description
|-|-|-|
|reservationOrderId|string|The reservation order ID is the identifier for a reservation purchase. Each reservation order ID represents a single purchase transaction. A reservation order contains reservations. The reservation order specifies the VM size and region for the reservations.|
|reservationId|string |The reservation ID is the identifier of a reservation within a reservation order. Each reservation is the grouping for applying the benefit scope and also specifies the number of instances to which the reservation benefit can be applied to.|
|usageDate|string |The date on which consumption occurred.|
|skuName|string| This is the Azure Resource Manager Sku name. It can be used to join with the servicetype field in additionalInfo in usage records.|
|instanceId|string| This identifier is the name of the resource or the fully qualified Resource ID.|
|totalReservedQuantity|string| This is the total count of instances that are reserved for the reservationid.|
|reservedHours|decimal| This is the total hours reserved for the day. For example, if reservation for 1 instance was made on 1 PM, reserved hours will be 11 hours for first day and 24 hours for subsequent days.|
|usedHours|decimal| This is the total hours used by the instance.|


<br/>
## Request for  Reserved Instance usage summary
Common header properties that need to be added are specified [here](https://docs.microsoft.com/azure/billing/billing-enterprise-api). This api supports reservation utilization for daily and monthly grain. Startdate and EndDate parameters are not required for monthly data.

|Method | Request URI|
|-|-|
|GET| https://consumption.azure.com/v2/enrollments/{enrollmentNumber}/reservationsummaries?grain=daily&startdate={yyyy-mm-dd}&enddate={yyyy-mm-dd}


## Response
```json
[
	 {
        "reservationOrderId": "00000000-0000-0000-0000-000000000000",
        "reservationId": "00000000-0000-0000-0000-000000000000",
        "skuName": "Standard_F1s",
        "reservedHours": 24,
        "usageDate": "2018-05-01T00:00:00",
        "usedHours": 23,
        "minUtilizationPercentage": 0,
        "avgUtilizationPercentage": 95.83,
        "maxUtilizationPercentage": 100
    }
]
	
```
**Response property definitions**

|Property Name| Type| Description
|-|-|-|
|reservationOrderId|string|The reservation order ID is the identifier for a reservation purchase. Each reservation order ID represents a single purchase transaction. A reservation order contains reservations. The reservation order specifies the VM size and region for the reservations.|
|reservationId|string |The reservation ID is the identifier of a reservation within a reservation order. Each reservation is the grouping for applying the benefit scope and also specifies the number of instances to which the reservation benefit can be applied to.|
|usageDate|string |The date on which consumption occurred.|
|skuName|string| String representing the purchased resource.|
|reservedHours|decimal| This is the total hours reserved for the day. For example, if reservation for 1 instance was made on 1 PM, reserved hours will be 11 hours for first day and 24 hours for subsequent days.|
|usedHours|decimal| This is the total hours used by the instance.|
|minUtilizationPercentage|double|This is the minimum utilization percentage on a given day. If you purchase one reservation and have 1 VM running for 23 hours, this will be 0.
|avgUtilizationPercentage|double|This is the Average utilization percentage on a given day. If you purchase one reservation and have 1 VM running for 23 hours, this will be 23/24.
|MaxUtilizationPercentage|double|This is the maximum utilization percentage on a given day. If you purchase one reservation and have 1 VM running for 23 hours, this field will be 1.
<br/>
## See also

* [Purchase Reserved Instance](https://docs.microsoft.com/en-us/azure/virtual-machines/windows/prepay-reserved-vm-instances)

* [Billing Periods API](billing-enterprise-api-billing-periods.md)

* [Usage Detail API](billing-enterprise-api-usage-detail.md) 

* [Marketplace Store Charge API](billing-enterprise-api-marketplace-storecharge.md) 

* [Price Sheet API](billing-enterprise-api-pricesheet.md)

* [Reserved Instance Recommendation API](billing-enterprise-api-reserved-instance-recommendation.md)

* [Reserved Instance Charges API](billing-enterprise-api-reserved-instance-charges.md)