---
title: Reference Data API for Azure Time Series Insights environment | Microsoft Docs
description: This tutorial covers how to work with the reference data API for an Azure Time Series Insights environment
keywords:
services: time-series-insights
documentationcenter:
author: anshan
manager: almineev
editor: cgronlun

ms.assetid:
ms.service: time-series-insights
ms.devlang: na
ms.topic: data-acesss-api
ms.tgt_pltfrm: na
ms.workload: big-data
ms.date: 11/10/2017
ms.author: anshan
---

# Azure Time Series Insights reference data API


This document describes the reference data API used to manage items within a reference data set. It assumes that the reference data set has already been created.

Reference data is data such as manufacturer or location data that changes less often, and contextualizes telemetry data. Because it is relatively static, each data packet contains identical information. Reference data is usually not originated on devices, and even if it was, it does not make sense to send it over the wire because of it relatively static nature. Reference data is managed outside of the device itself.  




## Common headers and parameters

For authentication and authorization, a valid OAuth2.0 Bearer token must be passed in [Authorization header](/rest/api/#create-the-request). The token must be issued to `https://api.timeseries.azure.com/` resource (also known as "audience" in the token).

Optional request headers:
- `x-ms-client-request-id` - a client request ID. Service records this value. Allows the service to trace operation across services.
- `x-ms-client-session-id` - a client session ID. Service records this value. Allows the service to trace a group of related operations across services.
- `x-ms-client-application-name` - name of the application that generated this request. Service records this value.

Response headers:
- `x-ms-request-id` - server-generated request ID. Can be used to contact Microsoft to investigate a request.

## API overview

The reference data management API is a batch API. All operations against this API are HTTP POST operations. Each operation accepts a payload. The payload is a JSON object. This object defines a single property. The property key is the name of an operation allowed by the API. The operation names are the following:

* [put](time-series-insights-reference-reference-data-api.md#put-reference-data-items)
* [patch](time-series-insights-reference-reference-data-api.md#patch-reference-data-items)
* [deleteproperties](time-series-insights-reference-reference-data-api.md#delete-properties-in-reference-data-items)
* [delete](time-series-insights-reference-reference-data-api.md#delete-reference-data-items)
* [get](time-series-insights-reference-reference-data-api.md#get-reference-data-items)

The property value is an array of reference data items over which the operation must be applied.

Each item is processed individually and an error with one piece of data does not affect the storing of good data. If your request has 100 items and one item has an error, then 99 items are written and one is rejected.

## Put reference data items

`POST https://<environmentFqdn>/referencedatasets/<referenceDataSetName>/$batch?api-version=2016-12-12`

Inserts / replaces the entire reference data item $.put[i] (the *i* th item in the array with key 'put'). The unit of commit is $.put[i]. The operation is idempotent.

Assume a reference data set that defines a single key with name *deviceId* and type *string*. A sample request and response message is shown in the following sections:

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

1. Same as [put-API](time-series-insights-reference-reference-data-api.md###put-request-validations).
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

- Same as [put-API](time-series-insights-reference-reference-data-api.md###put-request-validations).
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

- Values in delete.[i] follow same key properties restrictions mentioned in [put-API](time-series-insights-reference-reference-data-api.md###put-request-validations).
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

- Values in get.[i] follow same key properties restrictions mentioned in [put-API](time-series-insights-reference-reference-data-api.md###put-request-validations).
- If item not found, return error response 404 against that item.

## Common error response example

The following JSON shows sample error response. The first item in the request was invalid while the second item was successfully posted. This response structure is the same for all operations except for [get](time-series-insights-reference-reference-data-api.md###get-reference-data-items). For *get*, on successful completion of an operation, the item itself is returned.

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
|-|-|-|-|-|
| Key property count  | 3 | S1, S2 | Per reference data set.  Azure Resource Manager/Azure Portal only|
| Key property size| 1KB | S1, S2 | Per reference data set |
| Reference Data Item count  | 2,000/20,000 (S1/S2) | S1, S2 | Per unit.  Example:  4 unit S1 SKU = 8,000 items (4 x 2,000) |
| Max concurrent transactions | 2/10 (S1/S2) | S1, S2 | - |
| Max reference data transactions | 120/600 (S1/S2) | S1, S2 | Per hour |
| Max reference data item count | 1,000 | S1, S2 | Per transaction |
| Max reference data item size | 8,192KB | S1, S2 | Per transaction |
