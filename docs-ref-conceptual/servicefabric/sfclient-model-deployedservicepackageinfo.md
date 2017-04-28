---
title: "DeployedServicePackageInfo"
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
# DeployedServicePackageInfo

Information about service package deployed on a Service Fabric node.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [Name](#name) | string | No |
| [Version](#version) | string | No |
| [Status](#status) | string (enum) | No |
| [ServicePackageActivationId](#servicepackageactivationid) | string | No |

____
### Name
__Type__: string <br/>
__Required__: No<br/>
<br/>
The name of the service package.

____
### Version
__Type__: string <br/>
__Required__: No<br/>
<br/>
The version of the service package specified in service manifest.

____
### Status
__Type__: string (enum) <br/>
__Required__: No<br/>
<br/>
Specifies the status of a deployed application or service package on a Service Fabric node. Possible values are following.

  - Invalid - Indicates status of the application or service package is not known or invalid. The value is 0.
  - Downloading - Indicates the application or service package is being downloaded to the node from the ImageStore. The value is 1.
  - Activating - Indicates the application or service package is being activated. The value is 2.
  - Active - Indicates the application or service package is active the node. The value is 3.
  - Upgrading - Indicates the application or service package is being upgraded. The value is 4.
  - Deactivating - Indicates the application or service package is being deactivated. The value is 5.


____
### ServicePackageActivationId
__Type__: string <br/>
__Required__: No<br/>
<br/>
The ActivationId of a deployed service package. If ServicePackageActivationMode specified at the time of creating the service
is 'SharedProcess' (or if it is not specified, in which case it defaults to 'SharedProcess'), then value of ServicePackageActivationId
is always an empty string.

