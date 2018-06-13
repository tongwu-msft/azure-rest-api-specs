---
title: "Get Repair Task List"
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
# Get Repair Task List
Gets a list of repair tasks matching the given filters.

This API supports the Service Fabric platform; it is not meant to be used directly from your code.


## Request
| Method | Request URI |
| ------ | ----------- |
| GET | `/$/GetRepairTaskList?api-version=6.0&TaskIdFilter={TaskIdFilter}&StateFilter={StateFilter}&ExecutorFilter={ExecutorFilter}` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [api-version](#api-version) | string | Yes | Query |
| [TaskIdFilter](#taskidfilter) | string | No | Query |
| [StateFilter](#statefilter) | integer | No | Query |
| [ExecutorFilter](#executorfilter) | string | No | Query |

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
### TaskIdFilter
__Type__: string <br/>
__Required__: No<br/>
<br/>
The repair task ID prefix to be matched.

____
### StateFilter
__Type__: integer <br/>
__Required__: No<br/>
<br/>
A bitwise-OR of the following values, specifying which task states should be included in the result list.
- 1 - Created
- 2 - Claimed
- 4 - Preparing
- 8 - Approved
- 16 - Executing
- 32 - Restoring
- 64 - Completed


____
### ExecutorFilter
__Type__: string <br/>
__Required__: No<br/>
<br/>
The name of the repair executor whose claimed tasks should be included in the list.

## Responses

| HTTP Status Code | Description | Response Schema |
| --- | --- | --- |
| 200 (OK) | A successful operation will return 200 status code.<br/>The response body provides a list of repair tasks matching all of the given filters.<br/> | array of [RepairTask](sfclient-v61-model-repairtask.md) |
| All other status codes | The detailed error response.<br/> | [FabricError](sfclient-v61-model-fabricerror.md) |
