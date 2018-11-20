---
title: Azure Time Series Insights Update TSM landing  | Microsoft Docs
description: This topic describes the Azure Time Series Insights update Model Experience
keywords:
services: time-series-insights
documentationcenter:
author: dpalled
manager: cshankar
editor: 

ms.assetid:
ms.service: time-series-insights
ms.devlang: na
ms.topic: time-series-model
ms.tgt_pltfrm: na
ms.workload: azure-iot
ms.date: 11/13/2017
ms.author: 
---

# Azure Time Series Insights Model APIs

This document describes the time series model APIs which are used to manage metadata in the model. It assumes that the environment is provisioned.

TSM makes it easy to find and analyze IoT data by enabling curation, maintenance, and enrichment of time series data to help establish consumer-ready data sets. It plays a vital role in queries and navigation as it contextualizes device and non-device entities. Data persisted in TSM powers time series queries computations by leveraging the formulas stored in them.

## Common headers and parameters

For authentication and authorization, a valid OAuth2.0 Bearer token must be passed in [Authorization header](/rest/api/#create-the-request). The token must be issued to `https://api.timeseries.azure.com/` resource (also known as "audience" in the token).

Optional request headers:
- `x-ms-client-request-id` - a client request ID. Service records this value. Allows the service to trace operation across services.
- `x-ms-client-session-id` - a client session ID. Service records this value. Allows the service to trace a group of related operations across services.
- `x-ms-client-application-name` - name of the application that generated this request. Service records this value.

Response headers:
- `x-ms-request-id` - server-generated request ID. Can be used to contact Microsoft to investigate a request.

## Model Settings API

The Model Settings API enable CRUD on auto created model in the environment for TimeSeriesIds

### Get Model Settings
`GET https://api.timeseries.azure.com/timeseries/modelsettings?api-version=2018-11-01-preview`

The Get Model Setting API returns the auto created model in the environment for TimeSeriesIds 

Request Body: None

Response Body:
```json
{
    "name": "DefaultModel",
    "timeSeriesIdProperties":[
        {
            "name": "Property1",
            "type": "String"
        }
    ],
    "defaultTypeId": "1be09af9-f089-4d6b-9f0b-48018b5f7393"
}
```
### Patch Model Settings

`PATCH https://api.timeseries.azure.com/timeseries/modelsettings?api-version=2018-11-01-preview`

The Patch Model Settings API updates the model in the environment for TimeSeriesIds with the new values provided in the request

Request Body:
```json
{
  "name": "AnotherModelName",
  "defaultTypeId": null
}
```

Response Body:
```json
{
    "modelSettings": {
    "name": "AnotherModelName",
    "timeSeriesIdProperties": [
        {
        "name": "someType1",
        "type": "String"
        }
    ],
    "defaultTypeId": "1be09af9-f089-4d6b-9f0b-48018b5f7393"
  }
}
```

## Types API

The Types API enable CRUD on Time Series Types and their associated Variables.

### Get Types
`GET https://123f394f-a3c6-4cc2-b13a-55e2fcf57823.env.api.timeseries.azure.com/timeseries/types?api-version=2018-11-01-preview`

The Get Types API returns all the Time Series Types and their associated Variables.

Request Body: None

Response Body:
```json
{
  "types": [
    {
      "id": "1be09af9-f089-4d6b-9f0b-48018b5f7393",
      "name": "DefaultType",
      "description": "Default type",
      "variables": {
        "EventCount": {
          "kind": "aggregate",
          "value": null,
          "filter": null,
          "aggregation": {
            "tsx": "count()"
          }
        }
      }
    },
    {
      "id": "c1cb7a33-ed9b-4cf1-9958-f3162fed8ee8",
      "name": "TemperatureSensor",
      "description": "This is a temperature sensor.",
      "variables": {
        "AverageTemperature": {
          "kind": "numeric",
          "value": {
            "tsx": "$event.Temperature.Double"
          },
          "filter": null,
          "aggregation": {
            "tsx": "avg($value)"
          }
        }
      }
    }
  ]
}
```
### Manage Types

`POST https://api.timeseries.azure.com/timeseries/types/$batch?api-version=2018-11-01-preview`

The Post Types API enables batch operations on Types. All operations against this API are HTTP POST operations. Each operation accepts a payload. The payload is a JSON object. This object defines a single property. The property key is the name of an operation allowed by the API. Supported opearions are put, update and delete.

Request Body:
```json
```

Response Body:
```json
```

Continuation Token

## Hierarchies API

The Hierarchies API enable CRUD on Time Series Hierarchies.

### Get Hierarchies
`GET https://api.timeseries.azure.com/timeseries/hierarchies/$batch?api-version=2018-11-01-preview`

The Get Hierarchies API returns all the Time Series Hierarchies matching the request

Request Body: None

Response Body:
```json
```
### Manage Hierarchies

`POST https://api.timeseries.azure.com/timeseries/hierarchies/$batch?api-version=2018-11-01-preview`

The Post Hierarchies API enables batch operations on Hierarchies. All operations against this API are HTTP POST operations. Each operation accepts a payload. The payload is a JSON object. This object defines a single property. The property key is the name of an operation allowed by the API. Supported opearions are put, update and delete.

Request Body:
```json
```

Response Body:
```json
```

## Instances API

The Instances API enable CRUD on Time Series Instances.

### Get Instances
`GET https://api.timeseries.azure.com/timeseries/instances?api-version=2018-11-01-preview`

The Get Instances API returns all the Time Series Instances matching the request

Request Body: None

Response Body:
```json
```

### Discover Instances

#### Suggest

#### Search

`POST https://api.timeseries.azure.com/timeseries/instances/$batch?api-version=2018-11-01-preview`

The Post Instances API enables batch operations on Instances. All operations against this API are HTTP POST operations. Each operation accepts a payload. The payload is a JSON object. This object defines a single property. The property key is the name of an operation allowed by the API. Supported opearions are put, update and delete.

Request Body:
```json
```

Response Body:
```json
```

### Manage Instances

`POST https://api.timeseries.azure.com/timeseries/instances/$batch?api-version=2018-11-01-preview`

The Post Instances API enables batch operations on Instances. All operations against this API are HTTP POST operations. Each operation accepts a payload. The payload is a JSON object. This object defines a single property. The property key is the name of an operation allowed by the API. Supported opearions are put, update and delete.

Request Body:
```json
```

Response Body:
```json
```
