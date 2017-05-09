---
title: "Delete Service"
ms.date: "2017-05-09"
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
# Delete Service
Deletes an existing Service Fabric service.

Deletes an existing Service Fabric service. A service must be created before it can be deleted. By default Service Fabric will try to close service replicas in a graceful manner and then delete the service. However if service is having issues closing the replica gracefully, the delete operation may take a long time or get stuck. Use the optional ForceRemove flag to skip the graceful close sequence and forcefully delete the service.

## Request
| Method | Request URI |
| ------ | ----------- |
| POST | `/Services/{serviceId}/$/Delete?api-version=3.0&ForceRemove={ForceRemove}&timeout={timeout}` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [serviceId](#serviceid) | string | Yes | Path |
| [api-version](#api-version) | string | Yes | Query |
| [ForceRemove](#forceremove) | boolean | No | Query |
| [timeout](#timeout) | integer (int64) | No | Query |

____
### serviceId
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The identity of the service. This is typically the full name of the service without the 'fabric:' URI scheme.

____
### api-version
__Type__: string <br/>
__Required__: Yes<br/>
__Default__: 3.0 <br/>
<br/>
The version of the API. This is a required parameter and it's value must be "3.0".

____
### ForceRemove
__Type__: boolean <br/>
__Required__: No<br/>
<br/>
Remove a Service Fabric application or service forcefully without going through the graceful shutdown sequence. This parameter can be used to forcefully delete an application or service for which delete is timing out due to issues in the service code that prevents graceful close of replicas.

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
| 200 (OK) | A successful operation will return 200 status code.<br/> |  |
| All other status codes | The detailed error response.<br/> | [FabricError](sfclient-model-fabricerror.md) |
