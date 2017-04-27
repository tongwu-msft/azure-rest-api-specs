---
title: "RemoteReplicatorAcknowledgementDetail"
ms.date: "2017-04-26"
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
# RemoteReplicatorAcknowledgementDetail

Provides various statistics of the acknowledgements that are being received from the remote replicator.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [AverageReceiveDuration](#averagereceiveduration) | string (int64) | No |
| [AverageApplyDuration](#averageapplyduration) | string (int64) | No |
| [NotReceivedCount](#notreceivedcount) | string (int64) | No |
| [ReceivedAndNotAppliedCount](#receivedandnotappliedcount) | string (int64) | No |

____
### AverageReceiveDuration
__Type__: string (int64) <br/>
__Required__: No<br/>
<br/>
Represents the average duration it takes for the remote replicator to receive an operation.

____
### AverageApplyDuration
__Type__: string (int64) <br/>
__Required__: No<br/>
<br/>
Represents the average duration it takes for the remote replicator to apply an operation. This usually entails writing the operation to disk.

____
### NotReceivedCount
__Type__: string (int64) <br/>
__Required__: No<br/>
<br/>
Represents the number of operations not yet received by a remote replicator.

____
### ReceivedAndNotAppliedCount
__Type__: string (int64) <br/>
__Required__: No<br/>
<br/>
Represents the number of operations received and not yet applied by a remote replicator.
