---
title: "Get Transition Progress"
ms.date: "2017-04-29"
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
# Get Transition Progress
Gets the progress of an operation started using StartNodeTransition.

Gets the progress of an operation started with StartNodeTransition using the provided OperationId.


## Request
| Method | Request URI |
| ------ | ----------- |
| GET | `/Faults/Nodes/{nodeName}/$/GetTransitionProgress?api-version=3.0&OperationId={OperationId}` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [nodeName](#nodename) | string | Yes | Path |
| [api-version](#api-version) | string | Yes | Query |
| [OperationId](#operationid) | string (uuid) | Yes | Query |

____
### nodeName
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The name of the node.

____
### api-version
__Type__: string <br/>
__Required__: Yes<br/>
__Default__: 3.0 <br/>
<br/>
The version of the API. This is a required parameter and it's value must be "3.0".

____
### OperationId
__Type__: string (uuid) <br/>
__Required__: Yes<br/>
<br/>
A GUID that identifies a call of this API.  This is passed into the corresponding GetProgress API

## Responses

| HTTP Status Code | Description | Response Schema |
| --- | --- | --- |
| 200 (OK) | Information about the progress of a node transition operation.<br/> | [NodeTransitionProgress](sfclient-model-nodetransitionprogress.md) |
| All other status codes | The detailed error response.<br/> | [FabricError](sfclient-model-fabricerror.md) |

## Examples

### Gets information about a completed NodeTransition operation

This shows an example of possible output when GetTransitionProgress has reached a State of Completed.  If the State has a value of Running, only the State field will have a value.

#### Request
```
GET http://localhost:19080/Faults/Nodes/N0060/$/GetTransitionProgress?api-version=3.0&OperationId=a9c24269-88e9-4812-b4ad-a0bf2b724ad4
```

#### 200 Response
##### Body
```json
{
  "State": "Completed",
  "NodeTransitionResult": {
    "ErrorCode": 0,
    "NodeResult": {
      "NodeName": "N0060",
      "NodeInstanceId": "131366982707950527"
    }
  }
}
```


### Gets information about a running NodeTransition operation

This shows an example of output when GetTransitionProgress has a State of Running.

#### Request
```
GET http://localhost:19080/Faults/Nodes/N0060/$/GetTransitionProgress?api-version=3.0&OperationId=ed903556-acf1-489c-9f33-b484c31f9087
```

#### 200 Response
##### Body
```json
{
  "State": "Running"
}
```

