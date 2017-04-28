---
title: "ServiceTypeInfo"
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
# ServiceTypeInfo

Information about a service type that is defined in a service manifest of a provisioned application type.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [ServiceTypeDescription](#servicetypedescription) | [ServiceTypeDescription](sfclient-model-servicetypedescription.md) | No |
| [ServiceManifestName](#servicemanifestname) | string | No |
| [ServiceManifestVersion](#servicemanifestversion) | string | No |
| [IsServiceGroup](#isservicegroup) | boolean | No |

____
### ServiceTypeDescription
__Type__: [ServiceTypeDescription](sfclient-model-servicetypedescription.md) <br/>
__Required__: No<br/>
<br/>
Describes a service type defined in the service manifest of a provisioned application type. The properties the the ones defined in the service manifest.

____
### ServiceManifestName
__Type__: string <br/>
__Required__: No<br/>
<br/>
The name of the service manifest in which this service type is defined.

____
### ServiceManifestVersion
__Type__: string <br/>
__Required__: No<br/>
<br/>
The version of the service manifest in which this service type is defined.

____
### IsServiceGroup
__Type__: boolean <br/>
__Required__: No<br/>
<br/>
Indicates whether the service is a service group. If it is, the property value is true otherwise false.
