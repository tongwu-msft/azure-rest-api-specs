---
title: "Get Provisioned Fabric Config Version Info List"
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
# Get Provisioned Fabric Config Version Info List
Gets a list of fabric config versions that are provisioned in a Service Fabric cluster.

Gets a list of information about fabric config versions that are provisioned in the cluster. The parameter ConfigVersion can be used to optionally filter the output to only that particular version.

## Request
| Method | Request URI |
| ------ | ----------- |
| GET | `/$/GetProvisionedConfigVersions?api-version=3.0&ConfigVersion={ConfigVersion}&timeout={timeout}` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [api-version](#api-version) | string | Yes | Query |
| [ConfigVersion](#configversion) | string | No | Query |
| [timeout](#timeout) | integer (int64) | No | Query |

____
### api-version
__Type__: string <br/>
__Required__: Yes<br/>
__Default__: 3.0 <br/>
<br/>
The version of the API. This is a required parameter and it's value must be "3.0".

____
### ConfigVersion
__Type__: string <br/>
__Required__: No<br/>
<br/>
The config version of Service Fabric.

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
| 200 (OK) | A successful operation will return 200 status code and the requested provisioned config versions information.<br/> | array of [FabricConfigVersionInfo](sfclient-model-fabricconfigversioninfo.md) |
| All other status codes | The detailed error response.<br/> | [FabricError](sfclient-model-fabricerror.md) |
