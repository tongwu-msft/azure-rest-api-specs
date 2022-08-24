---
title: Azure Billing Enterprise APIs - Balance and Summary
description: Learn about the Balance and Summary API that's in the Azure Billing Usage and RateCard APIs. They're used to provide insights into Azure resource consumption and trends.
author: bandersmsft
ms.reviewer: prkumar
tags: billing
ms.service: cost-management-billing
ms.subservice: enterprise
ms.topic: article
ms.date: 09/15/2021
ms.author: banders

---
# Reporting APIs for Enterprise customers - Balance and Summary

> [!Note]
> Microsoft is retiring the Azure Enterprise Reporting APIs. EA customers - please move to the Cost Management APIs. 
> To learn more, see [Migrate from Azure Enterprise Reporting to Microsoft Cost Management APIs overview - Microsoft Cost Management | Microsoft Docs](/azure/cost-management-billing/automate/migrate-ea-reporting-arm-apis-overview).

The Balance and Summary API offers a monthly summary of information on balances, new purchases, Azure Marketplace service charges, adjustments, and overage charges.


## Request
Common header properties that need to be added are specified in the [Overview of Reporting APIs for Enterprise customers](/azure/billing/billing-enterprise-api) article. If a billing period isn't specified, then data for the current billing period is returned.

|Method | Request URI|
|-|-|
|GET| https:\//consumption.azure.com/v3/enrollments/{enrollmentNumber}/balancesummary|
|GET| https:\//consumption.azure.com/v3/enrollments/{enrollmentNumber}/billingPeriods/{billingPeriod}/balancesummary|

> [!Note]
> To use the previous version of the API, replace v3 with v2 in the URLs above. Some fields aren't available if you use v2.

## Response

```json
        {
            "id": "enrollments/100/billingperiods/201507/balancesummaries",
              "billingPeriodId": 201507,
              "currencyCode": "USD",
              "beginningBalance": 0,
              "endingBalance": 1.1,
              "newPurchases": 1,
              "adjustments": 1.1,
              "utilized": 1.1,
              "serviceOverage": 1,
              "chargesBilledSeparately": 1,
              "totalOverage": 1,
              "totalUsage": 1.1,
              "azureMarketplaceServiceCharges": 1,
              "newPurchasesDetails": [
                {
                  "name": "",
                  "value": 1
                }
              ],
              "adjustmentDetails": [
                {
                  "name": "Promo Credit",
                  "value": 1.1
                },
                {
                  "name": "SIE Credit",
                  "value": 1.0
                }
              ]
        }
```

**Response property definitions**

|Property Name| Type| Description|
|-|-|-|
|id|string|The unique Id for a specific billing period and enrollment|
|billingPeriodId|string |The billing period Id|
|currencyCode|string |The currency code|
|beginningBalance|decimal| The beginning balance for the billing period|
|endingBalance|decimal| The ending balance for the billing period (for open periods this will be updated daily)|
|newPurchases|decimal| Total new purchase amount|
|adjustments|decimal| Total adjustment amount|
|utilized|decimal| Total Commitment usage|
|serviceOverage|decimal| Overage for Azure services|
|chargesBilledSeparately|decimal| Charges Billed separately|
|totalOverage|decimal| serviceOverage + chargesBilledSeparately|
|totalUsage|decimal| Azure service commitment + total Overage|
|azureMarketplaceServiceCharges|decimal| Total charges for Azure Marketplace|
|newPurchasesDetails|JSON string array of Name Value pairs|List of new purchases|
|adjustmentDetails|JSON string array of Name Value pairs|List of Adjustments (Promo credit, SIE credit etc.) |


<br/>

## See also

* [Billing Periods API](billing-enterprise-api-billing-periods.md)
* [Usage Detail API](billing-enterprise-api-usage-detail.md)
* [Marketplace Store Charge API](billing-enterprise-api-marketplace-storecharge.md)
* [Price Sheet API](billing-enterprise-api-pricesheet.md)
