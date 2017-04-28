---
title: "Get Service Manifest"
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
# Get Service Manifest
Gets the manifest describing a service type.

Gets the manifest describing a service type. The response contains the service manifest XML as a string.

## Request
| Method | Request URI |
| ------ | ----------- |
| GET | `/ApplicationTypes/{applicationTypeName}/$/GetServiceManifest?api-version=3.0&ApplicationTypeVersion={ApplicationTypeVersion}&ServiceManifestName={ServiceManifestName}` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [applicationTypeName](#applicationtypename) | string | Yes | Path |
| [api-version](#api-version) | string | Yes | Query |
| [ApplicationTypeVersion](#applicationtypeversion) | string | Yes | Query |
| [ServiceManifestName](#servicemanifestname) | string | Yes | Query |

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

## Responses

| HTTP Status Code | Description | Response Schema |
| --- | --- | --- |
| 200 (OK) | Information about the service type.<br/> | [ServiceTypeManifest](sfclient-model-servicetypemanifest.md) |
| All other status codes | The detailed error response.<br/> | [FabricError](sfclient-model-fabricerror.md) |
