---
title: "ResolvedServicePartition"
ms.date: "2017-04-29"
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
# ResolvedServicePartition

Information about a service partition and its associated endpoints.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [Name](#name) | string | Yes |
| [PartitionInformation](#partitioninformation) | [PartitionInformation](sfclient-model-partitioninformation.md) | Yes |
| [Endpoints](#endpoints) | array of [ResolvedServiceEndpoint](sfclient-model-resolvedserviceendpoint.md) | Yes |
| [Version](#version) | string | Yes |

____
### Name
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The full name of the service with 'fabric:' URI scheme.

____
### PartitionInformation
__Type__: [PartitionInformation](sfclient-model-partitioninformation.md) <br/>
__Required__: Yes<br/>
<br/>
A representation of the resolved partition.

____
### Endpoints
__Type__: array of [ResolvedServiceEndpoint](sfclient-model-resolvedserviceendpoint.md) <br/>
__Required__: Yes<br/>
<br/>
List of resolved service endpoints of a service partition.

____
### Version
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The version of this resolved service partition result. This version should be passed in the next time the ResolveService call is made via the PreviousRspVersion query parameter.
