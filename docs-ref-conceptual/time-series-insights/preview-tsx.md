---
title: Azure Time Series Insights (Preview) TSX  | Microsoft Docs
description: This topic describes the Azure Time Series Insights (Preview) TSX
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
# Time Series Expression (TSX)

Time Series Expression (tsx) is a string-based expression language with strong typing. TSX is used to represent the following entities in a [Time Series Query](preview-query.md).

- Filter
- Value
- Aggregation

## Filter Expressions
**Filter expressions** are used to represent boolean clauses. Examples of filters:

| TSX | Description |
|-|-|
| $event.PointValue.Double = 3.14 | `true` for events with double PointValue equal to 3.14 |
| $event.PointValue > 3.14 AND $event.Status.String = 'Good' | `true` for events with PointValue greater than 3.14 and string Status 'Good' |
| $event.$ts > dt'2018-11-01T02:03:45Z' | `true` for events with event timestamp greater than 2018-11-01T02:03:45Z |
| $event.PointEval.Bool == true | `true` for events with property PointEval equal to true |

## Value Expressions
**Value expressions** are used to depict the value for Numeric variables. It can be only a single property reference expression of type Double.

For example: 

| TSX | Notes |
|--|--|
| `$event.temperature.Double` | |
| `$event.[Temperature.ABC].Double` | Use `[` and `]` for escaping |
| `$event.Temperature` | The type is assumed to be double |

## Aggregation Expressions
**Aggregate expressions** are used to depict the aggregation operation to be used on the query. It results in a single value for each interval. Aggregate expression can be applied on Numeric and Aggregate variable kinds.

### Numeric

Numeric variables should refer to `$value`.

Here are the supported aggregate functions.

| Aggregate Function | Example | Description |
|--|--|--|
| `min`  | `min($value)` | Calculates the minimum of the `$value` per interval. Avoids `null` values. |
| `max`  | `max($value)` | Calculates the maximum of the `$value` per interval. Avoids `null` values. |
| `sum`  | `sum($value)` | Calculates the sum of `$value` over all the events in the interval. Avoids `null` values. |
| `avg`  | `avg($value)` | Calculates the average of `$value` over all the events in the interval. Avoids `null` values. |
| `first`  | `first($value)` | Returns `$value` of the first occurring event in the interval by event timestamp, this function does not avoid null values. |
| `last`  | `last($value)` | Returns `$value` of the last occurring event in the interval by event timestamp, this function does not avoid null values. |

### Aggregate

Aggregate variables should only refer to `$event.<PropertyName>.<Type>`.

Here are the supported aggregate functions.

| Aggregate Function | Example | Description |
|--|--|--|
| `count`  | `count()` | Returns the number of events per interval. |
| `min`  | `min($event.Temperature.Double)` | Calculates the minimum of the `double` property `Temperature` per interval. Avoids `null` values. |
| `max`  | `max($event.Temperature.Double)` | Calculates the maximum of the `double` property `Temperature` per interval. Avoids `null` values.  |
| `sum`  | `sum($event.Temperature.Double)` | Calculates the sum of the `double` property `Temperature` over all the events in the interval. Avoids `null` values. |
| `avg`  | `avg($event.Temperature.Double)` | Calculates the average of the `double` property `Temperature` over all the events in the interval. Avoids `null` values. |
| `first`  | `first($event.Temperature.Double)` | Returns the value of the `double` property `Temperature` from the first occurring event in the interval by event timestamp, this function does not avoid null values. |
| `last`  | `last($event.Temperature.Double)` | Returns the value of the `double` property `Temperature` from the last occurring event in the interval by event timestamp, this function does not avoid null values. |

## Syntax

### Supported literals
| Primitive Type | Literals |
|--|--|
| Bool  | TRUE, FALSE |
| DateTime | dt'2016-10-08T03:22:55.3031599Z' |
| Double   | 1.23, 1 |
| String   | 'abc' |
| TimeSpan | ts'P1Y2M3DT4M5.67S' |
|  | NULL |

### Supported operand types
| Operation | Supported Types | Notes |
|--|--|--|
| <, >, <=, >= | Double, DateTime, TimeSpan | |
| =, !=, <> | String, Bool, Double, DateTime, TimeSpan, NULL | <> is equivalent for != |
| +, -, *, / |  Double, DateTime, TimeSpan | |

### Supported scalar functions
| Function name | Return value | Arguments | Example | Notes |
|--|--|--|--|--|
| utcNow | DateTime | None | utcNow() | Returns current time in UTC format. Function name is case-sensitive. |

For comparison expressions (`<`, `>`, `<=`, `>=`, `=`, `!=`), operand can be `NULL` or have a single type.
In each predicate expression, types of left-hand side and right-hand side operands are validated to match.
Errors occur when types of left and right sides do not agree, or operation is not allowed on particular types.

1. If type is specified for property, then type check is applied:
   * Any property type is accepted against NULL literal
   * Otherwise, types of left-hand side and right-hand side should match

2. If type is omitted for property but name is specified, then type is assumed to be double.

Here are examples given properties "p1" and "p2" of type String, and property "p3" of type Double:

| Filter | Is valid? | Notes |
| - | - | - |
| $event.p1.String = 'abc' | Yes | |
| $event.p1.String = $event.p2.String | Yes | |
| $event.p1.String = NULL | Yes | NULL matches any left-hand side type. |
| $event.p3.Double = 'abc' | No | Type mismatch. |
| $event.p3.Double = $event.p1.String | No | Type mismatch. |
| $event.p1 = 'abc' | No |  Type mismatch. |
| $event.p1 = true | No | Type mismatch. |
| $event.p1 = NULL | Yes | $event.p1.Double = NULL |
| $event.p1 != NULL | Yes | $event.p1.Double != NULL |
| $event.p1 = '1.0' | No | Type mismatch. |

    
