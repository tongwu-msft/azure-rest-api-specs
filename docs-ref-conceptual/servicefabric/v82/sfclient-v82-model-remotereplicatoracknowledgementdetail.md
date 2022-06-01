---
title: "RemoteReplicatorAcknowledgementDetail v82"
description: "RemoteReplicatorAcknowledgementDetail v82"
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
# RemoteReplicatorAcknowledgementDetail v82

Provides various statistics of the acknowledgements that are being received from the remote replicator.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`AverageReceiveDuration`](#averagereceiveduration) | string | No |
| [`AverageApplyDuration`](#averageapplyduration) | string | No |
| [`NotReceivedCount`](#notreceivedcount) | string | No |
| [`ReceivedAndNotAppliedCount`](#receivedandnotappliedcount) | string | No |

____
### `AverageReceiveDuration`
__Type__: string <br/>
__Required__: No<br/>
<br/>
Represents the average duration it takes for the remote replicator to receive an operation.

____
### `AverageApplyDuration`
__Type__: string <br/>
__Required__: No<br/>
<br/>
Represents the average duration it takes for the remote replicator to apply an operation. This usually entails writing the operation to disk.

____
### `NotReceivedCount`
__Type__: string <br/>
__Required__: No<br/>
<br/>
Represents the number of operations not yet received by a remote replicator.

____
### `ReceivedAndNotAppliedCount`
__Type__: string <br/>
__Required__: No<br/>
<br/>
Represents the number of operations received and not yet applied by a remote replicator.
