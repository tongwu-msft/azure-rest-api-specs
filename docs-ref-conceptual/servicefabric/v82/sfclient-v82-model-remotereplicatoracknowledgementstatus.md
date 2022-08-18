---
title: "RemoteReplicatorAcknowledgementStatus v82"
description: "RemoteReplicatorAcknowledgementStatus v82"
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
# RemoteReplicatorAcknowledgementStatus v82

Provides details about the remote replicators from the primary replicator's point of view.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`ReplicationStreamAcknowledgementDetail`](#replicationstreamacknowledgementdetail) | [RemoteReplicatorAcknowledgementDetail](sfclient-v82-model-remotereplicatoracknowledgementdetail.md) | No |
| [`CopyStreamAcknowledgementDetail`](#copystreamacknowledgementdetail) | [RemoteReplicatorAcknowledgementDetail](sfclient-v82-model-remotereplicatoracknowledgementdetail.md) | No |

____
### `ReplicationStreamAcknowledgementDetail`
__Type__: [RemoteReplicatorAcknowledgementDetail](sfclient-v82-model-remotereplicatoracknowledgementdetail.md) <br/>
__Required__: No<br/>
<br/>
Details about the acknowledgements for operations that are part of the replication stream data.

____
### `CopyStreamAcknowledgementDetail`
__Type__: [RemoteReplicatorAcknowledgementDetail](sfclient-v82-model-remotereplicatoracknowledgementdetail.md) <br/>
__Required__: No<br/>
<br/>
Details about the acknowledgements for operations that are part of the copy stream data.
