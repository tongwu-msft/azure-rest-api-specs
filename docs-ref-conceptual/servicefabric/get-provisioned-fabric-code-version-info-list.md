---
title: "Get Provisioned Fabric Code Version Info List"
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
# Get Provisioned Fabric Code Version Info List
Gets a list of fabric code versions that are provisioned in a Service Fabric cluster.

Gets a list of information about fabric code versions that are provisioned in the cluster. The parameter CodeVersion can be used to optionally filter the output to only that particular version.

## Request
| Method | Request URI |
| ------ | ----------- |
| GET | `/$/GetProvisionedCodeVersions?api-version=3.0&CodeVersion={CodeVersion}` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [api-version](#api-version) | string | Yes | Query |
| [CodeVersion](#codeversion) | string | No | Query |

____
### api-version
__Type__: string <br/>
__Required__: Yes<br/>
__Default__: 3.0 <br/>
<br/>
The version of the API. This is a required parameter and it's value must be "3.0".

____
### CodeVersion
__Type__: string <br/>
__Required__: No<br/>
<br/>
The product version of Service Fabric.

## Responses

| HTTP Status Code | Description | Response Schema |
| --- | --- | --- |
| 200 (OK) | A successful operation will return 200 status code and the requested provisioned code versions information.<br/> | array of [FabricCodeVersionInfo](model-FabricCodeVersionInfo.md) |
| All other status codes | The detailed error response.<br/> | [FabricError](model-FabricError.md) |
