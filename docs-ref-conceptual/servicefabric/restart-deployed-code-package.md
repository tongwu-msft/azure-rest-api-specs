---
title: "Restart Deployed Code Package"
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
# Restart Deployed Code Package
Restarts a code package deployed on a Service Fabric node in a cluster.

Restarts a code package deployed on a Service Fabric node in a cluster. This aborts the code package process, which will restart all the user service replicas hosted in that process.

## Request
| Method | Request URI |
| ------ | ----------- |
| POST | `/Nodes/{nodeName}/$/GetApplications/{applicationId}/$/GetCodePackages/$/Restart?api-version=3.0` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [nodeName](#nodename) | string | Yes | Path |
| [applicationId](#applicationid) | string | Yes | Path |
| [api-version](#api-version) | string | Yes | Query |
| [RestartDeployedCodePackageDescription](#restartdeployedcodepackagedescription) | [RestartDeployedCodePackageDescription](model-RestartDeployedCodePackageDescription.md) | Yes | Body |

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
### RestartDeployedCodePackageDescription
__Type__: [RestartDeployedCodePackageDescription](model-RestartDeployedCodePackageDescription.md) <br/>
__Required__: Yes<br/>
<br/>
Describes the deployed code package on Service Fabric node to restart.

## Responses

| HTTP Status Code | Description | Response Schema |
| --- | --- | --- |
| 200 (OK) | A successful operation will return 200 status code.<br/> |  |
| All other status codes | The detailed error response.<br/> | [FabricError](model-FabricError.md) |
