---
title: "Get Upgrade Progress"
ms.date: "11/23/2019"
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
# Get Upgrade Progress
Gets the progress of the latest upgrade performed on this application resource.

Gets the upgrade progress information about the Application resource with the given name. The information include percentage of completion and other upgrade state information of the Application resource.

## Request
| Method | Request URI |
| ------ | ----------- |
| GET | `/Resources/Applications/{applicationResourceName}/$/GetUpgradeProgress?api-version=7.0` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [`applicationResourceName`](#applicationresourcename) | string | Yes | Path |
| [`api-version`](#api-version) | string | Yes | Query |

____
### `applicationResourceName`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The identity of the application.

____
### `api-version`
__Type__: string <br/>
__Required__: Yes<br/>
__Default__: `7.0` <br/>
<br/>
The version of the API. This parameter is required and its value must be '7.0'.

Service Fabric REST API version is based on the runtime version in which the API was introduced or was changed. Service Fabric runtime supports more than one version of the API. This version is the latest supported version of the API. If a lower API version is passed, the returned response may be different from the one documented in this specification.

Additionally the runtime accepts any version that is higher than the latest supported version up to the current version of the runtime. So if the latest API version is 6.0 and the runtime is 6.1, the runtime will accept version 6.1 for that API. However the behavior of the API will be as per the documented 6.0 version.


## Responses

| HTTP Status Code | Description | Response Schema |
| --- | --- | --- |
| 200 (OK) | OK<br/> | [ApplicationResourceUpgradeProgressInfo](sfclient-model-applicationresourceupgradeprogressinfo.md) |
| All other status codes | Error<br/> | [FabricError](sfclient-model-fabricerror.md) |

## Examples

### GetApplicationResourceUpgrade

This example shows how to get a application resource upgrade. If the application resource exists, its description is returned along with an OK (200) status code. If the application resource does not exist, an error is returned with an appropriate status code.

#### Request
```
GET http://localhost:19080/Resources/Applications/sampleApplication/$/GetUpgradeProgress?api-version=6.4-preview
```

#### 200 Response
##### Body
```json
{
  "Name": "sampleApplication",
  "TargetApplicationTypeVersion": "v1",
  "StartTimestampUtc": "0001-01-01T00:00:00Z",
  "UpgradeState": "RollingForward",
  "PercentCompleted": "0",
  "ServiceUpgradeProgress": [
    {
      "ServiceName": "helloWorldService",
      "CompletedReplicaCount": "0",
      "PendingReplicaCount": "3"
    }
  ],
  "RollingUpgradeMode": "Monitored",
  "UpgradeDuration": "PT0H0M2.31669S",
  "ApplicationUpgradeStatusDetails": "Deployment upgrading from version: v0 to version: v1.",
  "UpgradeReplicaSetCheckTimeoutInSeconds": "4294967295"
}
```

