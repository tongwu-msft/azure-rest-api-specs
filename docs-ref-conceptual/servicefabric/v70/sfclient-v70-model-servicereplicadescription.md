---
title: "ServiceReplicaDescription"
ms.date: "11/23/2019"
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
author: "erikadoyle"
ms.author: "edoyle"
manager: "gwallace"
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
# ServiceReplicaDescription

Describes a replica of a service resource.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`osType`](#ostype) | string (enum) | Yes |
| [`codePackages`](#codepackages) | array of [ContainerCodePackageProperties](sfclient-v70-model-containercodepackageproperties.md) | Yes |
| [`networkRefs`](#networkrefs) | array of [NetworkRef](sfclient-v70-model-networkref.md) | No |
| [`diagnostics`](#diagnostics) | [DiagnosticsRef](sfclient-v70-model-diagnosticsref.md) | No |
| [`replicaName`](#replicaname) | string | Yes |

____
### `osType`
__Type__: string (enum) <br/>
__Required__: Yes<br/>
<br/>


The operation system required by the code in service.

Possible values are: 

  - `Linux` - The required operating system is Linux.
  - `Windows` - The required operating system is Windows.



____
### `codePackages`
__Type__: array of [ContainerCodePackageProperties](sfclient-v70-model-containercodepackageproperties.md) <br/>
__Required__: Yes<br/>
<br/>
Describes the set of code packages that forms the service. A code package describes the container and the properties for running it. All the code packages are started together on the same host and share the same context (network, process etc.).


____
### `networkRefs`
__Type__: array of [NetworkRef](sfclient-v70-model-networkref.md) <br/>
__Required__: No<br/>
<br/>
The names of the private networks that this service needs to be part of.

____
### `diagnostics`
__Type__: [DiagnosticsRef](sfclient-v70-model-diagnosticsref.md) <br/>
__Required__: No<br/>
<br/>
Reference to sinks in DiagnosticsDescription.

____
### `replicaName`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
Name of the replica.
