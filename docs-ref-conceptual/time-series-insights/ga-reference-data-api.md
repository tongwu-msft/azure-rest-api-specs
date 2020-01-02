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
ms.date: 01/02/2020
---

# Azure Time Series Insights reference data API

This document describes the Time Series Insights General Availability  Reference Data Management API used to manage items within a reference data set. It assumes that the reference data set has already been created within the environment.

Reference data includes manufacturer or location data that changes less often. Reference data is used to contextualize telemetry data and serves to compare telemetry data against.

> [!TIP]
> * See [How to create a reference data set](https://docs.microsoft.com/azure/time-series-insights/time-series-insights-add-reference-data-set) to create a reference data set.
> * Review [Authentication and authorization](https://docs.microsoft.com/azure/time-series-insights/time-series-insights-authentication-and-authorization) for required HTTP request headers and parameters.

Since the data set is a pre-existing and fixed, each data packet would contain identical information if sent by a device. Because of that, reference data is not sent from devices and is managed using the Reference Data Management API or Azure portal.

## API overview

The Reference Data Management API is a batch API.

> [!IMPORTANT]
> * All operations against this API are HTTP POST operations. 
> * Each operation accepts JSON objects as the request payload.
> * HTTP request JSON objects define a single property name which specifies the operation to be executed by the API.

Valid JSON request operation property names are:

* [Put](#put-reference-data-items)
* [Patch](#patch-reference-data-items)
* [Delete properties](#delete-properties-in-reference-data-items)
* [Delete](#delete-reference-data-items)
* [Get](#get-reference-data-items)

> [!NOTE]
> * The property value is an array of reference data items over which the operation must be applied.
> * Each item is processed individually and an error with one item does not prevent the others from successfully completing:
>   * If your request has 100 items and one item has an error, then 99 items are written and one is rejected.
> * Reference data items are queried using their fully-enumerated key properties.

## Put reference data items

Inserts or replaces the entire reference data item `$.put[i]` (the *i*-th item in the array with key **put**). The unit of commit is `$.put[i].` The operation is idempotent.

* Endpoint and operation

   ```URL
   POST https://<environmentFqdn>/referencedatasets/<referenceDataSetName>/$batch?api-version=2016-12-12
   ```

> [!NOTE]
> The example below assumes a reference data set that defines a single key with name **deviceId** and type **String**.

* Request body example:

  ```JSON
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

* Response example:

  ```JSON
  {
    "put": [
      null,
      null
    ]
  }
  ```

## Patch reference data items

Updates and inserts specific properties for the reference data item `$.patch[i]`.

* Endpoint and operation:

   ```URL
   POST https://<environmentFqdn>/referencedatasets/<referenceDataSetName>/$batch?api-version=2016-12-12
   ```

> [!NOTE]
> The example below assumes a reference data set that defines a single key with name **deviceId** and type **String**.

* Request body example:

  ```JSON
  {
    "patch": [
      {
        "deviceId": "Fan1",
        "maxSpeed": 108
      },
      {
        "deviceId": "Fan2",
        "floor": 18
      }
    ]
  }
  ```

* Response body example:

  ```JSON
  {
    "patch": [
      null,
      null
    ]
  }
  ```

## Delete properties in reference data items

Delete the specified properties from the reference data item `$.deleteproperties[i]`.

* Endpoint and operation:

   ```URL
   POST https://<environmentFqdn>/referencedatasets/<referenceDataSetName>/$batch?api-version=2016-12-12
  ```

> [!NOTE]
> The example below assumes a reference data set that defines a single key with name **deviceId** and type **String**.

* Request body example:

  ```JSON
  {
    "deleteProperties":[
      {
        "key":{
          "deviceId":"Fan2"
        },
        "properties":[
          "floor"
        ]
      }
    ]
  }
  ```

* Response body example:

  ```JSON
  {
    "deleteProperties": [
      null
    ]
  }
  ```

## Delete reference data items

Deletes the entire reference data identified by the key property values specified in each `$.delete[i]`.

* Endpoint and operation:

   ```URL
   POST https://<environmentFqdn>/referencedatasets/<referenceDataSetName>/$batch?api-version=2016-12-12
  ```

> [!NOTE]
> The example below assumes a reference data set that defines a single key with name **deviceId** and type **String**.

* Request body example:

  ```JSON
  {
    "delete": [{
      "deviceId": "Fan1"
    }]
  }
  ```

* Response body example:

  ```JSON
  {
    "delete": [
      null
    ]
  }
  ```

## Get reference data items

Get the entire reference data identified by the key property values specified in each `$.get[i]`.

* Endpoint and operation:

   ```URL
   POST https://<environmentFqdn>/referencedatasets/<referenceDataSetName>/$batch?api-version=2016-12-12
  ```

> [!NOTE]
> The example below assumes a reference data set that defines a single key with name **deviceId** and type **String**.

* Request body example:

  ```JSON
  {
    "get": [{
      "deviceId": "Fan1"
    },
    {
      "deviceId": "Fan2"
    }]
  }
  ```

* Response body example:

  ```JSON
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
      }
    ]
  }
  ```

## Validation and error handling

The Reference Data Management API processes each item individually and an error with one item does not prevent the others from successfully completing. For example, if your request has 100 items and one item has an error, then 99 items are written and one is rejected.

### Item error codes

Item error codes will occur within a successful JSON response body with HTTP status code **200**.

* **InvalidInput: Key not found.** indicates that the queried item cannot be found in the reference data set.

  ```JSON
  {
    "code": "InvalidInput",
    "message": "Key not found.",
    "target": null,
    "details": null,
    "innerError": null
  }
  ```

* **InvalidInput:Payload key should not contain any non-key property.** indicates that JSON request body query items should not contain any properties that are not key properties (those specified in the reference set schema). Key properties can be found in Azure portal.

  ```JSON
  {
    "code": "InvalidInput",
    "message": "Payload key should not contain any non-key property.",
    "target": null,
    "details": null,
    "innerError": null
  }
  ```

* **InvalidInput: Payload item should contain all key properties.**  indicates that JSON request body query items should include all key properties (those specified in the reference set schema). Key properties can be found in Azure portal.

  ```JSON
  {
    "code": "InvalidInput",
    "message": "Payload item should contain all key properties.",
    "target": null,
    "details": null,
    "innerError": null
  }
  ```

## Reference data join example

Consider an event hub message that has the following structure:

```JSON
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

Consider a reference data item set with the name `contoso` and key **deviceId** of type **String** having the following structure:

|deviceId|color|maxSpeed|floor|
|--------|-----|--------|-----|
|Fan1|Red|5||
|Fan2|White||2|

When the two events in the event hub message are processed by the Time Series Insights ingress engine, they are joined with the correct reference data item. The events output has the following structure:

```JSON
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

### Join rules and semantics

When joining reference data, adhere to the following constraints:

* Key name comparison during a join is case-sensitive.
* Key value comparison during a join is case-sensitive for string properties.

For environments with more than one reference data set, three further constraints are enforced during joins:

* Each item in a reference data set can specify its own list of non-key properties.
* For any two reference data sets A and B, non-key properties must not intersect.
* Reference data sets are only joined directly to events, never to other referenced data sets (and then to events). To join reference data item with an event, all key properties used in the reference data item must be present in the event. Also, the key properties should not come from the non-key properties joined to an event through some other reference data item.

Given these constraints, the join engine can apply the join in any order for a given event. Hierarchy and ordering are not considered.

### Current limits

You can add up to two reference data per Time Series Insights environment.  Below are additional limitations associated with Time Series Insights reference data.

| Limit name | Limit value | SKUs affected | Notes |
|-|-|-|-|
| Key property count  | 3 | S1, S2 | Per reference data set.  Azure Resource Manager/Azure Portal only|
| Key property size| 1 KB | S1, S2 | Per reference data set |
| Reference Data Item count  | 2,000/20,000 (S1/S2) | S1, S2 | Per unit.  Example:  4 unit S1 SKU = 8,000 items (4 x 2,000) |
| Max concurrent transactions | 2/10 (S1/S2) | S1, S2 |  |
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