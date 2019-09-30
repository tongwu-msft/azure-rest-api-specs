---
title: Azure Time Series Insights (Preview) TSQ  | Microsoft Docs
description: This topic describes the Azure Time Series Insights (Preview) TSQ
keywords:
services: time-series-insights
documentationcenter:
author: TheGrungeByte
manager: cshankar
editor: 

ms.assetid:
ms.service: time-series-insights
ms.devlang: na
ms.topic: data-acesss-api
ms.tgt_pltfrm: na
ms.workload: big-data
ms.date: 11/13/2017
ms.author: 
---
# Azure Time Series Insights (Preview) Query API

This document describes various REST query APIs. REST APIs are service endpoints that support sets of HTTP operations (methods), which enable you to query Time Series Insights environments. 

To better understand the API calls described in this document, see [Azure Time Series Insights (Preview) Expression Syntax](preview-tsx.md).

## Components of a REST API request/response

Time Series Insights uses the HTTPS protocol for Get Environments, Get Availability, Get Event Schema API.

Time Series Insights uses secure WebSockets protocol (WSS) for Get Aggregates and Get Events.

A REST API request/response pair can be separated into the following components:

- HTTP **method**: Time Series Insights query APIs support GET and POST methods. GET is used for requests that do not require method body and for WebSocket requests.

- The **request URI**, which consists of `{URI-scheme} :// {URI-host} / {resource-path} ? {query-string}`. 
  - `{URI scheme}` indicates the protocol used to transmit the request. Time Series Insights API uses HTTPS and WSS (secure WebSockets) depending on API.
  - URI host: 
    - `api.timeseries.azure.com` for Get Environments API
    - \<environmentFqdn> for per-environment APIs. You can obtain this domain name from the response of the Get Environments API, Azure portal, or Azure Resource Manager. For example, `00000000-0000-0000-0000-000000000000.env.timeseries.azure.com`
  - Resource path: For example, environments can be used to query the list of Time Series Insights environments available for user.
  - Query string: Required parameter is api-version. For example, `api-version=2018-11-01-preview`

- HTTP **request header** fields: For example, an Authorization header that provides a bearer token containing client authorization information for the request. For WebSocket requests, Authorization header and other headers are sent in the message under the headers container. See examples in the APIs below.

- HTTP **request message body**: optional for GET requests, and required for POST requests. Only JSON-encoded body is supported.

- HTTP **response message header** fields:
  - An HTTP status code: 200 for successful requests, or 4xx or 5xx for errors. For more information, see Errors section.
  - Optional additional header fields, as required to support the request's response, such as a Content-type response header.

- HTTP **response message body**: JSON encoded response data.
 
