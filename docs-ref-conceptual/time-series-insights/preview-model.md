---
title: Azure Time Series Insights (Preview) TSM landing  | Microsoft Docs
description: This topic describes the Azure Time Series Insights (Preview) Model Experience
keywords:
services: time-series-insights
documentationcenter:
author: TheGrungeByte
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

The Get Model Setting API returns the auto created model in the environment for TimeSeriesIds.

`GET https://123f394f-a3c6-4cc2-b13a-55e2fcf57823.env.timeseries.azure.com/timeseries/modelsettings?api-version=2018-11-01-preview`

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

The Patch Model Settings API updates the model in the environment for TimeSeriesIds with the new values provided in the request.

`PATCH https://123f394f-a3c6-4cc2-b13a-55e2fcf57823.env.timeseries.azure.com/timeseries/modelsettings?api-version=2018-11-01-preview`

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

The Get Types API returns all the Time Series Types and their associated Variables.

`GET https://123f394f-a3c6-4cc2-b13a-55e2fcf57823.env.timeseries.azure.com/timeseries/types?api-version=2018-11-01-preview`

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

The Post Types API enables batch operations on Types. All operations against this API are HTTP POST operations. Each operation accepts a payload. The payload is a JSON object. This object defines a single property. The property key is the name of an operation allowed by the API. Supported operations are put, update and delete.

`POST https://123f394f-a3c6-4cc2-b13a-55e2fcf57823.env.timeseries.azure.com/timeseries/types/$batch?api-version=2018-11-01-preview`

#### Get Types
Request Body:
```json
{
  "get": {
    "typeIds": [
      "1be09af9-f089-4d6b-9f0b-48018b5f7393",
      "c1cb7a33-ed9b-4cf1-9958-f3162fed8ee8"
    ],
    "names": null
  }
}
```

Response Body:
```json
{
  "get": [
    {
      "timeSeriesType": {
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
      "error": null
    },
    {
      "timeSeriesType": {
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
        },
      "error": null
    }
  }]
}
```

#### Create or Update Types

This API enables create or update of types.

Request Body:
```json
{
  "put": [
    {
      "id": "1be09af9-f089-4d6b-9f0b-48018b5f7393",
      "name": "DefaultType",
      "description": "My Default type",
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
      "name": "OutdoorTemperatureSensor",
      "description": "This is an outdoor temperature sensor.",
      "variables": {
        "AverageTemperature": {
          "kind": "numeric",
          "value": {
            "tsx": "$event.Temperature.Double"
          },
          "filter": {
            "tsx": "$event.Mode.String = 'outdoor'"
          },
          "aggregation": {
            "tsx": "avg($value)"
          }
        }
      }
  }]
}
```

Response Body:
```json
{
  "put": [
    {
      "timeSeriesType": {
        "id": "1be09af9-f089-4d6b-9f0b-48018b5f7393",
        "name": "DefaultType",
        "description": "My Default type",
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
      "error": null
    },
    {
      "timeSeriesType": {
        "id": "c1cb7a33-ed9b-4cf1-9958-f3162fed8ee8",
        "name": "OutdoorTemperatureSensor",
        "description": "This is an outdoor temperature sensor.",
        "variables": {
          "AverageTemperature": {
            "kind": "numeric",
            "value": {
              "tsx": "$event.Temperature.Double"
            },
            "filter": {
              "tsx": "$event.Mode.String = 'outdoor'"
            },
            "aggregation": {
              "tsx": "avg($value)"
            }
          }
        },
      "error": null
    }
  }]
}
```

#### Delete Types

This API enables deletion of types by `names` and `typeIds`. Types can only be deleted when there are no instances associated with them. Successful deletion returns `null` on the corresponding index.

Default type with Id `1be09af9-f089-4d6b-9f0b-48018b5f7393` can not be deleted.

Request Body:
```json
{
  "delete": {
    "typeIds": [
      "9250f816-faed-44c4-88e6-630e5eefa38b"
    ]
  }
}
```

Response Body:
```json
{
  "delete": [
    null
  ]
}
```

Request Body:
```json
{
  "delete": {
    "names": ["TemperatureSensor"]
  }
}
```

