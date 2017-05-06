---
title: "Get Service Manifest"
ms.date: "2017-05-06"
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
# Get Service Manifest
Gets the manifest describing a service type.

Gets the manifest describing a service type. The response contains the service manifest XML as a string.

## Request
| Method | Request URI |
| ------ | ----------- |
| GET | `/ApplicationTypes/{applicationTypeName}/$/GetServiceManifest?api-version=3.0&ApplicationTypeVersion={ApplicationTypeVersion}&ServiceManifestName={ServiceManifestName}&timeout={timeout}` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [applicationTypeName](#applicationtypename) | string | Yes | Path |
| [api-version](#api-version) | string | Yes | Query |
| [ApplicationTypeVersion](#applicationtypeversion) | string | Yes | Query |
| [ServiceManifestName](#servicemanifestname) | string | Yes | Query |
| [timeout](#timeout) | integer (int64) | No | Query |

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

____
### ServiceManifestName
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The name of a service manifest registered as part of an application type in a Service Fabric cluster.

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
| 200 (OK) | Information about the service type.<br/> | [ServiceTypeManifest](sfclient-model-servicetypemanifest.md) |
| All other status codes | The detailed error response.<br/> | [FabricError](sfclient-model-fabricerror.md) |
