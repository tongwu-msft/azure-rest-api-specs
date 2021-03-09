---
ms.assetid:
ms.title: Azure Time Series Insights Gen2 Time Series Expression and syntax - Azure Time Series Insights Gen2 | Microsoft Docs
title: Azure Time Series Insights Gen2 Time Series Expression and syntax - Azure Time Series Insights Gen2 | Microsoft Docs
services: time-series-insights
ms.service: time-series-insights
service_description: Time Series Insights
description: Time Series Expression and syntax overview of REST API and data access concepts reference documentation for Azure Time Series Insights Gen2.
manager: deepakpalled
ms.manager: dpalled
author: shreyasharmamsft
ms.author: shresha
ms.date: 08/05/2020
---

# Azure Time Series Insights Gen2 Time Series Expression syntax

## Overview

Time Series Expression (TSX) is a string-based expression language with strong typing. TSX is used to represent the following entities in a [Time Series Query](reference-query-apis.md).

* Filter
* Value
* Aggregation

## Filter expressions

*Filter expressions* are used to represent boolean clauses. The following table lists examples of filters:

| TSX | Description |
|-|-|
| `$event.PointValue.Double = 3.14` | `true` for events with double **PointValue** equal to `3.14` |
| `$event.PointValue > 3.14 AND $event.Status.String = 'Good'` | `true` for events with **PointValue** greater than `3.14` and string status `Good` |
| `$event.$ts > dt'2018-11-01T02:03:45Z'` | `true` for events with a time stamp greater than `2018-11-01T02:03:45Z` |
| `$event.PointEval.Bool = true` | `true` for events with **PointValue** equal to `true` |

## Value expressions

*Value expressions* are used to depict the value for numeric and categorical variables. A value expression can be a property reference expression of type **Double** or **Long**.

For example:

| TSX | Notes |
|--|--|
| `$event.Temperature.Double` | The last token in any value expression (in this case `Double`) is read as the Type of the property. |
| `$event.Temperature` | The type is assumed to be **Double** for a property accessed by a single token. |
| `$event['Temperature-Celsius']` | Use `[` and `]` for escaping tokens that have special characters. Additionally, use `\` within the brackets to escape the following characters: `\` and `'`.  |
| `$event.Temperature.Celsius.Double` | Use `.` to access nested properties. When accessing nested properties, the Type is **required**. |
| `$event.Temperature['Celsius-C'].Double` | Use `[` and `]` for escaping tokens that have special characters when accessing nested properties. Additionally, use `\` within the brackets to escape the following characters: `\` and `'`. When accessing nested properties, the Type is **required**. |
| `$event['Temperature']['Celsius'].Double` | Use of `[` and `]` for escaping tokens is allowed on any token. |

### Numeric variable kind

The result of the value expression should be of **Double** or **Long** type.

### Aggregate variable kind

The result of the value expression can be of any supported types.

### Categorical variable kind

The result of the value expression can only be **String** or **Long** type.

## Aggregation expressions

*Aggregate expressions* are used to depict the aggregation operation to be used on the query. An aggregate expression results in a single value for each interval. Aggregate expressions can be applied on numeric and aggregate variables.

### Aggregation expressions - numeric variable kind

Numeric variables should refer to `$value`.

Here are the supported aggregate functions.

