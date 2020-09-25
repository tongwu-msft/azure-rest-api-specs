---
title: Azure Retail Prices REST API overview
description: Provides operations to programmatically get Azure service retail prices.
author: bandersmsft
ms.author: banders
ms.reviewer: mumami
ms.date: 09/25/2020
ms.topic: reference
ms.service: cost-management-billing
ms.subservice: cost-management
ms.devlang: rest-api
---

# Azure Retail Prices overview

Azure customers have been looking for a programmatic way to retrieve retail prices for all Azure services. Now you can use the Unified Pricing API – Retail Rates endpoint to get retail prices. Previously, the only way that you could retrieve prices for Azure services was to either use the Azure Pricing Calculator or use the Azure portal. This API gives you an unauthenticated experience to get retail rates for all Azure services. Use the API to explore prices for Azure services against different regions and different SKUs. The programmatic API can also help you create your own tools for internal analysis and price comparison across SKUs and regions.

## API endpoint

`https://prices.azure.com/api/retail/prices`

## API response examples

Here's a sample API response, without reservation prices.

```json
{
            "currencyCode": "USD",
            "tierMinimumUnits": 0.0,
            "retailPrice": 0.176346,
            "unitPrice": 0.176346,
            "armRegionName": "westeurope",
            "location": "EU West",
            "effectiveStartDate": "2020-08-01T00:00:00Z",
            "meterId": "000a794b-bdb0-58be-a0cd-0c3a0f222923",
            "meterName": "F16s Spot",
            "productId": "DZH318Z0BQPS",
            "skuId": "DZH318Z0BQPS/00TG",
            "productName": "Virtual Machines FS Series Windows",
            "skuName": "F16s Spot",
            "serviceName": "Virtual Machines",
            "serviceId": "DZH313Z7MMC8",
            "serviceFamily": "Compute",
            "unitOfMeasure": "1 Hour",
            "type": "DevTestConsumption",
            "isPrimaryMeterRegion": true,
            "armSkuName": "Standard_F16s"
        }
```

Here's a sample API response with reservation prices and term in the response.

```json
{
            "currencyCode": "USD",
            "tierMinimumUnits": 0.0,
            "reservationTerm": "1 Year",
            "retailPrice": 25007.0,
            "unitPrice": 25007.0,
            "armRegionName": "southcentralus",
            "location": "US South Central",
            "effectiveStartDate": "2020-08-01T00:00:00Z",
            "meterId": "0016083a-928f-56fd-8eeb-39287dcf676d",
            "meterName": "E64 v4",
            "productId": "DZH318Z0D1L7",
            "skuId": "DZH318Z0D1L7/018J",
            "productName": "Virtual Machines Ev4 Series",
            "skuName": "E64 v4",
            "serviceName": "Virtual Machines",
            "serviceId": "DZH313Z7MMC8",
            "serviceFamily": "Compute",
            "unitOfMeasure": "1 Hour",
            "type": "Reservation",
            "isPrimaryMeterRegion": true,
            "armSkuName": "Standard_E64_v4"
        }
```

## API property details

Here's all the property details that are a part of the API response.

| Field | Example Values | Definition |
| --- | --- | --- |
| currencyCode | USD | The currency in which rates are defined. Currently, the only currency returned is USD. |
| tierMinimumUnits | 0 | Minimum units of consumption to avail the price |
| reservationTerm | 1 year | Reservation term – 1 year or 3 years |
| retailPrice | 0.176346 | Prices without discount |
| unitPrice | 0.176346 |  |
| armRegionName | westeurope | ARM region where the service is available. This version only supports prices on Commercial Cloud. |
| Location | EU West | Azure data center where the resource is deployed |
| effectiveStartDate | 2020-08-01T00:00:00Z | Optional field. Shows the date when the retail prices are effective.  |
| meterId | 000a794b-bdb0-58be-a0cd-0c3a0f222923 | Unique identifier of the resource |
| meterName | F16s Spot | Name of the meter |
| productid | DZH318Z0BQPS | UniqueID of the product |
| skuId | DZH318Z0BQPS/00TG | UniqueID for the SKU |
| productName | Virtual Machines FS Series Windows | Product name |
| skuName | F16s Spot | SKU name |
| serviceName | Virtual Machines | Name of the service |
| serviceId | DZH313Z7MMC8 | UniqueID of the service |
| serviceFamily | Compute | Service family of the SKU |
| unitOfMeasure | 1 Hour | How usage is measured for the service |
| Type | DevTestConsumption | Meter consumption type. Other types are _Reservation, Consumption._ |
| isPrimaryMeterRegion | True |  |
| armSkuName | Standard\_F16s | SKU name registered in Azure |

## API filters

Filters are supported for the following fields:

- armRegionName
- Location
- meterId
- meterName
- productid
- skuId
- productName
- skuName
- serviceName
- serviceId
- serviceFamily
- priceType
- armSkuName
 
You append the filters to the API endpoint in the next section.

## API sample calls 

Here are some examples:

Example call filtered for only virtual machines

```http
https://prices.azure.com/api/retail/prices?$filter=serviceName eq 'Virtual Machines'
```

Example call filtered for only reservations

```http
https://prices.azure.com/api/retail/prices?$filter=priceType eq 'Reservation
```

Example call filtered for reserved instance virtual machines

```http
https://prices.azure.com/api/retail/prices?$filter=serviceName eq 'Virtual Machines' and priceType eq 'Reservation'
```

Example call filtered for compute resources

```http
https://prices.azure.com/api/retail/prices?$filter=serviceFamily eq 'Compute'
```

## Unsupported functions

The Retail Prices API doesn't support the following functionalities:

- The API doesn't support other currencies.
- Azure Marketplace products aren't included in the response.
- Part numbers aren't included in the response.

## Next steps

- Learn about other [Cost Management APIs](../index.md).