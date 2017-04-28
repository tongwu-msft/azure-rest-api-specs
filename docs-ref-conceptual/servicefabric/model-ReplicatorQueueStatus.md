---
title: "ReplicatorQueueStatus"
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
# ReplicatorQueueStatus

Provides various statistics of the queue used in the service fabric replicator.
Contains information about the service fabric replicator like the replication/copy queue utilization, last acknowledgement received timestamp, etc.
Depending on the role of the replicator, the properties in this type imply different meanings. 


## Properties
| Name | Type | Required |
| --- | --- | --- |
| [QueueUtilizationPercentage](#queueutilizationpercentage) | integer (int32) | No |
| [QueueMemorySize](#queuememorysize) | string (int64) | No |
| [FirstSequenceNumber](#firstsequencenumber) | string (int64) | No |
| [CompletedSequenceNumber](#completedsequencenumber) | string (int64) | No |
| [CommittedSequenceNumber](#committedsequencenumber) | string (int64) | No |
| [LastSequenceNumber](#lastsequencenumber) | string (int64) | No |

____
### QueueUtilizationPercentage
__Type__: integer (int32) <br/>
__Required__: No<br/>
<br/>
Represents the utilization of the queue. A value of 0 indicates that the queue is empty and a value of 100 indicates the queue is full.

____
### QueueMemorySize
__Type__: string (int64) <br/>
__Required__: No<br/>
<br/>
Represents the virtual memory consumed by the queue in bytes.

____
### FirstSequenceNumber
__Type__: string (int64) <br/>
__Required__: No<br/>
<br/>
On a primary replicator, this is semantically the sequence number of the operation for which all the secondary replicas have sent an acknowledgement.
On a secondary replicator, this is the smallest sequence number of the operation that is present in the queue.


____
### CompletedSequenceNumber
__Type__: string (int64) <br/>
__Required__: No<br/>
<br/>
On a primary replicator, this is semantically the highest sequence number of the operation for which all the secondary replicas have sent an acknowledgement.
On a secondary replicator, this is semantically the highest sequence number that has been applied to the persistent state.


____
### CommittedSequenceNumber
__Type__: string (int64) <br/>
__Required__: No<br/>
<br/>
On a primary replicator, this is semantically the highest sequence number of the operation for which a write quorum of the secondary replicas have sent an acknowledgement.
On a secondary replicator, this is semantically the highest sequence number of the in-order operation received from the primary.


____
### LastSequenceNumber
__Type__: string (int64) <br/>
__Required__: No<br/>
<br/>
Represents the latest sequence number of the operation that is available in the queue.
