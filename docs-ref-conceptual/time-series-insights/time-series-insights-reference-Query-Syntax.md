# Azure Time Series Insights Query Syntax

This document describes query request format for query API. Query requests must be in JSON format. The request JSON payload should be created using JSON-based domain-specific strongly typed query language.

The language is subdivided into the following elements:
- Scalar expressions, which produce scalar values.
- Aggregate expressions, used to partition collections of events and compute measures over the partitions.
- Clauses, which form constituent components of input JSON query and also can be a part of expressions.

## Data Model

Query API operates on data stored as individual **events** within an environment.
Each event is a set of property name and value pairs.

Event properties can be of one of the following primitive types: `Boolean`, `DateTime`, `Double` or `String`.
Original event source formats may support a larger set of value types, in which case Time Series Insights ingress maps them to the closest primitive types.
All primitive types are nullable.

All events have the following built-in properties with predefined name and type:
| Property name | Property type | Definition |
|-|-|-|
| $ts | DateTime | Event timestamp |
| $esn | String | Event source name |

By default, event timestamp value is provided by the event source: for example, events coming from an IoT Hub would have their enqueued time as a timestamp.
However, this behavior can be changed in event source configuration by specifying one of the event properties to be used as a timestamp.

Event source name is the display name of the event source from which Time Series Insights has received the event.
It is associated with a particular event at the ingress time of the event and stays unchanged for the life-time of the event.
When the name is changed in the event source configuration, already processed events will carry the old name and new events will carry the new name.

Custom event properties are uniquely identified and referenced in query expressions by name and type.
An event can have more than one property with the same name and different types.
This might happen as a result of ingress type splitting: in certain cases an event property value of string type can be stored as a property with a different type:
* If String value is a valid Double value, then it is stored both as Double and String.
* If String value is a valid DateTime value, then it is stored as DateTime only.

Time Series Insights has limited support for the following values within the Double type: `Double.NaN`, `Double.PositiveInfinity` and `Double.NegativeInfinity`.
These values are converted to `null` during ingress, but if query evaluation produces one of these values, the value will be properly evaluated and serialized as a `String` in response.
User can pass these values as strings for ingress, so in query expressions these values should be also passed as strings.
Query API converts empty string literals to nulls in the output.

**Event schema** describes properties of an event.
Different events can have different schemas or share the same schema.
Schema contains the name of the event source and ordered set of properties for the event.

## Scalar Expressions

**Constant expressions** are represented using the following literals for each of the primitive types.

| Primitive Type | JSON Representation | JSON Example | Notes |
|-|-|-|-|
| Boolean | JSON Boolean | `true`, `false`|  |
| DateTime | Nested object with single "dateTime" property in ISO 8601 format `yyyy'-'MM'-'dd'T'HH':'mm':'ss.FFFFFFFK`. | `{"dateTime":"2016-08-01T00:00:00.000Z"}`|  |
| Double | JSON number cast to Double range. | `1.23e45`, `123`| Overflow of Double results in error. |
| String | JSON String | `"abc"`|  |

Null literal is typed in JSON and is represented as a nested object with type property.

JSON example:
```json
{"string": null}
{"double": null}
{"bool": null}
{"dateTime": null}
```

**Property reference expression** is used to access values of non-built-in properties of an event.
Result type of a property reference expression is the primitive type of the property.
Properties in the event schema are uniquely identified by name and type and the reference expression requires both to be specified.

JSON example:
```json
"property": {
    "name": "p1",
    "type": "String"
}
```

**Built-in Property reference expression** is used to access built-in properties of an event.
Result type of a built-in property reference expression is the primitive type of the property.
Built-in properties are referenced by name only, no type is needed in the reference expression.

JSON example:
```json
{ "builtInProperty": "$esn" }
```

Time Series Insights supports the following **boolean comparison expressions**:
| Property Name in JSON | Description |
|-|-|
| `"eq"` | equal |
| `"in"` | in (equal any) |
| `"phrase"` | contains phrase |
| `"lt"` | less than |
| `"lte"` | less than or equal |
| `"gt"` | greater than |
| `"gte"` | greater than or equal |

