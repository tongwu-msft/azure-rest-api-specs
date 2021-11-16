---
title: "BackupSuspensionInfo v81"
description: "BackupSuspensionInfo v81"
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
# BackupSuspensionInfo v81

Describes the backup suspension details.


## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`IsSuspended`](#issuspended) | boolean | No |
| [`SuspensionInheritedFrom`](#suspensioninheritedfrom) | string (enum) | No |

____
### `IsSuspended`
__Type__: boolean <br/>
__Required__: No<br/>
<br/>
Indicates whether periodic backup is suspended at this level or not.

____
### `SuspensionInheritedFrom`
__Type__: string (enum) <br/>
__Required__: No<br/>
<br/>


Specifies the scope at which the backup suspension was applied.


Possible values are: 

  - `Invalid` - Indicates an invalid backup suspension scope type also indicating entity is not suspended. All Service Fabric enumerations have the invalid type.
  - `Partition` - Indicates the backup suspension is applied at partition level.
  - `Service` - Indicates the backup suspension is applied at service level. All partitions of the service are hence suspended for backup.
  - `Application` - Indicates the backup suspension is applied at application level. All services and partitions of the application are hence suspended for backup.


