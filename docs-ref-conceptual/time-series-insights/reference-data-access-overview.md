---
ms.assetid:
ms.title: Data access concepts overview - Azure Time Series Insights Gen2 | Microsoft Docs
title: Data access concepts overview - Azure Time Series Insights Gen2 | Microsoft Docs
services: time-series-insights
ms.service: time-series-insights
service_description: Time Series Insights
description: Overview of REST API and data access concepts reference documentation for Azure Time Series Insights Gen2.
manager: deepakpalled
ms.manager: dpalled
author: shreyasharmamsft
ms.author: shresha
ms.date: 08/05/2020
---

# Azure Time Series Insights Gen2 data access concepts overview

The Azure Time Series Insights Gen2 APIs provide data access operations for Azure Time Series Insights Gen2 environments. Gen2 APIs are mostly structured around Time Series Model and provide REST **CREATE**, **READ**, **UPDATE**, and **DELETE** operations through the [Time Series Insights Expression syntax (TSX)](reference-time-series-expression-syntax.md).

> [!TIP]
> Batch operations and result pagination are supported for most query operations.

> [!NOTE]
>
> * Review [Authentication and authorization](https://docs.microsoft.com/azure/time-series-insights/time-series-insights-authentication-and-authorization) for required HTTP request headers and parameters.

## See also

For more information about APIs, see the following articles:

* [API limits](reference-api-limits.md)
* [Environments APIs](reference-environments-apis.md)
* [Model APIs](reference-model-apis.md)
* [Query APIs](reference-query-apis.md)
* [Time Series expression syntax](reference-time-series-expression-syntax.md)

For more information about application registration and the Azure Active Directory programming model, see [Azure Active Directory for developers](https://docs.microsoft.com/azure/active-directory/develop/active-directory-developers-guide).

To learn about request and authentication parameters, read [Authentication and authorization](https://docs.microsoft.com/azure/time-series-insights/time-series-insights-authentication-and-authorization).

Tools that assist with testing HTTP requests and responses include:

* [Fiddler](https://www.telerik.com/fiddler). This free web debugging proxy can intercept your REST requests, so you can diagnose the HTTP request and response messages.
* [JWT.io](https://jwt.io/). You can use this tool to quickly dump the claims in your bearer token and then validate their contents.
* [Postman](https://www.getpostman.com/). This is a free HTTP request and response testing tool for debugging REST APIs.

Learn more about Azure Time Series Insights Gen2 by reviewing the [Gen2 documentation](https://docs.microsoft.com/azure/time-series-insights/time-series-insights-update-overview).
