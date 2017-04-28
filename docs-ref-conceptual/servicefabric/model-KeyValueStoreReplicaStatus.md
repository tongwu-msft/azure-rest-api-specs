---
title: "KeyValueStoreReplicaStatus"
ms.date: "2017-04-27"
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
# KeyValueStoreReplicaStatus

Key value store related information for the replica.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [Kind](#kind) | string | Yes |
| [DatabaseRowCountEstimate](#databaserowcountestimate) | string (int64) | No |
| [DatabaseLogicalSizeEstimate](#databaselogicalsizeestimate) | string (int64) | No |
| [CopyNotificationCurrentKeyFilter](#copynotificationcurrentkeyfilter) | string | No |
| [CopyNotificationCurrentProgress](#copynotificationcurrentprogress) | string (int64) | No |
| [StatusDetails](#statusdetails) | string | No |

____
### Kind
__Type__: string <br/>
__Required__: Yes <br/>
<br/>
A discriminator property. Its value must be 'KeyValueStore' for objects of type 'KeyValueStoreReplicaStatus'.

____
### DatabaseRowCountEstimate
__Type__: string (int64) <br/>
__Required__: No<br/>
<br/>
Value indicating the estimated number of rows in the underlying database.

____
### DatabaseLogicalSizeEstimate
__Type__: string (int64) <br/>
__Required__: No<br/>
<br/>
Value indicating the estimated size of the underlying database.

____
### CopyNotificationCurrentKeyFilter
__Type__: string <br/>
__Required__: No<br/>
<br/>
Value indicating the latest key-prefix filter applied to enumeration during the callback. Null if there is no pending callback.

____
### CopyNotificationCurrentProgress
__Type__: string (int64) <br/>
__Required__: No<br/>
<br/>
Value indicating the latest number of keys enumerated during the callback. 0 if there is no pending callback.

____
### StatusDetails
__Type__: string <br/>
__Required__: No<br/>
<br/>
Value indicating the current status details of the replica.
