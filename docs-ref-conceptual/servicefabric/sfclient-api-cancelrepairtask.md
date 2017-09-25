---
title: "Cancel Repair Task"
ms.date: "2017-09-24"
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
# Cancel Repair Task
Requests the cancellation of the given repair task.

This API supports the Service Fabric platform; it is not meant to be used directly from your code.


## Request
| Method | Request URI |
| ------ | ----------- |
| POST | `/$/CancelRepairTask?api-version=6.0` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [api-version](#api-version) | string | Yes | Query |
| [RepairTaskCancelDescription](#repairtaskcanceldescription) | [RepairTaskCancelDescription](sfclient-model-repairtaskcanceldescription.md) | Yes | Body |

____
### api-version
__Type__: string <br/>
__Required__: Yes<br/>
__Default__: 6.0 <br/>
<br/>
The version of the API. This is a required parameter and it's value must be "6.0".

____
### RepairTaskCancelDescription
__Type__: [RepairTaskCancelDescription](sfclient-model-repairtaskcanceldescription.md) <br/>
__Required__: Yes<br/>
<br/>
Describes the repair task to be cancelled.

## Responses

| HTTP Status Code | Description | Response Schema |
| --- | --- | --- |
| 200 (OK) | A successful operation will return 200 status code.<br/>The response body provides information about the updated repair task.<br/>Success indicates that the cancellation request was recorded, but does not guarantee that the repair task will be cancelled.<br/>Clients may use the State property of the repair task to determine the current state of the repair task.<br/> | [RepairTaskUpdateInfo](sfclient-model-repairtaskupdateinfo.md) |
| All other status codes | The detailed error response.<br/> | [FabricError](sfclient-model-fabricerror.md) |
