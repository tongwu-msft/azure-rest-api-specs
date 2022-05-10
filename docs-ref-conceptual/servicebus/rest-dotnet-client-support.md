---
title: "REST vs. .NET Client Support"
description: Learn about REST versus .NET client support and the the REST API versions supported by each Service Bus release.
ms.custom: ""
ms.date: "07/08/2020"
ms.reviewer: ""
ms.service: "service-bus"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: ccd80576-5493-4eba-bbb6-3012b178ebb0
caps.latest.revision: 10
author: "spelluru"
ms.author: "spelluru"
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
# REST vs. .NET Client Support
## Version and server overview  
 Following Azure guidelines, REST APIs now support versioning. By default, passing no version indicates current service behavior. Any changes in existing REST APIs require providing an `api-version` value as the query string.  
  
 The following table lists the REST API versions for each Service Bus release.  
  
|Version|  
|-------------|  
|“2012-03”|  
|“2012-08”|  
|“2013-04”|  
|“2013-07”|  
|“2013-08”|  
|“2013-10”|  
|“2014-01”|  
|“2015-01”|  
  
## Features exposed using both the REST client and the .NET managed API  
 The table below details the features that are exposed using both the REST client and the .NET managed API. Note that not all features are available to REST clients.  
  
|Feature|REST Client|.NET Client|  
|-------------|-----------------|-----------------|  
|Send to queue/topic|X|X|  
|Receive from queue/subscription|X|X|  
|Support for partitioned entities|X|X|  
|Support for express entities|X|X|  
|Scheduled messages|X|X|  
|Batching|send only|X|  
|Session receivers||X|  
|Deadlettering||X|  
|Message deferral||X|  
| Filters | X | X | 
| Message enrichment | | X | 
| Custom filter definitions | | X | 
