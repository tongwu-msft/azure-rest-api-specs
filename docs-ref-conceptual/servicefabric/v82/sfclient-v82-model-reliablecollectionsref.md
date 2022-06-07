---
title: "ReliableCollectionsRef v82"
description: "ReliableCollectionsRef v82"
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
# ReliableCollectionsRef v82

Specifying this parameter adds support for reliable collections

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`name`](#name) | string | Yes |
| [`doNotPersistState`](#donotpersiststate) | boolean | No |

____
### `name`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
Name of ReliableCollection resource. Right now it's not used and you can use any string.

____
### `doNotPersistState`
__Type__: boolean <br/>
__Required__: No<br/>
<br/>
False (the default) if ReliableCollections state is persisted to disk as usual. True if you do not want to persist state, in which case replication is still enabled and you can use ReliableCollections as distributed cache.
