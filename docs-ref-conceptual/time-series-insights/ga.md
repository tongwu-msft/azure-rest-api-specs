---
ms.assetid: 
ms.title: General availability (GA) data access landing page - Azure Time Series Insights | Microsoft Docs
title: General availability (GA) data access landing page - Azure Time Series Insights | Microsoft Docs
services: time-series-insights
ms.service: time-series-insights
service_description: Time Series Insights
description: Landing page and overview of REST API and data access reference documentation for Azure Time Series Insights general availability (GA).
manager: deepakpalled
ms.manager: dpalled
author: yeskarthik
ms.author: Subramanian.Karthik
ms.date: 02/11/2020
---

# Azure Time Series Insights data access (GA)

There are three ways to access and view your data in Azure Time Series Insights general availability (GA). You can query by using the [Azure Time Series Insights GA explorer](https://docs.microsoft.com/azure/time-series-insights/time-series-quickstart), create a query on behalf of an environment to be deployed through a custom URL, or create a custom application by using the Time Series Insights GA Query APIs.

You can use the Azure Time Series Insights GA Query APIs to perform REST **CREATE**, **READ**, **UPDATE**, and **DELETE** operations against GA environments through the [GA query syntax](ga-query-syntax.md). The APIs allow you to:

* Use the Time Series Insights scalable platform for analysis on the fly.
* Chunk time series intervals.
* Store low-latency time series data.
* Take advantage of Azure security and identity management.
* Perform repeated operations reliably.
* Stream events through secure WebSockets.

This article summarizes data-access capabilities in the GA APIs.

> [!TIP]
> * Review [GA Query Syntax](./ga-query-syntax.md) for supported HTTP request body parameters and advanced query operations. 
> * Review [Authentication and authorization](https://docs.microsoft.com/azure/time-series-insights/time-series-insights-authentication-and-authorization) for required HTTP request headers and parameters.

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