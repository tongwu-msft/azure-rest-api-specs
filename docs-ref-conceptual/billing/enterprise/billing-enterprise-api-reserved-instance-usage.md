---
title: Azure Billing Enterprise APIs - Reserved Instance Usage
description: Get Reserved Instance usage.
author: bandersmsft
ms.reviewer: prkumar
tags: billing
ms.service: cost-management-billing
ms.subservice: enterprise
ms.topic: article
ms.date: 09/15/2021
ms.author: banders

---
# Get Reserved Instance usage for enterprise customers

> [!NOTE]
> Microsoft is retiring the Azure Enterprise Reporting APIs. EA customers - please move to the Cost Management APIs. 
> To learn more, see [Migrate from Azure Enterprise Reporting to Microsoft Cost Management APIs overview](/azure/cost-management-billing/automate/migrate-ea-reporting-arm-apis-overview).

The Reserved Instance usage API returns the usage of the Reserved Instance purchases within an enrollment. If there are more than one Reserved Instances in an enrollment, you can get the usage of all the Reserved Instance purchases using this API.


## Request for Reserved Instance usage details

See the [Overview of Reporting APIs for Enterprise customers](/azure/billing/billing-enterprise-api) article to learn about required common header properties.

|Method | Request URI|
|-|-|
|GET| https://consumption.azure.com/v2/enrollments/{enrollmentNumber}/reservationdetails?startDate={yyyy-mm-dd}&endDate={yyyy-mm-dd}


## Usage details response

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

|Property Name| Type| Description|
|-|-|-|
|reservationOrderId|string|The reservation order ID is the identifier for a reservation purchase. Each reservation order ID represents a single purchase transaction. A reservation order contains reservations. The reservation order specifies the VM size and region for the reservations.|
|reservationId|string |The reservation ID is the identifier of a reservation within a reservation order. Each reservation is the grouping for applying the benefit scope and also specifies the number of instances to which the reservation benefit can be applied to.|
|usageDate|string |The date on which consumption occurred.|
|skuName|string| This is the Azure Resource Manager Sku name. It can be used to join with the servicetype field in additionalInfo in usage records.|
|instanceId|string| This identifier is the name of the resource or the fully qualified Resource ID.|
|totalReservedQuantity|string| This is the total count of instances that are reserved for the reservation ID.|
|reservedHours|decimal| This is the total hours reserved for the day. For example, if reservation for 1 instance was made on 1 PM, reserved hours will be 11 hours for first day and 24 hours for subsequent days.|
|usedHours|decimal| This is the total hours used by the instance.|


<br/>

## Request for Reserved Instance usage summary
See the [Overview of Reporting APIs for Enterprise customers](/azure/billing/billing-enterprise-api) article to learn about required common header properties. The API supports reservation utilization for daily and monthly grain. Startdate and EndDate parameters are not required for monthly data.

|Method | Request URI|
|-|-|
|GET| https://consumption.azure.com/v2/enrollments/{enrollmentNumber}/reservationsummaries?grain=daily&startdate={yyyy-mm-dd}&enddate={yyyy-mm-dd}


## Usage summary response

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

|Property Name| Type| Description|
|-|-|-|
|reservationOrderId|string|The reservation order ID is the identifier for a reservation purchase. Each reservation order ID represents a single purchase transaction. A reservation order contains reservations. The reservation order specifies the VM size and region for the reservations.|
|reservationId|string |The reservation ID is the identifier of a reservation within a reservation order. Each reservation is the grouping for applying the benefit scope and also specifies the number of instances to which the reservation benefit can be applied to.|
|usageDate|string |The date on which consumption occurred.|
|skuName|string| String representing the purchased resource.|
|reservedHours|decimal| The total hours reserved for the day. For example, if reservation for 1 instance was made on 1 PM, reserved hours will be 11 hours for first day and 24 hours for subsequent days.|
|usedHours|decimal| The total hours used by the instance.|
|minUtilizationPercentage|double|The minimum utilization percentage on a given day. If you purchase one reservation and have one VM running for 23 hours, the value is 0.
|avgUtilizationPercentage|double|The Average utilization percentage on a given day. If you purchase one reservation and have one VM running for 23 hours, the value is 23/24.
|MaxUtilizationPercentage|double|The maximum utilization percentage on a given day. If you purchase one reservation and have one VM running for 23 hours, the field will be 1.

<br/>

## See also

* [Purchase Reserved Instance](/azure/virtual-machines/windows/prepay-reserved-vm-instances)
* [Billing Periods API](billing-enterprise-api-billing-periods.md)
* [Usage Detail API](billing-enterprise-api-usage-detail.md)
* [Marketplace Store Charge API](billing-enterprise-api-marketplace-storecharge.md)
* [Price Sheet API](billing-enterprise-api-pricesheet.md)
* [Reserved Instance Recommendation API](billing-enterprise-api-reserved-instance-recommendation.md)
* [Reserved Instance Charges API](billing-enterprise-api-reserved-instance-charges.md)
