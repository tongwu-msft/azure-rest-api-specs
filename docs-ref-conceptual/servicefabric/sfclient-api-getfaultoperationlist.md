---
title: "Get Fault Operation List"
ms.date: "2017-05-04"
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
# Get Fault Operation List
Gets a list of user-induced fault operations filtered by provided input.

Gets the a list of user-induced fault operations filtered by provided input.

## Request
| Method | Request URI |
| ------ | ----------- |
| GET | `/Faults/?api-version=3.0&TypeFilter={TypeFilter}&StateFilter={StateFilter}&timeout={timeout}` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [api-version](#api-version) | string | Yes | Query |
| [TypeFilter](#typefilter) | integer | Yes | Query |
| [StateFilter](#statefilter) | integer | Yes | Query |
| [timeout](#timeout) | integer (int64) | No | Query |

____
### api-version
__Type__: string <br/>
__Required__: Yes<br/>
__Default__: 3.0 <br/>
<br/>
The version of the API. This is a required parameter and it's value must be "3.0".

____
### TypeFilter
__Type__: integer <br/>
__Required__: Yes<br/>
__Default__: 65535 <br/>
<br/>
Used to filter on OperationType for user-induced operations.
65535 - select all
1     - select PartitionDataLoss.
2     - select PartitionQuorumLoss.
4     - select PartitionRestart.
8     - select NodeTransition.


____
### StateFilter
__Type__: integer <br/>
__Required__: Yes<br/>
__Default__: 65535 <br/>
<br/>
Used to filter on OperationState's for user-induced operations.
65535 - select All
1     - select Running
2     - select RollingBack
8     - select Completed
16    - select Faulted
32    - select Cancelled
64    - select ForceCancelled


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
| 200 (OK) | A successful operation will return 200 status code.<br/> | array of [OperationStatus](sfclient-model-operationstatus.md) |
| All other status codes | The detailed error response.<br/> | [FabricError](sfclient-model-fabricerror.md) |

## Examples

### Gets information on fault operations

This shows an example of possible output for GetFaultOperationList

#### Request
```
GET http://localhost:19080/Faults/?api-version=3.0&TypeFilter=0xFF&StateFilter=0xFF
```

#### 200 Response
##### Body
```json
[
  {
    "OperationId": "00000000-0000-0000-0000-000000000010",
    "State": "Completed",
    "Type": "PartitionDataLoss"
  },
  {
    "OperationId": "00000000-0000-0000-0000-000000000020",
    "State": "Completed",
    "Type": "PartitionQuorumLoss"
  },
  {
    "OperationId": "00000000-0000-0000-0000-000000000030",
    "State": "Completed",
    "Type": "PartitionRestart"
  },
  {
    "OperationId": "00000000-0000-0000-0000-000000000500",
    "State": "Faulted",
    "Type": "NodeTransition"
  },
  {
    "OperationId": "00000000-0000-0000-0000-000000000700",
    "State": "Completed",
    "Type": "NodeTransition"
  },
  {
    "OperationId": "00000000-0000-0000-0000-000000000710",
    "State": "Completed",
    "Type": "NodeTransition"
  },
  {
    "OperationId": "88ef90f9-0b94-46b0-b817-a6ea20c07f8a",
    "State": "Completed",
    "Type": "PartitionRestart"
  }
]
```

