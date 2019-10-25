---
ms.assetid: d05239ef-89cd-41f9-8345-bd558e72e891
ms.title: Azure Time Series REST APIs | Microsoft Docs
title: Azure Time Series REST APIs | Microsoft Docs
services: time-series-insights
ms.service: time-series
service_description: Time Series Insights
description: This landing page summarizes API information for Azure Time Series Insights.
manager: cshankar
ms.manager: jhubbard
author: KingdomOfEnds
ms.author: v-adgera
ms.date: 10/21/2019
---

# Azure Time Series Insights REST APIs

Azure Time Series Insights provides powerful data exploration and telemetry tools to help you improve operational analysis. It's a fully managed analytics, storage, and visualization service that makes it simple to explore and analyze billions of IoT events simultaneously. It gives you a global view of your data, letting you quickly validate your IoT solution and avoid costly downtime to mission-critical devices by helping you discover hidden trends, spot anomalies, and conduct root-cause analyses in near real time.  

## API querying overview

The Azure Time Series Insights APIs provide secure REST *CREATE*, *READ*, *UPDATE*, and *DELETE* operations using the Time Series Insights [query syntax language](ga-query-syntax.md) (TSX).

Batch operations and result pagination are supported for most APIs.

GA live event streaming is supported through secure WebSockets.

## General Availability and Preview

The Azure Time Series Insights APIs are split into two versions, one that is already generally available (Time Series Insights GA) and a major service update that is in preview (Time Series Insights Preview).

* Data Access GA::

    * See the [GA REST overview](ga.md).
    * Review the GA Query Syntax [reference](ga-query-syntax.md) documentation.
    * Review the GA Environments API [reference](ga-query-api.md) documentation.
    * Review the GA Reference Data API [reference](ga-reference-data-api.md) documentation.

* Data Access Concepts Preview:

    * See the [Preview REST concepts overview](preview.md).
    * Review the Time Series Expression (TSX) [reference](preview.md#time-series-expression-and-syntax)  documentation.
    * Review the Time Series Model API [concept](preview.md#time-series-model-apis) and [reference](https://docs.microsoft.com/rest/api/time-series-insights/dataaccess(preview)/modelsettings) documentation.
    * Review the Preview Environments API [concept](preview.md#preview-environments-apis) and [reference](https://docs.microsoft.com/rest/api/time-series-insights/management/environments) documentation.
    * Review the Preview Query API [concept](preview.md#query-apis) and [reference](https://docs.microsoft.com/rest/api/time-series-insights/dataaccess(preview)/query) documentation.

## See also

Learn more about the Preview [Time Series Models](https://docs.microsoft.com/azure/time-series-insights/time-series-insights-update-tsm).

Read about [making queries in Azure Time Series Insights](https://docs.microsoft.com/azure/time-series-insights/time-series-insights-update-tsq).

[Authentication and Authorization](https://docs.microsoft.com/azure/time-series-insights/time-series-insights-authentication-and-authorization) for Azure Time Series Insights.