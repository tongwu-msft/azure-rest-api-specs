---
ms.assetid: d05239ef-89cd-41f9-8345-bd558e72e891
ms.title: REST API landing page - Azure Time Series Insights | Microsoft Docs
title: REST API landing page - Azure Time Series Insights | Microsoft Docs
services: time-series-insights
ms.service: time-series-insights
service_description: Time Series Insights
description: Landing page and overview of REST API and data access reference documentation for Azure Time Series Insights.
manager: deepakpalled
ms.manager: dpalled
author: shreyasharmamsft
ms.author: shresha
ms.date: 07/01/2020
---

# Azure Time Series Insights REST APIs

Azure Time Series Insights provides data exploration and telemetry tools to help you improve operational analysis. It's a fully managed analytics, storage, and visualization service where you can explore and analyze billions of Internet of Things (IoT) events simultaneously.

Azure Time Series Insights gives you a global view of your data, so you can quickly validate your IoT solution and avoid costly downtime to mission-critical devices. It can help you discover hidden trends, spot anomalies, and conduct root-cause analyses in near real time.  

## API querying overview

The Azure Time Series Insights APIs provide secure REST **CREATE**, **READ**, **UPDATE**, and **DELETE** operations by using the Azure Time Series Insights Gen 1 and Azure Time Series Insights Gen 2 query syntax. 

> [!TIP]
> Batch operations and result pagination are supported for most APIs.

Azure Time Series Insights Gen 1 live event streaming is supported through secure WebSockets.

## Azure Time Series Insights Gen 1 and Gen 2

The Azure Time Series Insights APIs are split into two versions: Gen 1 and Gen 2. The Gen 2 version is a major service update.

* Data access for Gen 1:

    * See the [Gen 1 REST overview](ga.md).
    * Review the Gen 1 query syntax [reference](ga-query-syntax.md) documentation.
    * Review the Gen 1 Environments API [reference](ga-query-api.md) documentation.
    * Review the Gen 1 Reference Data API [reference](ga-reference-data-api.md) documentation.

* Data access for Gen 2:

    * See the [Gen 2 REST concepts overview](preview.md).
    * Review the Gen 2 [Time Series Expression (TSX)](preview.md#time-series-expression-and-syntax) documentation.
    * Review the Gen 2 Time Series Model API [concepts](preview.md#time-series-model-apis) and [reference](https://docs.microsoft.com/rest/api/time-series-insights/dataaccess(preview)/modelsettings) documentation.
    * Review the Gen 2 Environments API [concept](preview.md#environments-apis) and [reference](https://docs.microsoft.com/rest/api/time-series-insights/management/environments) documentation.
    * Review the Gen 2 Query API [concept](preview.md#query-apis) and [reference](https://docs.microsoft.com/rest/api/time-series-insights/dataaccess(preview)/query) documentation.

## See also

Learn more about the [Time Series Model](https://docs.microsoft.com/azure/time-series-insights/time-series-insights-update-tsm).

Read about [making queries in Azure Time Series Insights Gen 2](https://docs.microsoft.com/azure/time-series-insights/time-series-insights-update-tsq).

Learn about [authentication and authorization](https://docs.microsoft.com/azure/time-series-insights/time-series-insights-authentication-and-authorization) for Azure Time Series Insights.
