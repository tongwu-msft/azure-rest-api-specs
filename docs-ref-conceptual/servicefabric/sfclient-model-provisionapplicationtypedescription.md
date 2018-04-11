---
title: "ProvisionApplicationTypeDescription"
ms.date: "2018-01-22"
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
# ProvisionApplicationTypeDescription

Describes the operation to register or provision an application type using an application package uploaded to the Service Fabric image store.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [Kind](#kind) | string | Yes |
| [Async](#async) | boolean | Yes |
| [ApplicationTypeBuildPath](#applicationtypebuildpath) | string | No |

____
### Kind
__Type__: string <br/>
__Required__: Yes <br/>
<br/>
A discriminator property. Its value must be 'ImageStorePath' for objects of type 'ProvisionApplicationTypeDescription'.

____
### Async
__Type__: boolean <br/>
__Required__: Yes<br/>
<br/>
Indicates whether or not provisioning should occur asynchronously. When set to true, the provision operation returns when the request is accepted by the system, and the provision operation continues without any timeout limit. The default value is false. For large application packages, we recommend setting the value to true.

____
### ApplicationTypeBuildPath
__Type__: string <br/>
__Required__: No<br/>
<br/>
The relative path for the application package in the image store specified during the prior upload operation.
