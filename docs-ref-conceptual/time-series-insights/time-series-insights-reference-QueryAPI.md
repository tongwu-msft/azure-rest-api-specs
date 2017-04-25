# Azure Time Series Insights Query API

This document describes various query APIs.

For the details of input format, see [Query Syntax](time-series-insights-reference-Query-Syntax.md).


## Common Headers and Parameters

For authentication and authorization, valid OAuth2.0 Bearer token must be passed in [Authorization header](/rest/api/#create-the-request). The token must be issued to `https://api.timeseries.azure.com/` resource (also known as "audience" in the token).

Optional request headers:
- `x-ms-client-request-id` - a client request id. Service logs this ID. Allows to trace operation end-to-end across services.
- `x-ms-client-session-id` - a client session id. Service logs this ID. Allows to trace a group of related operations end-to-end across services.
- `x-ms-client-application-name` - name of the application that generated this request. Service logs this value.

Response headers:
- `x-ms-request-id` - server generated request ID. Can be used to contact Microsoft to investigate a particular request.

## Get Environments API

`GET https://api.timeseries.azure.com/environments?api-version=2016-12-12`

Returns the list of available environments.

Request Body: None

Response Body:
```json
{
    "environments":[{
        "displayName":"Sensors",
        "environmentFqdn": "00000000-0000-0000-0000-000000000000.env.timeseries.azure.com",
        "environmentId":"00000000-0000-0000-0000-000000000000"
    }]
}
```

Here, `environmentFqdn` is unique Fully-Qualified Domain Name for environment used in per-environment query API requests below.

## Get Environment Availability API

`GET https://<environmentFqdn>/availability?api-version=2016-12-12`

Returns the distribution of event count over the event timestamp `$ts`.
This API can be used to provide landing experience of navigating to the environment.

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

Empty object is returned for environments with no events.
Environment availability is cached, and the response time does not depend on the number of events in an environment.

## Get Environment Metadata API

`GET https://<environmentFqdn>/metadata?api-version=2016-12-12`

Returns environment metadata for a given search span. Metadata is returned as a set of property references.

Input payload structure:
* Search span clause (mandatory).

Request Body:
```json
{
    "searchSpan": {
        "from": "2016-08-01T00:00:00.000Z",
        "to": "2016-08-31T00:00:00.000Z"
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

Time Series Insights internally caches and approximates metadata and may return more properties that are actually present in the exact events in the search span.
Empty `properties` array is returned for either empty environment or environment with no events in a given search span.
Built-in properties are not returned in the list of properties.

## Get Environment Events API

`GET wss://<environmentFqdn>/events?api-version=<apiVersion>`

Returns list of raw events matching the search span and predicate.

This API uses Web Sockets to do streaming and return partial results.
It always returns additional events, i.e. new message is additive to the previous one.
New message contains new events that were not in the previous message.
Previous message should be kept and accumulated with the new message.

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
All property types are supported to be sorted on. Sorting relies on comparison operators defined for *boolean expressions*.

> NOTE: Nested sorting (sort by two or more properties) is currently not supported.

## Get Environment Aggregates API

`GET wss://<environmentFqdn>/aggregates?api-version=<apiVersion>`

Groups events by given property with optionally measuring values of other properties.

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
            "aggregates": [{
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
                    }]
                }]
        }]
    }
}
```

Response Messages:
```json
{
    "headers" : {
        "x-ms-request-id" : "fa15156a-..."
    },
    "content" : {
        "aggregates": {
            "dimension": ["temp"],
            "aggregates": [{
                "dimension": [
                    "2015-12...", "2015-12...", "2015-12..."
                ],
                "measures": [
                    [
                        [81.3, 13],
                        [91.3, 14],
                        [101.3, 15]
                    ]
                ]
            }]
        }
    },
    "percentCompleted" : 10.0
}
```

```json
{
    "content" : {
        "aggregates": {
            "dimension": ["co2", "temp"],
            "aggregates": [{
                "dimension": [
                    "2015-12...", "2015-12...", "2015-12..."
                ],
                "measures": [
                    [
                        [456.7, 10],
                        [235.6, 11],
                        [678.2, 12]
                    ],
                    [
                        [81.3, 13],
                        [91.3, 14],
                        [101.3, 15]
                    ]
                ]
            }]
        }
    },
    "percentCompleted" : 100.0
}
```

For numeric histogram bucket boundaries are aligned to one of 10^n, 2x10^n or 5x10^n values.

If list of events is empty the response will be empty if no measure expressions are specified.
If measures are present, the response will contain a single record with `null` dimension value, 0 value for count and `null` value for other kinds of measures.

## Limits

The following limits are applied during query execution to fairly utilize resources among multiple environments and users:

| Applicable APIs | Limit name | Limit value | SKUs affected | Notes |
|-|-|-|-|-|
| All | Max request size | 32 KB | S1, S2 |  |
| Get Availability, Get Metadata, Get Events, Get Aggregates | Max number of concurrent requests per environment | 10 | S1, S2 |  |
| Get Events, Get Aggregates | Max response size | 16 MB | S1, S2 |  |
| Get Events, Get Aggregates | Max number of property references in predicate, including predicate string(s) | 50 | S1, S2 |  |
| Get Events, Get Aggregates | Max full-text search terms with no property reference in predicate string | 2 | S1, S2 | Example: `HAS 'abc'`, `'abc'` |
| Get Events | Max number of events in response | 10,000 | S1, S2 |  |
| Get Aggregates | Max number of dimensions | 3 | S1, S2 |  |
| Get Aggregates | Max total cardinality across all dimensions | 150,000 | S1, S2 |  |
| Get Aggregates | Max number of measures | 5 | S1, S2 |  |

## Reporting Unresolved Properties

Property references can be specified for predicate, dimension and measure expressions.
If property with specific name and type does not exist for a given search span an attempt is made to resolve a property over a global time span.
An error or warning might be emitted depending on the success of resolution:
* If property exists in the environment over a global time span, it is resolved appropriately and a warning is emitted to notify that the value of this property is `null` for a given search span.
* If property does not exists in the environment an error is emitted and query execution fails.

## Error Responses

If query execution fails, the JSON response payload contains error response with the following structure:
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

Query API response may contain a list of warnings as a sibling of `"content"` entry.
Currently warnings are generated if property is not found for a given search span but is found in an environment for global time span.

Each warning object may contain the following fields:

| Field name | Field type | Notes |
|--|--|--|
| code | String | One of predefined warning codes |
| message | String | Detailed warning message |
| target | String | Dot-separated JSON path to the JSON input payload entry causing the warning |
| warningDetails | Dictionary | Optional. Additional warning details, e.g. the position in predicate string. |

Example of warnings for predicate, predicate string within predicate, dimension and measure:
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
