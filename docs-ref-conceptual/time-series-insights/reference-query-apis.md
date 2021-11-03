---
ms.assetid:
ms.title: Azure Time Series Insights Gen2 Query APIs - Azure Time Series Insights Gen2 | Microsoft Docs
title: Azure Time Series Insights Gen2 Query APIs - Azure Time Series Insights Gen2 | Microsoft Docs
services: time-series-insights
ms.service: time-series-insights
service_description: Time Series Insights
description: Query API and data access concepts reference documentation for Azure Time Series Insights Gen2.
manager: deepakpalled
ms.manager: dpalled
author: shreyasharmamsft
ms.author: shresha
ms.date: 03/05/2021
---

# Azure Time Series Insights Gen2 Query APIs

## Overview

The [Query APIs](https://docs.microsoft.com/rest/api/time-series-insights/dataaccessgen2/query/execute) are constituted by three REST APIs, one API each for *events*, *series*, and *aggregates*.

The Query APIs return *event schema* and event counts over a specified time range through HTTP **GET** requests with optional pagination. *Series* and *aggregate series* information is also exposed through **GET** operations with optional pagination.

| API | Description
| --- | --- |
| [Get Events API](https://docs.microsoft.com/rest/api/time-series-insights/dataaccessgen2/query/execute#getevents) | Returns a list of raw events that match the search span and predicate. |
| [Get Series API](https://docs.microsoft.com/rest/api/time-series-insights/dataaccessgen2/query/execute#getseries) | Enables query and retrieval of Time Series Insights data from captured events by using data recorded on the wire through the variables defined in the model or provided inline. |
| [Aggregate Series API](https://docs.microsoft.com/rest/api/time-series-insights/dataaccessgen2/query/execute#aggregateseries) | Enables query and retrieval of Time Series Insights data from captured events by aggregating recorded data by using the aggregate or sample functions. |

The APIs also support a [variety of customized operations](https://docs.microsoft.com/rest/api/time-series-insights/dataaccessgen2/query/execute#examples) specified through the HTTP request JSON body. [Query definitions](https://docs.microsoft.com/rest/api/time-series-insights/dataaccessgen2/query/execute#definitions) can be used for common operations.

> [!IMPORTANT]
>
> * As part of the [upcoming changes to JSON flattening and escaping rules](https://docs.microsoft.com/azure/time-series-insights/ingestion-rules-update), arrays will be stored as **Dynamic** type. Payload properties stored as this type are **ONLY accessible through the Get Events API**.

## Error responses

If query execution fails, the JSON response payload will contain an error response that conforms to the following structure:

```JSON
{
    "error" : {
        "code" : "...",
        "message" : "...",
        "innerError" : {  
            "code" : "...",
            "message" : "...",
        }
    }
}
```

Here, `innerError` is optional. In addition to basic errors like malformed request, the following errors are returned:

| Http status code | Error code | Example error message | Possible innerError codes |
|-|-|-|-|
| 400 | InvalidApiVersion | API version '2016' is not supported. Supported versions are '2016-12-12', '2018-11-01-preview'. | - |
| 400 | InvalidUrl | The request URL '/a/b' could not be parsed. | - |
| 400 | InvalidInput | The given query 'aggregate' is not valid. Supported queries are 'getEvents','getSeries','aggregateSeries'. | InvalidQueryType |
| 400 | InvalidInput | The '$event.temperature.Double > 0' time series expression in 'projectedVariables.temperature.value' is not a valid property reference expression. | InvalidPropertyReferenceExpression |
| 400 | InvalidInput | The '$event.temperature.Double' time series expression in 'projectedVariables.temperature.filter' is invalid. It can only be a predicate expression that returns a boolean. | InvalidPredicateExpression |
| 400 | InvalidInput | The '$event.temperature.Double' time series expression in 'projectedVariables.temperature.aggregation' is invalid. It did not contain an aggregate expression. | InvalidAggregateExpression |
| 400 | InvalidInput | The '$event.temperature.Double > 0' time series expression in 'projectedVariables.temperature.value' is not a valid value expression of type 'numeric'. | InvalidValueExpression |
| 400 | InvalidInput | The value time series expression in 'projectedVariables.temperature.value' should not be specified or should be null for variable of kind 'aggregate'. | ValueExpressionShouldNotBeSpecified |
| 400 | InvalidInput | The value time series expression in 'projectedVariables.temperature.value' should be specified for variable kind 'numeric'. | ValueExpressionShouldBeSpecified |
| 400 | InvalidInput | The variable kind 'aggregate' is invalid for expression 'min($value)' in 'projectedVariables.temperature.aggregation'. | InvalidVariableKind |
| 400 | InvalidInput | The timespan '00.00:01' in 'interval' is not a valid ISO8601 timespan format. | InvalidTimeSpanFormat |
| 400 | InvalidInput | The instance with timeSeriesId '[\"ABC123\"]' is not found. | InstanceNotFound |
| 400 | InvalidInput | The instance with name 'timeSeriesName' is not found. | InstanceNotFound |
| 400 | InvalidInput | The instance with timeSeriesId '[\"ABC321\"]' cannot be deleted. There are already ingested events associated with this time series ID. | CannotDeleteInstance |
| 400 | InvalidInput | The environment with ID '5e19f688-83fb-4aee-8321-5c123ed016b7' does not support time series query APIs. | TimeSeriesQueryNotSupported |
| 400 | InvalidInput | The projected variable with name 'temperature' was not found in the type or inline variable definitions. | ProjectedVariableNotFound |
| 400 | InvalidInput | Unable to upsert type with ID '7e19g688-83fb-4aee-8321-5c123ed016b7' and name 'ABC123'. This name is already used by type with ID '6e19g688-83fb-4aee-8321-5c123ed016b7'. | NameAlreadyExists |
| 400 | InvalidInput | Unable to upsert hierarchy with ID '4e19g688-83fb-4aee-8321-7c123ed016b7' and name 'XYZ123'. This name is already used by hierarchy with ID '8e39g688-83fb-4aee-8321-5c123ed016b7'. | HierarchyNotDefined |
| 400 | InvalidInput | Number of instances exceeded the limit of '1,000,000'. | NumberOfInstancesExceededLimit |
| 400 | InvalidInput | Number of types exceeded the limit of '1000'. | NumberOfTypesExceededLimit |
| 400 | InvalidInput | Number of hierarchies exceeded the limit of '32'. | NumberOfHierarchiesExceededLimit |
| 400 | InvalidInput | The entity size is more than the maximum allowed size '16,384'. | ObjectSizeExceededLimit |
| 400 | InvalidInput | The object name 'ABC123' with length '6' exceeds the maximum allowed character limit of '5'. | NameExceededLimit |
| 408 | RequestTimeout | Request timed out after '30' second(s). | BatchRequestSizeExceededLimit |
| 503 | TooManyRequests | Concurrent request count of '30' exceeded for environment '95880732-01b9-44ea-8d2d-4d764dfe1904'. | EnvRequestLimitExceeded |

## See also

* For more information about application registration and the Azure Active Directory programming model, see [Azure Active Directory for developers](https://docs.microsoft.com/azure/active-directory/develop/active-directory-developers-guide).

* To learn about request and authentication parameters, read [Authentication and authorization](https://docs.microsoft.com/azure/time-series-insights/time-series-insights-authentication-and-authorization).

* Tools that assist with testing HTTP requests and responses include:

* [Fiddler](https://www.telerik.com/fiddler). This free web debugging proxy can intercept your REST requests, so you can diagnose the HTTP request and response messages.
* [JWT.io](https://jwt.io/). You can use this tool to quickly dump the claims in your bearer token and then validate their contents.
* [Postman](https://www.getpostman.com/). This is a free HTTP request and response testing tool for debugging REST APIs.

* Learn more about Azure Time Series Insights Gen2 by reviewing the [Gen2 documentation](https://docs.microsoft.com/azure/time-series-insights/time-series-insights-update-overview).
