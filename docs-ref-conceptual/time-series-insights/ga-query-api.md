---
ms.assetid: 
ms.title: General availability (GA) Query API - Azure Time Series Insights | Microsoft Docs
title:  General availability (GA) Query API - Azure Time Series Insights | Microsoft Docs
services: time-series-insights
ms.service: time-series-insights
service_description: Time Series Insights
description: Reference documentation for the Azure Time Series Insights general availability (GA) Query REST APIs.
manager: deepakpalled
ms.manager: dpalled
author: yeskarthik
ms.author: Subramanian.Karthik
ms.date: 01/02/2019
---

# Azure Time Series Insights Query API

This article describes various REST Query APIs. REST APIs are service endpoints that support sets of HTTP operations (methods), which enable you to query Azure Time Series Insights environments.

> [!TIP]
> * Review [Azure Time Series Insights general availability (GA) query syntax](./ga-query-syntax.md) for supported HTTP request body parameters and advanced query operations. 
> * Review [Authentication and authorization for the Azure Time Series Insights API](https://docs.microsoft.com/azure/time-series-insights/time-series-insights-authentication-and-authorization) for required HTTP request headers and parameters.

> [!IMPORTANT]
> * Azure Time Series Insights uses the HTTPS Protocol for the [Get Environment](#get-environments-api), [Get Environment Availability](#get-environment-availability-api), [Get Metadata](#get-environment-metadata-api), [Get Environment Events](#get-environment-events-api), and [Get Environment Aggregates](#get-environment-aggregates-api) APIs.
> * Azure Time Series Insights uses the WebSocket Secure (WSS) Protocol for the [Get Environment Events Streamed](#get-environment-events-streamed-api) and [Get Aggregates Streamed](#get-environment-aggregates-streamed-api) APIs.

## Get Environment API

The Get Environment API returns the list of environments that the caller is authorized to access.

* Endpoint and operation:

  ```URL
  GET https://api.timeseries.azure.com/environments?api-version=2016-12-12
  ```

* Example request body: Not applicable

* Example response body:

    ```JSON
    {
      "environments": [
        {
          "displayName":"Sensors",
          "environmentFqdn": "00000000-0000-0000-0000-000000000000.env.timeseries.azure.com",
          "environmentId":"00000000-0000-0000-0000-000000000000",
          "resourceId": "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/RdxProdAssetsEastUs/providers/Microsoft.TimeSeriesInsights/environments/Sensors",
          "roles": [
            "Reader",
            "Contributor"
          ]
        }
      ]
    }
    ```

  > [!NOTE]
  > The response property **environmentFqdn** is a unique, fully-qualified domain name for the environment that's used in per-environment Query API requests.

## Get Environment Availability API

The Get Environment Availability API returns the distribution of event count over the event timestamp **$ts**. Environment availability is cached, and the response time does not depend on the number of events in an environment.

> [!TIP]
> The Get Environment Availability API can be used to initialize a front-end UI experience.

* Endpoint and operation:

  ```URL
  GET https://<environmentFqdn>/availability?api-version=2016-12-12
  ```

* Example request body: Not applicable

* Example response body:

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

   An empty object is returned for environments with no events. 

## Get Environment Metadata API

The Get Environment Metadata API returns environment metadata for a given search span. Metadata is returned as a set of property references. Azure Time Series Insights internally caches and approximates metadata and may return more properties that are present in the exact events in the search span.

* Endpoint and operation:

  ```URL
  POST https://<environmentFqdn>/metadata?api-version=2016-12-12
  ```

* Input payload structure:

  * Search span clause (mandatory)

* Example request body:

   ```JSON
   {
     "searchSpan": {
       "from": {"dateTime":"2016-08-01T00:00:00.000Z"},
       "to": {"dateTime":"2016-08-31T00:00:00.000Z"}
     }
   }
   ```

* Example response body:

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
       },
       {
         "name": "iothub-connection-device-id",
         "type": "String"
       }
     ]
   }
   ```
  
  An empty `properties` array is returned when the environment is empty or there are no events in a search span.
  
  Built-in properties are not returned in the list of properties.

## Get Environment Events API

The Get Environment Events API returns a list of raw events that match the search span and predicate.

* Endpoint and operation:

  ```URL
  POST https://<environmentFqdn>/events?api-version=<apiVersion>
  ```

* Input payload structure:

  * Search span clause (mandatory)
  * Predicate clause (optional)
  * Limit clause (mandatory)

* Example request body:

    ```JSON
    {
      "searchSpan": {
        "from": {
          "dateTime": "2019-12-30T00:00:00.000Z"
        },
        "to": {
          "dateTime": "2019-12-31T23:00:00.000Z"
        }
      },
      "predicateString": "PointValue.Double = 3.14",
      "top": {
        "sort": [
          {
            "input": {
              "builtInProperty": "$ts"
            },
              "order": "Asc"
            }
        ],
        "count": 1000
      }
   }
   ```

  > [!NOTE]
  > * Nested sorting (that is, sorting by two or more properties) is currently not supported.
  > * Events can be sorted and limited to the top.
  > * Sorting is supported on all property types. Sorting relies on comparison operators that are defined for *Boolean expressions*.

* Example response body:

    ```JSON
    {
      "warnings": [],
      "events": [
        {
          "schema": {
            "rid": 0,
            "$esn" : "buildingsensors",
            "properties" : [{
              "name" : "sensorId",
              "type" : "String"
            }, {
              "name" : "sensorValue",
              "type" : "String"
            }]
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

## Get Environment Events Streamed API

The Get Environment Events Streamed API returns a list of raw events that match the search span and predicate.

This API uses the WebSocket Secure Protocol to do streaming and return partial results. It always returns additional events. That is, the new message is additive to the previous one. The new message contains new events that were not in the previous message. The previous message should be kept when the new message is added.

* Endpoint and operation:

  ```URL
  GET wss://<environmentFqdn>/events?api-version=<apiVersion>
  ```

* Input payload structure:

  * Search span clause (mandatory)
  * Predicate clause (optional)
  * Limit clause (mandatory)

* Example request message:

    ```JSON
    {
      "headers" : {
        "Authorization":"Bearer <YOUR_AAD_OAUTH_TOKEN>",
        "x-ms-client-request-id" : "132gae-w343-41a1-2342-w23ta4532"
      },
      "content": {
        "searchSpan": {
          "from": "2017-04-30T23:00:00.000Z",
          "to": "2017-05-01T00:00:00.000Z"
        },
        "top": {
          "sort": [
            {
              "input": {
                "builtInProperty": "$ts"
              },
              "order": "Asc"
            }
          ],
          "count": 1000
        }
      }
    }
    ```

  > [!NOTE]
  > * Nested sorting (that is, sorting by two or more properties) is currently not supported.
  > * Events can be sorted and limited to the top.
  > * Sorting is supported on all property types. Sorting relies on comparison operators that are defined for *Boolean expressions*.

* Example response message:

    ```JSON
    {
      "headers": {
        "x-ms-request-id": "a325-a345-sy43-w332-a4qat36a2262"
      },
      "content": {
        "events": [
          {
            "schema": {
              "rid": 0,
              "$esn": "devicedata",
              "properties": [
                {
                  "name": "Id",
                  "type": "String"
                },
                {
                  "name": "TemperatureControlLevel",
                  "type": "Double"
                },
                {
                  "name": "Type",
                  "type": "String"
                },
                {
                  "name": "UnitVersion",
                  "type": "String"
                },
                {
                  "name": "Station",
                  "type": "String"
                },
                {
                  "name": "ProductionLine",
                  "type": "String"
                },
                {
                  "name": "Factory",
                  "type": "String"
                },
                {
                  "name": "Timestamp",
                  "type": "DateTime"
                }
              ]
            },
            "$ts": "2017-04-30T23:00:00Z",
            "values": [
              "82faa3c1-f11d-44f5-a1ca-e448f6123eee",
              0.9835468282931982,
              "temp control rate",
              "1.1.7.0",
              "Station5",
              "Line1",
              "Factory2",
              "2017-04-30T23:00:00Z"
            ]
          },
          {
            "schemaRid": 0,
            "$ts": "2017-04-30T23:00:00Z",
            "values": [
              "acb2f926-62cc-4a88-9246-94a26ebcaee3",
              0.8542095381579537,
              "temp control rate",
              "1.1.7.0",
              "Station2",
              "Line1",
              "Factory3",
              "2017-04-30T23:00:00Z"
            ]
          }
        ]
      },
      "warnings": [],
      "percentCompleted": 100
    }
    ```

## Get Environment Aggregates API

The Get Environment Aggregates API groups events by a specified property as it optionally measures the values of other properties.

> [!NOTE]
> Bucket boundaries support *10ⁿ*, *2×10ⁿ*, or *5×10ⁿ* values to align with and better support numeric histograms.

* Endpoint and operation:

  ```URL
  POST https://<environmentFqdn>/aggregates?api-version=<apiVersion>
  ```

* Input payload structure:

  * Search span clause (mandatory)
  * Predicate clause (optional)
  * Aggregates clause (mandatory)

* Example request body:

     ```JSON
    {
      "searchSpan": {
        "from": {
          "dateTime": "2019-12-30T00:00:00.000Z"
        },
        "to": {
          "dateTime": "2019-12-31T23:00:00.000Z"
        }
      },
      "predicateString": "PointValue.Double > 1000",
      "aggregates": [
        {
          "dimension": {
            "uniqueValues": {
              "input": {
                "property": "iothub-connection-device-id",
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
                "breaks": {
                  "size": "1h"
                }
              }
            },
            "measures": [
              {
                "min": {
                  "input": {
                    "property": "series.flowRate",
                    "type": "Double"
                  }
                }
              },
              {
                "count": {}
              }
            ]
          }
        }
      ]
    }
    ```

* Example response body:

    ```JSON
    {
      "aggregates": [
        {
          "dimension": [
            "Test-Device-A11342"
          ],
          "aggregate": {
            "dimension": [
              "2019-12-30T23:00:00Z",
              "2019-12-31T00:00:00Z"
            ],
            "measures": [
              [
                [
                  0.319668575730514,
                  2678
                ],
                [
                  0.08442680357734211,
                  1238
                ]
              ]
            ]
          }
        }
      ],
      "warnings": []
    }
    ```

    If no measure expressions are specified and the list of events is empty, the response will be empty.
    
    If measures are present, the response contains a single record with a `null` dimension value, a `0` value for count, and a `null` value for other kinds of measures.

## Get Environment Aggregates Streamed API

The Get Environment Aggregates Streamed API groups events by a specified property as it optionally measures the values of other properties:

* This API uses the WebSocket Secure Protocol for streaming and to return partial results.
* It always returns a replacement (snapshot) of all the values.
* Previous packets can be discarded by the client.

> [!NOTE]
> Bucket boundaries support *10ⁿ*, *2×10ⁿ*, or *5×10ⁿ* values to align with and better support numeric histograms.

* Endpoint and operation:

  ```URL
  GET wss://<environmentFqdn>/aggregates?api-version=<apiVersion>
  ```

* Input payload structure:

  * Search span clause (mandatory)
  * Predicate clause (optional)
  * Aggregates clause (mandatory)

* Example request message:

    ```JSON
    {
      "headers":{  
        "Authorization":"Bearer <YOUR_AAD_OAUTH_TOKEN>"
      },
      "content":{  
        "predicate":{  
          "predicateString":""
        },
        "searchSpan":{  
          "from":"2017-04-30T23:00:00.000Z",
          "to":"2017-05-01T00:00:00.000Z"
        },
        "aggregates":[{  
          "dimension":{  
            "dateHistogram":{  
              "input":{  
                "builtInProperty":"$ts"
              },
              "breaks":{  
                "size":"1m"
              }
            }
          },
          "measures":[{  
            "count":{}
          }]
        }]
      }
    }
    ```

* Example response messages:

    ```JSON
    {  
      "headers":{  
        "x-ms-request-id":"abc3243-23af-23ad-3224s-a32525age"
      },
      "content":[  
        {  
          "dimension":[  
            "2017-04-30T23:00:00Z",
            "2017-04-30T23:01:00Z",
            "2017-04-30T23:02:00Z",
            "2017-04-30T23:03:00Z",
            "2017-04-30T23:04:00Z"
          ],
          "measures":[  
            [ 722 ],
            [ 721 ],
            [ 722 ],
            [ 721 ],
            [ 722 ]
          ]
        }
      ],
      "warnings":[ ],
      "percentCompleted":100
    }
    ```

  If no measure expressions are specified and the list of events is empty, the response will be empty.
  
  If measures are present, the response contains a single record with a `null` dimension value, a `0` value for count, and a `null` value for other kinds of measures.

## Limits

The following limits are applied during query execution to fairly utilize resources among multiple environments and users:

| Applicable APIs | Limit name | Limit value | SKUs affected | Notes |
|-|-|-|-|-|
| All | Max request size | 32 KB | S1, S2 |  |
| Get Environment Availability, Get Environment Metadata, Get Environment Events, Get Environment Aggregates Streamed | Max number of concurrent requests per environment | 10 | S1, S2 |  |
| Get Environment Events, Get Environment Aggregates Streamed | Max response size | 16 MB | S1, S2 |  |
| Get Environment Events, Get Environment Aggregates Streamed | Max number of unique property references in predicate, including predicate string expressions | 50 | S1, S2 |  |
| Get Environment Events, Get Environment Aggregates Streamed | Max full-text search terms with no property reference in predicate string | 2 | S1, S2 | Example: `HAS 'abc'`, `'abc'` |
| Get Environment Events  | Max number of events in response | 10,000 | S1, S2 |  |
| Get Environment Aggregates Streamed | Max number of dimensions | 5 | S1, S2 |  |
| Get Environment Aggregates Streamed | Max total cardinality across all dimensions | 150,000 | S1, S2 |  |
| Get Environment Aggregates Streamed | Max number of measures | 20 | S1, S2 |  |

## Error handling and resolution

### Property Not Found behavior

For properties referenced in the query, either as part of predicates or part of aggregates (measures), by default, the query tries to resolve the property in the global search span of the environment. If the property is found, the query succeeds. If the property is not found, the query fails. 

However, you can modify this behavior to treat properties as existing but with `null` values if they are not present in the environment. You do this by setting the optional request header `x-ms-property-not-found-behavior` with the value `UseNull`.

Possible values for the request header are `UseNull` or `ThrowError` (default). When you set `UseNull` as the value, the query will succeed even though the properties do not exist, and the response will contain warnings that display the properties that are not found.

### Report unresolved properties

You can specify property references for predicate, dimension, and measure expressions. If a property with a specific name and type doesn't exist for a specified search span, an attempt is made to resolve a property over a global time span.

Depending on the success of resolution, the following warning or error might be emitted:

* If a property exists in the environment over a global time span, it is resolved appropriately, and a warning is emitted to notify you that the value of this property is `null` for a given search span.
* If a property does not exist in the environment, an error is emitted, and the query execution fails.

### Error responses

If the query execution fails, the JSON response payload contains an error response with the following structure:

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

Here, `innerError` is optional. In addition to basic errors, such as a malformed request, the following errors are returned:

| HTTP status code | Error code | Example of error message | Possible inner error codes |
|-|-|-|-|
| 400 | InvalidApiVersion | "API version '2016' is not supported. Supported versions are '2016-12-12'." | |
| 400 | InvalidInput | "Unable to parse predicate string." | `PredicateStringParseError` |
| 400 | InvalidInput | "Unable to translate predicate string." | `InvalidTypes`, `LimitExceeded`, `MissingOperand`, `InvalidPropertyType`, `InvalidLiteral`, `PropertyNotFound` |
| 400 | InvalidInput | "Multiple aggregates are not supported." | |
| 400 | InvalidInput | "Predicate property not found." | `PropertyNotFound` |
| 400 | InvalidInput | "Measure property not found." | `PropertyNotFound` |
| 400 | InvalidInput | "Dimension property not found." | `PropertyNotFound` |
| 400 | InvalidInput | "Number of measures exceeded limit." | `NumberOfMeasuresExceededLimit` |
| 400 | InvalidInput | "Aggregate depth exceeded limit." | `AggregateDepthExceededLimit` |
| 400 | InvalidInput | "Total cardinality exceeded limit." | `TotalCardinalityExceededLimit` |
| 400 | InvalidInput | "Property 'from' is missing." | `BreaksPropertyMissing` |
| 400 | InvalidInput | "Property 'to' is missing." | `BreaksPropertyMissing` |
| 400 | InvalidInput | "Request size exceeded limit." | `RequestSizeExceededLimit` |
| 400 | InvalidInput | "Response size exceeded limit." | `ResponseSizeExceededLimit` |
| 400 | InvalidInput | "Event count exceeded limit." | `EventCountExceededLimit` |
| 400 | InvalidInput | "Property reference count exceeded limit." | `PropertyReferenceCountExceededLimit` |
| 400 | InvalidMethod | "Only WebSocket requests are allowed on the path 'aggregates'." | |
| 400 | InvalidUrl | "The request URL '/a/b' could not be parsed." | |
| 408 | RequestTimeout | "Request timed out after '30' second(s)." | |
| 503 | TooManyRequests | "Concurrent request count of '10' exceeded for environment '95880732-01b9-44ea-8d2d-4d764dfe1904'." | `EnvRequestLimitExceeded` |

### Warnings

A Query API response may contain a list of warnings as `"warnings"` entry under the root of the HTTP response or WebSocket response message. Currently warnings are generated if property is not found for a given search span but is found in an environment for global time span. It is also generated when the header `x-ms-property-not-found-behavior` is set to `UseNull` and a property that is referenced does not exist even in the global search span.

Each warning object may contain the following fields:

| Field name | Field type | Notes |
|--|--|--|
| **code** | **String** | One of the predefined warning codes |
| **message** | **String** | A detailed warning message |
| **target** | **String** | A dot-separated JSON path to the JSON input payload entry causing the warning |
| **warningDetails** | **Dictionary** | Optional; additional warning details (for example, the position in predicate string) |

The following code presents examples of warnings for predicate, predicate string within predicate, dimension, and measure:

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
    "warningDetails": {
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

To learn about request and authentication parameters, see [Authentication and authorization](https://docs.microsoft.com/azure/time-series-insights/time-series-insights-authentication-and-authorization).

Tools that assist with testing HTTP requests and responses include:

- [Fiddler](https://www.telerik.com/fiddler). This free web debugging proxy can intercept your REST requests, so you can diagnose the HTTP request and response messages.
- [JWT.io](https://jwt.io/). You can use this tool to quickly dump the claims in your bearer token and then validate their contents.
- [Postman](https://www.getpostman.com/). This is a free HTTP request and response testing tool for debugging REST APIs.

Learn more about Azure Time Series Insights by reviewing the [Time Series Insights documentation](https://docs.microsoft.com/azure/time-series-insights/time-series-insights-overview).