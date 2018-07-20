---
title: "Get Replica"
ms.date: "2018-07-20"
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
# Get Replica
Gets a specific replica of a given service in an application resource.

Gets the information about the specified replica of a given service of an application. The information includes the runtime properties of the replica instance.

## Request
| Method | Request URI |
| ------ | ----------- |
| GET | `/Resources/Applications/{applicationResourceName}/Services/{serviceResourceName}/Replicas/{replicaName}?api-version=6.3-preview` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [`applicationResourceName`](#applicationresourcename) | string | Yes | Path |
| [`serviceResourceName`](#serviceresourcename) | string | Yes | Path |
| [`replicaName`](#replicaname) | string | Yes | Path |
| [`api-version`](#api-version) | string | Yes | Query |

____
### `applicationResourceName`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
Service Fabric application resource name.


____
### `serviceResourceName`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
Service Fabric service resource name.


____
### `replicaName`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
Service Fabric replica name.


____
### `api-version`
__Type__: string <br/>
__Required__: Yes<br/>
__Default__: `6.3-preview` <br/>
<br/>
The version of the API. This parameter is required and its value must be '6.3-preview'.


## Responses

| HTTP Status Code | Description | Response Schema |
| --- | --- | --- |
| 200 (OK) | OK<br/> | [ServiceResourceReplicaDescription](sfclient-model-serviceresourcereplicadescription.md) |


## Examples

### GetReplica

This example shows how to get the description of the specified service in an application resource.

#### Request
```
GET http://localhost:19080/Resources/Applications/helloWorldApp/Services/helloWorldService/Replicas/0?api-version=6.3-preview
```

#### 200 Response
##### Body
```json
{
  "osType": "Linux",
  "codePackages": [
    {
      "name": "helloWorldCode",
      "image": "seabreeze/sbz-helloworld:1.0-alpine",
      "endpoints": [
        {
          "name": "helloWorldListener",
          "port": "80"
        }
      ],
      "resources": {
        "requests": {
          "memoryInGB": "1",
          "cpu": "1"
        }
      },
      "instanceView": {
        "restartCount": "1",
        "currentState": {
          "state": "Running",
          "exitCode": "0"
        },
        "previousState": {
          "state": "NotSpecified",
          "exitCode": "0"
        }
      }
    }
  ],
  "networkRefs": [],
  "replicaName": "0s"
}
```

