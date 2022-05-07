---
title: "ServiceReplicaProperties v82"
description: "ServiceReplicaProperties v82"
ms.date: "10/21/2020"
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
# ServiceReplicaProperties v82

Describes the properties of a service replica.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`osType`](#ostype) | string (enum) | Yes |
| [`codePackages`](#codepackages) | array of [ContainerCodePackageProperties](sfclient-v82-model-containercodepackageproperties.md) | Yes |
| [`networkRefs`](#networkrefs) | array of [NetworkRef](sfclient-v82-model-networkref.md) | No |
| [`diagnostics`](#diagnostics) | [DiagnosticsRef](sfclient-v82-model-diagnosticsref.md) | No |

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
__Type__: array of [ContainerCodePackageProperties](sfclient-v82-model-containercodepackageproperties.md) <br/>
__Required__: Yes<br/>
<br/>
Describes the set of code packages that forms the service. A code package describes the container and the properties for running it. All the code packages are started together on the same host and share the same context (network, process etc.).


____
### `networkRefs`
__Type__: array of [NetworkRef](sfclient-v82-model-networkref.md) <br/>
__Required__: No<br/>
<br/>
The names of the private networks that this service needs to be part of.

____
### `diagnostics`
__Type__: [DiagnosticsRef](sfclient-v82-model-diagnosticsref.md) <br/>
__Required__: No<br/>
<br/>
Reference to sinks in DiagnosticsDescription.