Response Body:
```json
{
  "delete": [
    null
  ]
}
```

## Hierarchies API

The Hierarchies API enable CRUD on Time Series Hierarchies.

### Get Hierarchies

The Get Hierarchies API returns all the Time Series Hierarchies matching the request.

`GET https://123f394f-a3c6-4cc2-b13a-55e2fcf57823.env.timeseries.azure.com/timeseries/hierarchies?api-version=2018-11-01-preview`

Request Body: None

Response Body:
```json
{
  "hierarchies": [
    {
      "id": "6e292e54-9a26-4be1-9034-607d71492707",
      "name": "Location",
      "source": {
        "instanceFieldNames": [
          "state",
          "city"
        ]
      }
    },
    {
      "id": "a28fd14c-6b98-4ab5-9301-3840f142d30e",
      "name": "ManufactureDate",
      "source": {
        "instanceFieldNames": [
          "year",
          "month"
        ]
      }
    }
  ]
}
```
### Manage Hierarchies

The Manage Hierarchies APIs enables batch operations on Hierarchies. All operations against this API are HTTP POST operations. Each operation accepts a payload. The payload is a JSON object. This object defines a single property. The property key is the name of an operation allowed by the API. Supported operations are put, update and delete.

`POST https://123f394f-a3c6-4cc2-b13a-55e2fcf57823.env.timeseries.azure.com/timeseries/hierarchies/$batch?api-version=2018-11-01-preview`

#### Get Hierarchies

This API enables retrieval of hierarchies by `names` or `hierarchyIds`.

Request Body:
```json
{
  "get": {
    "hierarchyIds": [
      "6e292e54-9a26-4be1-9034-607d71492707",
      "a28fd14c-6b98-4ab5-9301-3840f142d30e"
    ]
  }
}
```

Response Body:
```json
{
  "get": [
    {
      "id": "6e292e54-9a26-4be1-9034-607d71492707",
      "name": "Location",
      "source": {
        "instanceFieldNames": [
          "state",
          "city"
        ]
      }
    },
    {
      "id": "a28fd14c-6b98-4ab5-9301-3840f142d30e",
      "name": "ManufactureDate",
      "source": {
        "instanceFieldNames": [
          "year",
          "month"
        ]
      }
    }
  ]
}
```

Request Body:
```json
{
  "get": {
    "names": ["Location","ManufactureDate"]
  }
}
```

Response Body:
```json
{
  "get": [
    {
      "id": "6e292e54-9a26-4be1-9034-607d71492707",
      "name": "Location",
      "source": {
        "instanceFieldNames": [
          "state",
          "city"
        ]
      }
    },
    {
      "id": "a28fd14c-6b98-4ab5-9301-3840f142d30e",
      "name": "ManufactureDate",
      "source": {
        "instanceFieldNames": [
          "year",
          "month"
        ]
      }
    }
  ]
}
```

#### Create or Update Hierarchies

This API enables create or update of hierarchies.

Request Body:
```json
{
  "put": [
    {
      "id": "6e292e54-9a26-4be1-9034-607d71492707",
      "name": "Location",
      "source": {
        "instanceFieldNames": [
          "state",
          "city"
        ]
      }
    },
    {
      "id": "a28fd14c-6b98-4ab5-9301-3840f142d30e",
      "name": "ManufactureDate",
      "source": {
        "instanceFieldNames": [
          "year",
          "month"
        ]
      }
    }
  ]
}
```

Response Body:
```json
{
  "put": [
    {
      "hierarchy": {
        "id": "6e292e54-9a26-4be1-9034-607d71492707",
        "name": "Location",
        "source": {
          "instanceFieldNames": [
            "state",
            "city"
          ]
        }
      },
      "error": null
    },
    {
      "hierarchy": {
        "id": "a28fd14c-6b98-4ab5-9301-3840f142d30e",
        "name": "ManufactureDate",
        "source": {
          "instanceFieldNames": [
            "year",
            "month"
          ]
        }
      },
      "error": null
    }
  ]
}
```

#### Delete Hierarchies

