---
ms.assetid:
title: General availability (GA) Reference Data API - Azure Time Series Insights | Microsoft Docs
ms.title: General availability (GA) Reference Data API - Azure Time Series Insights | Microsoft Docs
services: time-series-insights
ms.service: time-series-insights
service_description: Time Series Insights
description: REST API reference documentation for the Azure Time Series Insights general availability (GA) Reference Data API.
manager: deepakpalled
ms.manager: dpalled
author: yeskarthik
ms.author: Subramanian.Karthik
ms.date: 01/02/2020
---

# Azure Time Series Insights Reference Data API

This article describes the Time Series Insights General Availability Reference Data Management API that's used to manage items within a reference dataset. It assumes that the reference dataset has already been created within the environment.

Reference data includes manufacturer or location data that changes infrequently. Reference data is used to contextualize telemetry data and serves to compare telemetry data.

> [!TIP]
> * To create a reference dataset, see [How to create a reference dataset](https://docs.microsoft.com/azure/time-series-insights/time-series-insights-add-reference-data-set).
> * For required HTTP request headers and parameters, see [Authentication and authorization](https://docs.microsoft.com/azure/time-series-insights/time-series-insights-authentication-and-authorization).

Because datasets are preexisting and fixed, each data packet that's sent by a device would contain identical information. Consequently, reference data is not sent from devices, and you manage the data by using the Reference Data Management API or the Azure portal.

## API overview

The Reference Data Management API is a batch API.

> [!IMPORTANT]
> * All operations against this API are HTTP POST operations. 
> * Each operation accepts JSON objects as the request payload.
> * HTTP-request JSON objects define a single property name that specifies the operation to be executed by the API.

Valid JSON request operation property names are:

* [Put](#put-reference-data-items)
* [Patch](#patch-reference-data-items)
* [Delete properties](#delete-properties-in-reference-data-items)
* [Delete](#delete-reference-data-items)
* [Get](#get-reference-data-items)

> [!IMPORTANT]
> * The property value is an array of reference data items over which the operation must be applied.
> * Each item is processed individually, and an error with one item doesn't prevent the others from being written successfully. For example, if your request has 100 items and one item has an error, 99 items are written and one is rejected.
> * Reference data items are queried using their fully-enumerated key properties.

> [!NOTE]
> All the following JSON body examples assume a reference dataset with a single property key with name **deviceId** and type **String**.

## Put reference data items

Inserts or replaces the entire reference data item `$.put[i]` (the *i<sup>th</sup>* item in the array with the key **put**). The unit of commit is `$.put[i].` The operation is idempotent.

* Endpoint and operation:

   ```URL
   POST https://<environmentFqdn>/referencedatasets/<referenceDataSetName>/$batch?api-version=2016-12-12
   ```

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

Deletes the specified properties from the reference data item `$.deleteproperties[i]`.

* Endpoint and operation:

   ```URL
   POST https://<environmentFqdn>/referencedatasets/<referenceDataSetName>/$batch?api-version=2016-12-12
  ```

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

Deletes the entire reference data item that's identified by the key property values specified in each `$.delete[i]`.

* Endpoint and operation:

   ```URL
   POST https://<environmentFqdn>/referencedatasets/<referenceDataSetName>/$batch?api-version=2016-12-12
  ```

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

Gets the entire reference data item that's identified by the key property values specified in each `$.get[i]`.

* Endpoint and operation:

   ```URL
   POST https://<environmentFqdn>/referencedatasets/<referenceDataSetName>/$batch?api-version=2016-12-12
  ```

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

The Reference Data Management API processes each item individually, and an error with one item doesn't prevent the others from being written successfully. For example, if your request has 100 items and one item has an error, 99 items are written and one is rejected.

### Item error codes

Item error codes occur within a successful JSON response body that has the HTTP status code **200**.

* **InvalidInput: Key not found.**: Indicates that the queried item can't be found in the reference dataset.

  ```JSON
  {
    "code": "InvalidInput",
    "message": "Key not found.",
    "target": null,
    "details": null,
    "innerError": null
  }
  ```

* **InvalidInput: Payload key should not contain any non-key property.**: Indicates that JSON request body query items should not contain any properties that are not key properties (that is, properties that are specified in the reference set schema). Key properties can be found in the Azure portal.

  ```JSON
  {
    "code": "InvalidInput",
    "message": "Payload key should not contain any non-key property.",
    "target": null,
    "details": null,
    "innerError": null
  }
  ```

* **InvalidInput: Payload item should contain all key properties.**: Indicates that JSON request body query items should include all key properties (that is, properties that are specified in the reference set schema). Key properties can be found in Azure portal.

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

Consider a reference data item that is set with the name `contoso` and key **deviceId** of type **String**, and that has the following structure:

|deviceId|color|maxSpeed|floor|
|--------|-----|--------|-----|
|Fan1|Red|5||
|Fan2|White||2|

When the two events in the event hub message are processed by the Time Series Insights ingress engine, they're joined with the correct reference data item. The events output has the following structure:

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

When you're joining reference data, adhere to the following constraints:

* Key name comparison is case-sensitive.
* Key value comparison is case-sensitive for string properties.

For environments with more than one reference dataset, three further constraints are enforced during joins:

* Each item in a reference dataset can specify its own list of non-key properties.
* For any two reference datasets A and B, non-key properties must not intersect.
* Reference datasets are joined directly only to events, never to other referenced datasets (and then to events). To join a reference data item to an event, all key properties that are used in the reference data item must be present in the event. Also, the key properties should not come from the non-key properties that are joined to an event through some other reference data item.

Given these constraints, the join engine can apply the join in any order for a given event. Hierarchy and ordering are not considered.

### Current limits

You can add up to two reference datasets per Time Series Insights environment. Additional limitations associated with Time Series Insights reference data are listed in the following table:

| Limit name | Limit value | SKUs affected | Notes |
|-|-|-|-|
| Key property count  | 3 | S1, S2 | Per reference dataset; Azure Resource Manager and the Azure portal only|
| Key property size| 1 KB | S1, S2 | Per reference dataset |
| Reference data item count  | 2,000/20,000 (S1/S2) | S1, S2 | Per unit; for example, 4 unit S1 SKU = 8,000 items (4 x 2,000) |
| Max concurrent transactions | 2/10 (S1/S2) | S1, S2 |  |
| Max reference data transactions | 120/600 (S1/S2) | S1, S2 | Per hour |
| Max reference data item count | 1,000 | S1, S2 | Per transaction |
| Max reference data item size | 8,192 KB | S1, S2 | Per transaction |

## See also

For more information about application registration and the Azure Active Directory programming model, see [Azure Active Directory for developers](https://docs.microsoft.com/azure/active-directory/develop/active-directory-developers-guide).

To learn about request and authentication parameters, see [Authentication and authorization](https://docs.microsoft.com/azure/time-series-insights/time-series-insights-authentication-and-authorization).

Tools that assist with testing HTTP requests and responses include:

- [Fiddler](https://www.telerik.com/fiddler). This free web debugging proxy can intercept your REST requests, so you can diagnose the HTTP request and response messages.
- [JWT.io](https://jwt.io/). You can use this tool to quickly dump the claims in your bearer token and then validate their contents.
- [Postman](https://www.getpostman.com/). This is a free HTTP request and response testing tool for debugging REST APIs.

Learn more about Azure Time Series Insights by reviewing the [product documentation](https://docs.microsoft.com/azure/time-series-insights/time-series-insights-overview).