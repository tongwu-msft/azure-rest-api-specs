---
title: "UnprovisionApplicationTypeDescriptionInfo"
ms.date: "2018-04-23"
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
# UnprovisionApplicationTypeDescriptionInfo

Describes the operation to unregister or unprovision an application type and its version that was registered with the Service Fabric.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`ApplicationTypeVersion`](#applicationtypeversion) | string | Yes |
| [`Async`](#async) | boolean | No |

____
### `ApplicationTypeVersion`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The version of the application type as defined in the application manifest.

____
### `Async`
__Type__: boolean <br/>
__Required__: No<br/>
<br/>
The flag indicating whether or not unprovision should occur asynchronously. When set to true, the unprovision operation returns when the request is accepted by the system, and the unprovision operation continues without any timeout limit. The default value is false. However, we recommend to set it to true for large application packages that were provisioned.