Depending on your application, you may also need to register your client application with Azure Active Directory. For more information, see [Authentication and authorization for Azure Time Series Insights API](https://docs.microsoft.com/en-us/azure/time-series-insights/time-series-insights-authentication-and-authorization).


## Common Headers and Parameters

Required URL query string parameters:
- `api-version=2018-11-01-preview` – currently only supported API version.

Required request headers:

- `Authorization` for authentication and authorization, valid OAuth2.0 Bearer token must be passed in the [Authorization header](/rest/api/apimanagement/2019-01-01/apioperation/createorupdate). The token must be issued to `https://api.timeseries.azure.com/` resource (also known as "audience" in the token).

Optional URL query string parameters:
- `timeout=<timeout>` – server-side timeout for the request execution. Applicable only for Get Environment Events and Get Environment Aggregates API. Timeout value should be in ISO 8601 duration format, for example "PT20S" and should be in the range 1-30s. Default value is 30s.

Optional request headers:
- `Content-type` - if specified, only `application/json` is supported.
- `x-ms-client-request-id` - a client request ID. Service records this value. Allows the service to trace operation across services.
- `x-ms-client-session-id` - a client session ID. Service records this value. Allows the service to trace a group of related operations across services.
- `x-ms-client-application-name` - name of the application that generated this request. Service records this value.

Response headers:
- `Content-type` - only `application/json` is supported.
- `x-ms-request-id` - server-generated request ID. Can be used to contact Microsoft to investigate a request.

## Get Events API

`POST https://123f394f-a3c6-4cc2-b13a-55e2fcf57823.env.timeseries.azure.com/timeseries/query?api-version=2018-11-01-preview`

The Get Events API returns a list of raw events matching the search span and predicate.

Input payload structure:
* `timeSeriesId` (mandatory if `timeSeriesName` is not provided. Both `timeSeriesId` and `timeSeriesName` cannot be set.)
* `timeSeriesName` (mandatory if `timeSeriesId` is not provided. Both `timeSeriesId` and `timeSeriesName` cannot be set.)
* `searchSpan` clause (mandatory).
* `filter` clause (optional – For filtering the rows using a predicate. Ex: `$event.Status.String = 'Good'`).
* `projectedProperties` (optional – List of properties to be retrieved by the query. If not specified, all the properties will be retrieved. To specify the properties, both 'name' and 'type' of each property should be set.).

Payload examples:

Request Body:  
Using `timeSeriesId`
```json
{
  "getEvents": {
    "timeSeriesId": ["PU.123","W00158","ABN.9890"],
    "timeSeriesName" : null,
    "searchSpan": {
        "from":  "2016-08-01T00:00:00Z",
        "to":  "2016-08-01T00:16:50Z"
    },
    "filter": { "tsx": "($event.Value.Double != null) OR ($event.Status.String = 'Good')"
    },
    "projectedProperties": [{"name":"Building","type":"String"}, {"name":"Temperature","type":"Double"}]
  }
 }
```

OR  
Using `timeSeriesName`
```json
{
  "getEvents": {
    "timeSeriesId": null,
    "timeSeriesName" : "timeSeries1",
    "searchSpan": {
        "from": "2016-08-01T00:00:00Z",
        "to": "2016-08-01T00:16:50Z"
    },
    "filter": { "tsx": "($event.Value.Double != null) OR ($event.Status.String = 'Good')"
    },
    "projectedProperties": [{"name":"Building","type":"String"}, {"name":"Temperature","type":"Double"}]
  }
 }
```

Response Body:
```json
{
  "timestamps": [
    "2016-08-01T00:00:10Z",
    "2016-08-01T00:00:11Z",
    "2016-08-01T00:00:12Z",
    "2016-08-01T00:00:13Z",
    "2016-08-01T00:00:14Z",
    "2016-08-01T00:00:15Z",
    "2016-08-01T00:00:16Z",
    "2016-08-01T00:00:17Z",
    "2016-08-01T00:00:18Z",
    "2016-08-01T00:00:19Z"
  ],
  "properties": [
    {
      "name": "Building",
      "type": "String",
      "values": [
        "Millenium",
        "Millenium",
        "Millenium",
        "Millenium",
        "Millenium",
        "Millenium",
        "Millenium",
        "Millenium",
        "Millenium",
        "Millenium",
      ]
    },
    {
      "name": "Temperature",
      "type": "Double",
      "values": [
        65.125,
        65.375,
        65.625,
        65.875,
        66.125,
        66.375,
        66.625,
        66.875,
        67.125,
        67.375,
      ]
    }
  ],
  "progress": 100.0
}
```

Events can not be sorted at this time.

## Get Series API

`POST https://123f394f-a3c6-4cc2-b13a-55e2fcf57823.env.timeseries.azure.com/timeseries/query?api-version=2018-11-01-preview`

The Get Series API enables query and retrieval of Time Series Insights data from captured events by leveraging data recorded on the wire using the variables define in model or provided inline. Please note if interpolation and aggregation clause is provided in variable, or interval is specified, it will be ignored.

Input payload structure:
* `timeSeriesId` (mandatory if `timeSeriesName` is not provided. Both `timeSeriesId` and `timeSeriesName` cannot be set.)
* `timeSeriesName` (mandatory if `timeSeriesId` is not provided. Both `timeSeriesId` and `timeSeriesName` cannot be set.)
* `filter` clause (optional – For filtering the rows using a predicate. Ex: `$event.Status.String = 'Good'`).
* `inlineVariables` (optional – If specified the variable definition stored in the model part of types is overwritten by this definition, only if the name matches).
* `projectedVariables` (optional – If specified only the mentioned variables are retrieved part of the result, else all variables from model are considered for querying).

Payload examples:

Request Body:  
Using `timeSeriesId`
```json
{
  "getSeries": {
    "timeSeriesId": ["Millenium","Kitchen","Cooker"],
    "timeSeriesName" : null,
    "searchSpan": {
        "from":  "2016-08-01T00:00:00Z",
        "to":  "2016-08-01T00:16:50Z"
    },
    "filter": null,
    "inlineVariables": {
        "temperatures": {
            "kind": "numeric",
            "value": { "tsx": "$event.Temperature"},
            "filter": null,
            "aggregation": null
        }
    },
    "projectedVariables": ["temperatures"]
  }
}
```
OR  
Using `timeSeriesName`

```json
{
  "getSeries": {
    "timeSeriesId": null,
    "timeSeriesName" : "timeSeries1",
    "searchSpan": {
        "from": "2016-08-01T00:00:00Z",
        "to": "2016-08-01T00:16:50Z"
    },
    "filter": null,
    "inlineVariables": {
        "temperatures": {
            "kind": "numeric",
            "value": { "tsx": "$event.Temperature"},
            "filter": null,
            "aggregation": null
        }
    },
    "projectedVariables": ["temperatures"]
  }
}
```

Response Body:
```json
{
  "timestamps": [
    "2016-08-01T00:00:10Z",
    "2016-08-01T00:00:11Z",
    "2016-08-01T00:00:12Z",
    "2016-08-01T00:00:13Z",
    "2016-08-01T00:00:14Z",
    "2016-08-01T00:00:15Z",
    "2016-08-01T00:00:16Z",
    "2016-08-01T00:00:17Z",
    "2016-08-01T00:00:18Z",
    "2016-08-01T00:00:19Z",
    "2016-08-01T00:00:20Z"
  ],
  "properties": [
    {
      "name": "temperatures",
      "type": "Double",
      "values": [
        65.125,
        65.375,
        65.625,
        65.875,
        66.125,
        66.375,
        66.625,
        66.875,
        67.125,
        67.375,
        67.625
      ]
    }
  ],
  "progress": 100.0
}
```

Inline variables can override variable definition stored in model part of types.

## Aggregate Series API

`POST https://123f394f-a3c6-4cc2-b13a-55e2fcf57823.env.timeseries.azure.com/timeseries/query?api-version=2018-11-01-preview`

The Aggregate Series API enables query and retrieval of Time Series Insights data from captured events by aggregating recorded data using the aggregate or sample functions. 

Input payload structure:
* `timeSeriesId` (mandatory if `timeSeriesName` is not provided. Both `timeSeriesId` and `timeSeriesName` cannot be set.)
* `timeSeriesName` (mandatory if `timeSeriesId` is not provided. Both `timeSeriesId` and `timeSeriesName` cannot be set.)
* `interval` (mandatory).
* `filter` clause (optional – For filtering the rows using a predicate. Ex: `$event.Status.String = 'Good'`)
* `inlineVariables` (optional – This enables creation of variables by specifying aggregate functions such as sum, max, etc. If the name of variable matches with variable definition stored in the model part of types, the definition is overwritten).
* `projectedVariables` (optional – If specified only the mentioned variables are retrieved part of the result, else all variables from model are considered for querying).

Payload examples:

Request Body:  
Using `timeSeriesId`
```json
{
  "aggregateSeries": {
    "timeSeriesId": ["Millenium","Kitchen","Cooker"],
    "timeSeriesName" : null,
    "searchSpan": {
        "from":  "2016-08-01T00:00:00Z",
        "to":  "2016-08-01T00:16:50Z"
    },
    "filter": null,
    "interval": "PT1M",
    "inlineVariables": {
        "Count": {
            "kind": "Aggregate",
            "value": null,
            "filter": null,
            "aggregation": {"tsx": "count()"}
        },
        "MinTemperature": {
            "kind": "numeric",
            "value": {"tsx": "$event.Temperature"},
            "filter": null,
            "aggregation": {"tsx": "min($value)"}
        },
        "MaxTemperature": {
            "kind": "numeric",
            "value": {"tsx": "$event.Temperature"},
            "filter": null,
            "aggregation": {"tsx": "max($value)"}
        }
    },
    "projectedVariables": ["Count","MinTemperature","MaxTemperature"]
  }
}
```
OR  
Using `timeSeriesName`
```json
{
  "aggregateSeries": {
    "timeSeriesId": null,
    "timeSeriesName" : "timeSeries1",
    "searchSpan": {
        "from": "2016-08-01T00:00:00Z",
        "to": "2016-08-01T00:16:50Z"
    },
    "filter": null,
    "interval": "PT1M",
    "inlineVariables": {
        "Count": {
            "kind": "Aggregate",
            "value": null,
            "filter": null,
            "aggregation": {"tsx": "count()"}
        },
        "MinTemperature": {
            "kind": "numeric",
            "value": {"tsx": "$event.Temperature"},
            "filter": null,
            "aggregation": {"tsx": "min($value)"}
        },
        "MaxTemperature": {
            "kind": "numeric",
            "value": {"tsx": "$event.Temperature"},
            "filter": null,
            "aggregation": {"tsx": "max($value)"}
        }
    },
    "projectedVariables": ["Count","MinTemperature","MaxTemperature"]
  }
}
```

Response Body:
```json
{
  "timestamps": [
    "2016-08-01T00:00:00Z",
    "2016-08-01T00:01:00Z",
    "2016-08-01T00:02:00Z",
    "2016-08-01T00:03:00Z",
    "2016-08-01T00:04:00Z",
    "2016-08-01T00:05:00Z",
    "2016-08-01T00:06:00Z",
    "2016-08-01T00:07:00Z",
    "2016-08-01T00:08:00Z",
    "2016-08-01T00:09:00Z",
    "2016-08-01T00:10:00Z"
  ],
  "properties": [
    {
      "name": "Count",
      "type": "Double",
      "values": [
        50.0,
        60.0,
        60.0,
        60.0,
        60.0,
        60.0,
        60.0,
        60.0,
        60.0,
        60.0,
        null
      ]
    },
    {
      "name": "AverageTemperature",
      "type": "Double",
      "values": [
        71.25,
        85.0,
        82.5,
        80.0,
        89.166666666666671,
        75.0,
        90.0,
        75.833333333333329,
        85.0,
        82.5,
        null
      ]
    },
    {
      "name": "MinTemperature",
      "type": "Double",
      "values": [
        65.125,
        77.625,
        65.125,
        72.625,
        65.125,
        67.625,
        82.625,
        65.125,
        77.625,
        65.125,
        null
      ]
    },
    {
      "name": "MaxTemperature",
      "type": "Double",
      "values": [
        77.375,
        92.375,
        99.875,
        87.375,
        99.875,
        82.375,
        97.375,
        99.875,
        92.375,
        99.875,
        null
      ]
    }
  ],
  "progress": 100.0
}
```

Inline variables can override variable definition stored in model part of types.

## Limits

The following limits are applied during query execution to fairly utilize resources among multiple environments and users:

| Applicable APIs | Limit name | Limit value | SKUs affected |
|-|-|-|-|
| Get Availability, Get EventSchema, Get Events, Get Series, Aggregate Series | Max number of concurrent requests per environment | 10 | L1 |
| Get Events, Get Series, Aggregate Series | Max response size | 16 MB | L1 |
| Get Events, Get Series, Aggregate Series | Max number of projected properties or variables | 50 | L1 |
| Aggregate Series | Max number of intervals in the response | 200,000 | L1 |


## Error Responses

If query execution fails, the JSON response payload contains an error response with the following structure:
```json
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

| Http status code | Error code | Example of error message | Possible inner error codes |
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
| 400 | InvalidInput | The variable kind 'aggregate' is invalid for expression 'min($value)' in 'projectedVariables.temperature.aggregation' . | InvalidVariableKind |
| 400 | InvalidInput | The timespan '00.00:01' in 'interval' is not a valid ISO8601 timespan format. | InvalidTimeSpanFormat |
| 400 | InvalidInput | The instance with timeSeriesId '[\"ABC123\"]' is not found. | InstanceNotFound |
| 400 | InvalidInput | The instance with name 'timeSeriesName' is not found. | InstanceNotFound |
| 400 | InvalidInput | The instance with timeSeriesId '[\"ABC321\"]' cannot be deleted. There is already ingested events associated with this time series id. | CannotDeleteInstance |
| 400 | InvalidInput | The environment with id '5e19f688-83fb-4aee-8321-5c123ed016b7' does not support time series query APIs. | TimeSeriesQueryNotSupported |
| 400 | InvalidInput | The projected variable with name 'temperature' was not found in the type or inline variable definitions. | ProjectedVariableNotFound |
| 400 | InvalidInput | Unable to upsert type with id '7e19g688-83fb-4aee-8321-5c123ed016b7' and name 'ABC123'. This name is already used by type with id '6e19g688-83fb-4aee-8321-5c123ed016b7'. | NameAlreadyExists |
| 400 | InvalidInput | Unable to upsert hierarchy with id '4e19g688-83fb-4aee-8321-7c123ed016b7' and name 'XYZ123'. This name is already used by hierarchy with id '8e39g688-83fb-4aee-8321-5c123ed016b7'. | HierarchyNotDefined |
| 400 | InvalidInput | Number of instances exceeded the limit of '500,000'. | NumberOfInstancesExceededLimit |
| 400 | InvalidInput | Number of types exceeded the limit of '1000'. | NumberOfTypesExceededLimit |
| 400 | InvalidInput | Number of hierarchies exceeded the limit of '32'. | NumberOfHierarchiesExceededLimit |
| 400 | InvalidInput | The entity size is more than the maximum allowed size '16,384'. | ObjectSizeExceededLimit |
| 400 | InvalidInput | The object name 'ABC123' with length '6' exceeds the maximum allowed character limit of '5'. | NameExceededLimit |
| 408 | RequestTimeout | Request timed out after '30' second(s). | BatchRequestSizeExceededLimit |
| 503 | TooManyRequests | Concurrent request count of '10' exceeded for environment '95880732-01b9-44ea-8d2d-4d764dfe1904'. | EnvRequestLimitExceeded |

## More information

For more information about application registration and the Azure Active Directory programming model, see [Azure Active Directory for developers](https://docs.microsoft.com/azure/active-directory/develop/active-directory-developers-guide).

For information about testing HTTP requests/responses, see:

- [Fiddler](https://www.telerik.com/fiddler), which is a free web debugging proxy that can intercept your REST requests, making it easy to diagnose the HTTP request/ response messages.
- [JWT.io](https://jwt.io/) makes it quick and easy to dump the claims in your bearer token so you can validate their contents.
