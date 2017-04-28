---
title: "Get Application Manifest"
ms.date: "2017-04-27"
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
# Get Application Manifest
Gets the manifest describing an application type.

Gets the manifest describing an application type. The response contains the application manifest XML as a string.

## Request
| Method | Request URI |
| ------ | ----------- |
| GET | `/ApplicationTypes/{applicationTypeName}/$/GetApplicationManifest?api-version=3.0&ApplicationTypeVersion={ApplicationTypeVersion}` |


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
| 200 (OK) | Information about the node.<br/> | [ApplicationTypeManifest](model-ApplicationTypeManifest.md) |
| All other status codes | The detailed error response.<br/> | [FabricError](model-FabricError.md) |
