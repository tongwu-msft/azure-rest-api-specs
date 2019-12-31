---
ms.assetid:
title: General availability (GA) reference data API - Azure Time Series Insights | Microsoft Docs
ms.title: General availability (GA) reference data API - Azure Time Series Insights | Microsoft Docs
services: time-series-insights
ms.service: time-series-insights
service_description: Time Series Insights
description: REST API reference documentation for the Azure Time Series Insights general availability (GA) reference data API.
manager: deepakpalled
ms.manager: dpalled
author: yeskarthik
ms.author: Subramanian.Karthik
ms.date: 12/17/2019
---

# Azure Time Series Insights reference data API

This document describes the reference data API used to manage items within a reference data set. It assumes that the reference data set has already been created.

Reference data is data such as manufacturer or location data that changes less often, and contextualizes telemetry data. Because it is relatively static, each data packet contains identical information. Reference data generally does not originate from devices, and even if it did, it would not make sense to send it over the wire because of it relatively static nature. Reference data is managed outside of the device itself.  

> [!TIP]
> * Review [Authentication and authorization](https://docs.microsoft.com/azure/time-series-insights/time-series-insights-authentication-and-authorization) for required HTTP request headers and parameters.

## API overview

The Reference Data Management API is a batch API. 

> [!IMPORTANT]
> All operations against this API are HTTP POST operations. Each operation accepts JSON objects as the request payload. The submitted JSON object defines a single property which specifies the operation to be executed by the API.

Accepted JSON request operation names are:

* [Put](#put-reference-data-items)
* [Patch](#patch-reference-data-items)
* [Delete properties](#delete-properties-in-reference-data-items)
* [Delete](#delete-reference-data-items)
* [Get](#get-reference-data-items)

> [!NOTE]
> * The property value is an array of reference data items over which the operation must be applied.
> * Each item is processed individually and an error with one piece of data does not affect the storing of good data.
> * If your request has 100 items and one item has an error, then 99 items are written and one is rejected.

## Put reference data items

`POST https://<environmentFqdn>/referencedatasets/<referenceDataSetName>/$batch?api-version=2016-12-12`

Inserts / replaces the entire reference data item $.put[i] (the *i* th item in the array with key 'put'). The unit of commit is $.put[i]. The operation is idempotent.

Assume a reference data set that defines a single key with name *deviceId* and type *string*. A sample request and response message are shown in the following sections:

### *Put* operation request message example

```json
{
    "put": [{
        "deviceId": "Fan1",
        "color": "Red",
        "maxSpeed": 5
    },
    {
        "deviceId": "Fan2",
        "color": "White",
        "floor": 2
    }]
}
```

### *Put* operation response message example

```json
{
    "put": [
        null,
        null
    ]
}
```

### *Put* operation validations

- Each item in $.put can specify its own list of non-key properties (“color”, “maxSpeed”, “location”, etc.).
- For any two item sets X and Y, non-key properties in [X].put[i] and [Y].put[j] must not intersect. Consider the following two posts:

`POST https://<environmentFqdn>/referencedatasets/deviceInfo/$batch?api-version=2016-12-12`

```json
{
    "put": [
    {
        "deviceId": "Fan1",
        "color": "Red"
    }]
}
```

`POST https://<environmentFqdn>/referencedatasets/manufacturerInfo/$batch?api-version=2016-12-12`

```json
{
    "put": [
    {
        "deviceId": "Fan1",
        "manufacturerId": "Manufactuer1",
        "color": "Red"
    }]
}
```

The second post for set *manufacturerInfo* is not allowed because “color” is already defined in the first post for set *deviceInfo*.

- All key property values in $.put[i] should be of JSON primitive type and should be parsable to type defined during reference data set creation.
- All non-key property values in $.put[i] can be of any JSON type. At the root, if it is an object, it is flattened to individual properties. If it is an array, it is serialized and indexed as JSON string.
- $.put[i] should contain all properties specified as key properties in the reference data set.
- $.put[i] should contain at least one non-key property.
- Values of key properties in $.put[i] cannot be null.
- Case-sensitive persistence: When persisted, the value of the key whose type is *String* has the same casing as the input event stream. Keys are expected to be immutable.
- Any validation failure results in a response code of 400 with the appropriate error information.
- The response for individual items is either JSON null (for success) or error information JSON object.

## Patch reference data items

`POST https://<environmentFqdn>/referencedatasets/<referenceDataSetName>/$batch?api-version=2016-12-12`

Updates / inserts specific properties for the reference data item $.patch[i].

Assume a reference data set that defines a single key with name *deviceId* and type *string*. A sample request and response message are shown in the following sections:

### *Patch* operation request message example

```json
{
    "patch": [
    {
        "deviceId": "Fan1",
        "maxSpeed": 108
    },
    {
        "deviceId": "Fan2",
        "floor": 18
    }]
}
```

### *Patch* operation response message example

```json
{
    "patch": [
        null,
        null
    ]
}
```

### *Patch* operation request validations

1. Same as [put-API](#put-reference-data-items).
2. If the item does not exist, a new item is created.

## Delete properties in reference data items

`POST https://<environmentFqdn>/referencedatasets/<referenceDataSetName>/$batch?api-version=2016-12-12`

Delete the specified properties from the reference data item $.deleteproperties[i].

Assume a reference data set that defines a single key with name *deviceId* and type *string*. A sample request and response message are shown in the following sections:

### *Delete properties* operation request message example

```json
{
    "deleteProperties":[
    {
        "key":{
            "deviceId":"Fan2"
        },
        "properties":[
            "floor"
        ]
    }]
}
```

### *Delete properties* operation response message example

```json
{
    "deleteProperties": [
        null
    ]
}
```

### *Delete properties* operation validations

- Same as [put-API](#put-reference-data-items).
- If a property specified in $.deleteProperties[i].properties does not exist, it is a no-op for that property.

## Delete reference data items

`POST https://<environmentFqdn>/referencedatasets/<referenceDataSetName>/$batch?api-version=2016-12-12`

Deletes the entire reference data identified by the key property values specified in each $.delete[i].

Assume a reference data set that defines a single key with name *deviceId* and type *string*. A sample request and response message are shown in the following sections:

### *Delete* operation request message example

```json
{
    "delete": [
    {
        "deviceId": "Fan1"
    }]
}
```

### *Delete* operation response message example

```json
{
    "delete": [
        null
    ]
}
```

### *Delete* operation request validations

- Values in delete.[i] follow same key properties restrictions mentioned in [put-API](#put-reference-data-items).
- If item not found, a response code of 404 is returned.

## Get reference data items

`POST https://<environmentFqdn>/referencedatasets/<referenceDataSetName>/$batch?api-version=2016-12-12`

Get the entire reference data identified by the key property values specified in each $.get[i].

Assume a reference data set that defines a single key with name *deviceId* and type *string*. A sample request and response message are shown in the following sections:

### *Get* operation request message example

```json
{
    "get": [
    {
        "deviceId": "Fan1"
    },
    {
        "deviceId": "Fan2"
    }]
}

```

### *Get* operation response message example

```json
{
    "get": [
    {
        "code": "InvalidInput",
        "message": "Key not found.",
        "target": null,
        "details": null,
        "innerError": null
    },
    {
        "id": "Fan2",
        "floor": 18
    }]
}

```

### *Get* operation validations

- Values in get.[i] follow same key properties restrictions mentioned in [put-API](#put-reference-data-items).
- If item not found, return error response 404 against that item.

## Common error response example

The following JSON shows sample error response. The first item in the request was invalid while the second item was successfully posted. This response structure is the same for all operations except for [get](ga-reference-data-api.md###get-reference-data-items). For *get*, on successful completion of an operation, the item itself is returned.

```json
{
    "put": [
    {
        "code": "InvalidInput",
        "message": "Object should contain all key properties.",
        "target": null,
        "details": null,
        "innerError": null
    },
    null]
}
```

## Reference data join example

Consider an event hub message that has the following structure:

```json
[
    {
        "deviceId":"Fan1",
        "timestamp":"1/5/2015T00:10:30Z"
    },
    {
        "deviceId":"Fan2",
        "timestamp":"1/5/2015T00:10:30Z"
    }
]
```

Consider a reference data item set with the name "contoso" and key "deviceId" of type "String" having the following structure:

|deviceId|color|maxSpeed|floor|
|--------|-----|--------|-----|
|Fan1|Red|5||
|Fan2|White||2|

When the two events in the event hub message are processed by the Time Series Insights ingress engine, they are joined with the correct reference data item. The events output has the following structure:

```json
[
    {
        "deviceId":"Fan1",
        "timestamp":"1/5/2015T00:10:30Z",
        "color":"Red",
        "maxSpeed":5
    },
    {
        "deviceId":"Fan2",
        "timestamp":"1/5/2015T00:10:30Z",
        "color":"White",
        "floor":2
    }
]
```

### Reference data join rules

- Key name comparison during join is case-sensitive.
- Key value comparison during join is case-sensitive for string properties.

### Handling multiple reference data sets join semantics

For an environment with more than one reference data set, three constraints are enforced during join. 

- Each item in a reference data set can specify its own list of non-key properties.
- For any two reference data sets A and B, non-key properties must not intersect.
- Reference data sets are only joined directly to events, never to other referenced data sets (and then to events). To join reference data item with an event, all key properties used in the reference data item must be present in the event. Also, the key properties should not come from the non-key properties joined to an event through some other reference data item.

Given these constraints, the join engine can apply the join in any order for a given event. Hierarchy and ordering are not considered.

### Current Limits

You can add up to two reference data per Time Series Insights environment.  Below are additional limitations associated with Time Series Insights reference data.

| Limit name | Limit value | SKUs affected | Notes |
|-|-|-|-|
| Key property count  | 3 | S1, S2 | Per reference data set.  Azure Resource Manager/Azure Portal only|
| Key property size| 1 KB | S1, S2 | Per reference data set |
| Reference Data Item count  | 2,000/20,000 (S1/S2) | S1, S2 | Per unit.  Example:  4 unit S1 SKU = 8,000 items (4 x 2,000) |
| Max concurrent transactions | 2/10 (S1/S2) | S1, S2 | - |
| Max reference data transactions | 120/600 (S1/S2) | S1, S2 | Per hour |
| Max reference data item count | 1,000 | S1, S2 | Per transaction |
| Max reference data item size | 8,192 KB | S1, S2 | Per transaction |

## See also

For more information about application registration and the Azure Active Directory programming model, see [Azure Active Directory for developers](https://docs.microsoft.com/azure/active-directory/develop/active-directory-developers-guide).

To learn about request and authentication parameters, read [Authentication and authorization](https://docs.microsoft.com/azure/time-series-insights/time-series-insights-authentication-and-authorization).

Tools that assist with testing HTTP requests and responses include:

- [Fiddler](https://www.telerik.com/fiddler). This free web debugging proxy can intercept your REST requests, so you can diagnose the HTTP request and response messages.
- [JWT.io](https://jwt.io/). You can use this tool to quickly dump the claims in your bearer token and then validate their contents.
- [Postman](https://www.getpostman.com/). This is a free HTTP request and response testing tool for debugging REST APIs.

Learn more about Azure Time Series Insights by reviewing the [product documentation](https://docs.microsoft.com/azure/time-series-insights/time-series-insights-overview).
