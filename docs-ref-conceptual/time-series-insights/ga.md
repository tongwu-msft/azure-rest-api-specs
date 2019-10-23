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

# Data Access (GA)

There are three ways to access and view your Time Series Insights General Availability (GA) data. You can query with the [Azure Time Series Insights GA explorer](https://docs.microsoft.com/azure/time-series-insights/time-series-quickstart), create a query on behalf of an environment to be deployed using a custom URL, or you can create a custom application using the Time Series Insights GA Query API.

The Azure Time Series Insights GA Query APIs allow powerful REST *CREATE*, *READ*, *UPDATE*, and *DELETE* operations to be performed against GA environments using the [GA query syntax](ga-query-syntax.md). The APIs allow you to:

* Leverage Time Series Insights scalable platform for ad-hoc analysis on the fly.
* Time series interval chunking.
* Low latency time series data storage.
* Leverage best-in-class Azure security and identity management.
* Perform repeated operations with reliability and ease.
* Event streaming is supported through secure WebSockets.

This document provides a succinct summary of GA API Data Access capabilities.

## API overview

The Azure Time Series Insights GA APIs are composed of several primary APIs that are described below.

Review the [GA query syntax](ga-query-syntax.md).

### Environments API

The following REST endpoints manage your Time Series Insights environment:

* [Get Environments API](./ga-query-api.md#get-environments-api)
* [Get Environment Availability API](./ga-query-api.md#get-environment-availability-api)
* [Get Environment Metadata API](./ga-query-api.md#get-environment-metadata-api)
* [Get Environment Events API](./ga-query-api.md#get-environment-events-api)
* [Get Environment Events Streamed API](./ga-query-api.md#get-environment-events-streamed-api)
* [Get Environment Aggregates API](./ga-query-api.md#get-environment-aggregates-api)
* [Get Environment Aggregates Streamed API](./ga-query-api.md#get-environment-aggregates-streamed-api)

The following REST endpoints manage your Time Series Insights GA Reference Data:

* [Reference Data API](./ga-reference-data-api.md)

## See also

Read [Authentication and Authorization](https://docs.microsoft.com/azure/time-series-insights/time-series-insights-authentication-and-authorization) to learn about request and authentication parameters.