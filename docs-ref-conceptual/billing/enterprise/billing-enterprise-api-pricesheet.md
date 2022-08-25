---
title: Azure Billing Enterprise APIs - PriceSheet
description: Learn about the Price Sheet APIs to get consumption data programmatically.
author: bandersmsft
ms.reviewer: prkumar
tags: billing
ms.service: cost-management-billing
ms.subservice: enterprise
ms.topic: article
ms.date: 09/15/2021
ms.author: banders

---
# Reporting APIs for Enterprise customers - Price Sheet

> [!NOTE]
> Microsoft is retiring the Azure Enterprise Reporting APIs. EA customers - please move to the Cost Management APIs. 
> To learn more, see [Migrate from Azure Enterprise Reporting to Microsoft Cost Management APIs overview](/azure/cost-management-billing/automate/migrate-ea-reporting-arm-apis-overview).

The Price Sheet API provides the applicable rate for each Meter for the given Enrollment and Billing Period.

## Request
Common header properties that need to be added are specified in the [Overview of Reporting APIs for Enterprise customers](/azure/billing/billing-enterprise-api) article. If a billing period isn't specified, then data for the current billing period is returned.

|Method | Request URI|
|-|-|
|GET|https://consumption.azure.com/v3/enrollments/{enrollmentNumber}/pricesheet|
|GET|https://consumption.azure.com/v3/enrollments/{enrollmentNumber}/billingPeriods/{billingPeriod}/pricesheet|

> [!Note]
> To use the previous version of the API, replace v3 with v2 in the URLs above. Some fields aren't available if you use v2.

## Response

```json
          [
            {
                  "id": "enrollments/57354989/billingperiods/201601/products/343/pricesheets",
                  "billingPeriodId": "201704",
                "meterId": "dc210ecb-97e8-4522-8134-2385494233c0",
                  "meterName": "A1 VM",
                  "unitOfMeasure": "100 Hours",
                  "includedQuantity": 0,
                  "partNumber": "N7H-00015",
                  "unitPrice": 0.00,
                  "currencyCode": "USD"
            },
            {
                  "id": "enrollments/57354989/billingperiods/201601/products/2884/pricesheets",
                  "billingPeriodId": "201404",
                "meterId": "dc210ecb-97e8-4522-8134-5385494233c0",
                  "meterName": "Locally Redundant Storage Premium Storage - Snapshots - AU East",
                  "unitOfMeasure": "100 GB",
                  "includedQuantity": 0,
                  "partNumber": "N9H-00402",
                  "unitPrice": 0.00,
                  "currencyCode": "USD"
            },
            ...
        ]
```

> [!Note]
>If you are using the Preview API, meterId field isn't available.

**Response property definitions**

|Property Name| Type| Description|
|-|-|-|
|id| string| The unique ID represents a PriceSheet item (meter by billing period)|
|billingPeriodId| string| The unique ID that represents a particular Billing period|
|meterId| string| The identifier for the meter. It can be mapped to the usage meterID.|
|meterName| string| The meter name|
|unitOfMeasure| string| The Unit of Measure for measuring the service|
|includedQuantity| decimal| Quantity that's included |
|partNumber| string| The part number that's associated with the Meter|
|unitPrice| decimal| The unit price for the meter|
|currencyCode| string| The currency code for the unitPrice|

<br/>

## See also

* [Billing Periods API](billing-enterprise-api-billing-periods.md)
* [Usage Detail API](billing-enterprise-api-usage-detail.md)
* [Balance and Summary API](billing-enterprise-api-balance-summary.md)
* [Marketplace Store Charge API](billing-enterprise-api-marketplace-storecharge.md)
