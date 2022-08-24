---
title: Azure Billing Enterprise APIs - Reserved Instance Charges
description: Get Reserved Instance transaction charges based on Enrollment.
author: bandersmsft
ms.reviewer: prkumar
tags: billing
ms.service: cost-management-billing
ms.subservice: enterprise
ms.topic: article
ms.date: 09/15/2021
ms.author: banders

---
# Get Reserved Instance transaction charges for enterprise customers

> [!Note]
> Microsoft is retiring the Azure Enterprise Reporting APIs. EA customers - please move to the Cost Management APIs. 
> To learn more, see [Migrate from Azure Enterprise Reporting to Microsoft Cost Management APIs overview - Microsoft Cost Management | Microsoft Docs](/azure/cost-management-billing/automate/migrate-ea-reporting-arm-apis-overview).

Reserved Instance charges API shows the billing transactions made on the Enterprise enrollment. If the reservation has been moved from the purchasing enrollment to a different enrollment, it will show the purchasing and the current enrollment of the reservation.


## Request for Reserved Instance charges
Common header properties that need to be added are specified in the [Overview of Reporting APIs for Enterprise customers](/azure/billing/billing-enterprise-api) article.

|Method | Request URI|
|-|-|
|GET| https://consumption.azure.com/v4/enrollments/{enrollmentNumber}/reservationcharges?startDate={yyyy-mm-dd}&endDate={yyyy-mm-dd}

> [!Note]
> To use the previous version of the API, replace v4 with v3 or v2 in the URLs above. Some fields aren't available if you use v2.

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

| Property Name | Type| Description |
|---|---|---|
| purchasingEnrollment | string | Enrollmentnumber that purchased the Reservation. |
| armSkuName | string | String representing the purchased resource. |
| term | string | String representing the term of Reservation. It will be P1Y for one year and P3Y for three years. |
| region | string | Region for which Reserved Instance is transacted. |
| PurchasingsubscriptionGuid | string | Subscriptionguid that was used to purchase the Reservation. |
| PurchasingsubscriptionName | string | Name of the Subscription that was used to purchase the Reservation. |
| accountName | string | Account associated to the purchasing subscription. |
| accountOwnerEmail | string | Email account associated to the purchasing subscription. |
| departmentName | string | Name of the purchasing subscription's department. |
| costCenter | string| The cost center that the purchasing subscription is associated with.|
| CurrentEnrollment | string | Enrollmentnumber where Reserved Instance resides today. If Reserved Instance was purchased in EA1 and later moved to EA2. This field will be EA2. |
| eventDate | string | Date of the reservation purchase/cancel/refund event. |
| billingFrequency | string | Possible values are Recurring and OneTime. |
| reservationOrderId | string | The reservationorderID is the identifier for a reservation transaction. Each reservation order ID represents a single transaction. A reservation order contains reservations. The reservation order specifies the VM size and region for the reservations. |
| description | string | This string is combination of Azure Resource Manager SKUName, region and the duration of Reserved Instance purchase. |
| eventType | string | String representing purchase/cancel/refund event. |
| quantity | decimal | Number of Reserved Instances transacted. |
| amount | string | Total amount of transaction. |
| currency | decimal | Currency of the Reserved Instance transaction. |
| reservationOrderName | string | Friendly name of the reservation order. |

<br/>


## See also

* [Purchase Reserved Instance](/azure/virtual-machines/windows/prepay-reserved-vm-instances)
* [Billing Periods API](billing-enterprise-api-billing-periods.md)
* [Usage Detail API](billing-enterprise-api-usage-detail.md)
* [Marketplace Store Charge API](billing-enterprise-api-marketplace-storecharge.md)
* [Price Sheet API](billing-enterprise-api-pricesheet.md)
* [Reserved Instance Recommendation API](billing-enterprise-api-reserved-instance-recommendation.md)
* [Reserved Instance Usage API](billing-enterprise-api-reserved-instance-usage.md)