All comparison expressions take left and right arguments of primitive types and return a Boolean value representing result of the comparison.
All types implicitly cast only to themselves and explicit casts are not supported, therefore types of left and right arguments should match.

JSON example:
```json
"eq": {
    "left": {
        "property": {
            "name": "p1",
            "type": "String"
        }
    },
    "right": "abc"
}
```

The following table shows supported types of arguments for each of the comparison expressions:
| Argument Type | Supported comparison operation |
|-|-|
| Boolean | `eq`, `in` |
| DateTime | `eq`, `in`, `lt`, `lte`, `gt`, `gte` |
| Double | `eq`, `in`, `lt`, `lte`, `gt`, `gte` |
| String | `eq`, `in`, `phrase` |

Null literal can only be used in the following expressions: `eq`, `in`.
The `eq` operation results in `true` if both sides are null values and `false` otherwise.
For other operations the error is raised for null literal and behavior is undefined for null-value properties (any comparison operation will result in `false`).
Null value precedes non-null value in the sort order (occurs, for example, if sorting by a property is applied when getting a list of events).

Time Series Insights supports the following **boolean logical expressions**:

| Property Name in JSON | Description |
|-|-|
| `"and"` | Takes a non-empty set of boolean arguments and returns `true` if all of them evaluate to `true`. |
| `"or"` | Takes a non-empty set of boolean arguments and returns `true` if any of them evaluate to `true`. |
| `"not"` | Takes a single boolean argument and returns its negated value. |

JSON example:
```json
"and": [{
		"eq": {
			"left": {
				"property": {
					"name": "p1",
					"type": "String"
				}
			},
			"right": "abc"
		}
	}, {
		"not": {
			"lt": {
				"left": {
					"property": {
						"name": "p1",
						"type": "Double"
					}
				},
				"right": 1.0
			}
		}
	}
]
```

**Boolean predicate string expression** contains boolean predicate represented as a human-readable expression called Predicate String.
Some examples of predicate strings are listed below:

| Predicate string | Description |
|-|-|
| Description HAS 'hello world' | `true` for events containing the phrase 'hello world' in property Description across all event sources |
| 'hello world' | `true` for events containing the phrase 'hello world' |
| PointValue.Double = 3.14 | `true` for events with double PointValue equal to 3.14 |
| Status IN ('Good','Bad') | `true` for events with Status containing 'Good' or 'Bad' |
| PointValue > 3.14 AND Status.String = 'Good' | `true` for events with PointValue greater than 3.14 and string Status 'Good' |
| [PointValue] > 3.14 AND ([Status] = 'Good' OR [Status] = 'Bad') AND NOT [Description] HAS 'hello world' | `true` for events with PointValue greater than 3.14 and Status 'Good' or 'Bad' and Description not containing the phrase 'hello world' |

JSON example:
```json
"predicateString": "PointValue.Double = 3.14"
```

### Predicate String

Expression in predicate string is evaluated into JSON boolean expression. It should comply with the following grammar (simplified):

```bnf
parse: orPredicate EOF | EOF;

orPredicate: andPredicate ('OR' andPredicate)*;
andPredicate: notPredicate ('AND' notPredicate)*;
notPredicate: ('NOT')* predicate;

predicate: parenExpression | propertyPredicate | hasPredicate | inPredicate;

parenExpression: '(' orPredicate ')';

propertyPredicate: (ComparisonOp literal) | (unaryPredicate ComparisonOp unaryPredicate);

hasPredicate: (identifier? 'HAS')? StringLiteral;

inPredicate: identifier? 'IN (' literal (',' literal)* ')';

unaryPredicate: identifier | literal;

literal: StringLiteral | NumericLiteral | BooleanLiteral | DateTimeLiteral | NullLiteral;

identifier: (BuiltinIdentifier | QuotedOrUnquotedIdentifier) (Sep QuotedOrUnquotedIdentifier)?;

ComparisonOp: '=' | '!=' | '<>' | '>' | '>=' | '<' | '<=';
```

