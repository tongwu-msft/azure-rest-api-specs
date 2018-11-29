---
title: Azure Time Series Insights Update TSX  | Microsoft Docs
description: This topic describes the Azure Time Series Insights update TSX
keywords:
services: time-series-insights
documentationcenter:
author: dpalled
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

Time Series Expression (tsx) is a string based expression language with strong typing. TSX is used to represent the following entities in a [Time Series Query](time-series-insights-reference-update-tsq.md).

- Predicate
- Value
- Aggregation

## Predicate Expressions
**Predicate expressions** are used to represent boolean clauses. Examples of predicate string:

| Predicate string | Description |
|-|-|
| $event.PointValue.Double = 3.14 | `true` for events with double PointValue equal to 3.14 |
| $event.PointValue > 3.14 AND $event.Status.String = 'Good' | `true` for events with PointValue greater than 3.14 and string Status 'Good' |
| $event.$ts > dt'2018-11-01T02:03:45Z' | `true` for events with event timestamp greater than 2018-11-01T02:03:45Z |
| $event.PointEval.Bool == true | `true` for events with property PointEval equal to true |

## Value Expressions
**Value expressions** are used to depict the value for Numeric variables. It can be only a single property reference expression of type Double.

For example: `$event.temperature.Double`

## Aggregation Expressions
**Aggregate expressions** are used to depict the aggregation operation to be used on the query. It results in a single value for each interval. Aggregate expression can be applied on Numeric and Aggregate variable kinds.

### Numeric
For numeric variables, we have the following aggregate types: `min`, `max`, `avg` and `sum`.

For example: `min($value)`

### Aggregate
For aggregate variables, we currently support `count`.

For example: `count()`

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

For comparison predicates (`<`, `>`, `<=`, `>=`, `=`, `!=`), operand can be `NULL` or have a single type.
In each predicate expression, types of left-hand side and right-hand side operands are validated to match.
Errors occur when types of left and right sides do not agree, or operation is not allowed on particular types.

1. If type is specified for property, then type check is applied:
   * Any property type is accepted against NULL literal
   * Otherwise, types of left-hand side and right-hand side should match

    Here are examples given properties "p1" and "p2" of type String, and property "p3" of type Double:

    | Predicate string | Is valid? | Notes |
    | - | - | - |
    | p1.String = 'abc' | Yes | |
    | p1.String = p2.String | Yes | |
    | p1.String = NULL | Yes | NULL matches any left-hand side type. |
    | p3.Double = 'abc' | No | Type mismatch. |
    | p3.Double = p1.String | No | Type mismatch. |

2. If type is omitted for property but name is specified, then the following steps are performed:

    1. All properties with given name and types are taken.
    2. Left-hand side and right-hand side operands are grouped in pairs by type.
    3. Pairs are concatenated via `AND` operation.

    Here are examples given properties "p1" and "p2" of type String and Double:

    | Predicate string | Equivalent strong-typed predicate string | Notes |
    |--|--|--|--|
    | p1 = 'abc' | p1.String = 'abc' |  |
    | p1 = true | - | No p1 property of type Bool, so missing property error is emitted. |
    | p1 = NULL | p1.String = NULL AND p1.Double = NULL | For NULL right-hand side it is assumed that all matching properties should be NULL. |
    | p1 != NULL | p1.String != NULL OR p1.Double != NULL | Inversion of the preceding expression |
    | p1 = '1.0' | p1.String = '1.0' |  |
    | p1 = p2 | p1.String = p2.String AND p1.Double = p2.Double |  |
    | p1 != p2 | p1.String != p2.String OR p1.Double != p2.Double | Inversion of the preceding expression |
