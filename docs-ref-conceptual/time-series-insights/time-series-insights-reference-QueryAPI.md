---
title: Azure Time Series Insights Query API | Microsoft Docs
description: This topic describes the Azure Time Series Insights Query API
keywords:
services: time-series-insights
documentationcenter:
author: venkatgct
manager: almineev
editor: cgronlun

ms.assetid:
ms.service: time-series-insights
ms.devlang: na
ms.topic: data-acesss-api
ms.tgt_pltfrm: na
ms.workload: big-data
ms.date: 11/03/2017
ms.author: venkatja
---
# Azure Time Series Insights Query API

This document describes various REST query APIs. REST APIs are service endpoints that support sets of HTTP operations (methods), which enable you to query Time Series Insights environments. 

To better understand the API calls described in this document, see [Azure Time Series Insights Query Syntax](https://docs.microsoft.com/rest/api/time-series-insights/time-series-insights-reference-query-syntax).

## Components of a REST API request/response

Time Series Insights uses the HTTPS protocol for Get Environments, Get Availability, Get Metadata API.

Time Series Insights uses secure WebSockets protocol (WSS) for Get Aggregates and Get Events.

A REST API request/response pair can be separated into the following components:

- HTTP **method**: Time Series Insights query APIs support GET and POST methods. GET is used for requests that do not require method body and for WebSocket requests.

- The **request URI**, which consists of `{URI-scheme} :// {URI-host} / {resource-path} ? {query-string}`. 
  - `{URI scheme}` indicates the protocol used to transmit the request. Time Series Insights API uses HTTPS and WSS (secure WebSockets) depending on API.
  - URI host: 
    - `api.timeseries.azure.com` for Get Environments API
    - \<environmentFqdn> for per-environment APIs. You can obtain this domain name from the response of the Get Environments API, Azure portal, or Azure Resource Manager. For example, `00000000-0000-0000-0000-000000000000.env.timeseries.azure.com`
  - Resource path: For example environments can be used to query the list of Time Series Insights environments available for user.
  - Query string: Required parameter is api-version. For example, `api-version=2016-12-12`

- HTTP **request header** fields: For example, an Authorization header that provides a bearer token containing client authorization information for the request. For WebSocket requests, Authorization header and other headers are sent in the message under the headers container. See examples in the APIs below.

- HTTP **request message body**: optional for GET requests, and required for POST requests. Only JSON-encoded body is supported.

- HTTP **response message header** fields:
  - An HTTP status code: 200 for successful requests, or 4xx or 5xx for errors. See Errors section for more information.
  - Optional additional header fields, as required to support the request's response, such as a Content-type response header.

- HTTP **response message body**: JSON encoded response data.
 
Depending on your application, you may also need to register your client application with Azure Active Directory. For more information, see [Authentication and authorization for Azure Time Series Insights API
](https://docs.microsoft.com/en-us/azure/time-series-insights/time-series-insights-authentication-and-authorization).


## Common Headers and Parameters

Required URL query string parameters:
- `api-version=2016-12-12` – currently only supported API version.

Required request headers:

- `Authorization` for authentication and authorization, valid OAuth2.0 Bearer token must be passed in [Authorization header](/rest/api/#create-the-request). The token must be issued to `https://api.timeseries.azure.com/` resource (also known as "audience" in the token).

Optional request headers:
- `Content-type` - if specified, only `application/json` is supported.
- `x-ms-client-request-id` - a client request ID. Service records this value. Allows the service to trace operation across services.
- `x-ms-client-session-id` - a client session ID. Service records this value. Allows the service to trace a group of related operations across services.
- `x-ms-client-application-name` - name of the application that generated this request. Service records this value.

Response headers:
- `Content-type` - only `application/json` is supported.
- `x-ms-request-id` - server-generated request ID. Can be used to contact Microsoft to investigate a request.

## Get Environments API

`GET https://api.timeseries.azure.com/environments?api-version=2016-12-12`

The Get Environments API returns the list of environments that the caller is authorized to access.

Request Body: None

Response Body:
```json
{
    "environments": [
        {
            "displayName":"Sensors",
            "environmentFqdn": "00000000-0000-0000-0000-000000000000.env.timeseries.azure.com",
            "environmentId":"00000000-0000-0000-0000-000000000000",
	     "resourceId":
"/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/RdxProdAssetsEastUs/providers/Microsoft.TimeSeriesInsights/environments/Sensors"
        }
    ]
}

```

Here, `environmentFqdn` is unique fully qualified domain name for environment used in per-environment query API requests.

## Get Environment Availability API

`GET https://<environmentFqdn>/availability?api-version=2016-12-12`

The get Environments Availability API returns the distribution of event count over the event timestamp `$ts`. This API can be used to provide landing experience of navigating to the environment.

Request Body: None

Response Body:
```json
{
    "range": {
        "from": "2016-08-01T01:02:03Z",
        "to": "2016-08-31T03:04:05Z"
    },
    "intervalSize": "1h",
    "distribution": {
        "2016-08-01T00:00:00Z": 123,
        "2016-08-31T03:00:00Z": 345
    }
}
```

An empty object is returned for environments with no events. Environment availability is cached, and the response time does not depend on the number of events in an environment.

## Get Environment Metadata API

`POST https://<environmentFqdn>/metadata?api-version=2016-12-12`

The Get Environments Metadata API returns environment metadata for a given search span. Metadata is returned as a set of property references.

Input payload structure:
* Search span clause (mandatory).

Request Body:
```json
{
    "searchSpan": {
        "from": {"dateTime":"2016-08-01T00:00:00.000Z"},
        "to": {"dateTime":"2016-08-31T00:00:00.000Z"}
    }
}
```

Response Body:
```json
{
    "properties": [
        {
            "name": "sensorId",
            "type": "String"
        },
        {
            "name": "sensorValue",
            "type": "Double"
        }
    ]
}
```

Time Series Insights internally caches and approximates metadata and may return more properties that are present in the exact events in the search span.
An empty `properties` array is returned when the environment is empty or there are no events in a search span.
Built-in properties are not returned in the list of properties.

## Get Environment Events API

`GET wss://<environmentFqdn>/events?api-version=<apiVersion>`

The Get Environment Events API returns a list of raw events matching the search span and predicate.

This API uses Web Sockets to do streaming and return partial results. It always returns additional events, i.e. new message is additive to the previous one. New message contains new events that were not in the previous message. The previous message should be kept and accumulated with the new message.

Input payload structure:
* Search span clause (mandatory).
* Predicate clause (optional).
* Limit clause (mandatory).

Payload examples (`predicate` and `searchSpan` are omitted for clarity):

Request Message:
```json
{
    "headers" : {
        "Authorization" : "Bearer ... ",
        "x-ms-client-request-id" : "06be6306-..."
    },
    "content" : {
        "searchSpan" : {...},
        "predicate" : {...},
        "top" : {
            "sort" : [{
                "input" : {
                    "builtInProperty" : "$ts"
                },
                "order" : "Asc"
            }],
            "count" : 1000
        }
    }
}
```

Response Message:
```json
{
    "headers" : {
        "x-ms-request-id" : "fa15156a-..."
    },
    "content" : {
        "events" : [{
                "schema" : {
                    "rid" : 0,
                    "$esn" : "buildingsensors",
                    "properties" : [{
                            "name" : "sensorId",
                            "type" : "String"
                        }, {
                            "name" : "sensorValue",
                            "type" : "String"
                        }
                    ]
                },
                "$ts" : "2016-08-30T23:20:00Z",
                "values" : ["IndoorTemperatureSensor", 72.123]
            }, {
                "schemaRid" : 0,
                "$ts" : "2016-08-30T23:21:00Z",
                "values" : ["IndoorTemperatureSensor", 72.345]
            }
        ]
    },
    "percentCompleted" : 100.0
}

```

Events can be sorted and limited to the top.
Sorting is supported on all property types. Sorting relies on comparison operators defined for *boolean expressions*.

> [!NOTE]
> Nested sorting (sort by two or more properties) is currently not supported.

## Get Environment Aggregates API

`GET wss://<environmentFqdn>/aggregates?api-version=<apiVersion>`

The Get Environment Aggregates API groups events by given property with optionally measuring values of other properties.

This API use Web Sockets to do streaming and return partial results.
It always returns a replacement (snapshot) of all the values.
Previous packet can be discarded by the client.

Input payload structure:
* Search span clause (mandatory).
* Predicate clause (optional).
* Aggregates clause (mandatory).

Payload examples (`predicate` and `searchSpan` are omitted for clarity):

Request Message:
```json
{
    "headers" : {
        "Authorization" : "Bearer ... ",
        "client-request-id" : "06be6306-..."
    },
    "content" : {
        "searchSpan": {...},
        "predicate": {...},
        "aggregates": [{
            "dimension": {
                "uniqueValues": {
                    "input": {
                        "property": "sensorId",
                        "type": "String"
                    },
                    "take": 100
                }
            },
            "aggregate": {
                "dimension": {
                    "dateHistogram": {
                        "input": {
                            "builtInProperty": "$ts"
                        },
                        "breaks": { "size": "1m" }
                    }
                },
                "measures": [
                    {
                        "min": {
                            "input": {
                                "property": "sensorValue",
                                "type": "Double"
                            }
                        }
                    },
                    {
                        "count": {}
                    }
                ]
            }
        }]
    }

```

Response Messages:
```json
{
    "headers" : {
        "x-ms-request-id" : "fa15156a-..."
    },
    "content" : [{
        "dimension": ["temp"],
        "aggregate": {
            "dimension": [
                "2015-12-01T00:00:00", "2015-12-01T00:01:00", "2015-12-01T00:02:00"
            ],
            "measures": [
                [
                    [81.3, 13.0],
                    [91.3, 14.0],
                    [101.3, 15.0]
                ]
            ]
        }
    }],
    "percentCompleted" : 10.0
}


```

```json
{
    "content" : [{
        "dimension": ["co2", "temp"],
        "aggregate": {
            "dimension": [
                "2015-12-01T00:00:00", "2015-12-01T00:01:00", "2015-12-01T00:02:00"
            ],
            "measures": [
                [
                    [456.7, 10.0],
                    [235.6, 11.0],
                    [678.2, 12.0]
                ],
                [
                    [81.3, 13.0],
                    [91.3, 14.0],
                    [101.3, 15.0]
                ]
            ]
        }
    }],
    "percentCompleted" : 100.0
}


```

For numeric histogram, bucket boundaries are aligned to one of 10^n, 2x10^n or 5x10^n values.

If no measure expressions are specified and the list of events is empty, the response will be empty.
If measures are present, the response contains a single record with `null` dimension value, 0 value for count and `null` value for other kinds of measures.

## Limits

The following limits are applied during query execution to fairly utilize resources among multiple environments and users:

| Applicable APIs | Limit name | Limit value | SKUs affected | Notes |
|-|-|-|-|-|
| All | Max request size | 32 KB | S1, S2 |  |
| Get Availability, Get Metadata, Get Events, Get Aggregates | Max number of concurrent requests per environment | 10 | S1, S2 |  |
| Get Events, Get Aggregates | Max response size | 16 MB | S1, S2 |  |
| Get Events, Get Aggregates | Max number of unique property references in predicate, including predicate string expressions | 50 | S1, S2 |  |
| Get Events, Get Aggregates | Max full-text search terms with no property reference in predicate string | 2 | S1, S2 | Example: `HAS 'abc'`, `'abc'` |
| Get Events | Max number of events in response | 10,000 | S1, S2 |  |
| Get Aggregates | Max number of dimensions | 5 | S1, S2 |  |
| Get Aggregates | Max total cardinality across all dimensions | 150,000 | S1, S2 |  |
| Get Aggregates | Max number of measures | 5 | S1, S2 |  |

## Reporting Unresolved Properties

Property references can be specified for predicate, dimension, and measure expressions.
If a property with a specific name and type does not exist for a given search span, an attempt is made to resolve a property over a global time span.
An error or warning might be emitted depending on the success of resolution:
* If a property exists in the environment over a global time span, it is resolved appropriately and a warning is emitted to notify that the value of this property is `null` for a given search span.
* If a property does not exist in the environment, an error is emitted and query execution fails.

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
| 400 | InvalidInput | Unable to parse predicate string. | PredicateStringParseError |
| 400 | InvalidInput | Unable to translate predicate string. | InvalidTypes, LimitExceeded, MissingOperand, InvalidPropertyType, InvalidLiteral, PropertyNotFound |
| 400 | InvalidInput | Multiple aggregates are not supported. | - |
| 400 | InvalidInput | Predicate property not found. | PropertyNotFound |
| 400 | InvalidInput | Measure property not found. | PropertyNotFound |
| 400 | InvalidInput | Dimension property not found. | PropertyNotFound |
| 400 | InvalidInput | Number of measures exceeded limit. | NumberOfMeasuresExceededLimit |
| 400 | InvalidInput | Aggregate depth exceeded limit. | AggregateDepthExceededLimit |
| 400 | InvalidInput | Total cardinality exceeded limit. | TotalCardinalityExceededLimit |
| 400 | InvalidInput | Property 'from' is missing. | BreaksPropertyMissing |
| 400 | InvalidInput | Property 'to' is missing. | BreaksPropertyMissing |
| 400 | InvalidInput | Request size exceeded limit. | RequestSizeExceededLimit |
| 400 | InvalidInput | Response size exceeded limit. | ResponseSizeExceededLimit |
| 400 | InvalidInput | Event count exceeded limit. | EventCountExceededLimit |
| 400 | InvalidInput | Property reference count exceeded limit. | PropertyReferenceCountExceededLimit |
| 400 | InvalidMethod | Only WebSocket requests are allowed on the path 'aggregates'. | - |

## Warnings

A query API response may contain a list of warnings as a sibling of `"content"` entry.
Currently warnings are generated if property is not found for a given search span but is found in an environment for global time span.

Each warning object may contain the following fields:

| Field name | Field type | Notes |
|--|--|--|
| code | String | One of predefined warning codes |
| message | String | Detailed warning message |
| target | String | Dot-separated JSON path to the JSON input payload entry causing the warning |
| warningDetails | Dictionary | Optional. Additional warning details, for example, the position in predicate string. |

Example of warnings for predicate, predicate string within predicate, dimension, and measure:
```json
"warnings": [
    {
        "code": "PropertyNotFound",
        "message": "Predicate property 'X' of type 'String' is not found in local search span.",
        "target": "predicate.and[0].eq.left.property.name"
    },
    {
        "code": "PropertyNotFound",
        "message": "Predicate string property 'X' is not found in local search span.",
        "target": "predicate.and[1].predicateString",
        "warningDetails":
        {
            "startPos": 1,
            "endPos": 2,
            "line": 1,
            "col": 1
        }
    },
    {
        "code": "PropertyNotFound",
        "message": "Dimension property 'X' of type 'String' is not found in local search span.",
        "target": "aggregates.dimension.uniqueValues.input.property"
    },
    {
        "code": "PropertyNotFound",
        "message": "Measure property 'X' of type 'String' is not found in local search span.",
        "target": "aggregates.aggregates.measures[0].min.input.property"
    }
]
```
## More information

For more information about application registration and the Azure Active Directory programming model, see [Azure Active Directory for developers](https://docs.microsoft.com/azure/active-directory/develop/active-directory-developers-guide).

For information about testing HTTP requests/responses, see:

- [Fiddler](https://www.telerik.com/fiddler), which is a free web debugging proxy that can intercept your REST requests, making it easy to diagnose the HTTP request/ response messages.
- [JWT Decoder](http://jwt.calebb.net/) and [JWT.io](https://jwt.io/), which make it quick and easy to dump the claims in your bearer token so you can validate their contents.
