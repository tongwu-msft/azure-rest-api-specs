---
ms.assetid:
title: Gen1 APIs landing page - Azure Time Series Insights Gen1 | Microsoft Docs
ms.title: Gen1 APIs landing page - Azure Time Series Insights Gen1 | Microsoft Docs
services: time-series-insights
ms.service: time-series-insights
service_description: Azure Time Series Insights
description: The Azure Time Series Insights Gen1 REST APIs provide powerful abilities to query and view data in your Gen1 environments.
manager: deepakpalled
ms.manager: dpalled
author: shreyasharmamsft
ms.author: shresha
ms.date: 03/05/2021
---

# Azure Time Series Insights Gen1 APIs

> [!CAUTION]
> This is a Gen1 article.

Azure Time Series Insights Gen1 enables you to query and view the data in your Azure Time Series Insights Gen1 environments three ways.

* You can query with the Azure Time Series Insights Gen1 Explorer
* Create a query on behalf of an environment to be deployed using a custom URL
* You can create a custom application using the [Azure Time Series Insights Gen1 query API](gen1-query-api.md) to achieve scenarios such as:

  * Leverage Azure Time Series Insights Gen1 scalable platform for ad-hoc analysis on the fly
  * Time series interval chunking
  * Low latency time series data storage
  * Leverage best-in-class Azure security and identity management
  * Perform repeated operations with reliability and ease

## API overview

The following REST endpoints manage your Azure Time Series Insights Gen1 environment:

* [Get Environments API](./gen1-query-api.md#get-environments-api)
* [Get Environment Availability API](./gen1-query-api.md#get-environment-availability-api)
* [Get Environment Metadata API](./gen1-query-api.md#get-environment-metadata-api)
* [Get Environment Events API](./gen1-query-api.md#get-environment-events-api)
* [Get Environment Events Streamed API](./gen1-query-api.md#get-environment-events-streamed-api)
* [Get Environment Aggregates API](./gen1-query-api.md#get-environment-aggregates-api)
* [Get Environment Aggregates Streamed API](./gen1-query-api.md#get-environment-aggregates-streamed-api)

## See also

For information about how to use the Azure Time Series Insights Gen1 Query API for custom applications, see [Gen1 query API](gen1-query-api.md).

For information about supported query constructs and input formats, see [Gen1 query syntax](gen1-query-syntax.md).
