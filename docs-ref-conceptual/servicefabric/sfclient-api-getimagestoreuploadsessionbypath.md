---
title: "Get Image Store Upload Session By Path"
ms.date: "2018-04-23"
ms.prod: "azure"
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
author: "rwike77"
ms.author: "ryanwi"
manager: "timlt"
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
# Get Image Store Upload Session By Path
Get the image store upload session by relative path.

Gets the image store upload session associated with the given image store relative path. User can query the upload session at any time during uploading. 


## Request
| Method | Request URI |
| ------ | ----------- |
| GET | `/ImageStore/{contentPath}/$/GetUploadSession?api-version=6.0&timeout={timeout}` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [`contentPath`](#contentpath) | string | Yes | Path |
| [`api-version`](#api-version) | string | Yes | Query |
| [`timeout`](#timeout) | integer (int64) | No | Query |

____
### `contentPath`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
Relative path to file or folder in the image store from its root.

____
### `api-version`
__Type__: string <br/>
__Required__: Yes<br/>
__Default__: `6.0` <br/>
<br/>
The version of the API. This parameter is required and its value must be '6.0'.

Service Fabric REST API version is based on the runtime version in which the API was introduced or was changed. Service Fabric runtime supports more than one version of the API. This is the latest supported version of the API. If a lower API version is passed, the returned response may be different from the one documented in this specification.

Additionally the runtime accept any version that is higher than the latest supported version up to the current version of the runtime. So if the latest API version is 6.0, but if the runtime is 6.1, in order to make it easier to write the clients, the runtime will accept version 6.1 for that API. However the behavior of the API will be as per the documented 6.0 version.


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
| 200 (OK) | A successful operation will return 200 status code and the requested image store upload session information.<br/> | [UploadSession](sfclient-model-uploadsession.md) |
| All other status codes | The detailed error response.<br/> | [FabricError](sfclient-model-fabricerror.md) |

## Examples

### Get information about image store upload session by a given relative path

This example shows how to get image store upload session by a given relative path.

#### Request
```
GET http://localhost:19080/ImageStore/SwaggerTest\Common.dll/$/GetUploadSession?api-version=6.0
```

#### 200 Response
##### Body
```json
{
  "UploadSessions": [
    {
      "StoreRelativePath": "SwaggerTest\\Common.dll",
      "SessionId": "2032ac6c-a348-4594-86da-dab0f2bb1ae1",
      "FileSize": "2097152",
      "ModifiedDate": "2017-09-28T17:28:11.627Z",
      "ExpectedRanges": [
        {
          "StartPosition": "0",
          "EndPosition": "207615"
        },
        {
          "StartPosition": "626977",
          "EndPosition": "2097151"
        }
      ]
    },
    {
      "StoreRelativePath": "SwaggerTest\\Common.dll",
      "SessionId": "fb2da2b2-7cb4-45d2-a2e6-c4888d205bc5",
      "FileSize": "2097152",
      "ModifiedDate": "2017-09-28T17:28:11.643Z",
      "ExpectedRanges": [
        {
          "StartPosition": "0",
          "EndPosition": "616947"
        },
        {
          "StartPosition": "1087529",
          "EndPosition": "2097151"
        }
      ]
    }
  ]
}
```

