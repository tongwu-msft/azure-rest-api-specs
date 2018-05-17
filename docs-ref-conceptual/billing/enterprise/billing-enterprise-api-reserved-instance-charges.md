---
title: Azure Billing Enterprise APIs - Reserved Instance Charges| Microsoft Docs
description: Get Reserved Instance transaction charges based on Enrollment.
services: ''
documentationcenter: ''
author: manish-shukla01
manager: manshuk
editor: ''
tags: billing

ms.assetid: 3e817b43-0696-400c-a02e-47b7817f9b77
ms.service: billing
ms.devlang: na
ms.topic: article
ms.tgt_pltfrm: na
ms.workload: billing
ms.date: 04/17/2018
ms.author: manshuk

---
# Reserved Instance transaction charges for enterprise customers

Reserved Instance charges API shows the billing transactions made on the Enterprise enrollment. If the reservation has been moved from the purchasing enrollment to a different enrollment, it will show the purchasing and the current enrollment of the reservation.


## Request for Reserved Instance charges 
Common header properties that need to be added are specified [here](https://docs.microsoft.com/azure/billing/billing-enterprise-api). 

|Method | Request URI|
|-|-|
|GET| https://consumption.azure.com/v3/enrollments/{enrollmentNumber}/reservationcharges?startDate={yyyy-mm-dd}&endDate={yyyy-mm-dd}

> [!Note]
> To use the previous version of API, replace v3 with v2 in the above URL. Some of the fields will not be available if you use v2.
>

## Response
```json
[
    {
        "purchasingEnrollment": "string",
        "armSkuName": "Standard_F1s",
        "term": "P1Y",
        "region": "eastus",
        "PurchasingsubscriptionGuid": "00000000-0000-0000-0000-000000000000",
        "PurchasingsubscriptionName": "string",
        "accountName": "string",
        "accountOwnerEmail": "string",
        "departmentName": "string",
        "costCenter": "",
        "currentEnrollment": "string",
        "eventDate": "string",
        "reservationOrderId": "00000000-0000-0000-0000-000000000000",
        "description": "Standard_F1s eastus 1 Year",
        "eventType": "Purchase",
        "quantity": int,
        "amount": double,
        "currency": "string",
        "reservationOrderName": "string"
    }
]
```
**Response property definitions**

|Property Name| Type| Description
|-|-|-|
|purchasingEnrollment|string|Enrollmentnumber that purchased the Reservation.|
|armSkuName|string|String representing the purchased resource.|
|term|string|string representing the term of Reservation. It will be P1Y for one year and P3Y for three years.|
|region|string|Region for which Reserved Instance is transacted.|
|PurchasingsubscriptionGuid|string|Subscriptionguid that was used to purchase the Reservation.|
|PurchasingsubscriptionName|string|Name of the Subscription that was used to purchase the Reservation.|
|accountName| string| Account associated to the purchasing subscription. |
|accountOwnerEmail| string| Email account associated to the purchasing subscription. |
|departmentName| string| Name of the purchasing subscription's department. |
|costCenter| string| The cost center that the purchasing subscription is associated with. |
|CurrentEnrollment|string|Enrollmentnumber where Reserved Instance resides today. If Reserved Instance was purchased in EA1 and later moved to EA2. This field will be EA2|
|eventDate|string|Date of the reservation purchase/cancel/refund event|
|reservationOrderId|string |The reservationorderID is the identifier for a reservation transaction. Each reservation order ID represents a single transaction. A reservation order contains reservations. The reservation order specifies the VM size and region for the reservations.|
|description|string |This string is combination of Azure Resource Manager SKUName, region and the duration of Reserved Instance purchase|
|eventType|string| String representing purchase/cancel/refund event|
|quantity|decimal| Number of Reserved Instances transacted|
|amount|string| Total amount of transaction|
|currency|decimal| Currency of the Reserved Instance transaction|
|reservationOrderName|string| Friendly name of the reservation order|
<br/>


## See also

* [Purchase Reserved Instance](https://docs.microsoft.com/en-us/azure/virtual-machines/windows/prepay-reserved-vm-instances)

* [Billing Periods API](billing-enterprise-api-billing-periods.md)

* [Usage Detail API](billing-enterprise-api-usage-detail.md) 

* [Marketplace Store Charge API](billing-enterprise-api-marketplace-storecharge.md) 

* [Price Sheet API](billing-enterprise-api-pricesheet.md)

* [Reserved Instance Recommendation API](billing-enterprise-api-reserved-instance-recommendation.md)

* [Reserved Instance Usage API](billing-enterprise-api-reserved-instance-usage.md)