---
ms.assetid:
title: General availability (GA) APIs landing page - Azure Time Series Insights | Microsoft Docs
ms.title: General availability (GA) APIs landing page - Azure Time Series Insights | Microsoft Docs
services: time-series-insights
ms.service: time-series-insights
service_description: Time Series Insights
description: The Azure Time Series Insights general availability (GA) REST APIs provide powerful abilities to query and view data in your GA environments.
manager: deepakpalled
ms.manager: dpalled
author: yeskarthik
ms.author: Subramanian.Karthik
ms.date: 12/31/2019
---

# Azure Time Series Insights general availability (GA) APIs

Time Series Insights enables you to query and view the data in your Time Series Insights environments three ways.

* You can query with the Time Series Insights explorer
* Create a query on behalf of an environment to be deployed using a custom URL
* You can create a custom application using the [Time Series Insights query API](ga-query-api.md) to achieve scenarios such as:

  - Leverage Time Series Insights scalable platform for ad-hoc analysis on the fly
  - Time series interval chunking
  - Low latency time series data storage
  - Leverage best-in-class Azure security and identity management
  - Perform repeated operations with reliability and ease

> [!TIP]
> * Review [GA Query Syntax](./ga-query-syntax.md) for supported HTTP request body parameters and advanced query operations. 
> * Review [Authentication and authorization](https://docs.microsoft.com/azure/time-series-insights/time-series-insights-authentication-and-authorization) for required HTTP request headers and parameters.

## API overview

The following REST endpoints manage your Time Series Insights environment:

* [Get Environments API](./ga-query-api.md#get-environments-api)
* [Get Environment Availability API](./ga-query-api.md#get-environment-availability-api)
* [Get Environment Metadata API](./ga-query-api.md#get-environment-metadata-api)
* [Get Environment Events API](./ga-query-api.md#get-environment-events-api)
* [Get Environment Events Streamed API](./ga-query-api.md#get-environment-events-streamed-api)
* [Get Environment Aggregates API](./ga-query-api.md#get-environment-aggregates-api)
* [Get Environment Aggregates Streamed API](./ga-query-api.md#get-environment-aggregates-streamed-api)

## See also

For information about how to use the Time Series Insights Query API for custom applications, see [Azure Time Series Insights query API](ga-query-api.md).

For information about supported query constructs and input formats, see [Azure Time Series Insights Query Syntax](ga-query-syntax.md).
