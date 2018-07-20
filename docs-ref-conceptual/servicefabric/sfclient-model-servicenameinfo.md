---
title: "ServiceNameInfo"
ms.date: "2018-07-20"
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
| [`Id`](#id) | string | No |
| [`Name`](#name) | string | No |

____
### `Id`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The identity of the service. This ID is an encoded representation of the service name. This is used in the REST APIs to identify the service resource.
Starting in version 6.0, hierarchical names are delimited with the "\~" character. For example, if the service name is "fabric:/myapp/app1/svc1",
the service identity would be "myapp~app1\~svc1" in 6.0+ and "myapp/app1/svc1" in previous versions.


____
### `Name`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The full name of the service with 'fabric:' URI scheme.
