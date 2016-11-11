---
ms.assetid: bcafe4b9-0910-497d-bbb8-18c51416f665
ms.title: Azure Commerce REST API reference
ms.service: billing
author: steved0x
ms.author: sdanie
ms.manager: douge
---

# Azure Commerce REST API reference

The Azure Commerce REST API provides operations for estimating Azure consumption data, and listing available Azure resources along with estimated pricing information for each.


## REST operation groups

| Operation group                                    | Description                                                                                                       |
|----------------------------------------------------|-------------------------------------------------------------------------------------------------------------------|
| [Rate Card](~/api-ref/commerce/ratecard.json)               | Provides operations for querying for the resource/meter metadata and related prices used in a given subscription. |
| [Usage Aggregates](~/api-ref/commerce/usageaggregates.json) | Provides operations for querying aggregated Azure subscription consumption data for a date range.                 |

## See also

- [Gain insights into your Microsoft Azure resource consumption](https://azure.microsoft.com/documentation/articles/billing-usage-rate-card-overview/)