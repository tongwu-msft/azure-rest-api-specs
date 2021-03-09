---
ms.assetid:
ms.title: Environments APIs - Azure Time Series Insights Gen2 | Microsoft Docs
title: Environments APIs - Azure Time Series Insights Gen2 | Microsoft Docs
services: time-series-insights
ms.service: time-series-insights
service_description: Time Series Insights
description: Time Series Environments APIs and data access concepts reference documentation for Azure Time Series Insights Gen2.
manager: deepakpalled
ms.manager: dpalled
author: shreyasharmamsft
ms.author: shresha
ms.date: 03/05/2021
---

# Azure Time Series Insights Gen2 Environments APIs

The following REST endpoints manage your Azure Time Series Insights Gen2 environment. The Gen2 Environments APIs add HTTP **GET** request support for *event schemas* and *environment availability*. These features supplement the already supported [Gen1 Environments APIs](gen1-query-api.md).

## Overview

| API | Description |
| --- | --- |
| [Get Environments API](https://docs.microsoft.com/rest/api/time-series-insights/management(gen1/gen2)/environments/get) | Returns the list of environments that the caller is authorized to access. |
| [Get Environments Availability API](https://docs.microsoft.com/rest/api/time-series-insights/dataaccessgen2/query/getavailability) | Returns the distribution of event count over the event time stamp `$ts` . You can use this API to provide the landing experience in the environment. |
| [Get Event Schema API](https://docs.microsoft.com/rest/api/time-series-insights/dataaccessgen2/query/geteventschema) | Returns environment metadata for a search span. An event schema is returned as a set of property references. |

## See also

* For more information about application registration and the Azure Active Directory programming model, see [Azure Active Directory for developers](https://docs.microsoft.com/azure/active-directory/develop/active-directory-developers-guide).

* To learn about request and authentication parameters, read [Authentication and authorization](https://docs.microsoft.com/azure/time-series-insights/time-series-insights-authentication-and-authorization).

* Tools that assist with testing HTTP requests and responses include:

* [Fiddler](https://www.telerik.com/fiddler). This free web debugging proxy can intercept your REST requests, so you can diagnose the HTTP request and response messages.
* [JWT.io](https://jwt.io/). You can use this tool to quickly dump the claims in your bearer token and then validate their contents.
* [Postman](https://www.getpostman.com/). This is a free HTTP request and response testing tool for debugging REST APIs.

* Learn more about Azure Time Series Insights Gen2 by reviewing the [Gen2 documentation](https://docs.microsoft.com/azure/time-series-insights/time-series-insights-update-overview).
