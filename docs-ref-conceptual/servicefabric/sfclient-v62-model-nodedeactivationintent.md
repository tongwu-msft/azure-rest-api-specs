---
title: "NodeDeactivationIntent"
ms.date: "2018-04-23"
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
# NodeDeactivationIntent enum

type: string

The intent or the reason for deactivating the node. Following are the possible values for it.

Possible values are: 

  - `Invalid` - Indicates the node deactivation intent is invalid. All Service Fabric enumerations have the invalid type. The value is zero. This value is not used.
  - `Pause` - Indicates that the node should be paused. The value is 1.
  - `Restart` - Indicates that the intent is for the node to be restarted after a short period of time. Service Fabric does not restart the node, this action is done outside of Service Fabric. The value is 2.
  - `RemoveData` - Indicates that the intent is to reimage the node. Service Fabric does not reimage the node, this action is done outside of Service Fabric. The value is 3.
  - `RemoveNode` - Indicates that the node is being decommissioned and is not expected to return. Service Fabric does not decommission the node, this action is done outside of Service Fabric. The value is 4.

