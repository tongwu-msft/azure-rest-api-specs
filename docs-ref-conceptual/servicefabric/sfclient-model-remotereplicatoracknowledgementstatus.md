---
title: "RemoteReplicatorAcknowledgementStatus"
ms.date: "2017-10-02"
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
# RemoteReplicatorAcknowledgementStatus

Provides details about the remote replicators from the primary replicator's point of view.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [ReplicationStreamAcknowledgementDetail](#replicationstreamacknowledgementdetail) | [RemoteReplicatorAcknowledgementDetail](sfclient-model-remotereplicatoracknowledgementdetail.md) | No |
| [CopyStreamAcknowledgementDetail](#copystreamacknowledgementdetail) | [RemoteReplicatorAcknowledgementDetail](sfclient-model-remotereplicatoracknowledgementdetail.md) | No |

____
### ReplicationStreamAcknowledgementDetail
__Type__: [RemoteReplicatorAcknowledgementDetail](sfclient-model-remotereplicatoracknowledgementdetail.md) <br/>
__Required__: No<br/>
<br/>
Details about the acknowledgements for operations that are part of the replication stream data.

____
### CopyStreamAcknowledgementDetail
__Type__: [RemoteReplicatorAcknowledgementDetail](sfclient-model-remotereplicatoracknowledgementdetail.md) <br/>
__Required__: No<br/>
<br/>
Details about the acknowledgements for operations that are part of the copy stream data.
