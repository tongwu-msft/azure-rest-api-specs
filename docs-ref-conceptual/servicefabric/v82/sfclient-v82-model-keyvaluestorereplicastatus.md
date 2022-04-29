---
title: "KeyValueStoreReplicaStatus v82"
description: "KeyValueStoreReplicaStatus v82"
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
# KeyValueStoreReplicaStatus v82

Key value store related information for the replica.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`DatabaseRowCountEstimate`](#databaserowcountestimate) | string | No |
| [`DatabaseLogicalSizeEstimate`](#databaselogicalsizeestimate) | string | No |
| [`CopyNotificationCurrentKeyFilter`](#copynotificationcurrentkeyfilter) | string | No |
| [`CopyNotificationCurrentProgress`](#copynotificationcurrentprogress) | string | No |
| [`StatusDetails`](#statusdetails) | string | No |

____
### `DatabaseRowCountEstimate`
__Type__: string <br/>
__Required__: No<br/>
<br/>
Value indicating the estimated number of rows in the underlying database.

____
### `DatabaseLogicalSizeEstimate`
__Type__: string <br/>
__Required__: No<br/>
<br/>
Value indicating the estimated size of the underlying database.

____
### `CopyNotificationCurrentKeyFilter`
__Type__: string <br/>
__Required__: No<br/>
<br/>
Value indicating the latest key-prefix filter applied to enumeration during the callback. Null if there is no pending callback.

____
### `CopyNotificationCurrentProgress`
__Type__: string <br/>
__Required__: No<br/>
<br/>
Value indicating the latest number of keys enumerated during the callback. 0 if there is no pending callback.

____
### `StatusDetails`
__Type__: string <br/>
__Required__: No<br/>
<br/>
Value indicating the current status details of the replica.
