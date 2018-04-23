---
title: "Get Image Store Content"
ms.date: "2018-01-22"
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
# Get Image Store Content
Gets the image store content information.

Returns the information about the image store content at the specified contentPath relative to the root of the image store.

## Request
| Method | Request URI |
| ------ | ----------- |
| GET | `/ImageStore/{contentPath}?api-version=6.0&timeout={timeout}` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [contentPath](#contentpath) | string | Yes | Path |
| [api-version](#api-version) | string | Yes | Query |
| [timeout](#timeout) | integer (int64) | No | Query |

____
### contentPath
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
Relative path to file or folder in the image store from its root.

____
### api-version
__Type__: string <br/>
__Required__: Yes<br/>
__Default__: 6.0 <br/>
<br/>
The version of this API. This is a required parameter and its value must be "6.0".

Service Fabric REST API version is based on the runtime version in which the API was introduced or was changed. Service Fabric runtime supports more than one version of the API. This is the latest supported version of the API. If a lower API version is passed, the returned response may be different from the one documented in this specification.

Additionally the runtime accept any version that is higher than the latest supported version up to the current version of the runtime. So if the latest API version is 6.0, but if the runtime is 6.1, in order to make it easier to write the clients, the runtime will accept version 6.1 for that API. However the behavior of the API will be as per the documented 6.0 version.


____
### timeout
__Type__: integer (int64) <br/>
__Required__: No<br/>
__Default__: 60 <br/>
__InclusiveMaximum__: 4294967295 <br/>
__InclusiveMinimum__: 1 <br/>
<br/>
The server timeout for performing the operation in seconds. This specifies the time duration that the client is willing to wait for the requested operation to complete. The default value for this parameter is 60 seconds.

## Responses

| HTTP Status Code | Description | Response Schema |
| --- | --- | --- |
| 200 (OK) | A successful operation will return 200 status code and the requested image store content information.<br/> | [ImageStoreContent](sfclient-v61-model-imagestorecontent.md) |
| All other status codes | The detailed error response.<br/> | [FabricError](sfclient-v61-model-fabricerror.md) |

## Examples

### Get information about image store content under a given relative path

This example shows how to get image store content under the given relative path.

#### Request
```
GET http://localhost:19080/ImageStore/Store\CalcServiceApp?api-version=6.0
```

#### 200 Response
##### Body
```json
{
  "StoreFiles": [
    {
      "StoreRelativePath": "Store\\CalcServiceApp\\ApplicationManifest.2.0.xml",
      "FileVersion": {
        "EpochDataLossNumber": "131510254310497004",
        "VersionNumber": "23",
        "EpochConfigurationNumber": "25769803776"
      },
      "FileSize": "897",
      "ModifiedDate": "2017-09-28T17:44:22.609Z"
    },
    {
      "StoreRelativePath": "Store\\CalcServiceApp\\CalcService.Code.2.0.checksum",
      "FileVersion": {
        "EpochDataLossNumber": "131510254310497004",
        "VersionNumber": "25",
        "EpochConfigurationNumber": "25769803776"
      },
      "FileSize": "66",
      "ModifiedDate": "2017-09-28T17:44:22.468Z"
    },
    {
      "StoreRelativePath": "Store\\CalcServiceApp\\CalcService.Config.1.0.checksum",
      "FileVersion": {
        "EpochDataLossNumber": "131510254310497004",
        "VersionNumber": "26",
        "EpochConfigurationNumber": "25769803776"
      },
      "FileSize": "66",
      "ModifiedDate": "2017-09-28T17:44:22.468Z"
    },
    {
      "StoreRelativePath": "Store\\CalcServiceApp\\CalcService.Data.2.0.checksum",
      "FileVersion": {
        "EpochDataLossNumber": "131510254310497004",
        "VersionNumber": "27",
        "EpochConfigurationNumber": "25769803776"
      },
      "FileSize": "66",
      "ModifiedDate": "2017-09-28T17:44:22.468Z"
    },
    {
      "StoreRelativePath": "Store\\CalcServiceApp\\CalcService.Manifest.2.0.xml",
      "FileVersion": {
        "EpochDataLossNumber": "131510254310497004",
        "VersionNumber": "19",
        "EpochConfigurationNumber": "25769803776"
      },
      "FileSize": "744",
      "ModifiedDate": "2017-09-28T17:44:22.578Z"
    },
    {
      "StoreRelativePath": "Store\\CalcServiceApp\\CalcService.Manifest.2.0.xml.checksum",
      "FileVersion": {
        "EpochDataLossNumber": "131510254310497004",
        "VersionNumber": "24",
        "EpochConfigurationNumber": "25769803776"
      },
      "FileSize": "66",
      "ModifiedDate": "2017-09-28T17:44:22.484Z"
    }
  ],
  "StoreFolders": [
    {
      "StoreRelativePath": "Store\\CalcServiceApp\\CalcService.Code.2.0",
      "FileCount": "2"
    },
    {
      "StoreRelativePath": "Store\\CalcServiceApp\\CalcService.Config.1.0",
      "FileCount": "2"
    },
    {
      "StoreRelativePath": "Store\\CalcServiceApp\\CalcService.Data.2.0",
      "FileCount": "2"
    }
  ]
}
```

