---
title: "ServicePartitionStatus"
ms.date: "2018-07-20"
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
# ServicePartitionStatus enum

type: string

The status of the service fabric service partition.

Possible values are: 

  - `Invalid` - Indicates the partition status is invalid. All Service Fabric enumerations have the invalid type. The value is zero.
  - `Ready` - Indicates that the partition is ready. This means that for a stateless service partition there is at least one instance that is up and for a stateful service partition the number of ready replicas is greater than or equal to the MinReplicaSetSize. The value is 1.
  - `NotReady` - Indicates that the partition is not ready. This status is returned when none of the other states apply. The value is 2.
  - `InQuorumLoss` - Indicates that the partition is in quorum loss. This means that number of replicas that are up and participating in a replica set is less than MinReplicaSetSize for this partition. The value is 3.
  - `Reconfiguring` - Indicates that the partition is undergoing reconfiguration of its replica sets. This can happen due to failover, upgrade, load balancing or addition or removal of replicas from the replica set. The value is 4.
  - `Deleting` - Indicates that the partition is being deleted. The value is 5.

