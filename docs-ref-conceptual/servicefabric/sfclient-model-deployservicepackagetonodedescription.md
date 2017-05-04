---
title: "DeployServicePackageToNodeDescription"
ms.date: "2017-05-04"
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
# DeployServicePackageToNodeDescription

Defines description for downloading packages associated with a service manifest to image cache on a Service Fabric node.


## Properties
| Name | Type | Required |
| --- | --- | --- |
| [ServiceManifestName](#servicemanifestname) | string | Yes |
| [ApplicationTypeName](#applicationtypename) | string | Yes |
| [ApplicationTypeVersion](#applicationtypeversion) | string | Yes |
| [NodeName](#nodename) | string | Yes |
| [PackageSharingPolicy](#packagesharingpolicy) | array of [PackageSharingPolicyInfo](sfclient-model-packagesharingpolicyinfo.md) | No |

____
### ServiceManifestName
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The name of service manifest whose packages need to be downloaded.

____
### ApplicationTypeName
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The application type name found in the application manifest.

____
### ApplicationTypeVersion
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The version of the application type as defined in the application manifest.

____
### NodeName
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The friendly name of the node

____
### PackageSharingPolicy
__Type__: array of [PackageSharingPolicyInfo](sfclient-model-packagesharingpolicyinfo.md) <br/>
__Required__: No<br/>
<br/>
List of package sharing policy information.