This API enables deletion of hierarchies by `names` or `hierarchyIds`. Hierarchies can only be deleted when there is no instance associated with it. Successful deletion returns `null` on the corresponding index.

Request Body:
```json
{
  "delete": {
    "hierarchyIds": [
      "a28fd14c-6b98-4ab5-9301-3840f142d30e"
    ]
  }
}
```

Response Body:
```json
{
  "delete": [
    null
  ]
}
```

Request Body:
```json
{
  "delete": {
    "names": [
      "WindFarm"
    ]
  }
}
```

Response Body:
```json
{
  "delete": [
    null
  ]
}
```

## Instances API

The Instances API enable CRUD on Time Series Instances.

### Get Instances

The Get Instances API returns all the Time Series Instances matching the request.

`GET https://123f394f-a3c6-4cc2-b13a-55e2fcf57823.env.timeseries.azure.com/timeseries/instances?api-version=2018-11-01-preview`

Request Body: None

Response Body:
```json
{
  "instances": [
        {
            "typeId": "1be09af9-f089-4d6b-9f0b-48018b5f7393",
            "timeSeriesId": [
                "Id1One",
                "Id2One",
                "Id3One"
            ],
            "name" : "timeSeries1",
            "description": "floor 100",
            "hierarchyIds": [
                "1643004c-0a84-48a5-80e5-7688c5ae9295"
            ],
            "instanceFields": {
                "state": "California",
                "city": "Los Angeles"
            }
        }
    ],
    "continuationToken": "aXsic2tpcCI6MSwidGFrZSI6MX0="
}
```
This API returns at most 1000 instances. To get the next batch of instances, send the same request with header `x-ms-continuation-token` with value from the received response.
### Discover Instances

These APIs enable discovery of time series instances.

#### Suggest

Suggest will enable autocomplete scenarios while searching for an instance.

`POST https://123f394f-a3c6-4cc2-b13a-55e2fcf57823.env.timeseries.azure.com/timeseries/instances/suggest?api-version=2018-11-01-preview`

Request:
```json
{
    "searchString": "flo",
    "take": 100
}
```

Response:

```json
{
  "suggestions": [
        {
            "searchString": "floor 100",
            "highlightedSearchString": "<hit>flo</hit>or 100"
        },
        {
            "searchString": "sensor on floor 0",
            "highlightedSearchString": "sensor on <hit>flo</hit>or 0"
        },
        {
            "searchString": "sensor on floor 1",
            "highlightedSearchString": "sensor on <hit>flo</hit>or 1"
        }
    ]
}
```
#### Search

Search helps in identifying the instances based on the keywords provided, these keywords are matched with:
- timeSeriesId
- timeSeriesName
- typeName
- instanceFieldNames
- instanceFieldValues
- description

`POST https://123f394f-a3c6-4cc2-b13a-55e2fcf57823.env.timeseries.azure.com/timeseries/instances/suggest?api-version=2018-11-01-preview`

Request Body:
```json
{
    "searchString": "floor 100"
}
```

Response Body:
```json
{
  "instances": [
        {
            "timeSeriesId": ["Id1One", "Id2One", "Id3One"],
            "name" : "timeSeries1",
            "highlights": {
                "timeSeriesIds": ["Id1One", "Id2One", "Id3One"],
                "type": "DefaultType",
                "description": "<hit>floor</hit> <hit>100</hit>",
                "hierarchyIds": [
                    "1643004c-0a84-48a5-80e5-7688c5ae9295"
                ],
                "instanceFieldNames": [
                    "state",
                    "city"
                ],
                "instanceFieldValues": [
                    "California",
                    "Los Angeles"
                ]
            }
        }
    ],
    "instancesContinuationToken": null
}
```
### Manage Instances

The Manage Instances API enables batch operations on Instances. All operations against this API are HTTP POST operations. Each operation accepts a payload. The payload is a JSON object. This object defines a single property. The property key is the name of an operation allowed by the API. Supported operations are put, update and delete.

`POST https://123f394f-a3c6-4cc2-b13a-55e2fcf57823.env.timeseries.azure.com/timeseries/instances/$batch?api-version=2018-11-01-preview`

#### Get Instances