| Aggregate Function | Example | Description |
|--|--|--|
| `min`  | `min($value)` | Calculates the minimum of the `$value` per interval. Avoids `null` values. Cannot be used with interpolation. |
| `max`  | `max($value)` | Calculates the maximum of the `$value` per interval. Avoids `null` values. Cannot be used with interpolation. |
| `sum`  | `sum($value)` | Calculates the sum of `$value` over all the events in the interval. Avoids `null` values. Cannot be used with interpolation. |
| `avg`  | `avg($value)` | Calculates the average of `$value` over all the events in the interval. Avoids `null` values. Cannot be used with interpolation. |
| `first`  | `first($value)` | Returns `$value` of the first occurring event in the interval by event time stamp. Does **not** avoid `null` values. Cannot be used with interpolation. |
| `last`  | `last($value)` | Returns `$value` of the last occurring event in the interval by event time stamp. Does **not** avoid `null` values. Cannot be used with interpolation. |
| `median` | `median($value)` | Returns `$value` of the middle event in the interval by event time stamp. Does **not** avoid `null` values. Cannot be used with interpolation. |
| `stdev` | `stdev($value)` | Returns `$value` of the standard deviation of the events in the interval. Avoids `null` values. Cannot be used with interpolation. |
| `twsum` | `twsum($value)` | Returns `$value` of the time weighted sum of the events in the interval. Requires interpolation. |
| `twavg` | `twavg($value)` | Returns `$value` of the time weighted average of the events in the interval. Requires interpolation. |
| `left`  | `left($value)` | Returns the `$value` at the left edge of the given interval. Requires interpolation. |
| `right`  | `right($value)` | Returns the `$value` at the right edge of the given interval. Requires interpolation. |

### Aggregation expressions - aggregate variable kind

*Aggregate variables* should refer to a Property in the event payload.

Here are the supported aggregate functions.

| Aggregate function | Example | Description |
|--|--|--|
| `count`  | `count()` | Returns the number of events per interval. |
| `min`  | `min($event.Temperature.Double)` | Calculates the minimum of the property **Temperature** per interval. Avoids `null` values. |
| `max`  | `max($event.Temperature.Long)` | Calculates the maximum of the property **Temperature** per interval. Avoids `null` values.  |
| `sum`  | `sum($event.Temperature.Double)` | Calculates the sum of the property **Temperature** over all the events in the interval. Avoids `null` values. |
| `avg`  | `avg($event.Temperature.Long)` | Calculates the average of the property **Temperature** over all the events in the interval. Avoids `null` values. |
| `first`  | `first($event.Temperature.String)` | Returns the first occurring (by event time stamp) value of the property **Temperature** from all the events in the interval. Does **not** avoid `null` values. |
| `last`  | `last($event.Temperature.String)` | Returns the last occurring (by event time stamp) value of the property **Temperature** from all the events in the interval. Does **not** avoid `null` values.  |
| `median` | `median($event.Temperature.String)` | Returns the middle occurring (by event time stamp) value of the property **Temperature** from all the events in the interval. Does **not** avoid `null` values. |
| `stdev` | `stdev($event.Temperature.String)` | Calculates the standard deviation of the property **Temperature** per interval. Avoids `null` values. |

For an *aggregate variable* kind, these functions can be combined in the *aggregate expression*. For example: `max($event.Temperature.Long) - min($event.Temperature.Long)`.

## Syntax

This section describes core syntax concepts and query operators that are concatenated to form expressions.

