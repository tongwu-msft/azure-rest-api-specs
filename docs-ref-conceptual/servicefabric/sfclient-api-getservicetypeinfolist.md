---
title: "Get Service Type Info List"
ms.date: "2017-04-28"
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
# Get Service Type Info List
Gets the list containing the information about service types that are supported by a provisioned application type in a Service Fabric cluster.

Gets the list containing the information about service types that are supported by a provisioned application type in a Service Fabric cluster. The response includes the name of the service type, the name and version of the service manifest the type is defined in, kind (stateless or stateless) of the service type and other information about it.

## Request
| Method | Request URI |
| ------ | ----------- |
| GET | `/ApplicationTypes/{applicationTypeName}/$/GetServiceTypes?api-version=3.0&ApplicationTypeVersion={ApplicationTypeVersion}` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [applicationTypeName](#applicationtypename) | string | Yes | Path |
| [api-version](#api-version) | string | Yes | Query |
| [ApplicationTypeVersion](#applicationtypeversion) | string | Yes | Query |

____
### applicationTypeName
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The name of the application type.

____
### api-version
__Type__: string <br/>
__Required__: Yes<br/>
__Default__: 3.0 <br/>
<br/>
The version of the API. This is a required parameter and it's value must be "3.0".

____
### ApplicationTypeVersion
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The version of the application type.

## Responses

| HTTP Status Code | Description | Response Schema |
| --- | --- | --- |
| 200 (OK) | List of service types that are supported by a provisioned application type.<br/> | array of [ServiceTypeInfo](sfclient-model-servicetypeinfo.md) |
| All other status codes | The detailed error response.<br/> | [FabricError](sfclient-model-fabricerror.md) |
