---
ms.assetid:
ms.title: Azure Time Series Insights Gen2 Model APIs - Azure Time Series Insights Gen2 | Microsoft Docs
title: Azure Time Series Insights Gen2 Model APIs - Azure Time Series Insights Gen2 | Microsoft Docs
services: time-series-insights
ms.service: time-series-insights
service_description: Time Series Insights
description: Model APIs and data access concepts reference documentation for Azure Time Series Insights Gen2.
manager: deepakpalled
ms.manager: dpalled
author: shreyasharmamsft
ms.author: shresha
ms.date: 03/05/2021
---

# Azure Time Series Insights Gen2 Model APIs

## Overview

Each of the three components that make a [Time Series Model](https://docs.microsoft.com/azure/time-series-insights/time-series-insights-update-tsm) (*instances*, *hierarchies*, and *types*) have corresponding REST APIs that support **CREATE**, **READ**, **UPDATE**, and **DELETE**, paginated, and/or batch operations.

* The [Instance API](#instances-api) supports paginated **GET** operations, batch **CREATE**, **READ**, **UPDATE**, and **DELETE** operations, search, and keyword suggestions for search operations.
* The [Hierarchy API](#hierarchies-api) supports paginated **GET** operations and batch **CREATE**, **READ**, **UPDATE**, and **DELETE** operations.
* The [Type API](#types-api) supports paginated **GET** operations and batch **CREATE**, **READ**, **UPDATE**, and **DELETE** operations.

A fourth API provides REST support for Time Series Model settings:

* The [Model Settings API](#model-settings-api) supports HTTP **GET** and **UPDATE** operations for Time Series Model configuration settings.
Read [Time Series Model](https://docs.microsoft.com/azure/time-series-insights/time-series-insights-update-tsm) for detailed information about Time Series Model and *instance*, *hierarchy*, and *type* definitions.

## Instances API

The [Instances API](https://docs.microsoft.com/rest/api/time-series-insights/dataaccessgen2/timeseriesinstances) enables **CREATE**, **READ**, **UPDATE**, and **DELETE** operations to be performed on Time Series Instances:

* The [Get Instances API](https://docs.microsoft.com/rest/api/time-series-insights/dataaccessgen2/timeseriesinstances/list) returns all the Time Series Instances that match the request.
* The [Manage Instances API](https://docs.microsoft.com/rest/api/time-series-insights/dataaccessgen2/timeseriesinstances/executebatch) enables batch operations on instances. All operations against this API are HTTP **POST** operations. Each operation accepts a payload. The payload is a JSON object. This object defines a single property. The property key is the name of an operation allowed by the API. Supported operations are **PUT**, **UPDATE**, and **DELETE**.
* These APIs enable discovery of Time Series Instances:

  * [Suggest](https://docs.microsoft.com/rest/api/time-series-insights/dataaccessgen2/timeseriesinstances/suggest) will enable autocomplete scenarios while searching for an instance.
  * [Search](https://docs.microsoft.com/rest/api/time-series-insights/dataaccessgen2/timeseriesinstances/search) helps in identifying the instances based on the keywords provided.

   > [!TIP]
   > Read about [Search query features](#search-features) below.

## Hierarchies API

The [Hierarchies API](https://docs.microsoft.com/rest/api/time-series-insights/dataaccessgen2/timeserieshierarchies) enables **CREATE**, **READ**, **UPDATE**, and **DELETE** on Time Series Hierarchies.

| API | Description |
| --- | --- |
| [Get Hierarchies API](https://docs.microsoft.com/rest/api/time-series-insights/dataaccessgen2/timeserieshierarchies/list) | Returns all the Time Series Hierarchies that match the request. |
| [Manage Hierarchies APIs](https://docs.microsoft.com/rest/api/time-series-insights/dataaccessgen2/timeserieshierarchies/executebatch) | Enables batch operations on hierarchies. All operations against this API are HTTP **POST** operations. Each operation accepts a payload. The payload is a JSON object. This object defines a single property. The property key is the name of an operation that the API allows. Supported operations are **PUT**, **UPDATE**, and **DELETE**. |

## Types API

The [Types API](https://docs.microsoft.com/rest/api/time-series-insights/dataaccessgen2/timeseriestypes) enables **CREATE**, **READ**, **UPDATE**, and **DELETE** on Time Series Types and their associated variables.

| API | Description |
| --- | --- |
| [Get Types API](https://docs.microsoft.com/rest/api/time-series-insights/dataaccessgen2/timeseriestypes/list) | Returns all the Time Series Types and their associated variables. |
| [Post Types API](https://docs.microsoft.com/rest/api/time-series-insights/dataaccessgen2/timeseriestypes/executebatch) |Enables batch operations on types. All operations against this API are HTTP **POST** operations. Each operation accepts a payload. The payload is a JSON object. This object defines a single property. The property key is the name of an operation that the API allows. Supported operations are **PUT**, **UPDATE**, and **DELETE**. |

## Model Settings API

The [Model Settings API](https://docs.microsoft.com/rest/api/time-series-insights/dataaccessgen2/modelsettings) enables **CREATE**, **READ**, **UPDATE**, and **DELETE** on automatically created models in the environment by **TimeSeriesIds**.

| API | Description |
| --- | --- |
| [Get Model Settings API](https://docs.microsoft.com/rest/api/time-series-insights/dataaccessgen2/modelsettings/get) | Returns the auto created model in the environment for **TimeSeriesIds**. |
| [Update Model Settings API](https://docs.microsoft.com/rest/api/time-series-insights/dataaccessgen2/modelsettings/update) | Updates the model in the environment for **TimeSeriesIds** with the new values provided in the request. |

## Search features

### Wildcard searches

We support single and multiple character wildcard searches within single terms (not within phrase searches).

#### Single character

To perform a single character wildcard search, use the `?` symbol. The single character wildcard search looks for terms that match the string with the single character replaced.

To search for either `text` or `test`, search: `te?t`.

#### Multiple characters

To perform a multiple character wildcard search, use the `*` symbol. Multiple character wildcard searches look for zero or more characters.

To search for `test`, `tests`, or `tester`, use the search: `test*`.

You can also use the wildcard searches in the middle of a term. To search for `dryer`, you can use the search: `dr*r`.

### Boolean Operators

Boolean operators allow terms to be combined through logic operators. We support **AND**, **OR**,  **+**, **-**, and **NOT** as Boolean operators.

> [!IMPORTANT]
>
> * Boolean operators must be in ALL CAPS.
> * Boolean operators must be separated from search clauses using white-spaces.
> * `dryer AND washer` is valid but not `dryer ANDwasher`.

#### AND Operator

The **AND** operator matches documents where both terms exist anywhere in the text of a single document.

To search for documents that contain `dryer washer` and `foo bar` use the search: `dryer washer AND foo bar`.

> [!NOTE]
> The symbol `&&` can be used in place of the operator **AND**.

#### OR Operator

The **OR** operator links two terms and finds a matching document if either of the terms exist in a document. The **OR** operator is the default conjunction operator. This means that if there is no Boolean operator between two terms, the **OR** operator is used.

To search for documents that contain either `dryer washer` or just `dryer` use any one of the following searches:

1. `'dryer washer' dryer`
1. `'dryer washer' OR dryer`

> [!NOTE]
> The symbol `||` can be used in place of the operator **OR**.

#### + Operator

The **+** or required operator requires that the term after the `+` symbol exists somewhere in a field of a single document.

To search for documents that must contain `dryer` and may contain `washer` use the search: `+dryer washer`.

#### - Operator

The **-** or prohibit operator excludes documents that contain the term after the `-` symbol.

To search for documents that contain `dryer washer` but not `foo bar` use the search: `dryer washer -foo bar`.

#### NOT

The **NOT** operator excludes documents that contain the term after `NOT`.

To search for documents that contain `dryer washer` but not `foo bar` use the search: `dryer washer NOT foo bar`.

The **NOT** operator cannot be used with just one term.

The following search will return no results: `NOT dryer washer`.

> [!NOTE]
> The symbol `!` can be used in place of the operator **NOT**.
>
> * It must immediately precede the excluded search term.
> * `dryer !washer` is valid but not `dryer ! washer`.

## See also

* For more information about application registration and the Azure Active Directory programming model, see [Azure Active Directory for developers](https://docs.microsoft.com/azure/active-directory/develop/active-directory-developers-guide).

* To learn about request and authentication parameters, read [Authentication and authorization](https://docs.microsoft.com/azure/time-series-insights/time-series-insights-authentication-and-authorization).

* Tools that assist with testing HTTP requests and responses include:

* [Fiddler](https://www.telerik.com/fiddler). This free web debugging proxy can intercept your REST requests, so you can diagnose the HTTP request and response messages.
* [JWT.io](https://jwt.io/). You can use this tool to quickly dump the claims in your bearer token and then validate their contents.
* [Postman](https://www.getpostman.com/). This is a free HTTP request and response testing tool for debugging REST APIs.

* Learn more about Azure Time Series Insights Gen2 by reviewing the [Gen2 documentation](https://docs.microsoft.com/azure/time-series-insights/time-series-insights-update-overview).
