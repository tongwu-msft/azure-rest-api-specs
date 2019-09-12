---
title: Azure Time Series Insights (Preview) data access landing  | Microsoft Docs
description: This topic describes the Azure Time Series Insights (Preview) data access
keywords:
services: time-series-insights
documentationcenter:
author: TheGrungeByte
manager: cshankar
editor: 

ms.assetid:
ms.service: time-series-insights
ms.devlang: na
ms.topic: update-product-landing
ms.tgt_pltfrm: na
ms.workload: azure-iot
ms.date: 11/13/2017
ms.author: 
---
# Azure Time Series Insights (Preview) Environment APIs

This document describes various REST APIs for environment management. REST APIs are service endpoints that support sets of HTTP operations (methods), which enable you to query Time Series Insights environments. 

To better understand the API calls described in this document, see [Azure Time Series Insights (Preview) Expression Syntax](preview-tsx.md).

## Get Environments API

`GET https://api.timeseries.azure.com/environments?api-version=2016-12-12`

The Get Environments API returns the list of environments that the caller is authorized to access.

Request Body: None

Response Body:
```json
{
    "environments": [
        {
            "displayName": "Sensors",
            "environmentId": "123f394f-a3c6-4cc2-b13a-55e2fcf57823",
            "environmentFqdn": "123f394f-a3c6-4cc2-b13a-55e2fcf57823.env.timeseries.azure.com",
            "resourceId": "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/SampleResourceGroup/providers/Microsoft.TimeSeriesInsights/environments/Sensors",
            "features": [
                "TimeSeriesQuery",
                "TimeSeriesModel"
            ],
            "roles": [
                "Contributor"
            ]
        }
    ]
}
```

Here, `environmentFqdn` is unique fully qualified domain name for environment used in per-environment query API requests. The environmentFqdn can also be found under 'Data Access FQDN' in the overview section of the Time Series Insights environment in Azure Portal.

## Get Environment Availability API

`GET https://123f394f-a3c6-4cc2-b13a-55e2fcf57823.env.timeseries.azure.com/availability?api-version=2018-11-01-preview`

The get Environments Availability API returns the distribution of event count over the event timestamp `$ts`. This API can be used to provide landing experience of navigating to the environment.

Request Body: None

Response Body:
```json
{
    "range": {
        "from": "2016-08-01T01:02:03Z",
        "to": "2016-08-31T03:04:05Z"
    },
    "intervalSize": "PT1H",
    "distribution": {
        "2016-08-01T00:00:00Z": 123,
        "2016-08-31T03:00:00Z": 345
    }
}
```
Interval size is represented in [ISO8601](https://en.wikipedia.org/wiki/ISO_8601#Durations) timespan format

An empty object is returned for environments with no events. Environment availability is cached, and the response time does not depend on the number of events in an environment.

## Get Event Schema API

### **Event Schema**
**Time Series Insights** detects the **types** of properties that are sent part of events, and creates a schema. This schema will have properties defined by name and datatype (string, double, bool, & datetime).

`POST https://123f394f-a3c6-4cc2-b13a-55e2fcf57823.env.timeseries.azure.com/eventSchema?api-version=2018-11-01-preview`

The Get Event Schema API returns environment metadata for a given search span. Event Schema is returned as a set of property references.

Input payload structure:
* Search span clause (mandatory).

Request Body:
```json
{
    "searchSpan": {
        "from": "2016-08-01T00:00:00.000Z",
        "to": "2016-08-31T00:00:00.000Z"
    }
}
```

Response Body:
```json
{
    "properties": [
        {
    		"name": "Building",
    		"type": "String"
    	},
    	{
    		"name": "Room",
    		"type": "String"
    	},
    	{
    		"name": "DeviceId",
    		"type": "Double"
    	},
    	{
    		"name": "Temperature",
    		"type": "Double"
    	},
    	{
    		"name": "Pressure",
    		"type": "Double"
    	},
    	{
    		"name": "Status",
    		"type": "String"
    	}
    ]
}
```
