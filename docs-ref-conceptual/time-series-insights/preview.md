---
ms.assetid:
ms.title: Azure Time Series REST API | Microsoft Docs
title: Azure Time Series Insights Preview data access landing  | Microsoft Docs
services: time-series-insights
ms.service: time-series
service_description: Time Series Insights
description: This landing page summarizes API information for Azure Time Series Insights Preview.
manager: cshankar
ms.manager: jhubbard
author: KingdomOfEnds
ms.author: v-adgera
ms.date: 10/21/2019
---

# Data access concepts (Preview)

The Azure Time Series Insights Preview APIs provide data access operations for Azure Time Series Insights Preview environments. Preview APIs are mostly structured around Time Series Model and provide REST **CREATE**, **READ**, **UPDATE**, and **DELETE** operations through the Time Series Insights Preview [query expression language (TSX)](#time-series-expression-and-syntax).

> [!TIP]
> Batch operations and result pagination are supported for most query operations.

> [!NOTE]
> * Review the [Time Series Insights Expression syntax](#time-series-expression-and-syntax) for supported HTTP request body parameters and advanced query operations.
> * Review [Authentication and authorization](https://docs.microsoft.com/azure/time-series-insights/time-series-insights-authentication-and-authorization) for required HTTP request headers and parameters.

## Preview Environments APIs

The following REST endpoints manage your Time Series Insights Preview environment. The Preview Environments APIs add HTTP **GET** request support for *event schemas* and *environment availability*. These features supplement the already supported [GA Environments APIs](ga-query-api.md).

| API | Description |
| --- | --- |
| [Get Environments API](https://docs.microsoft.com/rest/api/time-series-insights/management/environments/get) | Returns the list of environments that the caller is authorized to access. | 
| [Get Environments Availability API](https://docs.microsoft.com/rest/api/time-series-insights/dataaccess(preview)/query/getavailability) | Returns the distribution of event count over the event time stamp `$ts` . You can use this API to provide the landing experience in the environment. |
| [Get Event Schema API](https://docs.microsoft.com/rest/api/time-series-insights/dataaccess(preview)/query/geteventschema) | Returns environment metadata for a search span. An event schema is returned as a set of property references. |

## Time Series Model APIs

Each of the three components that make a [Time Series Model](https://docs.microsoft.com/azure/time-series-insights/time-series-insights-update-tsm) (*instances*, *hierarchies*, and *types*) have corresponding REST APIs that support **CREATE**, **READ**, **UPDATE**, and **DELETE**, paginated, and/or batch operations.

* The [Instance API](#instances-api) supports paginated **GET** operations, batch **CREATE**, **READ**, **UPDATE**, and **DELETE** operations, search, and keyword suggestions for search operations.
* The [Hierarchy API](#hierarchies-api) supports paginated **GET** operations and batch **CREATE**, **READ**, **UPDATE**, and **DELETE** operations.
* The [Type API](#types-api) supports paginated **GET** operations and batch **CREATE**, **READ**, **UPDATE**, and **DELETE** operations.

A fourth API provides REST support for Time Series Model settings:

* The [Model Settings API](#model-settings-api) supports HTTP **GET** and **UPDATE** operations for Time Series Model configuration settings.
Read [Time Series Model](https://docs.microsoft.com/azure/time-series-insights/time-series-insights-update-tsm) for detailed information about Time Series Model and *instance*, *hierarchy*, and *type* definitions.

### Model Settings API

The [Model Settings API](https://docs.microsoft.com/rest/api/time-series-insights/dataaccess(preview)/modelsettings) enables **CREATE**, **READ**, **UPDATE**, and **DELETE** on automatically created models in the environment by **TimeSeriesIds**.

| API | Description |
| --- | --- |
| [Get Model Setting API](https://docs.microsoft.com/rest/api/time-series-insights/dataaccess(preview)/modelsettings/get) | Returns the auto created model in the environment for **TimeSeriesIds**. |
| [Update Model Settings API](https://docs.microsoft.com/rest/api/time-series-insights/dataaccess(preview)/modelsettings/update) | Updates the model in the environment for **TimeSeriesIds** with the new values provided in the request. |

### Types API

The [Types API](https://docs.microsoft.co/rest/api/time-series-insights/dataaccess(preview)/timeseriestypes) enables **CREATE**, **READ**, **UPDATE**, and **DELETE** on Time Series Types and their associated variables.

| API | Description |
| --- | --- |
| [Get Types API](https://docs.microsoft.com/rest/api/time-series-insights/dataaccess(preview)/timeseriestypes/get) | Returns all the Time Series Types and their associated variables. |
| [Post Types API](https://docs.microsoft.com/rest/api/time-series-insights/dataaccess(preview)/timeseriestypes/executebatch) |Enables batch operations on types. All operations against this API are HTTP **POST** operations. Each operation accepts a payload. The payload is a JSON object. This object defines a single property. The property key is the name of an operation that the API allows. Supported operations are **PUT**, **UPDATE**, and **DELETE**. |

### Hierarchies API

The [Hierarchies API](https://docs.microsoft.com/rest/api/time-series-insights/dataaccess(preview)/timeserieshierarchies) enables **CREATE**, **READ**, **UPDATE**, and **DELETE** on Time Series Hierarchies.

| API | Description |
| --- | --- |
| [Get Hierarchies API](https://docs.microsoft.com/rest/api/time-series-insights/dataaccess(preview)/timeserieshierarchies/get) | Returns all the Time Series Hierarchies that match the request. |
| [Manage Hierarchies APIs](https://docs.microsoft.com/rest/api/time-series-insights/dataaccess(preview)/timeserieshierarchies/executebatch) | Enables batch operations on hierarchies. All operations against this API are HTTP **POST** operations. Each operation accepts a payload. The payload is a JSON object. This object defines a single property. The property key is the name of an operation that the API allows. Supported operations are **PUT**, **UPDATE**, and **DELETE**. |

### Instances API

The [Instances API](https://docs.microsoft.com/rest/api/time-series-insights/dataaccess(preview)/timeseriesinstances) enables **CREATE**, **READ**, **UPDATE**, and **DELETE** operations to be performed on Time Series Instances:

* The [Get Instances API](https://docs.microsoft.com/rest/api/time-series-insights/dataaccess(preview)/timeseriesinstances/get) returns all the Time Series Instances that match the request.
* The [Manage Instances API](https://docs.microsoft.com/rest/api/time-series-insights/dataaccess(preview)/timeseriesinstances/executebatch) enables batch operations on instances. All operations against this API are HTTP **POST** operations. Each operation accepts a payload. The payload is a JSON object. This object defines a single property. The property key is the name of an operation allowed by the API. Supported operations are **PUT**, **UPDATE**, and **DELETE**.
* These APIs enable discovery of Time Series Instances:
   * [Suggest](https://docs.microsoft.com/rest/api/time-series-insights/dataaccess(preview)/timeseriesinstances/suggest) will enable autocomplete scenarios while searching for an instance.
   * [Search](https://docs.microsoft.com/rest/api/time-series-insights/dataaccess(preview)/timeseriesinstances/search) helps in identifying the instances based on the keywords provided.

### Limits

The following limits are applied during query execution to fairly utilize resources among multiple environments and users:

| Applicable APIs | Limit name | Limit value | SKUs affected |
|-|-|-|-|
| All | Max number of TSM objects per request | 10,000 or 8 MB | L1 |
| All | Max model request execution time | 30 seconds | L1 |
| All | Max number of instances per environment | 500,000 | L1 |
| All | Max number of instance fields per instance | 50 | L1 |
| All | Max number of types per environment | 1,000 | L1 |
| All | Max number of variables per type | 50 | L1 |
| All | Max number of hierarchies per environment | 32 | L1 |
| All | Max number of hierarchies associated with an instance | 32 | L1 |
| All | Max hierarchy depth | 32 | L1 |
| All | Max number of characters in type name, hierarchy name, instance fields name, Time Series ID property value, Time Series ID each property name, Time Series name | 1,024 | L1 |

## Query APIs

The [Query APIs](https://docs.microsoft.com/rest/api/time-series-insights/dataaccess(preview)/query/execute) are constituted by three REST APIs, one API each for *events*, *series*, and *aggregates*.

The Query APIs return *event schema* and event counts over a specified time range through HTTP **GET** requests with optional pagination. *Series* and *aggregate series* information is also exposed through **GET** operations with optional pagination.

| API | Description
| --- | --- |
| [Get Events API](https://docs.microsoft.com/rest/api/time-series-insights/dataaccess(preview)/query/execute#getevents) | Returns a list of raw events that match the search span and predicate. |
| [Get Series API](https://docs.microsoft.com/rest/api/time-series-insights/dataaccess(preview)/query/execute#getseries) | Enables query and retrieval of Time Series Insights data from captured events by using data recorded on the wire through the variables defined in the model or provided inline. |
| [Aggregate Series API](https://docs.microsoft.com/rest/api/time-series-insights/dataaccess(preview)/query/execute#aggregateseries) | Enables query and retrieval of Time Series Insights data from captured events by aggregating recorded data by using the aggregate or sample functions. |

The APIs also support a [variety of customized operations](https://docs.microsoft.com/rest/api/time-series-insights/dataaccess(preview)/query/execute#examples) specified through the HTTP request JSON body. [Query definitions](https://docs.microsoft.com/rest/api/time-series-insights/dataaccess(preview)/query/execute#definitions) can be used for common operations.

### Limits

The following limits are applied during query execution to evenly utilize resources among environments and users:

| Applicable APIs | Limit name | Limit value | SKUs affected |
|-|-|-|-|
| [Get Availability](https://docs.microsoft.com/rest/api/time-series-insights/dataaccess(preview)/query/getavailability), [Get EventSchema](https://docs.microsoft.com/rest/api/time-series-insights/dataaccess(preview)/query/geteventschema), [Get Events](https://docs.microsoft.com/rest/api/time-series-insights/dataaccess(preview)/query/execute#getevents), [Get Series](https://docs.microsoft.com/rest/api/time-series-insights/dataaccess(preview)/query/execute#getseries), [Aggregate Series](https://docs.microsoft.com/rest/api/time-series-insights/dataaccess(preview)/query/execute#aggregateseries) | Max number of concurrent requests per environment | 10 | L1 |
| [Get Events](https://docs.microsoft.com/rest/api/time-series-insights/dataaccess(preview)/query/execute#getevents), [Get Series](https://docs.microsoft.com/rest/api/time-series-insights/dataaccess(preview)/query/execute#getseries), [Aggregate Series](https://docs.microsoft.com/rest/api/time-series-insights/dataaccess(preview)/query/execute#aggregateseries) | Max response size | 16 MB | L1 |
| [Get Events](https://docs.microsoft.com/rest/api/time-series-insights/dataaccess(preview)/query/execute#getevents), [Get Series](https://docs.microsoft.com/rest/api/time-series-insights/dataaccess(preview)/query/execute#getseries), [Aggregate Series](https://docs.microsoft.com/rest/api/time-series-insights/dataaccess(preview)/query/execute#aggregateseries) | Max number of projected properties or variables | 50 | L1 |
| [Aggregate Series](https://docs.microsoft.com/rest/api/time-series-insights/dataaccess(preview)/query/execute#aggregateseries) | Max number of intervals in the response | 200,000 | L1 |

### Error responses

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
| 400 | InvalidInput | The instance with timeSeriesId '[\"ABC321\"]' cannot be deleted. There are already ingested events associated with this time series id. | CannotDeleteInstance |
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

## Time Series Expression and syntax

Time Series Expression (TSX) is a string-based expression language with strong typing. TSX is used to represent the following entities in a [Time Series Query](#query-apis).

- Filter
- Value
- Aggregation

### Filter expressions

*Filter expressions* are used to represent boolean clauses. The following table lists examples of filters:

| TSX | Description |
|-|-|
| $event.PointValue.Double = 3.14 | `true` for events with double `PointValue` equal to 3.14 |
| $event.PointValue > 3.14 AND $event.Status.String = 'Good' | `true` for events with `PointValue` greater than 3.14 and string status `Good` |
| $event.$ts > dt'2018-11-01T02:03:45Z' | `true` for events with a time stamp greater than 2018-11-01T02:03:45Z |
| $event.PointEval.Bool = true | `true` for events with `PointEval` equal to `true` |

### Value expressions

*Value expressions* are used to depict the value for numeric variables. A value expression can be only a single property reference expression of type `Double`.

For example:

| TSX | Notes |
|--|--|
| `$event.temperature.Double` | |
| `$event.[Temperature.ABC].Double` | Use `[` and `]` for escaping. |
| `$event.Temperature` | The type is assumed to be double. |

### Aggregation expressions

*Aggregate expressions* are used to depict the aggregation operation to be used on the query. An aggregate expression results in a single value for each interval. Aggregate expressions can be applied on numeric and aggregate variables.

#### Numeric

Numeric variables should refer to `$value`.

Here are the supported aggregate functions.

| Aggregate Function | Example | Description |
|--|--|--|
| `min`  | `min($value)` | Calculates the minimum of the `$value` per interval. Avoids `null` values. |
| `max`  | `max($value)` | Calculates the maximum of the `$value` per interval. Avoids `null` values. |
| `sum`  | `sum($value)` | Calculates the sum of `$value` over all the events in the interval. Avoids `null` values. |
| `avg`  | `avg($value)` | Calculates the average of `$value` over all the events in the interval. Avoids `null` values. |
| `first`  | `first($value)` | Returns `$value` of the first occurring event in the interval by event time stamp. This function does not avoid null values. |
| `last`  | `last($value)` | Returns `$value` of the last occurring event in the interval by event time stamp. This function does not avoid null values. |

#### Aggregate

*Aggregate variables* should only refer to `$event.<PropertyName>.<Type>`.

Here are the supported aggregate functions.

| Aggregate function | Example | Description |
|--|--|--|
| `count`  | `count()` | Returns the number of events per interval. |
| `min`  | `min($event.Temperature.Double)` | Calculates the minimum of the `double` property `Temperature` per interval. Avoids `null` values. |
| `max`  | `max($event.Temperature.Double)` | Calculates the maximum of the `double` property `Temperature` per interval. Avoids `null` values.  |
| `sum`  | `sum($event.Temperature.Double)` | Calculates the sum of the `double` property `Temperature` over all the events in the interval. Avoids `null` values. |
| `avg`  | `avg($event.Temperature.Double)` | Calculates the average of the `double` property `Temperature` over all the events in the interval. Avoids `null` values. |
| `first`  | `first($event.Temperature.Double)` | Returns the value of the `double` property `Temperature` from the first occurring event in the interval by event time stamp. This function does not avoid null values. |
| `last`  | `last($event.Temperature.Double)` | Returns the value of the `double` property `Temperature` from the last occurring event in the interval by event time stamp. This function does not avoid null values. |

### Syntax

This section describes core syntax concepts and query operators that are concatenated to form expressions.

#### Supported literals

| Primitive type | Literals |
|--|--|
| Bool  | TRUE, FALSE |
| DateTime | dt'2016-10-08T03:22:55.3031599Z' |
| Double   | 1.23, 1 |
| String   | 'abc' |
| TimeSpan | ts'P1Y2M3DT4M5.67S' |
|  | NULL |

#### Supported operand types

| Operation | Supported types | Notes |
|--|--|--|
| <, >, <=, >= | Double, DateTime, TimeSpan | |
| =, !=, <> | String, Bool, Double, DateTime, TimeSpan, NULL | <> is equivalent for != |
| +, -, *, / |  Double, DateTime, TimeSpan | |

#### Supported scalar functions

| Function name | Return value | Arguments | Example | Notes |
|--|--|--|--|--|
| utcNow | DateTime | None | utcNow() | Returns current time in UTC format. Function name is case-sensitive. |

For comparison expressions (`<`, `>`, `<=`, `>=`, `=`, `!=`), the operand can be `NULL` or have a single type.
In each predicate expression, types of left-side and right-side operands are validated to match.
Errors occur when types of left and right sides don't agree, or an operation is not allowed on particular types.

- If the type is specified for the property, then the type `Check` is applied:

   * Any property type is accepted against a `NULL` literal.
   * Otherwise, types of left side and right side should match.

- If the type is omitted for the property but the name is specified, then the type is assumed to be `Double`.

Here are examples of properties "p1" and "p2" of type `String`, and property "p3" of type `Double`:

| Filter | Is valid? | Notes |
| - | - | - |
| $event.p1.String = 'abc' | Yes | |
| $event.p1.String = $event.p2.String | Yes | |
| $event.p1.String = NULL | Yes | NULL matches any left-side type. |
| $event.p3.Double = 'abc' | No | Type mismatch. |
| $event.p3.Double = $event.p1.String | No | Type mismatch. |
| $event.p1 = 'abc' | No |  Type mismatch. |
| $event.p1 = true | No | Type mismatch. |
| $event.p1 = NULL | Yes | $event.p1.Double = NULL |
| $event.p1 != NULL | Yes | $event.p1.Double != NULL |
| $event.p1 = '1.0' | No | Type mismatch. |

## See also

For more information about application registration and the Azure Active Directory programming model, see [Azure Active Directory for developers](https://docs.microsoft.com/azure/active-directory/develop/active-directory-developers-guide).

To learn about request and authentication parameters, read [Authentication and authorization](https://docs.microsoft.com/azure/time-series-insights/time-series-insights-authentication-and-authorization).

Tools that assist with testing HTTP requests and responses include:

- [Fiddler](https://www.telerik.com/fiddler). This free web debugging proxy can intercept your REST requests, so you can diagnose the HTTP request and response messages.
- [JWT.io](https://jwt.io/). You can use this tool to quickly dump the claims in your bearer token and then validate their contents.
- [Postman](https://www.getpostman.com/). This is a free HTTP request and response testing tool for debugging REST APIs.

Learn more about Azure Time Series Insights by reviewing the [product documentation](https://docs.microsoft.com/azure/time-series-insights/).
