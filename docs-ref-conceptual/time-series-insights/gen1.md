---
ms.assetid: 
ms.title: Gen1 data access landing page - Azure Time Series Insights Gen1 | Microsoft Docs
title: Gen1 data access landing page - Azure Time Series Insights Gen1 | Microsoft Docs
services: time-series-insights
ms.service: time-series-insights
service_description: Azure Time Series Insights
description: Landing page and overview of REST API and data access reference documentation for Azure Time Series Insights Gen1.
manager: deepakpalled
ms.manager: dpalled
author: shreyasharmamsft
ms.author: shresha
ms.date: 03/05/2021
---

# Azure Time Series Insights Gen1 data access

> [!CAUTION]
> This is a Gen1 article.

There are three ways to access and view your data in Azure Time Series Insights Gen1. You can query by using the [Azure Time Series Insights Gen1 Explorer](https://docs.microsoft.com/azure/time-series-insights/time-series-quickstart), create a query on behalf of an environment to be deployed through a custom URL, or create a custom application by using the Azure Time Series Insights Gen1 Query APIs.

You can use the Azure Time Series Insights Gen1 Query APIs to perform REST **CREATE**, **READ**, **UPDATE**, and **DELETE** operations against GA environments through the [Gen1 query syntax](gen1-query-syntax.md). The APIs allow you to:

* Use the Azure Time Series Insights Gen1 scalable platform for analysis on the fly.
* Chunk time series intervals.
* Store low-latency time series data.
* Take advantage of Azure security and identity management.
* Perform repeated operations reliably.
* Stream events through secure WebSockets.

This article summarizes data-access capabilities in the Gen1 APIs.

Review the [Gen1 query syntax](gen1-query-syntax.md).

## API overview

The following REST endpoints manage your Azure Time Series Insights Gen1 environment:

* [Get Environments API](./gen1-query-api.md#get-environments-api)
* [Get Environment Availability API](./gen1-query-api.md#get-environment-availability-api)
* [Get Environment Metadata API](./gen1-query-api.md#get-environment-metadata-api)
* [Get Environment Events API](./gen1-query-api.md#get-environment-events-api)
* [Get Environment Events Streamed API](./gen1-query-api.md#get-environment-events-streamed-api)
* [Get Environment Aggregates API](./gen1-query-api.md#get-environment-aggregates-api)
* [Get Environment Aggregates Streamed API](./gen1-query-api.md#get-environment-aggregates-streamed-api)

The following REST endpoint manages your Azure Time Series Insights Gen1 reference data:

* [Reference Data API](./gen1-reference-data-api.md)

## See also

To learn about request and authentication parameters, read [Authentication and authorization](https://docs.microsoft.com/azure/time-series-insights/time-series-insights-authentication-and-authorization).
