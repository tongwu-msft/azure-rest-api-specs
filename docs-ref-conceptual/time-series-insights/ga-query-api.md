---
ms.assetid: 
ms.title: General availability (GA) query API - Azure Time Series Insights | Microsoft Docs
title:  General availability (GA) query API - Azure Time Series Insights | Microsoft Docs
services: time-series-insights
ms.service: time-series-insights
service_description: Time Series Insights
description: Reference documentation for the Azure Time Series Insights general availability (GA) query REST APIs.
manager: deepakpalled
ms.manager: dpalled
author: yeskarthik
ms.author: Subramanian.Karthik
ms.date: 11/14/2019
---

# Azure Time Series Insights query API

This document describes various REST query APIs. REST APIs are service endpoints that support sets of HTTP operations (methods), which enable you to query Time Series Insights environments.

> [!TIP]
> * Review [GA Query Syntax](./ga-query-syntax.md) for supported HTTP request body parameters and advanced query operations. 
> * Review [Authentication and authorization](https://docs.microsoft.com/azure/time-series-insights/time-series-insights-authentication-and-authorization) for required HTTP request headers and parameters.

> [!IMPORTANT]
> * Azure Time Series Insights uses the HTTPS protocol for the [Get Environments](#get-environments-api), [Get Environment Availability](#get-environment-availability-api), [Get Metadata](#get-environment-metadata-api), [Get Environment Events](#get-environment-events-api), and [Get Environment Aggregates](#get-environment-aggregates-api) APIs.
> * Azure Time Series Insights uses secure WebSockets (WSS) protocol for the [Get Environment Events Streamed](#get-environment-events-streamed-api) and [Get Aggregates Streamed](#get-environment-aggregates-streamed-api) APIs.

## Get Environments API

`GET https://api.timeseries.azure.com/environments?api-version=2016-12-12`

The Get Environments API returns the list of environments that the caller is authorized to access.

Request Body: None

Response Body:

```JSON
{
    "environments": [
        {
            "displayName":"Sensors",
            "environmentFqdn": "00000000-0000-0000-0000-000000000000.env.timeseries.azure.com",
            "environmentId":"00000000-0000-0000-0000-000000000000",
	     "resourceId": "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/RdxProdAssetsEastUs/providers/Microsoft.TimeSeriesInsights/environments/Sensors"
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

```JSON
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

```JSON
{
    "searchSpan": {
        "from": {"dateTime":"2016-08-01T00:00:00.000Z"},
        "to": {"dateTime":"2016-08-31T00:00:00.000Z"}
    }
}
```

Response Body:

```JSON
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

`POST https://<environmentFqdn>/events?api-version=<apiVersion>`

The Get Environment Events API returns a list of raw events matching the search span and predicate.

Input payload structure:
* Search span clause (mandatory).
* Predicate clause (optional).
* Limit clause (mandatory).

Payload examples (`predicate` and `searchSpan` are omitted for clarity):

Request Body:

```JSON
{
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
```

Response Body:

```JSON
{
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
}
```

Events can be sorted and limited to the top.
Sorting is supported on all property types. Sorting relies on comparison operators defined for *boolean expressions*.

> [!NOTE]
> Nested sorting (sort by two or more properties) is currently not supported.

## Get Environment Events Streamed API

`GET wss://<environmentFqdn>/events?api-version=<apiVersion>`

The Get Environment Events API returns a list of raw events matching the search span and predicate.

This API uses Web Sockets to do streaming and return partial results. It always returns additional events, that is, new message is additive to the previous one. New message contains new events that were not in the previous message. The previous message should be kept and accumulated with the new message.

Input payload structure:
* Search span clause (mandatory).
* Predicate clause (optional).
* Limit clause (mandatory).

Payload examples (`predicate` and `searchSpan` are omitted for clarity):

Request Message:

```JSON
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

```JSON
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

`POST https://<environmentFqdn>/aggregates?api-version=<apiVersion>`

The Get Environment Aggregates API groups events by given property with optionally measuring values of other properties.

Input payload structure:

* Search span clause (mandatory).
* Predicate clause (optional).
* Aggregates clause (mandatory).

Payload examples (`predicate` and `searchSpan` are omitted for clarity):

Request Body:

```JSON
{
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

Response Body:

```JSON
{
    "aggregates": [{
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
    }]
}
```

For numeric histogram, bucket boundaries are aligned to one of 10^n, 2x10^n or 5x10^n values.

If no measure expressions are specified and the list of events is empty, the response will be empty.
If measures are present, the response contains a single record with `null` dimension value, 0 value for count and `null` value for other kinds of measures.

## Get Environment Aggregates Streamed API

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

```JSON
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
}
```

Response Messages:

```JSON
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

```JSON
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

## Property Not Found Behavior

For properties referenced in the query, either as part of predicates or part of aggregates (measures), by default, the query tries to resolve the property in the global search span of the environment. If the property is found, then query succeeds else it fails. 

Users can however modify this behavior to treat properties as existing but with `null` values if they are not present in the environment. This can be done by setting the optional request header `x-ms-property-not-found-behavior with` value `UseNull`.

Possible values for the request header are `UseNull` or `ThrowError` (Default). When `UseNull` is set, the query succeeds despite properties not existing and the response will contain warnings that will contain the properties that are not found.

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
| Get Aggregates | Max number of measures | 20 | S1, S2 |  |

## Reporting Unresolved Properties

Property references can be specified for predicate, dimension, and measure expressions.
If a property with a specific name and type does not exist for a given search span, an attempt is made to resolve a property over a global time span.
An error or warning might be emitted depending on the success of resolution:

* If a property exists in the environment over a global time span, it is resolved appropriately and a warning is emitted to notify that the value of this property is `null` for a given search span.
* If a property does not exist in the environment, an error is emitted and query execution fails.

## Error Responses

If query execution fails, the JSON response payload contains an error response with the following structure:

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

| Http status code | Error code | Example of error message | Possible inner error codes |
|-|-|-|-|
| 400 | InvalidApiVersion | API version '2016' is not supported. Supported versions are '2016-12-12'. | - |
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
| 400 | InvalidUrl | The request URL '/a/b' could not be parsed. | - |
| 408 | RequestTimeout | Request timed out after '30' second(s). | - |
| 503 | TooManyRequests | Concurrent request count of '10' exceeded for environment '95880732-01b9-44ea-8d2d-4d764dfe1904'. | EnvRequestLimitExceeded |

## Warnings

A query API response may contain a list of warnings as `"warnings"` entry under the root of the HTTP response or WebSocket response message.
Currently warnings are generated if property is not found for a given search span but is found in an environment for global time span. It is also generated when the header `x-ms-property-not-found-behavior` is set to `UseNull` and a property that is referenced does not exist even in the global search span.

Each warning object may contain the following fields:

| Field name | Field type | Notes |
|--|--|--|
| code | String | One of predefined warning codes |
| message | String | Detailed warning message |
| target | String | Dot-separated JSON path to the JSON input payload entry causing the warning |
| warningDetails | Dictionary | Optional. Additional warning details, for example, the position in predicate string. |

Example of warnings for predicate, predicate string within predicate, dimension, and measure:

```JSON
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

## See also

For more information about application registration and the Azure Active Directory programming model, see [Azure Active Directory for developers](https://docs.microsoft.com/azure/active-directory/develop/active-directory-developers-guide).

To learn about request and authentication parameters, read [Authentication and authorization](https://docs.microsoft.com/azure/time-series-insights/time-series-insights-authentication-and-authorization).

Tools that assist with testing HTTP requests and responses include:

- [Fiddler](https://www.telerik.com/fiddler). This free web debugging proxy can intercept your REST requests, so you can diagnose the HTTP request and response messages.
- [JWT.io](https://jwt.io/). You can use this tool to quickly dump the claims in your bearer token and then validate their contents.
- [Postman](https://www.getpostman.com/). This is a free HTTP request and response testing tool for debugging REST APIs.

Learn more about Azure Time Series Insights by reviewing the [product documentation](https://docs.microsoft.com/azure/time-series-insights/time-series-insights-overview).
