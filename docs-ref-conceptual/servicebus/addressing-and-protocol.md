---
title: "Service Bus Namespace Access"
ms.custom: ""
ms.date: "08/11/2017"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "service-bus"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 81c0118e-68e1-4844-962f-3ef019a7100f
caps.latest.revision: 7
author: "sethmanheim"
ms.author: "sethm"
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
# Service Bus Namespace Access

A service namespace is a hierarchical graph in which entities can be created. The example in the following shows an exemplary namespace address. The host-name portion reflects the unique name of the namespace in DNS, based on the unique name chosen at creation time. The path section identifies the entity. All top-level Service Bus entities, such as `Queue` and `Topic` are addressed by this scheme.  

```  
https://{serviceNamespace}.servicebus.windows.net/{path}  
```  
The `*.servicebus.windows.net` suffix applies to all namespaces created in the global Azure cloud. Special environments use different suffixes. The separately operated German Azure cloud uses `*.servicebus.cloudapi.de`, for instance. 

The `{path}` is a segmented expression with the forward-slash ('/') as the segment separator, for example, /test, /test/test2, or /test/test2/test3. Multiple entities can share the same 
prefix segments, allowing formation of hierarchies. The maximum length of an entity name is 290 characters.  
  
## In This Section  

 [Overview](overview.md)  
 Provides overview of the simplified REST API sets for managing entities.  
  
 [Get Entity](get-entity.md)  
 Retrieves a messaging entity.  
  
 [Entities Discovery](entities-discovery.md)  
 Discovers messaging entities.  
  
 [Delete Entity](delete-entity.md)  
 Deletes messaging entity.  
  
 [Enumeration](enumeration.md)  
 List all messaging entities of certain kind in a flat view.  
  
 [Create and Update Entity](update-entity.md)  
 Creates and updates messaging entities.  
  
## Related Sections  
 [REST vs. .NET Client Support](rest-dotnet-client-support.md)  
  
 [Message Headers and Properties](message-headers-and-properties.md)  
  
 [Service Bus Runtime REST](service-bus-runtime-rest.md)