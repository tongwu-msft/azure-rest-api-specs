---
ms.assetid:
ms.title: General availability (GA) query syntax - Azure Time Series Insights | Microsoft Docs
title: General availability (GA) query syntax - Azure Time Series Insights | Microsoft Docs
services: time-series-insights
ms.service: time-series-insights
service_description: Time Series Insights
description: This reference document specifies query syntax for Azure Time Series Insights general availability (GA) REST API queries, requests, and operations.
manager: deepakpalled
ms.manager: dpalled
author: yeskarthik
ms.author: Subramanian.Karthik
ms.date: 01/02/2020
---

# Azure Time Series Insights query syntax

This document describes query request format and syntax for the Azure Time Series Insights General Availability [Query API](ga-query-api.md).

> [!TIP]
> * Review the [Azure REST API Reference](./https://docs.microsoft.com/rest/api/azure/) to learn more about making HTTP requests in Azure.
> * Review [Authentication and authorization](https://docs.microsoft.com/azure/time-series-insights/time-series-insights-authentication-and-authorization) for HTTP request headers and parameters required in Azure Time Series Insights.

## Summary

> [!IMPORTANT]
> * Query requests must be in JSON format.
> * HTTP request payloads made to the [Query API](ga-query-api.md) should conform to the format specified in this document.

The language is subdivided into the following elements:

* *Scalar* expressions that produce scalar values.
* *Scalar* functions that return scalar values.
* *Aggregate* expressions that are used to partition collections of events and compute measures over the partitions.
* *Clauses* that form constituent components of JSON queries or be a part of an expression.

## Data model

The Azure Time Series Insights query API operates on data stored as individual ***events*** within an environment. Each event is a set of ***property name*** and ***value*** pairs.

### Event properties

Event properties can be of one of the following primitive types: **Bool**, **DateTime**, **Double**, or **String**. All primitive types are nullable.

> [!NOTE]
> Customized event source formats may support a larger set of value types. Azure Time Series Insights will infer the closest primitive type and cast customized types to them at ingress.

All events have the following built-in properties with predefined name and type:

| Property name | Property type | Definition |
|-|-|-|
| **$ts** | **DateTime** | Event timestamp |
| **$esn** | **String** | Event source name |

* Event timestamp

    By default, an event timestamp value is provided by the event source. For example, events coming from an IoT hub would have their enqueued time as a timestamp.

    Customers can modify this behavior by configuring another event property instead. Custom timestamp properties can be specified in [Event Hubs](https://docs.microsoft.com/azure/time-series-insights/time-series-insights-how-to-add-an-event-source-eventhub#add-a-new-event-source) and [IoT Hubs](https://docs.microsoft.com/azure/time-series-insights/time-series-insights-how-to-add-an-event-source-iothub#add-a-new-event-source).

* Event source name

    The *event source name* is the name displayed for the event source from which Time Series Insights has received the event. Event source names are associated with a particular event at ingress time.

    > [!IMPORTANT]
    > * Event source names remain unchanged for the lifetime of the event.
    > * If the name of an event source is modified: existing events will carry the old event source name. New events will carry the new event source name.

### Event types

Custom event properties are uniquely identified and referenced in query expressions by name and type. An event can have more than one property with the same name and different types. Properties with the same name but different types might result from ingress type splitting.

An event property value of **String** type can be stored as a property with a different type in the following cases:

* If a **String** value is a valid **Double** value, then it is stored both as **Double** and **String**.
* If a **String** value is a valid **DateTime** value, then it is stored as **DateTime** only.

The Query API converts empty **Strings** literals (`""`) to `null` in the output.

Time Series Insights has limited support for the following values within the **Double** type: `Double.NaN`, `Double.PositiveInfinity`, and `Double.NegativeInfinity`.
These values are converted to `null` during ingress, but if query evaluation produces one of these values, the value is evaluated and serialized as a **String** in response.

You can pass these values as **Strings** for ingress, so in query expressions these values should be also passed as **Strings**.

*Event schemas* describe the properties of an event. An event schema contains the name of an event source and the ordered set of properties for the event. Different events can have different schemas or share the same schema.

## Scalar expressions

**Constant expressions** are represented using the following literals for each of the primitive types.

| Primitive Type | JSON Representation | JSON Example | Notes |
|-|-|-|-|
| **Bool** | As a JSON **boolean** type | `true`, `false`|  |
| **DateTime** | As a nested object with single **dateTime** property in [ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html) format `yyyy'-'MM'-'dd'T'HH':'mm':'ss.FFFFFFFK`. | `{"dateTime":"2016-08-01T00:00:00.000Z"}`|  |
| **Double** | A JSON **number** cast to the **Double** range. | `1.23e45`, `123`| **Double** overflows will generate an error. |
| **String** | A JSON **String** type | `"abc"`|  |
| **TimeSpan** | As a nested object with single **timeSpan** property in [ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html) format: `P[n]Y[n]M[n]DT[n]H[n]M[n]S`. | `{"timeSpan":"P1Y2M3DT4M5.67S"}`|  |

The `null` literal is typed in JSON as **null** and is represented as a nested object with type property.

JSON examples:

```JSON
{ "string": null }
```
```JSON
{ "double": null }
```
```JSON
{ "bool": null }
```
```JSON
{ "dateTime": null }
```
```JSON
{ "timeSpan": null }
```

A **Property reference expression** is used to access values of non-built-in properties of an event.

Result type of a property reference expression is the primitive type of the property.

Properties in the event schema are uniquely identified by name and type and the reference expression requires both to be specified.

JSON examples:

```JSON
{
  "property": "p1",
  "type": "Bool"
}
```
```JSON
{
  "property": "p1",
  "type": "DateTime"
}
```
```JSON
{
  "property": "p1",
  "type": "Double"
}
```
```JSON
{
  "property": "p1",
  "type": "String"
}
```
```JSON
{
  "property": "p1",
  "type": "TimeSpan"
}
```

A **Built-in Property reference expression** is used to access built-in properties of an event.

Result type of a built-in property reference expression is the primitive type of the property.

Built-in properties are referenced by name only; therefore, no type is needed in the reference expression.

```JSON
{ "builtInProperty": "$esn" }
```

The following **boolean comparison expressions** are supported:

| Property Name in JSON | Description |
|-|-|
| **eq** | equal |
| **in** | in (equal any) |
| **phrase** | contains phrase |
| **startsWith** | starts with |
| **endsWith** | ends with phrase |
| **regex** | matches regular expression |
| **lt** | less than |
| **lte** | less than or equal |
| **gt** | greater than |
| **gte** | greater than or equal |

All comparison expressions take left and right arguments of primitive types and return a boolean value representing the result of the comparison.

All types implicitly cast only to themselves and explicit casts are not supported, therefore types of left and right arguments should match.

```JSON
{
  "eq": {
    "left": {
      "property": "p1",
      "type": "String"
     },
     "right": "abc"
  }
}
```

JSON examples:

```JSON
{
  "startsWith": {
    "left": {
      "property": "p1",
      "type": "String"
     },
     "right": "abc"
  }
}
```
```JSON
{
  "startsWith": {
    "left": {
      "property": "p1",
      "type": "String"
    },
    "right": "",
    "stringComparison": "Ordinal"
  }
}
```
```JSON
{
  "endsWith": {
    "left": {
      "property": "p1",
      "type": "String"
    },
    "right": {
      "property": "p2",
      "type": "String"
    },
    "stringComparison": "Ordinal"
  }
}
```

The following table shows supported types of arguments for each of the comparison expressions:

| Argument Type | Supported comparison operation |
|-|-|
| **Bool** | **eq**, **in** |
| **DateTime** | **eq**, **in**, **lt**, **lte**, **gt**, **gte** |
| **Double** | **eq**, **in**, **lt**, **lte**, **gt**, **gte** |
| **String** | **eq**, **in**, **phrase**, **startsWith**, **endsWith**, **regex** |
| **TimeSpan** | **eq**, **in**, **lt**, **lte**, **gt**, **gte** |

Null literal can only be used with the following comparison operators: **eq**, **in**.

* The **eq** operator results in `true` if both sides are `null` values and `false` otherwise.
* For other operations, the error is raised for null literal and behavior is undefined for null-value properties (any comparison operation results in `false`).
* Null value precedes non-null value in the sort order (occurs, for example, if sorting by a property is applied when getting a list of events).

Time Series Insights supports the following **Boolean** logical expressions:

| Property Name in JSON | Description |
|-|-|
| **and** | Takes a non-empty set of **Boolean** arguments and returns `true` if all of them evaluate to `true`. |
| **or** | Takes a non-empty set of **Boolean** arguments and returns `true` if any of them evaluate to `true`. |
| **not** | Takes a single **Boolean** argument and returns its negated value. |

```JSON
{
  "and": [
    {
      "eq": {
        "left": {
          "property": "p1",
          "type": "String"
        },
        "right": "abc"
      }
    },
    {
      "not": {
        "lt": {
          "left": {
            "property": "p1",
            "type": "Double"
          },
          "right": 1
        }
      }
    }
  ]
}
```

The **stringComparison** property is optional. By default its value is `OrdinalIgnoreCase` which causes case to be ignored in comparisons.

```JSON
{ 
  "regex": {
    "left": {
      "property": "p1",
      "type": "String"
    },
    "right": "^abc*"
  }
}
```
```JSON
{
  "regex": {
      "left": "abc",
      "right": "^a*$"
  }
}
```

Time Series Insights supports the following **arithmetic expressions**:

| Property Name in JSON | Description |
|-|-|
| **add** | Addition. |
| **sub** | Subtraction. |
| **mult** | Multiplication. |
| **div** | Division. |

All arithmetic expressions take left and right arguments of primitive types and return a value representing result of the operation.

All types implicitly cast only to themselves and explicit casts are not supported.

```JSON
{
  "add": {
    "left": {
      "property": "p1",
      "type": "Double"
     },
     "right": 1
  }
}
```

The following table shows supported types of arguments for each of the comparison expressions:

| Operation | Left type | Right type | Result type |
|-|-|-|-|
| **add** | **Double** | **Double** | **Double** |
| **add** | **TimeSpan** | **TimeSpan** | **TimeSpan** |
| **add** | **DateTime** | **TimeSpan** | **DateTime** |
| **add** | **TimeSpan** | **DateTime** | **DateTime** |
| **sub** | **Double** | **Double** | **Double** |
| **sub** | **TimeSpan** | **TimeSpan** | **TimeSpan** |
| **sub** | **DateTime** | **DateTime**| **TimeSpan** |
| **sub** | **DateTime** | **TimeSpan** | **DateTime** |
| **mul** | **Double** | **Double** | **Double** |
| **div** | **Double** | **Double** | **Double** |

**Boolean predicate string expression** contains boolean predicate represented as a human-readable expression called a Predicate String.

Examples of predicate string:

| Predicate string | Description |
|-|-|
| `Description HAS 'hello world'` | `true` for events containing the phrase `hello world` in property **Description** across all event sources |
| `'hello world'` | `true` for events containing the phrase `hello world` |
| `startsWith(Status, 'go')` | `true` for events with **Status** starting with `go` |
| `endsWith(Status, 'oD')` | `true` for events with  **Status** ending with `od` |
| `startsWith_cs(Status, 'Go')` | `true` for events with  **Status** starting with `Go` |
| `endsWith_cs(Status, 'od')` | `true` for events with  **Status** starting with `od` |
| `matchesRegex(s, '^G*')` | `true` for events with  **Status** matching the regular expression `^G*` |
| `PointValue.Double = 3.14` | `true` for events with double **PointValue** equal to `3.14` |
| `Status IN ('Good','Bad')` | `true` for events with  **Status** containing `Good` or `Bad` |
| `PointValue > 3.14 AND Status.String = 'Good'` | `true` for events with **PointValue** greater than `3.14` and string **Status** 'Good' |
| `[PointValue] > 3.14 AND ([Status] = 'Good' OR [Status] = 'Bad') AND NOT [Description] HAS 'hello world'` | `true` for events with **PointValue** greater than `3.14` and **Status** `Good` or `Bad` and **Description** not containing the phrase `hello world` |

```JSON
{ "predicateString": "PointValue.Double = 3.14" }
```

### Predicate String

The expression in the predicate string is evaluated into a JSON boolean expression. It should comply with the following grammar (simplified):

| JSON boolean expression | Backus–Naur Form |
| --- | --- |
| `parse` | `orPredicate EOF | EOF;` |
| `orPredicate` | `andPredicate (Or andPredicate)*;` |
| `andPredicate` | `notPredicate (And notPredicate)*;` |
| `notPredicate` | `(Not)* predicate;` |
| `predicate` | `parenPredicate | comparisonPredicateExtended | hasPredicate | inPredicate;` |
| `parenPredicate` |`OpenParen orPredicate CloseParen;` |
| `parenExpression` | `OpenParen additiveExpression CloseParen;` |
| `comparisonPredicateExtended` | `(ComparisonOp literal) | comparisonPredicate;` |
| `comparisonPredicate` | `additiveExpression ComparisonOp additiveExpression;` |
| `additiveExpression` | `multiplicativeExpression ((Plus | Minus) multiplicativeExpression)*;` |
| `multiplicativeExpression` | `unaryExpression (MultiplicativeOp unaryExpression)*;` |
| `functionCallExpression` | `identifier OpenParen CloseParen;` |
| `unaryExpression` | `identifier | literal | functionCallExpression | parenPredicate | parenExpression;` |
| `hasPredicate`| `(identifier? Has)? StringLiteral;` |
| `inPredicate` | `identifier? In OpenParen literal (Comma literal)* CloseParen;` |
| `literal` | `StringLiteral | ((Minus)? NumericLiteral) | BooleanLiteral | DateTimeLiteral | TimeSpanLiteral | NullLiteral;` |
| `identifier` | `BuiltinIdentifier | (QuotedOrUnquotedIdentifier (Sep QuotedOrUnquotedIdentifier)?);` |

The same set of Time Series Insights types is supported for predicate string.

Unlike JSON property reference expressions, a type for a property can be omitted in which case a type is autoresolved.

#### Supported literals

| Primitive Type | Literals |
|--|--|
| **Bool** | `TRUE`, `FALSE` |
| **DateTime** | `dt'2016-10-08T03:22:55.3031599Z'` |
| **Double** | `1.23`, `1.0` |
| **String** | `'abc'` |
| **TimeSpan** | `ts'P1Y2M3DT4M5.67S'` |
|  | `NULL` |

#### Supported operand types

| Operation | Supported Types | Notes |
|--|--|--|
| **<**, **>**, **<=**, **>=** | **Double**, **DateTime**, **TimeSpan** | |
| **=**, **!=**, **<>** | **String**, **Bool**, **Double**, **DateTime**, **TimeSpan**, **NULL** | **<>** is equivalent for **!=** |
| **+**, **-**, **\***, **/** | **Double**, **DateTime**, **TimeSpan** | |
| **IN** | **String**, **Bool**, **Double**, **DateTime**, **TimeSpan**, **NULL** | All operands should be of the same type or be **NULL** constant. Multiple **NULL**s are equivalent to a single **NULL**. |
| **HAS** | **String** | Only constant string literals are allowed at right-hand side. Empty string and **NULL** are not allowed. |

#### Supported scalar functions

| Function name | Return value | Arguments | Example | Notes |
|--|--|--|--|--|
| utcNow | DateTime | None | utcNow() | Returns current time in UTC format. Function name is case-sensitive. |

Right-hand side constant literal of **HAS** operator is parsed to **Bool**, **Double**, **DateTime**, or **TimeSpan** value. For each successfully parsed value, predicate with **=** operator is created. These predicates and the original **HAS** predicate are joined into an **OR** predicate.

For example, predicate string `p1 HAS '1.0'` is equivalent to `p1.String HAS '1.0' OR p1.Double = 1.0`, if **p1** properties with **String** and **Double** types exist.

For comparison predicates (**<**, **>**, **<=**, **>=**, **=**, **!=**) and **IN** predicate, operand can be **NULL** or have a single type.

For **HAS** predicate, right-hand constant literal can be expanded into multiple types.
In each predicate expression, types of left-hand side and right-hand side operands are validated to match.
Errors occur when types of left and right sides do not agree, or operation is not allowed on particular types.

1. If type is specified for property, then type check is applied:

   * Any property type is accepted against `NULL` literal
   * Otherwise, types of left-hand side and right-hand side should match

    Here are examples given properties **p1** and **p2** of type **String**, and property **p3** of type **Double**:

    | Predicate string | Is valid? | Notes |
    | - | - | - |
    | `p1.String = 'abc'` | Yes | |
    | `p1.String = p2.String` | Yes | |
    | `p1.String = NULL` | Yes | `NULL` matches any left-hand side type. |
    | `p3.Double = 'abc'` | No | Type mismatch. |
    | `p3.Double = p1.String` | No | Type mismatch. |
    | `p1.String HAS 'abc'` | Yes | |
    | `p3.Double HAS '1.0'` | Yes | String literal was successfully parsed to a **Double** value. |

1. If type is omitted for property but name is specified, then the following steps are performed:

    1. All properties with given name and types are taken.
    1. Left-hand side and right-hand side operands are grouped in pairs by type.
    1. Pairs are concatenated using **AND** operations.

    * Given properties **p1** and **p2** of type **String** and **Double**, the following example expressions and some of their equivalents are displayed below:

    | Predicate string | Equivalent strong-typed predicate string | Notes |
    |--|--|--|
    | `p1 = 'abc'` | `p1.String = 'abc'` |  |
    | `p1 = true` |  | No **p1** property of type **Bool**, so missing property error is emitted. |
    | `p1 = NULL` | `p1.String = NULL AND p1.Double = NULL` | For `NULL` right-hand side it is assumed that all matching properties should be `NULL`. |
    | `p1 != NULL` | `p1.String != NULL OR p1.Double != NULL` | Inversion of the preceding expression |
    | `p1 = '1.0'` | `p1.String = '1.0'` |  |
    | `p1 IN (1.0, NULL)` | `p1.Double = 1.0 OR p1.Double = NULL` |  |
    | `p1 IN (NULL)` | `p1.String = NULL AND p1.Double = NULL` | Equivalent to `p1 = NULL`. |
    | `p1 HAS '1.0'` | `p1.String HAS '1.0' OR p1.Double = 1.0` | String literal was successfully parsed to a valid **Double** value. |
    | `p1 HAS 'true'` | `p1.String HAS 'true'` | String literal was successfully parsed to **Bool** but no **p1.Bool** property exists. |
    | `p1 = p2` | `p1.String = p2.String AND p1.Double = p2.Double` |  |
    | `p1 != p2` | `p1.String != p2.String OR p1.Double != p2.Double` | Inversion of the preceding expression |

1. Both property name and type can be omitted for left-hand side property if type of right-hand side is well-defined: right-hand side has const literal(s) and `NULL` literal is not the only right-hand side literal.

    * This scenario is a generalization of full-text search using the **HAS** operand.
    * All properties matching the right-hand side type are taken, and resulting expressions concatenated via **OR** operation.
    * Here are examples given properties **p1** of type **String** and **Double** and properties **p2** of type **String** and **DateTime**:

    | Predicate string | Equivalent strong-typed predicate string | Notes |
    |--|--|--|
    | `= 'abc'` | `p1.String = 'abc' OR p2.String = 'abc'` |  |
    | `!= 'abc'` | `p1.String != 'abc' AND p2.String != 'abc'` | Inversion of the preceding expression |
    | `= 1.0` | `p1.Double = 1.0` | |
    | `= dt'2000-01-02T03:04:05'` | `p2.DateTime = dt'2000-01-02T03:04:05'` | |
    | `= true` |  | Error. No **Bool** property exists, so missing property error is emitted. |
    | `= NULL` |  | Error. Omitting property name for `NULL` right-hand side is not allowed. |
    | `IN (NULL)` |  | Same as above. |
    | `IN (1.0, NULL)` | `p1.Double = 1.0 OR p1.Double = NULL` |  |
    | `HAS '1.0'` | `p1.String HAS '1.0' OR p1.Double = 1.0 OR p2.String HAS '1.0'` |  |
    | `HAS 'true'` | `p1.String HAS 'true' OR p2.String HAS 'true'` | No property with type **Bool**. |

1. If the operator is omitted together with a property name, the `HAS` operation is assumed.

#### Specific scalar functions

**UTC now** function returns a **DateTime** value, which contains current time in UTC format. It does not accept any arguments.

```JSON
{ "utcNow": {} }
```

## Aggregate Expressions

**Dimension expressions** are used inside *aggregates clause* to partition a set of events and assign a scalar key to each partition.

Dimension expression types:

| Property name in JSON | Description | Example |
|-|-|-|
| **uniqueValues** | Dimension values in the result are exact values of a given property. |  |
| **dateHistogram** | Dimension values in the result are ranges of time of a given property. | Date histogram of timestamp may result in 10 1-hour ranges for a 10-hour search span. |
| **numericHistogram** | Dimension values in the result are ranges of values in a given property. | Numeric histogram of temperature may result in 10 degrees ranges returned. |

Time Series Insights restricts the maximum cardinality (max lattice size) of an input aggregate query to 150,000 cells.  To calculate the cardinality of an aggregate query, you multiply the size of all dimensions in the query together.  As long as the product is less than 150,000 the query is accepted for execution, otherwise, the query is rejected.  

The maximum size of a dimension produced by **uniqueValues** and `numericHistogram`s the size of the dimension is specified using the **take** clause.  In `dateHistogram`, the size is calculated by the dividing the search span by the size of the dateHistorgram interval, which is specified using the break clause.

For example, an aggregate query has the search pan set from `2017-11-15T16:00:00.000Z` to `2017-11-15T19:00:00.000Z` = 3hours.  If the query includes `dateHistogram` with the interval (`break` clause), set to 1 minute (dimension 1) and `uniqueValues` over property XYZ, then the `dateHistogram` dimension size is 3x60=180, which means `uniqueValues` can take up to 150,000/180 = 833 items total.  

**Unique values expression** is used to group a set of events by values of the specified event property.

Evaluation of this JSON expression results in up to 100 records grouped by `sensorId` string property.

```JSON
{
  "uniqueValues": {
    "input": {
      "property": "sensorId",
      "type": "String"
    },
    "take": 100
  }
}
```

**Date histogram expression** is used to group DateTime property values into buckets of given size.

Evaluation of this JSON expression results in a set of Timestamp records floor-rounded such that each value has seconds zeroed.

```JSON
{
  "dateHistogram": {
    "input": {
      "builtInProperty": "$ts"
    },
    "breaks": {
      "size": "1m"
    }
  }
}
```

**Numeric histogram expression** is used to group Double property values into given number of buckets.

Evaluation of this JSON expression results in 10 records, so the range between min and max values of `p1` is divided into 10 buckets.

```JSON
{
  "numericHistogram": {
    "input": {
      "property": "p1",
      "type": "Double"
    },
    "breaks": {
      "count": 10
    }
  }
}
```

**Measure expression** is used inside *aggregates clause* to compute a scalar value on a set of events. For example, measure expression is the calculation of the maximum value of a temperature sensor during the last 24 hours.

Count expression is used to calculate number of events within corresponding bucket.

```JSON
{ "count": {} }
```

**min**, **max**, **avg**, and **sum** expressions are used to calculate the respective minimum, maximum, average of, and sum of the values for a given property within corresponding bucket.

```JSON
{
  "min": {
    "input": {
      "property": "temperature",
      "type": "Double"
    }
  }
}
```

**First** and **Last** measure expressions allow users to get the specific value of a given property **A** corresponding to the minimum or maximum value of another value of property **B**.

```JSON
{
  "first": {
    "input": {
      "property": "propertyA",
      "type": "String"
    },
    "orderBy": {
      "property": "propertyB",
      "type": "Double"
    }
  }
}
```

```JSON
{
  "last": {
    "input": {
      "property": "propertyA",
      "type": "Double"
    },
    "orderBy": {
      "property": "propertyB",
      "type": "DateTime"
    }
  }
}
```

The **orderBy** clause is optional and defaults to the timestamp property default **$ts**. Input can be of any type, **orderBy** clause supports only **Double** and **DateTime** types. 

If property **B** is a **dateTime**, the user will get the latest or the earliest value of property **A**.

One can use **First** and **Last** expressions to understand the earliest or latest value of a specific property. For example, if a user has a property called `deviceID` and they want to understand the latest `deviceID` that sent an event, last is the most efficient expression operator to use to identify that information.

```JSON
{
  "last": {
    "input": {
      "property": "deviceID",
      "type": "String"
    }
  }
}
```

Another example is to use **Last** to find the last reported location of a particular object, like a ship, vehicle, or other moving object.

To illustrate a query that produces the last known location of the ships in a fleet, a user could author a query similar to the following:

```JSON
{
  "searchSpan": {
    "from": "2018-05-05T12:00:00.000Z",
    "to": "2018-05-15T12:01:00.000Z"
  },
  "aggregates": [
     {
       "dimension": {
         "uniqueValues": {
           "input": {
             "property": "shipId",
             "type": "string"
            },
            "take": 150000
          }
        },
        "measures": [
          {
            "last": {
              "input": {
                "property": "Latitude",
                "type": "Double"
              }
           }
        },
        {
          "last": {
            "input": {
              "property": "Longitude",
              "type": "Double"
            }
          }
        }
      ]
    }
  ]
}
```

One more example is to use **First** to find a device reporting the lowest pressure for every plant:

```JSON
{
  "searchSpan": {
    "from": "2018-05-05T12:00:00.000Z",
    "to": "2018-05-15T12:01:00.000Z"
  },
  "aggregates": [
    {
      "dimension": {
        "uniqueValues": {
          "input": {
            "property": "plantId",
            "type": "String"
          },
          "take": 150000
        }
     },
     "measures": [
       {
         "first": {
           "input": {
             "property": "deviceId",
             "type": "String"
           },
           "orderBy": {
             "property": "pressure",
              "type": "Double"
            }
          }
        }
      ]
    }
  ]
}
```

Supported dimension and measure expressions depending on property type:

| Property Type | Supported Dimension Expressions | Supported Measure Expressions |
|-|-|-|
| **Bool** | `"uniqueValues"` | `"first"` (input), `"last"` (input) |
| **DateTime** | `"uniqueValues"`, `"dateHistogram"` | `"min"`, `"max"`, `"first"` (orderBy, input), `"last”` (orderBy, input)|
| **Double** | `"uniqueValues"`, `"numericHistogram"` | `"sum"`, `"avg"`, `"min"`, `"max"`,`"first"` (orderBy, input), `"last”` (orderBy, input) |
| **String** | `"uniqueValues"` | `"first"` (input), `"last"` (input) |

## Clauses

**Search span clause** is used to filter built-in Timestamp property of event to a given interval. Start of the interval is inclusive. End of the interval is exclusive.

```JSON
{
  "searchSpan": {
    "from": {
      "dateTime": "2016-08-01T00:00:00.000Z"
    },
    "to": {
      "dateTime": "2016-08-31T00:00:00.000Z"
    }
  }
}
```

The **from** and **to** properties in the search span clause (**searchSpan**) should be valid expressions of **DateTime** resulted type. These expressions are evaluated prior to query execution, which means they should not contain any property references.

**Predicate clause** is used to filter events satisfying the predicate. It should be resolved into a **Boolean** expression.

```JSON
{
  "predicate": {
    "eq": {
      "left": {
        "property": "p1",
        "type": "String"
       },
       "right": "abc"
     }
  }
}
```

Filtering of events means running a predicate represented by a boolean expression on each event in environment.

Execution of an expression on an event returns `true` if event must be included in further operation or `false` if event must be omitted from further processing.

In addition to predicate expression, events are always filtered by search span.

**Limit top clause** is used to get a given number of values in either ascending or descending order.  The number of values is limited as per the count specified.

```JSON
{
  "sort": [
    {
      "input": {
        "builtInProperty": "$ts"
      },
      "order": "Asc"
    }
  ],
  "count": 10
}
```

**Limit take clause** is used as a quick way to get a set of values not in any particular order. The number of values returned is limited by the input specified.

```JSON
{ "take": 10 }
```

**Limit sample clause** is used to get a statistically representative sample from a set of values. The number of values returned is limited by the input specified.

```JSON
{ "sample": 10 }
```

**Breaks clause** is used in histogram expressions to specify how a range should be divided.

* For date histogram one should specify the size of datetime interval, and interval boundaries unless a histogram is based on built-in Timestamp property where boundaries are determined based on search span.

  * Interval boundaries are optional and can be used. For example, "where boundaries are determined based on search span if interval boundaries are omitted".

* For numeric histogram one should specify number of breaks. Interval boundaries are determined based on minimum and maximum values of a property.

```JSON
{
  "breaks": {
    "size": "1d",
    "from": "2000-01-02T03:04:05.0000000",
    "to": "2000-01-02T03:04:05.0000000"
  }
}
```

```JSON
{
  "breaks": {
    "count": 10
  }
}
```

**Aggregates clause** is used to partition a set of events by a given property, while measuring values of other event properties.

Measures are evaluated on each partition produced by the dimension expression.

This JSON expression computes average, minimum, and maximum temperatures per sensor ID.

```JSON
{
  "aggregates": [
    {
      "dimension": {
        "uniqueValues": {
          "input": {
            "property": "sensorId",
            "type": "String"
          },
          "take": 100
        }
      },
      "measures": [
        {
          "avg": {
            "input": {
              "property": "temperature",
              "type": "Double"
            }
          }
        },
        {
          "min": {
            "input": {
              "property": "temperature",
              "type": "Double"
            }
          }
        },
        {
          "max": {
            "input": {
              "property": "temperature",
              "type": "Double"
            }
          }
        }
      ]
    }
  ]
}
```

Aggregates clause is an array that allows specifying more than one aggregation at the topmost level.

This JSON expression computes average temperature per city and per manufacturer independently.

```JSON
{
    "aggregates": [
        {
            "dimension": {
                "uniqueValues": {
                    "input": {
                        "property": "city",
                        "type": "String"
                    },
                    "take": 100
                }
            },
            "measures": [
                {
                    "avg": {
                        "input": {
                            "property": "temperature",
                            "type": "Double"
                        }
                    }
                }
            ]
        },
        {
            "dimension": {
                "uniqueValues": {
                    "input": {
                        "property": "manufacturer",
                        "type": "String"
                    },
                    "take": 100
                }
            },
            "measures": [
                {
                    "avg": {
                        "input": {
                            "property": "temperature",
                            "type": "Double"
                        }
                    }
                }
            ]
        }
    ]
}
```

> [!NOTE]
> Currently having more than one element in aggregates array is not supported.

An aggregation definition may include a nested aggregation, which allows specifying a multi-dimensional lattice.

This JSON expression computes average temperature per sensor ID, per minute.

```JSON
{
  "aggregates": [
    {
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
            "breaks": {
              "size": "1m"
            }
          }
        },
        "measures": [
          {
            "avg": {
              "input": {
                "property": "temperature",
                "type": "Double"
              }
            }
          }
        ]
      }
    }
  ]
}
```

## See also

Read more about the Time Series Insights APIs in [General Availability](ga.md).

To learn about request and authentication parameters, read [Authentication and authorization](https://docs.microsoft.com/azure/time-series-insights/time-series-insights-authentication-and-authorization).

Learn more about Azure Time Series Insights by reviewing the [product documentation](https://docs.microsoft.com/azure/time-series-insights/time-series-insights-overview).
