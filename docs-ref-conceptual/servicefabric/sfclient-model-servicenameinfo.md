---
title: "ServiceNameInfo"
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
# ServiceNameInfo

Information about the service name.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [Id](#id) | string | No |
| [Name](#name) | string | No |

____
### Id
__Type__: string <br/>
__Required__: No<br/>
<br/>
The identity of the service. This is same as service name without the 'fabric:' URI scheme. This is used in the REST APIs to identify the service resource.

____
### Name
__Type__: string <br/>
__Required__: No<br/>
<br/>
The name of the service.
