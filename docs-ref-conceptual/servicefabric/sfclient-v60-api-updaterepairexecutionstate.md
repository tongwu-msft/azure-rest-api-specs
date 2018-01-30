---
title: "Update Repair Execution State"
ms.date: "2017-10-02"
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
# Update Repair Execution State
Updates the execution state of a repair task.

This API supports the Service Fabric platform; it is not meant to be used directly from your code.


## Request
| Method | Request URI |
| ------ | ----------- |
| POST | `/$/UpdateRepairExecutionState?api-version=6.0` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [api-version](#api-version) | string | Yes | Query |
| [RepairTask](#repairtask) | [RepairTask](sfclient-v60-model-repairtask.md) | Yes | Body |

____
### api-version
__Type__: string <br/>
__Required__: Yes<br/>
__Default__: 6.0 <br/>
<br/>
The version of the API. This is a required parameter and it's value must be "6.0".

____
### RepairTask
__Type__: [RepairTask](sfclient-v60-model-repairtask.md) <br/>
__Required__: Yes<br/>
<br/>
Describes the repair task to be created or updated.

## Responses

| HTTP Status Code | Description | Response Schema |
| --- | --- | --- |
| 200 (OK) | A successful operation will return 200 status code.<br/>The response body provides information about the updated repair task.<br/> | [RepairTaskUpdateInfo](sfclient-v60-model-repairtaskupdateinfo.md) |
| All other status codes | The detailed error response.<br/> | [FabricError](sfclient-v60-model-fabricerror.md) |
