---
title: Azure Billing Enterprise APIs - Marketplace Charges
description: Learn about the Marketplace Store Charge to get consumption data programmatically.
author: banders
ms.reviewer: prkumar
tags: billing
ms.service: cost-management-billing
ms.subservice: enterprise
ms.topic: article
ms.date: 09/15/2021
ms.author: banders

---
# Reporting APIs for Enterprise customers - Marketplace Store Charge

> [!Note]
> Microsoft is retiring the Azure Enterprise Reporting APIs. EA customers - please move to the Cost Management APIs. 
> To learn more, see [Migrate from Azure Enterprise Reporting to Microsoft Cost Management APIs overview - Microsoft Cost Management | Microsoft Docs](/azure/cost-management-billing/automate/migrate-ea-reporting-arm-apis-overview).

The Marketplace Store Charge API returns the usage-based marketplace charges breakdown by day for the specified Billing Period or start and end dates. Recurring Charges are returned as a part of the API response.

## Request
Common header properties that you must specify are shown in the [Reporting APIs for Enterprise customers](/azure/billing/billing-enterprise-api) article. If a billing period isn't specified, then data for the current billing period is returned. You can specify custom time ranges. Start and end date parameters are in yyyy-MM-dd format. The maximum supported time range is 36 months.  

|Method | Request URI|
|-|-|
|GET|https://consumption.azure.com/v3/enrollments/{enrollmentNumber}/marketplacecharges|
|GET|https://consumption.azure.com/v3/enrollments/{enrollmentNumber}/billingPeriods/{billingPeriod}/marketplacecharges|
|GET|https://consumption.azure.com/v3/enrollments/{enrollmentNumber}/marketplacechargesbycustomdate?startTime=2017-01-01&endTime=2017-01-10|


## Response

```json
        [
            {
                "id": "id",
                "subscriptionGuid": "00000000-0000-0000-0000-000000000000",
                "subscriptionName": "subName",
                "meterId": "2core",
                "usageStartDate": "2015-09-17T00:00:00Z",
                "usageEndDate": "2015-09-17T23:59:59Z",
                "offerName": "Virtual LoadMaster&trade; (VLM) for Azure",
                "resourceGroup": "Res group",
                "instanceId": "id",
                "additionalInfo": "{\"ImageType\":null,\"ServiceType\":\"Medium\"}",
                "tags": "",
                "orderNumber": "order",
                "unitOfMeasure": "",
                "costCenter": "100",
                "accountId": 100,
                "accountName": "Account Name",
                "accountOwnerId": "account@live.com",
                "departmentId": 101,
                "departmentName": "Department 1",
                "publisherName": "Publisher 1",
                "planName": "Plan name",
                "consumedQuantity": 1.15,
                "resourceRate": 0.1,
                "extendedCost": 1.11,
                "isRecurringCharge": "False"
            },
            ...
        ]
```

**Response property definitions**

|Property Name| Type| Description|
|-|-|-|
|id|string|Unique Id for the marketplace charge item|
|subscriptionGuid|Guid|The Subscription Guid|
|subscriptionName|string|The Subscription Name|
|meterId|string|Id for the emitted Meter|
|usageStartDate|DateTime|Start time for the usage record|
|usageEndDate|DateTime|End time for the usage record|
|offerName|string|The Offer name|
|resourceGroup|string|The resource Group|
|instanceId|string|Instance Id|
|additionalInfo|string|Additional info JSON string|
|tags|string|Tag JSON string|
|orderNumber|string|The order number|
|unitOfMeasure|string|Unit of measure for the meter|
|costCenter|string|The cost center|
|accountId|int|The account Id|
|accountName|string |The Account Name|
|accountOwnerId|string|The Account Owner Id|
|departmentId|int|The department Id|
|departmentName|string|The department name|
|publisherName|string|The publisher name|
|planName|string|The Plan name|
|consumedQuantity|decimal|Consumed Quantity during this time period|
|resourceRate|decimal|Unit price for the meter|
|extendedCost|decimal|Estimated charge based on Consumed Quantity and Extended cost|
|isRecurringCharge|string|Recurring charges indicator|

<br/>

## See also

* [Billing Periods API](billing-enterprise-api-billing-periods.md)
* [Usage Detail API](billing-enterprise-api-usage-detail.md)
* [Balance and Summary API](billing-enterprise-api-balance-summary.md)
* [Price Sheet API](billing-enterprise-api-pricesheet.md)
