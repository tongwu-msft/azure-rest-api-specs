---
title: "Get Image Store Info v82"
description: "Get Image Store Info v82"
ms.date: "10/21/2020"
ms.service: "service-fabric"
ms.topic: "reference"
applies_to: 
  - "Azure"
  - "Windows Server 2012 R2"
  - "Windows Server 2016"
dev_langs: 
  - "rest-api"
helpviewer_keywords: 
  - "Service Fabric REST API Reference"
author: "erikadoyle"
ms.author: "edoyle"
manager: "gwallace"
translation.priority.mt: 
  - "de-de"
  - "es-es"
  - "fr-fr"
  - "it-it"
  - "ja-jp"
  - "ko-kr"
  - "pt-br"
  - "ru-ru"
  - "zh-cn"
  - "zh-tw"
---
# Get Image Store Info v82
Gets the overall ImageStore information

Returns information about the primary ImageStore replica, such as disk capacity and available disk space at the node it is on, and several categories of the ImageStore's file system usage.

## Request
| Method | Request URI |
| ------ | ----------- |
| GET | `/ImageStore/$/Info?api-version=6.5&timeout={timeout}` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [`api-version`](#api-version) | string | Yes | Query |
| [`timeout`](#timeout) | integer (int64) | No | Query |

____
### `api-version`
__Type__: string <br/>
__Required__: Yes<br/>
__Default__: `6.5` <br/>
<br/>
The version of the API. This parameter is required and its value must be '6.5'.

Service Fabric REST API version is based on the runtime version in which the API was introduced or was changed. Service Fabric runtime supports more than one version of the API. This version is the latest supported version of the API. If a lower API version is passed, the returned response may be different from the one documented in this specification.

Additionally the runtime accepts any version that is higher than the latest supported version up to the current version of the runtime. So if the latest API version is 6.0 and the runtime is 6.1, the runtime will accept version 6.1 for that API. However the behavior of the API will be as per the documented 6.0 version.


____
### `timeout`
__Type__: integer (int64) <br/>
__Required__: No<br/>
__Default__: `60` <br/>
__InclusiveMaximum__: `4294967295` <br/>
__InclusiveMinimum__: `1` <br/>
<br/>
The server timeout for performing the operation in seconds. This timeout specifies the time duration that the client is willing to wait for the requested operation to complete. The default value for this parameter is 60 seconds.

## Responses

| HTTP Status Code | Description | Response Schema |
| --- | --- | --- |
| 200 (OK) | A successful operation will return 200 status code and the requested ImageStore info<br/> | [ImageStoreInfo](sfclient-v82-model-imagestoreinfo.md) |
| All other status codes | The detailed error response.<br/> | [FabricError](sfclient-v82-model-fabricerror.md) |

## Examples

### Gets the overall ImageStore information

This example shows how to get ImageStore information.

#### Request
```
GET http://localhost:19080/ImageStore/$/Info?api-version=6.5
```

#### 200 Response
##### Body
```json
[
  {
    "DiskInfo": {
      "Capacity": "500090007552",
      "AvailableSpace": "228851900416"
    },
    "UsedByMetadata": {
      "UsedSpace": "23093248",
      "FileCount": "6"
    },
    "UsedByStaging": {
      "UsedSpace": "6291456",
      "FileCount": "9"
    },
    "UsedByCopy": {
      "UsedSpace": "4194304",
      "FileCount": "2"
    },
    "UsedByRegister": {
      "UsedSpace": "4194304",
      "FileCount": "3"
    }
  }
]
```