The same set of Time Series Insights types is supported for predicate string.
Unlike the JSON property reference expressions, a type for property can be omitted in which case a type is auto-resolved as it is explained below.

Supported literals:
| Primitive Type | Literals |
|--|--|
| Boolean  | TRUE, FALSE |
| DateTime | dt'2016-10-08T03:22:55.3031599Z' |
| Double   | 1.23, 1 |
| String   | 'abc' |
|  | NULL |

Supported operand types:
| Operation | Supported Types | Notes |
|--|--|--|--|
| <, >, <=, >= | Double, DateTime | |
| =, !=, <> | String, Bool, Double, DateTime, NULL | <> is equivalent for != |
| IN | String, Bool, Double, DateTime, NULL | All operands should be of the same type or be NULL constant. Multiple NULLs are equivalent to a single NULL. |
| HAS | String | Only constant string literals are allowed at right-hand side. Empty string and NULL are not allowed. |

Right-hand side constant literal of `HAS` operator is parsed to Bool, Double or DateTime value. For each successfully parsed value, predicate with `=` operator is created. These predicates and the original `HAS` predicate are joined together into an `OR` predicate.
For example, predicate string `p1 HAS '1.0'` is equivalent to `p1.String HAS '1.0' OR p1.Double = 1.0` if "p1" properties with String and Double types exist.

For comparison predicates (`<`, `>`, `<=`, `>=`, `=`, `!=`) and `IN` predicate, operand can be `NULL` or have a single type.
For `HAS` predicate, right-hand constant literal can be expanded into multiple types.
In each predicate expression, types of left-hand side and right-hand side operands are validated to match.
Errors occur when types of left and right sides do not agree, or operation is not allowed on particular types.

1. If type is specified for property, then type check is applied:
* Any property type is accepted against NULL literal
* Otherwise, types of left-hand side and right-hand side should match

Here are examples given properties "p1" and "p2" of type String, and property "p3" of type Double:

| Predicate string | Is valid? | Notes |
|--|--|--|--|
| p1.String = 'abc' | Yes |  |
| p1.String = p2.String | Yes |  |
| p1.String = NULL | Yes | NULL matches any left-hand side type. |
| p3.Double = 'abc' | No | Type mismatch. |
| p3.Double = p1.String | No | Type mismatch. |
| p1.String HAS 'abc' | Yes |  |
| p3.Double HAS '1.0' | Yes | String literal was successfully parsed to a Double value. |

2. If type is omitted for property but name is specified, then all properties with given name and types are taken, left-hand side and right-hand side operands are grouped in pairs by type and concatenated via `AND` operation.
Here are examples given properties "p1" and "p2" of type String and Double:

| Predicate string | Equivalent strong-typed predicate string | Notes |
|--|--|--|--|
| p1 = 'abc' | p1.String = 'abc' |  |
| p1 = true | - | No p1 property of type Bool, so missing property error is emitted. |
| p1 = NULL | p1.String = NULL AND p1.Double = NULL | For NULL right-hand side it is assumed that all matching properties should be NULL. |
| p1 != NULL | p1.String != NULL OR p1.Double != NULL | Inversion of the expression above |
| p1 = '1.0' | p1.String = '1.0' |  |
| p1 IN (1.0, NULL) | p1.Double = 1.0 OR p1.Double = NULL |  |
| p1 IN (NULL) | p1.String = NULL AND p1.Double = NULL | Equivalent to p1 = NULL. |
| p1 HAS '1.0' | p1.String HAS '1.0' OR p1.Double = 1.0 | String literal was successfully parsed to a valid Double value. |
| p1 HAS 'true' | p1.String HAS 'true' | String literal was successfully parsed to Bool but no p1.Bool property exists. |
| p1 = p2 | p1.String = p2.String AND p1.Double = p2.Double |  |
| p1 != p2 | p1.String != p2.String OR p1.Double != p2.Double | Inversion of the expression above |

