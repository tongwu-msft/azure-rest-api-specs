---
ms.assetid:
ms.title: Gen1 query syntax - Azure Time Series Insights | Microsoft Docs
title: Gen1 query syntax - Azure Time Series Insights | Microsoft Docs
services: time-series-insights
ms.service: time-series-insights
service_description: Azure Time Series Insights
description: This reference document specifies query syntax for Azure Time Series Insights Gen1 REST API queries, requests, and operations.
manager: deepakpalled
ms.manager: dpalled
author: shreyasharmamsft
ms.author: shresha
ms.date: 03/05/2021
---

# Azure Time Series Insights Gen1 query syntax

> [!CAUTION]
> This is a Gen1 article.

This article describes the query request format and syntax for the Azure Time Series Insights Gen1 [Query API](gen1-query-api.md).

## Summary

> [!IMPORTANT]
>
> * Query requests must be in JSON format.
> * HTTP request payloads made to the [Query API](gen1-query-api.md) should conform to the format specified in this article.

The language is subdivided into the following elements:

* [*Scalar* expressions](#scalar-expressions), which produce scalar values. Scalar expressions include [predicate string expressions](#predicate-string-expressions), [comparison expressions](#comparison-expressions), and [arithmetic expressions](#arithmetic-expressions).
* [*Scalar* functions](#scalar-functions), which return scalar values.
* [*Aggregate* expressions](#aggregate-expressions), which are used to partition collections of events and compute measures over the partitions.
* [*Clauses*](#clauses), which form the constituent components of JSON queries or a part of an expression.

## Data model

The Azure Time Series Insights Gen1 Query API operates on data that's stored as individual *events* within an environment. Each event is a set of *property name* and *value* pairs.

### Event properties

Event properties can be of one of the following primitive types: **Bool**, **DateTime**, **Double**, or **String**. All primitive types are nullable.

> [!NOTE]
> Customized event source formats may support a larger set of value types. Azure Time Series Insights Gen1 infers the closest primitive type and then casts customized types to them at ingress.

All events have the following built-in properties with a predefined name and type:

| Property name | Property type | Definition |
|-|-|-|
| **$ts** | **DateTime** | Event timestamp |
| **$esn** | **String** | Event source name |

* Event timestamp

    By default, an event timestamp value is provided by the event source. For example, events coming from an IoT hub would have their enqueued time as a timestamp.

    Customers can modify this behavior by configuring another event property instead. Custom timestamp properties can be specified in [event hubs](https://docs.microsoft.com/azure/time-series-insights/time-series-insights-how-to-add-an-event-source-eventhub#add-a-new-event-source) and [IoT hubs](https://docs.microsoft.com/azure/time-series-insights/time-series-insights-how-to-add-an-event-source-iothub#add-a-new-event-source).

* Event source name

    The *event source name* is the name that's displayed for the event source from which Azure Time Series Insights Gen1 has received the event. Event source names are associated with a particular event at ingress time.

    > [!IMPORTANT]
    >
    > * Event source names remain unchanged for the lifetime of the event.
    > * If the name of an event source is modified, existing events carry the old event source name. New events will carry the new event source name.

### Event types

Custom event properties are uniquely identified and referenced in query expressions by name and type. An event can have more than one property with the same name and different types. Properties with the same name but different types might result from ingress type splitting.

An event property value of **String** type can be stored as a property with a different type in the following cases:

* If a **String** value is a valid **Double** value, it's stored both as **Double** and **String**.
* If a **String** value is a valid **DateTime** value, it's stored as **DateTime** only.

The Query API converts empty **Strings** literals (`""`) to `null` in the output.

Azure Time Series Insights Gen1 has limited support for the following values within the **Double** type: `Double.NaN`, `Double.PositiveInfinity`, and `Double.NegativeInfinity`.
These values are converted to `null` during ingress, but if query evaluation produces one of these values, the value is evaluated and serialized as a **String** in response.

You can pass these values as **Strings** for ingress, so in query expressions these values should also be passed as **Strings**.

**Event schemas** describe the properties of an event. An event schema contains the name of an event source and the ordered set of properties for the event. Different events can have different schemas or share the same schema.

## Scalar expressions

*Scalar* expressions produce scalar values. Scalar expressions are divided into the following kinds:

* [Constant expressions](#constant-expressions)
* [Property reference expressions](#property-reference-expressions)
* [Comparison expressions](#comparison-expressions)
* [Arithmetic expressions](#arithmetic-expressions)
* [Predicate string expressions](#predicate-string-expressions)

### Constant expressions

You represent *constant* expressions by using the following literals for each of the primitive types:

| Primitive type | JSON representation | JSON example | Notes |
|-|-|-|-|
| **Bool** | As a [JSON Boolean](https://json-schema.org/understanding-json-schema/reference/boolean.html) type | `true`, `false`|  |
| **DateTime** | As a nested object with single **dateTime** property in [ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html) format `yyyy'-'MM'-'dd'T'HH':'mm':'ss.FFFFFFFK`. | `{"dateTime":"2016-08-01T00:00:00.000Z"}`|  |
| **Double** | A [JSON **number**](https://json-schema.org/understanding-json-schema/reference/numeric.html) cast to the **Double** range. | `1.23e45`, `123`| **Double** overflows will generate an error. |
| **String** | A [JSON **string**](https://json-schema.org/understanding-json-schema/reference/string.html) type | `"abc"`|  |
| **TimeSpan** | As a nested object with single **timeSpan** property in [ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html) format: `P[n]Y[n]M[n]DT[n]H[n]M[n]S`. | `{"timeSpan":"P1Y2M3DT4M5.67S"}`|  |

### Nullable primitive types

Primitive data types are nullable. `null` values for primitive types are expressed in JSON as follows:

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

### Property reference expressions

You use a *property reference* expression to access the values of *non-built-in properties* of an event. Non-built-in properties include any customized property beyond the default ones that are automatically contained in an event schema.

The result type of a property reference expression is the primitive type of the property. Properties in the event schema are uniquely identified by name and type, and the reference expression requires both to be specified.

* JSON examples:

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

A *built-in property reference* expression is used to access *built-in properties* of an event. Built-in properties are only those properties that are automatically defined in an event schema.

The result type of a built-in property reference expression is the primitive type of the property. Built-in properties are referenced by name only; therefore, no type is needed in the reference expression:

```JSON
{ "builtInProperty": "$esn" }
```

### Comparison expressions

The following *Boolean comparison* expressions are supported:

| Property name in JSON | Description |
|-|-|
| **eq** | Equal |
| **in** | In (equal any) |
| **phrase** | Contains phrase |
| **startsWith** | Starts with |
| **endsWith** | Ends with phrase |
| **regex** | Matches regular expression |
| **lt** | Less than |
| **lte** | Less than or equal |
| **gt** | Greater than |
| **gte** | Greater than or equal |

> [!IMPORTANT]
>
> * All comparison expressions take the primitive types of both left-hand and right-hand arguments and return a *Boolean* value representing the result of the comparison.
> * Both types of the left-hand and right-hand arguments in comparisons should match.
> * All types implicitly cast only to themselves, and explicit casts are not supported.

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

* JSON examples:

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

| Argument type | Supported comparison operation |
|-|-|
| **Bool** | **eq**, **in** |
| **DateTime** | **eq**, **in**, **lt**, **lte**, **gt**, **gte** |
| **Double** | **eq**, **in**, **lt**, **lte**, **gt**, **gte** |
| **String** | **eq**, **in**, **phrase**, **startsWith**, **endsWith**, **regex** |
| **TimeSpan** | **eq**, **in**, **lt**, **lte**, **gt**, **gte** |

The **NULL** literal can be used only with the following comparison operators: **eq** or **in**.

* The **eq** operator results in `true` if both sides are `null` values. Otherwise, the operator results in `false`.
* For other operations, the error is raised for the **NULL** literal, and the behavior is undefined for null-value properties (any comparison operation that results in `false`).
* A `null` value precedes non-null values in sort orderings (for example, if sorting by a property is applied to return a list of events).

Azure Time Series Insights Gen1 supports the following *Boolean* logical expressions:

| Property name in JSON | Description |
|-|-|
| **and** | Takes a non-empty set of *Boolean* arguments and returns `true` if all of them evaluate to `true`. |
| **or** | Takes a non-empty set of *Boolean* arguments and returns `true` if any of them evaluate to `true`. |
| **not** | Takes a single *Boolean* argument and returns its negated value. |

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

The **stringComparison** property is optional. By default, its value is `OrdinalIgnoreCase`, which causes sentence casing to be ignored in comparisons.

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

### Arithmetic expressions

Azure Time Series Insights Gen1 supports the following *arithmetic* expressions:

| Property name in JSON | Description |
|-|-|
| **add** | Addition |
| **sub** | Subtraction |
| **mult** | Multiplication |
| **div** | Division |

All arithmetic expressions take the left and right arguments of primitive types and return a value that represents the result of the operation.

All types implicitly cast only to themselves, and explicit casts are not supported.

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

The following table shows supported types of arguments for each of the arithmetic expressions:

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

### Predicate string expressions

*Boolean predicate string* expressions contain Boolean predicates that are represented as human-readable expressions called *predicate strings*.

Examples of predicate strings:

| Predicate string | Description |
|-|-|
| `Description HAS 'hello world'` | `true` for events that contain the phrase `hello world` in the **Description** property across all event sources |
| `'hello world'` | `true` for events that contain the phrase `hello world` |
| `startsWith(Status, 'go')` | `true` for events with **Status** starting with `go` |
| `endsWith(Status, 'oD')` | `true` for events with  **Status** ending with `od` |
| `startsWith_cs(Status, 'Go')` | `true` for events with  **Status** starting with `Go` |
| `endsWith_cs(Status, 'od')` | `true` for events with  **Status** starting with `od` |
| `matchesRegex(s, '^G*')` | `true` for events with  **Status** that matches the regular expression `^G*` |
| `PointValue.Double = 3.14` | `true` for events with double **PointValue** equal to `3.14` |
| `Status IN ('Good','Bad')` | `true` for events with  **Status** that contains `Good` or `Bad` |
| `PointValue > 3.14 AND Status.String = 'Good'` | `true` for events with **PointValue** greater than `3.14` and string **Status** of `Good` |
| `[PointValue] > 3.14 AND ([Status] = 'Good' OR [Status] = 'Bad') AND NOT [Description] HAS 'hello world'` | `true` for events with **PointValue** greater than `3.14` and **Status** of `Good` or `Bad` and **Description** not containing the phrase `hello world` |

```JSON
{ "predicateString": "PointValue.Double = 3.14" }
```

The expression in the predicate string is evaluated into a JSON Boolean expression. It should comply with the following (simplified) grammar:

| JSON Boolean expression | Backus–Naur form |
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

Azure Time Series Insights Gen1 primitive data types are supported in predicate string expressions.

Unlike JSON [property reference expressions](#property-reference-expressions), a type for a property can be omitted, in which case a type is automatically inferred.

#### Supported literals

| Primitive type | Literals |
|--|--|
| **Bool** | `TRUE`, `FALSE` |
| **DateTime** | `dt'2016-10-08T03:22:55.3031599Z'` |
| **Double** | `1.23`, `1.0` |
| **String** | `'abc'` |
| **TimeSpan** | `ts'P1Y2M3DT4M5.67S'` |
|  | `NULL` |

#### Supported operand types

| Operation | Supported types | Notes |
|--|--|--|
| **<**, **>**, **<=**, **>=** | **Double**, **DateTime**, **TimeSpan** | |
| **=**, **!=**, **<>** | **String**, **Bool**, **Double**, **DateTime**, **TimeSpan**, **NULL** | **<>** is equivalent for **!=** |
| **+**, **-**, **\***, **/** | **Double**, **DateTime**, **TimeSpan** | |
| **IN** | **String**, **Bool**, **Double**, **DateTime**, **TimeSpan**, **NULL** | All operands should be of the same type or be **NULL** constant. Multiple **NULL**s are equivalent to a single **NULL**. |
| **HAS** | **String** | Only constant string literals are allowed at right-hand side. Empty string and **NULL** are not allowed. |

For comparison predicates (**<**, **>**, **<=**, **>=**, **=**, **!=**) and the **IN** predicate operand can be **NULL** or have a single type.

For expressions with a **HAS** predicate, the constant literal on the right-hand side of the **HAS** operand can be expanded into multiple types. Additionally, the constant literal to the right-hand side of the **HAS** operand is parsed into a **Bool**, **Double**, **DateTime**, or **TimeSpan** value. For each successfully parsed value, a predicate with the **=** operator is created. These predicates and the original **HAS** predicate are joined into an **OR** predicate. For example, a predicate string `p1 HAS '1.0'` is equivalent to `p1.String HAS '1.0' OR p1.Double = 1.0`, if **p1** properties with **String** and **Double** types exist.

#### Type checking

Predicate expressions are type-checked and validated to ensure that the right-hand and left-hand types within them match.

> [!IMPORTANT]
>
> * When the constants to the left and right of an operand do not match, an error is thrown.
> * An error is also thrown if an operation is not allowed on or between specific types.

* If a type is specified for property, a type check is applied:

  * Any property type is accepted against a **NULL** literal.
  * Otherwise, left-hand side and right-hand side types should match.

    Examples of properties **p1** and **p2** of the **String** type, and property **p3** of the **Double** type are displayed in the following table:

    | Predicate string | Is valid? | Notes |
    | - | - | - |
    | `p1.String = 'abc'` | Yes | |
    | `p1.String = p2.String` | Yes | |
    | `p1.String = NULL` | Yes | `NULL` matches any left-hand side type. |
    | `p3.Double = 'abc'` | No | Type mismatch. |
    | `p3.Double = p1.String` | No | Type mismatch. |
    | `p1.String HAS 'abc'` | Yes | |
    | `p3.Double HAS '1.0'` | Yes | String literal was successfully parsed to a **Double** value. |

* If a type is omitted for the property but a name is specified, the following steps are performed:

    1. All properties with a specified name and types are taken.
    1. Left-hand side and right-hand side operands are grouped in pairs by type.
    1. Pairs are concatenated by using **AND** operations.

  * Examples of properties **p1** and **p2** of the **String** and **Double** types and some of their equivalents are displayed in the following table:

      | Predicate string | Equivalent strong-typed predicate string | Notes |
      |--|--|--|
      | `p1 = 'abc'` | `p1.String = 'abc'` |  |
      | `p1 = true` |  | No **p1** property of type **Bool**, so a missing property error is emitted. |
      | `p1 = NULL` | `p1.String = NULL AND p1.Double = NULL` | For `NULL` right-hand side it is assumed that all matching properties should be `NULL`. |
      | `p1 != NULL` | `p1.String != NULL OR p1.Double != NULL` | This is an inversion of the preceding expression. |
      | `p1 = '1.0'` | `p1.String = '1.0'` |  |
      | `p1 IN (1.0, NULL)` | `p1.Double = 1.0 OR p1.Double = NULL` |  |
      | `p1 IN (NULL)` | `p1.String = NULL AND p1.Double = NULL` | This is the equivalent of `p1 = NULL`. |
      | `p1 HAS '1.0'` | `p1.String HAS '1.0' OR p1.Double = 1.0` | The string literal was successfully parsed to a valid **Double** value. |
      | `p1 HAS 'true'` | `p1.String HAS 'true'` | The string literal was successfully parsed to **Bool**, but no **p1.Bool** property exists. |
      | `p1 = p2` | `p1.String = p2.String AND p1.Double = p2.Double` |  |
      | `p1 != p2` | `p1.String != p2.String OR p1.Double != p2.Double` | This is an inversion of the preceding expression. |

* Both the property name and type can be omitted for a left-hand side property if the right-hand side property type is well-defined. This is true whenever the right-hand side has constant literals and it doesn't contain only a `NULL` literal.

  * This scenario is a generalization of full-text search that uses the **HAS** operand.
  * All properties that match the right-hand side type are taken, and the resulting expressions are concatenated via an **OR** operation.
  * Examples of property **p1** of the **String** and **Double** types and property **p2** of the **String** and **DateTime** types are displayed in the following table:

      | Predicate string | Equivalent strong-typed predicate string | Notes |
      |--|--|--|
      | `= 'abc'` | `p1.String = 'abc' OR p2.String = 'abc'` |  |
      | `!= 'abc'` | `p1.String != 'abc' AND p2.String != 'abc'` | Inversion of the preceding expression |
      | `= 1.0` | `p1.Double = 1.0` | |
      | `= dt'2000-01-02T03:04:05'` | `p2.DateTime = dt'2000-01-02T03:04:05'` | |
      | `= true` |  | Error. No **Bool** property exists, so a missing property error is emitted. |
      | `= NULL` |  | Error. Omitting the property name for `NULL` right-hand side is not allowed. |
      | `IN (NULL)` |  | Same as the preceding error. |
      | `IN (1.0, NULL)` | `p1.Double = 1.0 OR p1.Double = NULL` |  |
      | `HAS '1.0'` | `p1.String HAS '1.0' OR p1.Double = 1.0 OR p2.String HAS '1.0'` |  |
      | `HAS 'true'` | `p1.String HAS 'true' OR p2.String HAS 'true'` | There is no property with type **Bool**. |

* If the operator is omitted together with a property name, the `HAS` operation is assumed.

## Scalar functions

*Scalar functions* return scalar values.

### Native functions

Scalar functions that are supported out-of-box by Azure Time Series Insights Gen1 include:

| Function name | Return value | Arguments | Example | Notes |
|--|--|--|--|--|
| utcNow | **DateTime** | None | utcNow() | Returns the current time in UTC format. The function name is case-sensitive. |

The **UTC now** function returns a **DateTime** value, which contains the current time in UTC format. It does not accept any arguments.

## Aggregate expressions

Aggregate expressions are used to partition collections of events and compute measures over the partitions. Aggregate expressions are divided into the following kinds:

* [Dimension expressions](#dimension-expressions)
* [Unique values expressions](#unique-values-expressions)
* [Date histogram expressions](#date-histogram-expressions)
* [Measure expressions](#measure-expressions)

### Dimension expressions

You use *dimension* expressions inside an *aggregates clause* to partition a set of events and assign a scalar key to each partition.

Dimension expression types:

| Property name in JSON | Description | Example |
|-|-|-|
| **uniqueValues** | Dimension values in the result are exact values of a given property. |  |
| **dateHistogram** | Dimension values in the result are ranges of time of a given property. | The date histogram of the timestamp might result in 10 1-hour ranges for a 10-hour search span. |
| **numericHistogram** | Dimension values in the result are ranges of values in a given property. | The numeric histogram of temperature might result in a return of 10 ranges of degrees. |

Azure Time Series Insights Gen1 restricts the maximum cardinality, or maximum lattice size, of an input aggregate query to 150,000 cells.  To calculate the cardinality of an aggregate query, you multiply the sizes of all dimensions in the query.  As long as the product is less than 150,000, the query is accepted for execution. If the product is equal to or less than 150,000, the query is rejected.  

You specify the maximum size of a dimension that's produced by **uniqueValues** and **numericHistogram** by using the **take** clause. In **dateHistogram**, the size is calculated by dividing the search span by the size of the **dateHistogram** interval, which you specify by using the **breaks** clause.

For example, an aggregate query has the search span set from "2017-11-15T16:00:00.000Z" to "2017-11-15T19:00:00.000Z" = 3 hours.  If the query includes **dateHistogram** with the **breaks** clause, set to 1 minute (dimension 1) and **uniqueValues** over property XYZ, the **dateHistogram** dimension size is 3x60=180. This result means that **uniqueValues** can take up to 150,000/180 = 833 items total.  

### Unique values expressions

You use a *unique values* expression to group a set of events by the values of a specified event property.

Evaluation of this JSON expression results in up to 100 records, which are grouped by the `sensorId` **String** property.

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

### Date histogram expressions

You use a *date histogram* expression to group **DateTime** property values into buckets of a specified size.

An evaluation of this JSON expression results in a set of **Timestamp** records that are floor-rounded such that each value has seconds zeroed.

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

### Numeric histogram expressions

You use a *numeric histogram* expression to group **Double** property values into a specified number of buckets.

An evaluation of this JSON expression results in 10 records, so the range between the minimum and maximum values of the **p1** property is divided into 10 buckets.

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

### Measure expressions

You use *measure* expressions inside *aggregates clauses* to compute a scalar value on a set of events. For example, a measure expression is the calculation of the maximum value measured by a temperature sensor during the last 24 hours.

You use a *count* expression to calculate the number of events within a corresponding bucket.

```JSON
{ "count": {} }
```

You use *min*, *max*, *avg*, and *sum* expressions to calculate the  minimum, maximum, average of, and sum of the values for a specified property within a corresponding bucket.

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

With *first* and *last* measure expressions, you can get the value of a specified property **A** that corresponds to the minimum or maximum value of property **B**.

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

The **orderBy** clause is optional and defaults to the **Timestamp** property **$ts**. The input can be of any type. The **orderBy** clause supports only **Double** and **DateTime** types.

If property **B** is a **DateTime** type, you get the latest or the earliest value of property **A**.

You can use *first* and *last* expressions to help understand the earliest or latest value of a specific property. For example, if you have a property called `deviceID` and you want to understand the latest `deviceID` that sent an event, *last* is the most efficient expression operator to use to identify that information.

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

Another example is to use *last* to find the last reported location of a particular object, such as a ship, vehicle, or other moving object.

To illustrate a query that produces the last known location of the ships in a fleet, you could author a query similar to the following:

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

Another example is to use *first* to find a device that reports the lowest pressure for every plant:

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

### Dimension and measure type support

Here are the supported dimension and measure expressions, based on property type:

| Property type | Supported dimension expressions | Supported measure expressions |
|-|-|-|
| **Bool** | `"uniqueValues"` | `"first"` (input), `"last"` (input) |
| **DateTime** | `"uniqueValues"`, `"dateHistogram"` | `"min"`, `"max"`, `"first"` (orderBy, input), `"last”` (orderBy, input)|
| **Double** | `"uniqueValues"`, `"numericHistogram"` | `"sum"`, `"avg"`, `"min"`, `"max"`, `"first"` (orderBy, input), `"last”` (orderBy, input) |
| **String** | `"uniqueValues"` | `"first"` (input), `"last"` (input) |

## Clauses

*Clauses* form constituent components of JSON queries or a part of an expression. Clauses are divided into the following kinds:

* [Search span clauses](#search-span-clauses)
* [Predicate clauses](#predicate-clauses)
* [Limit top clauses](#limit-top-clauses)
* [Limit take clauses](#limit-take-clauses)
* [Limit sample clauses](#limit-sample-clauses)
* [Breaks clauses](#breaks-clauses)
* [Aggregates clauses](#aggregates-clauses)

### Search span clauses

You use a *search span* clause to filter a built-in **Timestamp** property of an event to a given interval. The start of the interval is inclusive. The end of the interval is exclusive.

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

The **from** and **to** properties in the search span clause (**searchSpan**) should be valid expressions of the **DateTime** result type. These expressions are evaluated prior to query execution, which means that they should not contain any property references.

### Predicate clauses

You use a *predicate* clause to filter events that satisfy the predicate. It should be resolved into a *Boolean* expression.

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

To filter events means to run a predicate that's represented by a Boolean expression on each event in the environment. The execution of an expression on an event returns `true` if the event must be included in further operations. It returns `false` if the event must be omitted from further processing.

> [!NOTE]
> Events are always filtered by search span in addition to any filtering that's specified within a predicate expression.

### Limit top clauses

You use a **limit top* clause to get a specified number of values in either ascending or descending order. The number of values is limited as per the specified count.

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

### Limit take clauses

You can use a *limit take* clause as a quick way to get a set of values in no particular order. The number of returned values is limited by the specified input.

```JSON
{ "take": 10 }
```

### Limit sample clauses

You use a **limit sample* clause to get a statistically representative sample from a set of values. The number of returned values is limited by the specified input.

```JSON
{ "sample": 10 }
```

### Breaks clauses

You use a **breaks* clause in histogram expressions to specify how a range should be divided.

For date histograms, you should specify the size of the datetime interval and interval boundaries. You do so unless the histogram is based on a built-in **Timestamp** property where the boundaries are determined based on search span:

* Interval boundaries are optional and can be used. For example, you can use them when they're determined based on a search span if interval boundaries are omitted.
* For numeric histograms, you should specify the number of breaks. You determine interval boundaries based on the minimum and maximum values of a property.

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

### Aggregates clauses

You use an *aggregates* clause to partition a set of events by a given property while you're measuring the values of other event properties.

Measures are evaluated on each partition that's produced by the dimension expression.

* The following JSON example computes average, minimum, and maximum temperatures per sensor ID.

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

  > [!NOTE]
  > An aggregates clause is an array that lets you specify more than one aggregation at the topmost level.

* The following JSON example computes the average temperature per city and per manufacturer independently:

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
  >
  > * Having more than one element in an aggregates array is not currently supported.
  > * However, an aggregation definition may include a nested array that specifies a more flexible, multidimensional lattice.

* The following JSON example computes average temperature per sensor ID, per minute.

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

* For more information about the Azure Time Series Insights Gen1 APIs, see [Gen1 APIs](gen1.md).

* To learn about request and authentication parameters, see [Authentication and authorization](https://docs.microsoft.com/azure/time-series-insights/time-series-insights-authentication-and-authorization).

* Learn more about Azure Time Series Insights Gen1 by reviewing the [Gen1 documentation](https://docs.microsoft.com/azure/time-series-insights/time-series-insights-overview).
