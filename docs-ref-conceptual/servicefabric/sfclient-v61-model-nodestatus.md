---
title: "NodeStatus"
ms.date: "2018-01-22"
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
# NodeStatus enum

type: string

The status of the node.

Possible values are: 

  - Invalid - Indicates the node status is invalid. All Service Fabric enumerations have the invalid type. The value is zero.
  - Up - Indicates the node is up. The value is 1.
  - Down - Indicates the node is down. The value is 2.
  - Enabling - Indicates the node is in process of being enabled. The value is 3.
  - Disabling - Indicates the node is in the process of being disabled. The value is 4.
  - Disabled - Indicates the node is disabled. The value is 5.
  - Unknown - Indicates the node is unknown. A node would be in Unknown state if Service Fabric does not have authoritative information about that node. This can happen if the system learns about a node at runtime.The value is 6.
  - Removed - Indicates the node is removed. A node would be in Removed state if NodeStateRemoved API has been called for this node. In other words, Service Fabric has been informed that the persisted state on the node has been permanently lost. The value is 7.