3. Both property name and type can be omitted for left-hand side property if type of right-hand side is well-defined: right-hand side has const literal(s) and NULL literal is not the only right-hand side literal.
This is a generalization of full-text search `HAS` operand.
In this case all properties matching the right-hand side type are taken and concatenated via `OR` operation.
Here are examples given properties "p1" of type String and Double and properties "p2" of type String and DateTime:

| Predicate string | Equivalent strong-typed predicate string | Notes |
|--|--|--|--|
| = 'abc' | p1.String = 'abc' OR p2.String = 'abc' |  |
| != 'abc' | p1.String != 'abc' AND p2.String != 'abc' | Inversion of the expression above |
| = 1.0 | p1.Double = 1.0 | |
| = dt'2000-01-02T03:04:05' | p2.DateTime = dt'2000-01-02T03:04:05' | |
| = true | - | Error. No Bool property exists, so missing property error is emitted. |
| = NULL | - | Error. Omitting property name for NULL right-hand side is not allowed. |
| IN (NULL) | - | Same as above. |
| IN (1.0, NULL) | p1.Double = 1.0 OR p1.Double = NULL |  |
| HAS '1.0' | p1.String HAS '1.0' OR p1.Double = 1.0 OR p2.String HAS '1.0' |  |
| HAS 'true' | p1.String HAS 'true' OR p2.String HAS 'true' | No property with type Bool. |

4. If operator is omitted together with property name the `HAS` operation is assumed.

## Aggregate Expressions

**Dimension expressions** are used inside of *aggregates clause* to partition a set of events and assign a scalar key to each partition.

Dimension expression types:
| Property name in JSON | Description | Example |
|-|-|-|
| `"uniqueValues"` | Dimension values in the result are exact values of a given property. |  |
| `"dateHistogram"` | Dimension values in the result are ranges of time of a given property. | Date histogram of timestamp may result in 10 1-hour ranges for a 10-hour search span. |
| `"numericalHistogram"` | Dimension values in the result are ranges of values in a given property. | Numerical histogram of temperature may result in 10 degrees ranges returned. |

**Unique values expression** is used to group a set of events by values of the specified event property.

Evaluation of this JSON expression will result in up to 100 records grouped by `sensorId` string property:

JSON example:
```json
"uniqueValues": {
    "input": {
        "property": "sensorId",
        "type": "String"
    },
    "take": 100
}
```

**Date histogram expression** is used to group DateTime property values into buckets of given size.

Evaluation of this JSON expression will result in a set of Timestamp records floor-rounded such that each value has seconds zeroed:

JSON example:
```json
"dateHistogram": {
    "input": {
        "builtInProperty": "$ts"
    },
    "breaks": {
        "size": "1m"
    }
}
```

**Numeric histogram expression** is used to group Double property values into given number of buckets.

Evaluation of this JSON expression will result in 10 records, so the range between min and max values of `p1` is divided into 10 buckets:

JSON example:
```json
"numericHistogram": {
    "input": {
        "property": "p1",
        "type": "Double"
    },
    "breaks": {
        "count": 10
    }
}
```

**Measure expression** is used inside of *aggregates clause* to compute a scalar value on a set of events
(for example, maximum value of a temperature sensor during the last 24 hours).

Count expression is used to calculate number of events within corresponding bucket.

JSON example:
```json
"count": {}
```

Min, Max, Avg, Sum expressions are used to calculate minimum, maximum, average of sum of values for given property within corresponding bucket.

JSON example:
```json
"min": {
    "input": {
        "property": "temperature",
        "type": "Double"
    }
}
```

Supported dimension and measure expressions depending on property type:
| Property Type | Supported Dimension Expressions | Supported Measure Expressions |
|-|-|-|-|
| Boolean | `"uniqueValues"` | - |
| DateTime | `"uniqueValues"`, `"dateHistogram"` | `"min"`, `"max"` |
| Double | `"uniqueValues"`, `"numericHistogram"` | `"sum"`, `"avg"`, `"min"`, `"max"` |
| String | `"uniqueValues"` | - |

## Clauses

