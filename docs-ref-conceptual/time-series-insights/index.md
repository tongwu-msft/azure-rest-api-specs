---
ms.assetid: d05239ef-89cd-41f9-8345-bd558e72e891
ms.title: REST API landing page - Azure Time Series Insights | Microsoft Docs
title: REST API landing page - Azure Time Series Insights | Microsoft Docs
services: time-series-insights
ms.service: time-series-insights
service_description: Time Series Insights
description: Landing page and overview of REST API and data access reference documentation for Azure Time Series Insights Gen1 and Gen2.
manager: deepakpalled
ms.manager: dpalled
author: shreyasharmamsft
ms.author: shresha
ms.date: 03/05/2021
---

# Azure Time Series Insights REST APIs

Azure Time Series Insights provides data exploration and telemetry tools to help you improve operational analysis. It's a fully managed analytics, storage, and visualization service where you can explore and analyze billions of Internet of Things (IoT) events simultaneously.

Azure Time Series Insights gives you a global view of your data, so you can quickly validate your IoT solution and avoid costly downtime to mission-critical devices. It can help you discover hidden trends, spot anomalies, and conduct root-cause analyses in near real time.  

## API querying overview

The Azure Time Series Insights APIs provide secure REST **CREATE**, **READ**, **UPDATE**, and **DELETE** operations by using the Azure Time Series Insights Gen1 and Azure Time Series Insights Gen2 query syntax.

> [!TIP]
> Batch operations and result pagination are supported for most APIs.

Azure Time Series Insights Gen1 live event streaming is supported through secure WebSockets.

## Azure Time Series Insights Gen1 and Gen2

The Azure Time Series Insights APIs are split into two versions: Gen1 and Gen2. The Gen2 version is a major service update.

* Data access for Gen1:

  * See the [Gen1 REST overview](gen1.md).
  * Review the Gen1 query syntax [reference](gen1-query-syntax.md) documentation.
  * Review the Gen1 Environments API [reference](gen1-query-api.md) documentation.
  * Review the Gen1 Reference Data API [reference](gen1-reference-data-api.md) documentation.

* Data access for Gen2:

  * Review the Gen2 [Data Access Overview](reference-data-access-overview.md)
  * Review the Gen2 [Time Series Expression (TSX)](reference-time-series-expression-syntax.md) documentation.
  * Review the Gen2 [Time Series Model API concepts](reference-model-apis.md) and [reference](https://docs.microsoft.com/rest/api/time-series-insights/dataaccessgen2/modelsettings) documentation.
  * Review the Gen2 [Environments API concept](reference-environments-apis.md) and [reference](https://docs.microsoft.com/rest/api/time-series-insights/management/environments) documentation.
  * Review the Gen2 [Query API concept](reference-query-apis.md) and [reference](https://docs.microsoft.com/rest/api/time-series-insights/dataaccessgen2/query) documentation.
  * Review the Gen2 [API Limits](reference-api-limits.md) documentation.

## See also

Learn more about the [Time Series Model](https://docs.microsoft.com/azure/time-series-insights/time-series-insights-update-tsm).

Read about [making queries in Azure Time Series Insights Gen2](https://docs.microsoft.com/azure/time-series-insights/time-series-insights-update-tsq).

Learn about [authentication and authorization](https://docs.microsoft.com/azure/time-series-insights/time-series-insights-authentication-and-authorization) for Azure Time Series Insights.
