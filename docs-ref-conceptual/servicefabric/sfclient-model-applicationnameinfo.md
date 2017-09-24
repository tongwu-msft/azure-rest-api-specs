---
title: "ApplicationNameInfo"
ms.date: "2017-09-24"
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
# ApplicationNameInfo

Information about the application name.

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
The identity of the application. This is an encoded representation of the application name. This is used in the REST APIs to identify the application resource. 

Starting in version 6.0, hierarchical names are delimited with the "~" character. For example, if the application name is "fabric://myapp/app1", the application identity would be "myapp~app1" in 6.0+ and "myapp/app1" in previous versions.


____
### Name
__Type__: string <br/>
__Required__: No<br/>
<br/>
The name of the application, including the 'fabric:' URI scheme.
