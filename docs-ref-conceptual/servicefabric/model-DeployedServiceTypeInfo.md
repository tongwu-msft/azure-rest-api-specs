---
title: "DeployedServiceTypeInfo"
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
# DeployedServiceTypeInfo

Information about service type deployed on a node, information such as the status of the service type registration on a node.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [ServiceTypeName](#servicetypename) | string | No |
| [ServiceManifestName](#servicemanifestname) | string | No |
| [CodePackageName](#codepackagename) | string | No |
| [Status](#status) | string (enum) | No |
| [ServicePackageActivationId](#servicepackageactivationid) | string | No |

____
### ServiceTypeName
__Type__: string <br/>
__Required__: No<br/>
<br/>
The name of the service type defined in the service manifest.

____
### ServiceManifestName
__Type__: string <br/>
__Required__: No<br/>
<br/>
The name of the service manifest in which this service type is defined.

____
### CodePackageName
__Type__: string <br/>
__Required__: No<br/>
<br/>
The name of the code package that registered the service type.

____
### Status
__Type__: string (enum) <br/>
__Required__: No<br/>
<br/>
The status of the service type registration on the node. Possible values are following.

  - Invalid - Indicates the registration status is invalid. All Service Fabric enumerations have the invalid type. The value is zero.
  - Disabled - Indicates that the service type is disabled on this node. A type gets disabled when there are too many failures of the code package hosting the service type. If the service type is disabled, new replicas of that service type will not be placed on the node until it is enabled again. The service type is enabled again after the process hosting it comes up and re-registers the type or a preconfigured time interval has passed. The value is 1.
  - Enabled - Indicates that the service type is enabled on this node. Replicas of this service type can be placed on this node when the code package registeres the service type. The value is 2.
  - Registered - Indicates that the sevice type is enabled and registered on the node by a code package. Replicas of this service type can now be olaced on this node. The value is 3.


____
### ServicePackageActivationId
__Type__: string <br/>
__Required__: No<br/>
<br/>
The ActivationId of a deployed service package. If ServicePackageActivationMode specified at the time of creating the service
is 'SharedProcess' (or if it is not specified, in which case it defaults to 'SharedProcess'), then value of ServicePackageActivationId
is always an empty string.

