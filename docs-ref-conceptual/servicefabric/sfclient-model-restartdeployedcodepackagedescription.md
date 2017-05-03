---
title: "RestartDeployedCodePackageDescription"
ms.date: "2017-05-03"
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
# RestartDeployedCodePackageDescription

Defines description for restarting a deloyed code package on Service Fabric node.


## Properties
| Name | Type | Required |
| --- | --- | --- |
| [ServiceManifestName](#servicemanifestname) | string | No |
| [ServicePackageActivationId](#servicepackageactivationid) | string | No |
| [CodePackageName](#codepackagename) | string | No |
| [CodePackageInstanceId](#codepackageinstanceid) | string (int64) | No |

____
### ServiceManifestName
__Type__: string <br/>
__Required__: No<br/>
<br/>
The name of service manifest that specified this code package.

____
### ServicePackageActivationId
__Type__: string <br/>
__Required__: No<br/>
<br/>
The ActivationId of a deployed service package. If ServicePackageActivationMode specified at the time of creating the service
is 'SharedProcess' (or if it is not specified, in which case it defaults to 'SharedProcess'), then value of ServicePackageActivationId
is always an empty string.


____
### CodePackageName
__Type__: string <br/>
__Required__: No<br/>
<br/>
The name of the code package.

____
### CodePackageInstanceId
__Type__: string (int64) <br/>
__Required__: No<br/>
<br/>
The instance id for current running entry point. For a code package setup entry point (if specified) runs first and after it finishes main entry point is started. Each time entry point executable is run, its instance id will change.