This API enables getting instances by timeSeriesId or timeSeriesName.

Request Body:  
Using `timeSeriesId`
```json
{
  "get": [
    ["Id1One", "Id2One", "Id3One"]
  ]
}
```
OR   
Using `name`
```json
{
  "get": [
    "timeSeries1"
  ]
}
```
Response Body:
```json
{
  "get": [
    {
      "instance": {
        "typeId": "1be09af9-f089-4d6b-9f0b-48018b5f7393",
        "timeSeriesId": [
          "Id1One",
          "Id2One",
          "Id3One"
        ],
        "name" : "timeSeries1",
        "description": "This is the temperature sensor 123134.",
        "hierarchyIds": [
          "1643004c-0a84-48a5-80e5-7688c5ae9295"
        ],
        "instanceFields": {
          "state": "California",
          "city": "Los Angeles"
        }
      },
      "error": null
    }]
}
```
#### Create Instances

This API enables creation of instances by timeSeriesId. TimeSeries name is not a mandatory parameter to create instances.

Request Body:
```json
{
  "put": [
    {
      "typeId": "1be09af9-f089-4d6b-9f0b-48018b5f7393",
      "timeSeriesId": [
        "Id1One",
        "Id2One",
        "Id3One"
      ],
      "name": "timeSeries1",
      "description": "This is the temperature sensor 123134.",
      "hierarchyIds": [
        "1643004c-0a84-48a5-80e5-7688c5ae9295"
      ],
      "instanceFields": {
        "state": "California",
        "city": "Los Angeles"
      }
    }
  ]
}
```

Response Body:
```json
{
    "put": [
        {
            "instance": null,
            "error": null
        }
    ]
}
```

#### Update instances

This API enables update of instances by timeSeriesId. This API only updates existing instances, but will throw an error if the instances do not already exists. The API also updates the name of the time series instance. The name of time series has to be unique in an environment.

Request Body:
```json
{
  "update": [
    {
      "typeId": "1be09af9-f089-4d6b-9f0b-48018b5f7393",
      "timeSeriesId": [
        "Id1One",
        "Id2One",
        "Id3One"
      ],
      "name" : "timeSeries1",
      "description": "This is the updated temperature sensor 123134.",
      "hierarchyIds": [
        "1643004c-0a84-48a5-80e5-7688c5ae9295"
      ],
      "instanceFields": {
        "state": "California",
        "city": "Los Angeles"
      }
    }
  ]
}
```

Response Body:
```json
{
    "update": [
        {
            "instance": null,
            "error": null
        }
    ]
}
```


#### Delete instances

This API enables deletion of instances by timeSeriesId or name. Only one of timeSeriesId's or name should be provided to perform the delete operation. Instances can only be deleted when there is no telemetry associated with it. Successful deletion returns `null` on the corresponding index.

Request Body:  
Using `timeSeries1d`
```json
{
    "delete": [
        [
            "Id1One",
            "Id2One",
            "Id3One"
        ],
        [
            "Id1Two",
            "Id2Two",
            "Id3Two"
        ]
    ]
}
```

OR  
Using `name`

```json
{
    "delete": [
        "timeSeries1",
        "timeSeries2"
    ]
}
```

Response Body:
```json
{
  "delete": [
        null,
        null
      ]
}
```

## Limits

The following limits are applied during query execution to fairly utilize resources among multiple environments and users:

| Applicable APIs | Limit name | Limit value | SKUs affected |
|-|-|-|-|
| All | Max number of TSM objects per request | 10000 or 8 MB | L1 |
| All | Max model request execution time | 30 seconds | L1 |
| All | Max number of instances per environment | 500,000 | L1 |
| All | Max number of instance fields per instance | 50 | L1 |
| All | Max number of types per environment | 1000 | L1 |
| All | Max number of variables per type | 50 | L1 |
| All | Max number of hierarchies per environment | 32 | L1 |
| All | Max number of hierarchies associated with an instance | 32 | L1 |
| All | Max hierarchy depth | 32 | L1 |
| All | Max number of characters in type name, hierarchy name, instance fields name, Time Series Id property value, Time Series Id each property name, Time Series name | 1024 | L1 |
