---
title: "ServiceBackupEntity"
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
# ServiceBackupEntity

Identifies the Service Fabric stateful service which is being backed up.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`EntityKind`](#entitykind) | string | Yes |
| [`ServiceName`](#servicename) | string | No |

____
### EntityKind
__Type__: string <br/>
__Required__: Yes <br/>
<br/>
A discriminator property. Its value must be 'Service' for objects of type 'ServiceBackupEntity'.

____
### `ServiceName`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The full name of the service with 'fabric:' URI scheme.
