---
title: "Get Deployed Code Package Info List"
ms.date: "2017-04-26"
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
# Get Deployed Code Package Info List
Gets the list of code packages deployed on a Service Fabric node.

Gets the list of code packages deployed on a Service Fabric node for the given application.

## Request
| Method | Request URI |
| ------ | ----------- |
| GET | `/Nodes/{nodeName}/$/GetApplications/{applicationId}/$/GetCodePackages?api-version=3.0&ServiceManifestName={ServiceManifestName}&CodePackageName={CodePackageName}` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [nodeName](#nodename) | string | Yes | Path |
| [applicationId](#applicationid) | string | Yes | Path |
| [api-version](#api-version) | string | Yes | Query |
| [ServiceManifestName](#servicemanifestname) | string | No | Query |
| [CodePackageName](#codepackagename) | string | No | Query |

____
### nodeName
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The name of the node.

____
### applicationId
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The identity of the application. This is typically the full name of the application without the 'fabric:' URI scheme.

____
### api-version
__Type__: string <br/>
__Required__: Yes<br/>
__Default__: 3.0 <br/>
<br/>
The version of the API. This is a required parameter and it's value must be "3.0".

____
### ServiceManifestName
__Type__: string <br/>
__Required__: No<br/>
<br/>
The name of a service manifest registered as part of an application type in a Service Fabric cluster.

____
### CodePackageName
__Type__: string <br/>
__Required__: No<br/>
<br/>
The name of code package specified in service manifest registered as part of an application type in a Service Fabric cluster.

## Responses

| HTTP Status Code | Description | Response Schema |
| --- | --- | --- |
| 200 (OK) | A successful operation will return 200 status code and the list of deployed code packages information.<br/> | array of [DeployedCodePackageInfo](model-DeployedCodePackageInfo.md) |
| All other status codes | The detailed error response.<br/> | [FabricError](model-FabricError.md) |
