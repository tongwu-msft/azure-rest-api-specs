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
author: yeskarthik
ms.author: Subramanian.Karthik
ms.date: 10/21/2019
---

# Azure Time Series Insights REST APIs

Azure Time Series Insights provides data exploration and telemetry tools to help you improve operational analysis. It's a fully managed analytics, storage, and visualization service where you can explore and analyze billions of Internet of Things (IoT) events simultaneously. 

Time Series Insights gives you a global view of your data, so you can quickly validate your IoT solution and avoid costly downtime to mission-critical devices. It can help you discover hidden trends, spot anomalies, and conduct root-cause analyses in near real time.  

## API querying overview

The Azure Time Series Insights APIs provide secure REST **CREATE**, **READ**, **UPDATE**, and **DELETE** operations by using the Time Series Insights [query syntax language](ga-query-syntax.md) (TSX).

Batch operations and result pagination are supported for most APIs.

General availability (GA) live event streaming is supported through secure WebSockets.

## General availability and preview

The Azure Time Series Insights APIs are split into two versions. One is generally available (Time Series Insights GA), one is a major service update that's in preview (Time Series Insights Preview).

* Data access for the GA version:

    * See the [GA REST overview](ga.md).
    * Review the GA query syntax [reference](ga-query-syntax.md) documentation.
    * Review the GA Environments API [reference](ga-query-api.md) documentation.
    * Review the GA Reference Data API [reference](ga-reference-data-api.md) documentation.

* Data access concepts for the preview version:

    * See the [Preview REST concepts overview](preview.md).
    * Review the Time Series Expression (TSX) [reference](preview.md#time-series-expression-and-syntax)  documentation.
    * Review the Time Series Model API [concept](preview.md#time-series-model-apis) and [reference](https://docs.microsoft.com/rest/api/time-series-insights/dataaccess(preview)/modelsettings) documentation.
    * Review the Preview Environments API [concept](preview.md#preview-environments-apis) and [reference](https://docs.microsoft.com/rest/api/time-series-insights/management/environments) documentation.
    * Review the Preview Query API [concept](preview.md#query-apis) and [reference](https://docs.microsoft.com/rest/api/time-series-insights/dataaccess(preview)/query) documentation.

## See also

Learn more about the preview [Time Series Model](https://docs.microsoft.com/azure/time-series-insights/time-series-insights-update-tsm).

Read about [making queries in Azure Time Series Insights](https://docs.microsoft.com/azure/time-series-insights/time-series-insights-update-tsq).

Learn about [authentication and authorization](https://docs.microsoft.com/azure/time-series-insights/time-series-insights-authentication-and-authorization) for Azure Time Series Insights.
