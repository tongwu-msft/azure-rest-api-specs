---
ms.assetid:
ms.title: Azure Time Series Insights Gen2 API limits - Azure Time Series Insights Gen2 | Microsoft Docs
title: Azure Time Series Insights Gen2 API limits - Azure Time Series Insights Gen2 | Microsoft Docs
services: time-series-insights
ms.service: time-series-insights
service_description: Time Series Insights
description: API limits and data access concepts reference documentation for Azure Time Series Insights Gen2.
manager: deepakpalled
ms.manager: dpalled
author: shreyasharmamsft
ms.author: shresha
ms.date: 03/05/2021
---

# Azure Time Series Insights Gen2 API limits

This article describes the throughput, request, and concurrency limitations of the Time Series model and query APIs.

## Model API - limits

The following limits are applied during query execution to fairly utilize resources among multiple environments and users:

| Applicable APIs | Limit name | Limit value | SKUs affected |
|-|-|-|-|
| All | Max number of TSM objects per request | 10,000 or 8 MB | Gen2 |
| All | Max model request execution time | 30 seconds | Gen2 |
| All | Max number of instances per environment | 1,000,000 | Gen2 |
| All | Max number of instance fields per instance | 100 | Gen2 |
| All | Max number of types per environment | 1,000 | Gen2 |
| All | Max number of variables per type | 50 | Gen2 |
| All | Max number of hierarchies per environment | 32 | Gen2 |
| All | Max number of hierarchies associated with an instance | 32 | Gen2 |
| All | Max hierarchy depth | 32 | Gen2 |
| All | Max number of characters in type name, hierarchy name, instance fields name, Time Series ID property value, Time Series ID each property name, Time Series name | 1,024 | Gen2 |
| All | Max size per instance | 16 KB | Gen2 |

## Query APIs - limits

The following limits are applied during query execution to evenly utilize resources among environments and users:

| Applicable APIs | Limit name | Limit value | SKUs affected |
|-|-|-|-|
| [Get Availability](https://docs.microsoft.com/rest/api/time-series-insights/dataaccessgen2/query/getavailability), [Get EventSchema](https://docs.microsoft.com/rest/api/time-series-insights/dataaccessgen2/query/geteventschema), [Get Events](https://docs.microsoft.com/rest/api/time-series-insights/dataaccessgen2/query/execute#getevents), [Get Series](https://docs.microsoft.com/rest/api/time-series-insights/dataaccessgen2/query/execute#getseries), [Aggregate Series](https://docs.microsoft.com/rest/api/time-series-insights/dataaccessgen2/query/execute#aggregateseries) | Max number of concurrent requests per environment for Warm Store | 30 | Gen2 |
| [Get Availability](https://docs.microsoft.com/rest/api/time-series-insights/dataaccessgen2/query/getavailability), [Get EventSchema](https://docs.microsoft.com/rest/api/time-series-insights/dataaccessgen2/query/geteventschema), [Get Events](https://docs.microsoft.com/rest/api/time-series-insights/dataaccessgen2/query/execute#getevents), [Get Series](https://docs.microsoft.com/rest/api/time-series-insights/dataaccessgen2/query/execute#getseries), [Aggregate Series](https://docs.microsoft.com/rest/api/time-series-insights/dataaccessgen2/query/execute#aggregateseries) | Max number of concurrent requests per environment for Cold Store | 20 | Gen2 |
| [Get Events](https://docs.microsoft.com/rest/api/time-series-insights/dataaccessgen2/query/execute#getevents), [Get Series](https://docs.microsoft.com/rest/api/time-series-insights/dataaccessgen2/query/execute#getseries), [Aggregate Series](https://docs.microsoft.com/rest/api/time-series-insights/dataaccessgen2/query/execute#aggregateseries) | Max response size | 16 MB | Gen2 |
| [Get Events](https://docs.microsoft.com/rest/api/time-series-insights/dataaccessgen2/query/execute#getevents), [Get Series](https://docs.microsoft.com/rest/api/time-series-insights/dataaccessgen2/query/execute#getseries), [Aggregate Series](https://docs.microsoft.com/rest/api/time-series-insights/dataaccessgen2/query/execute#aggregateseries) | Max number of projected properties or variables | 50 | Gen2 |
| [Aggregate Series](https://docs.microsoft.com/rest/api/time-series-insights/dataaccessgen2/query/execute#aggregateseries) | Max number of intervals in the response | 200,000 | Gen2 |

## See also

* For more information about application registration and the Azure Active Directory programming model, see [Azure Active Directory for developers](https://docs.microsoft.com/azure/active-directory/develop/active-directory-developers-guide).

* To learn about request and authentication parameters, read [Authentication and authorization](https://docs.microsoft.com/azure/time-series-insights/time-series-insights-authentication-and-authorization).

* Tools that assist with testing HTTP requests and responses include:

* [Fiddler](https://www.telerik.com/fiddler). This free web debugging proxy can intercept your REST requests, so you can diagnose the HTTP request and response messages.
* [JWT.io](https://jwt.io/). You can use this tool to quickly dump the claims in your bearer token and then validate their contents.
* [Postman](https://www.getpostman.com/). This is a free HTTP request and response testing tool for debugging REST APIs.

* Learn more about Azure Time Series Insights Gen2 by reviewing the [Gen2 documentation](https://docs.microsoft.com/azure/time-series-insights/time-series-insights-update-overview).