**Search span clause** is used to filter built-in Timestamp property of event to a given interval. Start of interval is inclusive, end of interval is exclusive.

JSON example:
```json
"searchSpan": {
    "from": "2016-08-01T00:00:00.000Z",
    "to": "2016-08-31T00:00:00.000Z"
}
```

**Predicate clause** is used to filter events satisfying the predicate. It should be resolved into boolean expression.

JSON example:
```json
"predicate": {
    "eq": {
        "left": {
            "property": {
                "name": "p1",
                "type": "String"
            }
        },
        "right": "abc"
    }
}
```
Filtering of events means running a predicate represented by a boolean expression on each event in environment.
Execution of an expression on an event returns `true` if event must be included in further operation or `false` if event must be omitted from further processing.
In addition to predicate expression, events are always filtered by search span.

**Limit top clause** is used to get a given number of values in a given order.

JSON example:
```json
"sort": [
    {
        "input": {
            "builtInProperty": "$ts"
        },
        "order": "Asc"
    }
],
"count": 10
```

**Limit take clause** is used to get a given number of values fast in any order.

JSON example:
```json
"take": 10
```

**Limit sample clause** is used to get a statistically representative given number of values.

JSON example:
```json
"sample": 10
```

**Breaks clause** is used in histogram expressions to specify how a range analyzed should be divided.
* For date histogram one should specify a size of individual datetime interval. Interval boundaries should also be specified, unless a histogram is based on built-in Timestamp property where boundaries are determined based on search span.
* For numeric histogram one should specify number of breaks. Interval boundaries are determined based on minimum and maximum values of a property.

JSON example:
```json
"breaks": {
    "size": "1d",
    "from": "2000-01-02T03:04:05.0000000",
    "to": "2000-01-02T03:04:05.0000000",
}

"breaks": {
    "count": 10
}
```

**Aggregates clause** is used to partition a set of events by a given property, while measuring values of other event properties.
Measures are evaluated on each partition produced by the dimension expression.

This JSON expression computes average, min and max temperatures per sensor ID:

JSON example:
```json
"aggregates": [
    {
        "dimension": {
            "uniqueValues": {
                "input": { "property": "sensorId", "type": "String" },
                "take": 100
            }
        },
        "measures": [
            {
                "avg": {
                    "input": { "property": "temperature", "type": "Double" }
                }
            },
            {
                "min": {
                    "input": { "property": "temperature", "type": "Double" }
                }
            },
            {
                "max": {
                    "input": { "property": "temperature", "type": "Double" }
                }
            }]
    }
]
```

Aggregates clause is an array that allows specifying more than one aggregation at the topmost level.

This JSON expression computes average temperature per city and per manufacturer independently:

JSON example:
```json
"aggregates": [
    {
        "dimension": {
            "uniqueValues": {
                "input": { "property": "city", "type": "String" },
                "take": 100
            }
        },
        "measures": [
            {
                "avg": {
                    "input": { "property": "temperature", "type": "Double" }
                }
            }]
    },
    {
        "dimension": {
            "uniqueValues": {
                "input": { "property": "manufacturer", "type": "String" },
                "take": 100
            }
        },
        "measures": [
            {
                "avg": {
                    "input": { "property": "temperature", "type": "Double" }
                }
            }]
    }
]
```

> NOTE: Currently having more than 1 element in aggregates array is not supported.

An aggregation definition may include a nested aggregation, which allows specifying a multi-dimensional lattice.

This JSON expression computes average temperature per sensor id, per minute:

JSON example:
```json
"aggregates": [
    {
        "dimension": {
            "uniqueValues": {
                "input": { "property": "sensorId", "type": "String" },
                "take": 100
            }
        },
        "aggregate": {
            "dimension": {
                "dateHistogram": {
                    "input": { "builtInProperty": "$ts" },
                    "breaks": { "size": "1m" }
                }
            },
            "measures": [
                {
                    "avg": {
                        "input": { "property": "temperature", "type": "Double" }
                    }
                }]
        }
    }
]
```
