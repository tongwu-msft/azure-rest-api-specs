---
title: "UpgradeSortOrder"
ms.date: "11/23/2019"
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
# UpgradeSortOrder enum

type: string

Defines the order in which an upgrade proceeds through the cluster.

Possible values are: 

  - `Invalid` - Indicates that this sort order is not valid. All Service Fabric enumerations have the invalid type. The value is 0.
  - `Default` - Indicates that the default sort order (as specified in cluster manifest) will be used. The value is 1.
  - `Numeric` - Indicates that forward numeric sort order (UD names sorted as numbers) will be used. The value is 2.
  - `Lexicographical` - Indicates that forward lexicographical sort order (UD names sorted as strings) will be used. The value is 3.
  - `ReverseNumeric` - Indicates that reverse numeric sort order (UD names sorted as numbers) will be used. The value is 4.
  - `ReverseLexicographical` - Indicates that reverse lexicographical sort order (UD names sorted as strings) will be used. The value is 5.

