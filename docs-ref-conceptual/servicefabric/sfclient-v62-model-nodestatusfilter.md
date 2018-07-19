---
title: "NodeStatusFilter"
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
# NodeStatusFilter enum

type: string

Possible values include: 'default', 'all', 'up', 'down', 'enabling', 'disabling', 'disabled', 'unknown', 'removed'

Possible values are: 

  - `default` - This filter value will match all of the nodes excepts the ones with with status as Unknown or Removed.
  - `all` - This filter value will match all of the nodes.
  - `up` - This filter value will match nodes that are Up.
  - `down` - This filter value will match nodes that are Down.
  - `enabling` - This filter value will match nodes that are in the process of being enabled with status as Enabling.
  - `disabling` - This filter value will match nodes that are in the process of being disabled with status as Disabling.
  - `disabled` - This filter value will match nodes that are Disabled.
  - `unknown` - This filter value will match nodes whose status is Unknown. A node would be in Unknown state if Service Fabric does not have authoritative information about that node. This can happen if the system learns about a node at runtime.
  - `removed` - This filter value will match nodes whose status is Removed. These are the nodes that are removed from the cluster using the RemoveNodeState API.

