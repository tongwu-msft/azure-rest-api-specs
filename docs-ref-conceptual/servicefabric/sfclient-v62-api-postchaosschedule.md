---
title: "Post Chaos Schedule"
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
# Post Chaos Schedule
Set the schedule used by Chaos.

Set the Chaos Schedule currently in use by Chaos. Chaos will automatically schedule runs based on the Chaos Schedule.
The version in the provided input schedule must match the version of the Chaos Schedule on the server.
If the version provided does not match the version on the server, the Chaos Schedule is not updated.
If the version provided matches the version on the server, then the Chaos Schedule is updated and the version of the Chaos Schedule on the server is incremented up by one and wraps back to 0 after 2,147,483,647.
If Chaos is running when this call is made, the call will fail.


## Request
| Method | Request URI |
| ------ | ----------- |
| POST | `/Tools/Chaos/Schedule?api-version=6.2` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [`api-version`](#api-version) | string | Yes | Query |
| [`ChaosSchedule`](#chaosschedule) | [ChaosScheduleDescription](sfclient-v62-model-chaosscheduledescription.md) | Yes | Body |

____
### `api-version`
__Type__: string <br/>
__Required__: Yes<br/>
__Default__: `6.2` <br/>
<br/>
The version of the API. This parameter is required and its value must be '6.2'.

Service Fabric REST API version is based on the runtime version in which the API was introduced or was changed. Service Fabric runtime supports more than one version of the API. This version is the latest supported version of the API. If a lower API version is passed, the returned response may be different from the one documented in this specification.

Additionally the runtime accepts any version that is higher than the latest supported version up to the current version of the runtime. So if the latest API version is 6.0 and the runtime is 6.1, the runtime will accept version 6.1 for that API. However the behavior of the API will be as per the documented 6.0 version.


____
### `ChaosSchedule`
__Type__: [ChaosScheduleDescription](sfclient-v62-model-chaosscheduledescription.md) <br/>
__Required__: Yes<br/>
<br/>
Describes the schedule used by Chaos.

## Responses

| HTTP Status Code | Description | Response Schema |
| --- | --- | --- |
| 200 (OK) | A successful operation will return 200 status code.<br/> |  |
| All other status codes | The detailed error response.<br/> | [FabricError](sfclient-v62-model-fabricerror.md) |
