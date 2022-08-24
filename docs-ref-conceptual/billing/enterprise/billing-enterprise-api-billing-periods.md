---
title: Azure Billing Enterprise APIs - Billing periods
description: Learn about the Billing Periods API that's part of the to enable Enterprise Azure customers to get consumption data programmatically.
author: bandersmsft
ms.reviewer: prkumar
tags: billing
ms.service: cost-management-billing
ms.subservice: enterprise
ms.topic: article
ms.date: 09/15/2021
ms.author: banders

---
# Reporting APIs for Enterprise customers - Billing Periods

> [!Note]
> Microsoft is retiring the Azure Enterprise Reporting APIs. EA customers - please move to the Cost Management APIs. 
> To learn more, see [Migrate from Azure Enterprise Reporting to Microsoft Cost Management APIs overview - Microsoft Cost Management | Microsoft Docs](/azure/cost-management-billing/automate/migrate-ea-reporting-arm-apis-overview).

The Billing Periods API returns a list of billing periods that have consumption data for the specified Enrollment in reverse chronological order. Each Period contains a property pointing to the API route for the four sets of data - BalanceSummary, UsageDetails, Marketplace Charges, and PriceSheet. If the period does not have data, the corresponding property is null.


## Request
Common header properties that need to be added are specified in the [Overview of Reporting APIs for Enterprise customers](/azure/billing/billing-enterprise-api) article.

|Method | Request URI|
|-|-|
|GET| https:\//consumption.azure.com/v2/enrollments/{enrollmentNumber}/billingperiods|

> [!Note]
> To use the previous version of the API, replace v2 with v1 in the URL above. Some fields aren't available if you use v2.

## Response

```json
        [
            {
                  "billingPeriodId": "201704",
                  "billingStart": "2017-04-01T00:00:00Z",
                  "billingEnd": "2017-04-30T11:59:59Z",
                "balanceSummary": "/v1/enrollments/100/billingperiods/201704/balancesummary",
                  "usageDetails": "/v1/enrollments/100/billingperiods/201704/usagedetails",
                  "marketplaceCharges": "/v1/enrollments/100/billingperiods/201704/marketplacecharges",
                  "priceSheet": "/v1/enrollments/100/billingperiods/201704/pricesheet"
            },            
            ....
        ]
```

**Response property definitions**

|Property Name| Type| Description|
|-|-|-|
|billingPeriodId| string| The unique ID that represents a particular Billing period|
|billingStart| datetime| ISO 8601 string representing the period start date|
|billingEnd| datetime| ISO 8601 string representing the period end date|
|balanceSummary| string| The URL path that routes to the Balance Summary data for this period|
|usageDetails| string| The URL path that routes to the Usage Details data for this period|
|marketplaceCharges| string| The URL path that routes to the Marketplace Charges data for this period|
|priceSheet| string| The URL path that routes to the PriceSheet data for this period|

<br/>

## See also

* [Balance and Summary API](billing-enterprise-api-balance-summary.md)
* [Usage Detail API](billing-enterprise-api-usage-detail.md)
* [Marketplace Store Charge API](billing-enterprise-api-marketplace-storecharge.md)
* [Price Sheet API](billing-enterprise-api-pricesheet.md)