### Supported literals

  > [!NOTE]
  > The literals below are used to form expressions, see the [Supported data types](https://docs.microsoft.com/azure/time-series-insights/concepts-supported-data-types) article for the full list of data types.

| Primitive type | Literals |
|--|--|
| **Bool**  | `TRUE`, `FALSE` |
| **DateTime** | `dt'2016-10-08T03:22:55.3031599Z'` |
| **Double**   | `1.23`, `1.0` |
| **Long** | `1`, `6` |
| **String**   | `'abc'` |
| **TimeSpan** | `ts'P1Y2M3DT4M5.67S'` |
| **Null** | `NULL` |

### Supported operand types

| Operation | Supported types | Notes |
|--|--|--|
| **<**, **>**, **<=**, **>=** | **Double**, **Long**, **DateTime**, **TimeSpan** | |
| **=**, **!=**, **<>** | **Double**, **Long**, **String**, **Bool**, **DateTime**, **TimeSpan**, **NULL** | **<>** is equivalent to **!=** |
| **+**, **-**, **\***, **/** |  **Double**, **Long**, **DateTime**, **TimeSpan** | |

For comparison expressions (**<**, **>**, **<=**, **>=**, **=**, **!=**), the operands can be **NULL** or be of the same type. In each predicate expression, types of left hand side (LHS) and right hand side (RHS) operands are validated to match. Errors occur when types of LHS and RHS don't agree, or an operation is not allowed on particular types.

> [!NOTE]
> **String** type is not nullable in Warm Store:
>   * Comparison of **String** against **NULL** and empty string (**''**) behaves the same way: `$event.p1.String = NULL` is equivalent to `$event.p1.String = ''`.
>   * API may return **NULL** values even if original events contained empty strings.
>
> In the future, the same behavior will be on Cold Store.
>
> Do not take dependency on **NULL** values in **String** columns and treat them the same way as empty strings.

* A type check is applied:
  * Any property type is accepted against a `NULL` literal.
  * Types of LHS and RHS should match.

Here are examples of properties **p1** and **p2** of type **String**, property **p3** of type **Double**, and a nested property stored as **p4.p5** of type **Double**:

| Filter | Is valid? | Notes |
| - | - | - |
| `$event.p1.String = 'abc'` | Yes | |
| `$event.p1.String = $event.p2.String` | Yes | |
| `$event.p1.String = NULL` | Yes | `NULL` matches any left-side type. |
| `$event.p3.Double = 'abc'` | No | Type mismatch. |
| `$event.p3.Double = $event.p1.String` | No | Type mismatch. |
| `$event.p1 = 'abc'` | No |  Type mismatch. |
| `$event.p1 = 1` | No | Type mismatch. |
| `$event.p1 = true` | No | Type mismatch. |
| `$event.p1 = NULL` | Yes | `p1` is the only token used. Interpreted as `$event.p1.Double = NULL` |
| `$event['p1'] != NULL` | Yes | `['p1']` is the only token used. Interpreted as `$event['p1'].Double != NULL` |
| `$event.p4.p5 = 0.0` | No | Invalid property reference syntax. A type must be specified on LHS of comparison. |
| `$event.p4.p5.Double = 0.0` | Yes |  |

### Supported scalar functions

Below is the list of scalar functions by categories:

#### Conversion functions

| Function name | Signature | Example | Notes |
|--|--|--|--|
| `toDouble` | `Double toDouble (value: String, Double, Long)` | `toDouble($event.value.Long)` | Converts the arguments to **Double**.|
| `toLong` | `Long toLong (value: String, Double, Long)` | `toLong($event.value.Double + 1.0)` | Converts the arguments to **Long**.|
| `toString` | `String toString (value: String, Double, Long)` | `toString($event.value.Double)` | Converts arguments to **String**.|

#### Math functions

| Function name | Signature | Example | Notes |
|--|--|--|--|
| `round` | `Double round(value:Double)` | `round($event.value.Double)` | Rounds a double-precision floating number to the nearest integral.|
| `ceiling` | `Double ceiling(value:Double)` | `ceiling($event.value.Double)` | Returns the smallest integral value that is greater than or equal to double-precision floating point number.|
| `floor` | `Double floor(value:Double)` | `floor($event.value.Double)` | Returns the largest integral value that is less than or equal to double-precision floating point number.|

#### Trigonometric functions

| Function name | Signature | Example | Notes |
|--|--|--|--|
| `cos` | `Double cos(value:Double)` | `cos($event.value.Double)` | Returns the Cosine of the specified angle in radians.|
| `sin` | `Double sin(value:Double)` | `sin($event.value.Double)` | Returns the Sine of the specified angle in radians.|
| `tan` | `Double tan(value:Double)` | `tan($event.value.Double)` | Returns the Tangent of the specified angle in radians.|
| `acos` | `Double acos(value:Double)` | `acos($event.value.Double)` | Returns the angle in radians whose Cosine is the specified number.|
| `asin` | `Double asin(value:Double)` | `asin($event.value.Double)` | Returns the angle in radians whose Sine is the specified number.|
| `atan` | `Double atan(value:Double)` | `atan($event.value.Double)` | Returns the angle in radians whose Tangent is the specified number.|
| `atan2` | `Double atan2(value1:Double, value2:Double)` | `atan2($event.value1.Double, $event.value2.Double)` | Returns the angle in radians whose Tangent is the quotient of two specified numbers.|

#### Logarithmic functions

| Function name | Signature | Example | Notes |
|--|--|--|--|
| `log` | `Double log(value:Double)` | `log($event.value.Double)` | Returns the natural logarithm of a specified number.|
| `log2` | `Double log2(value:Double)` | `log2($event.value.Double)` | Returns the base 2 logarithm of a specified number.|
| `log10` | `Double log10(value:Double)` | `log10($event.value.Double)` | Returns the base 10 logarithm of a specified number.|

#### DateTime Functions

| Function name | Signature | Example | Notes |
|--|--|--|--|
| `monthOfYear` | `Long monthOfYear(value:DateTime)` | `monthOfYear($event.$ts)` | Returns the month of the year as a numeric for the provided **DateTime**.|
| `dayOfMonth` | `Long dayOfMonth(value:DateTime)` | `dayOfMonth($event.$ts)` | Returns the day of the month as a numeric for the provided **DateTime**.|
| `hourOfDay` | `Long hourOfDay(value:DateTime)` | `hourOfDay($event.$ts)` | Returns the hour of the day as a numeric for the provided **DateTime**.|
| `utcNow` | `DateTime utcNow()` | `utcNow()` | Returns current time in UTC format.|

#### String functions

| Function name | Signature | Example | Notes |
|--|--|--|--|
| `toUpper` | `String toUpper(value:String)` | `toUpper($event.value.String)` | Returns input string converted to uppercase.|
| `toLower` | `String toLower(value:String)` | `toLower($event.value.String)` | Returns input string converted to lowercase.|
| `strLen` | `Long strLen(value:String)` | `strLen($event.value.String)` | Returns the number of the characters in the string argument.|
| `strCat` | `Long strCat(value1:String, value2:String)` | `strCat($event.value1.String, $event.value2.String)` | Concatenates two specified input strings.|
| `subString` | `String subString(value:String, startIndex:Double, length:Double)` | `subString($event.value.String, 2.0, 4.0)` | Retrieves a substring from this instance.|
| `trim` | `String trim(value:String)` | `trim($event.value.String)` | Returns a new string by removing all leading and trailing white-space characters from the input string.|
| `indexOf` | `Long indexOf(value:String, subString:String)` | `indexOf($event.value.String, 'abc')` | Returns the first occurrence of the specified string within the original string, based on zero indexing.|
| `replace` | `String replace(value:String, searchString:String, replaceString:String)` | `replace($event.value.String, 'abc', 'xyz')` | Returns a string where all occurrences of the search string are replaced with the replacement string.|

#### Other Functions

| Function name | Signature | Example | Notes |
|--|--|--|--|
| `coalesce` | `String, Long, Double, Bool coalesce (value: String, Long, Double, Bool)` | `coalesce(toLong($event.value.Double), $event.value.Long)` | Returns the first non-null value in the argument list. Accepts at minimum 2 and at maximum 64 arguments, but they must all be of the same data type.|
| `iff` | `String, Long, Double, Bool iff (predicate: bool, ifTrue: String, Long, Double, Bool, ifFalse: String, Long, Double, Bool)` | `iff ($event.value.Double > 100, 'Good', 'Bad')` | Returns the second or third argument depending on whether the predicate resolved to true (returns second argument) or false (returns third argument). The predicate must be a Boolean expression and the second and third arguments must be of the same type.|

## See also

* For more information about application registration and the Azure Active Directory programming model, see [Azure Active Directory for developers](https://docs.microsoft.com/azure/active-directory/develop/active-directory-developers-guide).

* To learn about request and authentication parameters, read [Authentication and authorization](https://docs.microsoft.com/azure/time-series-insights/time-series-insights-authentication-and-authorization).

* Tools that assist with testing HTTP requests and responses include:

* [Fiddler](https://www.telerik.com/fiddler). This free web debugging proxy can intercept your REST requests, so you can diagnose the HTTP request and response messages.
* [JWT.io](https://jwt.io/). You can use this tool to quickly dump the claims in your bearer token and then validate their contents.
* [Postman](https://www.getpostman.com/). This is a free HTTP request and response testing tool for debugging REST APIs.

* Learn more about Azure Time Series Insights Gen2 by reviewing the [Gen2 documentation](https://docs.microsoft.com/azure/time-series-insights/time-series-insights-update-overview).