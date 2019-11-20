---
title: "BasicRetentionPolicyDescription"
ms.date: 11/26/2018
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
# BasicRetentionPolicyDescription

Describes basic retention policy.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`RetentionPolicyType`](#retentionpolicytype) | string | Yes |
| [`RetentionDuration`](#retentionduration) | string (duration) | Yes |
| [`MinimumNumberOfBackups`](#minimumnumberofbackups) | integer | No |

____
### RetentionPolicyType
__Type__: string <br/>
__Required__: Yes <br/>
<br/>
A discriminator property. Its value must be 'Basic' for objects of type 'BasicRetentionPolicyDescription'.

____
### `RetentionDuration`
__Type__: string (duration) <br/>
__Required__: Yes<br/>
<br/>
It is the minimum duration for which a backup created, will remain stored in the storage and might get deleted after that span of time. It should be specified in ISO8601 format.

____
### `MinimumNumberOfBackups`
__Type__: integer <br/>
__Required__: No<br/>
__InclusiveMinimum__: `0` <br/>
<br/>
It is the minimum number of backups to be retained at any point of time. If specified with a non zero value, backups will not be deleted even if the backups have gone past retention duration and have number of backups less than or equal to it.
