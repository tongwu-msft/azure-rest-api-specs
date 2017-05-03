---
title: "Faults"
ms.date: "2017-05-03"
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
# Faults APIs

| Name | Description |
| --- | --- |
| [Start Data Loss](sfclient-api-startdataloss.md) | This API will induce data loss for the specified partition. It will trigger a call to the OnDataLossAsync API of the partition.<br/> |
| [Get Data Loss Progress](sfclient-api-getdatalossprogress.md) | Gets the progress of a partition data loss operation started using the StartDataLoss API.<br/> |
| [Start Quorum Loss](sfclient-api-startquorumloss.md) | Induces quorum loss for a given stateful service partition.<br/> |
| [Get Quorum Loss Progress](sfclient-api-getquorumlossprogress.md) | Gets the progress of a quorum loss operation on a partition started using the StartQuorumLoss API.<br/> |
| [Start Partition Restart](sfclient-api-startpartitionrestart.md) | This API will restart some or all replicas or instances of the specified partition.<br/> |
| [Get Partition Restart Progress](sfclient-api-getpartitionrestartprogress.md) | Gets the progress of a PartitionRestart operation started using StartPartitionRestart.<br/> |
| [Start Node Transition](sfclient-api-startnodetransition.md) | Starts or stops a cluster node.<br/> |
| [Get Node Transition Progress](sfclient-api-getnodetransitionprogress.md) | Gets the progress of an operation started using StartNodeTransition.<br/> |
| [Get Fault Operation List](sfclient-api-getfaultoperationlist.md) | Gets a list of user-induced fault operations filtered by provided input.<br/> |
| [Cancel Operation](sfclient-api-canceloperation.md) | Cancels a user-induced fault operation.<br/> |

