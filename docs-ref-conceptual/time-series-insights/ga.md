---
ms.assetid: 
ms.title: Azure Time Series Insights GA landing  | Microsoft Docs
title: Azure Time Series Insights GA landing  | Microsoft Docs
services: time-series-insights
ms.service: time-series
service_description: Time Series Insights
description: This landing page summarizes API information for Azure Time Series Insights GA.
manager: cshankar
ms.manager: jhubbard
author: KingdomOfEnds
ms.author: v-adgera
ms.date: 10/21/2019
---

# Data access (GA)

There are three ways to access and view your data in Azure Time Series Insights general availability (GA). You can query by using the [Azure Time Series Insights GA explorer](https://docs.microsoft.com/azure/time-series-insights/time-series-quickstart), create a query on behalf of an environment to be deployed through a custom URL, or create a custom application by using the Time Series Insights GA Query APIs.

You can use the Azure Time Series Insights GA Query APIs to perform REST **CREATE**, **READ**, **UPDATE**, and **DELETE** operations against GA environments through the [GA query syntax](ga-query-syntax.md). The APIs allow you to:

* Use the Time Series Insights scalable platform for analysis on the fly.
* Chunk time series intervals.
* Store low-latency time series data.
* Take advantage of Azure security and identity management.
* Perform repeated operations reliably.
* Stream events through secure WebSockets.

This article summarizes data-access capabilities in the GA APIs.

## API overview

Review the [GA query syntax](ga-query-syntax.md).

The following REST endpoints manage your Time Series Insights environment:

* [Get Environments API](./ga-query-api.md#get-environments-api)
* [Get Environment Availability API](./ga-query-api.md#get-environment-availability-api)
* [Get Environment Metadata API](./ga-query-api.md#get-environment-metadata-api)
* [Get Environment Events API](./ga-query-api.md#get-environment-events-api)
* [Get Environment Events Streamed API](./ga-query-api.md#get-environment-events-streamed-api)
* [Get Environment Aggregates API](./ga-query-api.md#get-environment-aggregates-api)
* [Get Environment Aggregates Streamed API](./ga-query-api.md#get-environment-aggregates-streamed-api)

The following REST endpoint manages your Time Series Insights GA reference data:

* [Reference Data API](./ga-reference-data-api.md)

## See also

To learn about request and authentication parameters, read [Authentication and authorization](https://docs.microsoft.com/azure/time-series-insights/time-series-insights-authentication-and-authorization).
