---
title: "ApplicationBackupConfigurationInfo v82"
description: "ApplicationBackupConfigurationInfo v82"
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
# ApplicationBackupConfigurationInfo v82

Backup configuration information for a specific Service Fabric application specifying what backup policy is being applied and suspend description, if any.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`PolicyName`](#policyname) | string | No |
| [`PolicyInheritedFrom`](#policyinheritedfrom) | string (enum) | No |
| [`SuspensionInfo`](#suspensioninfo) | [BackupSuspensionInfo](sfclient-v82-model-backupsuspensioninfo.md) | No |
| [`ApplicationName`](#applicationname) | string | No |

____
### `PolicyName`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The name of the backup policy which is applicable to this Service Fabric application or service or partition.

____
### `PolicyInheritedFrom`
__Type__: string (enum) <br/>
__Required__: No<br/>
<br/>


Specifies the scope at which the backup policy is applied.


Possible values are: 

  - `Invalid` - Indicates an invalid backup policy scope type. All Service Fabric enumerations have the invalid type.
  - `Partition` - Indicates the backup policy is applied at partition level. Hence overriding any policy which may have applied at partition's service or application level.
  - `Service` - Indicates the backup policy is applied at service level. All partitions of the service inherit this policy unless explicitly overridden at partition level.
  - `Application` - Indicates the backup policy is applied at application level. All services and partitions of the application inherit this policy unless explicitly overridden at service or partition level.



____
### `SuspensionInfo`
__Type__: [BackupSuspensionInfo](sfclient-v82-model-backupsuspensioninfo.md) <br/>
__Required__: No<br/>
<br/>
Describes the backup suspension details.


____
### `ApplicationName`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The name of the application, including the 'fabric:' URI scheme.
