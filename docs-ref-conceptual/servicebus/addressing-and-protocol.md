---
title: "Addressing and Protocol"
ms.custom: ""
ms.date: "05/15/2015"
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
# Addressing and Protocol
A service namespace is a hierarchical namespace under which an entity can be created and mapped to any arbitrary depth of names at leaf node. It is considered the base address of all entities and features created under this namespace. In example address below, the bold section is considered the namespace address, which is used to set or get the full path of entities or features of these entities. All top level entities, such as `Queue` and `Topic` are addressed by this scheme.  
  
```  
  
https://{serviceNamespace}.servicebus.Windows.net/{path}  
```  
  
 You can specify `{path}` at any depth. For example, /test, /test/test2, or /test/test2/test3. Note that the maximum length of an entity name is 290 characters.  
  
## In This Section  
 [Topic Subscription](topic-subscription.md)  
 Describes the address of a topic subscription.  
  
 [Rule](rule.md)  
 Describes the rule of a topic subscription.  
  
 [Overview](overview.md)  
 Provides overview of the simplified REST API sets for managing entities.  
  
 [Send Message](send-message2.md)  
 Sends a new message.  
  
 [Get Entity](get-entity.md)  
 Retrieves a messaging entity.  
  
 [Entities Discovery](entities-discovery.md)  
 Discovers messaging entities.  
  
 [Delete Entity](delete-entity.md)  
 Deletes messaging entity.  
  
 [Enumeration](enumeration.md)  
 List all messaging entities of certain kind in a flat view.  
  
 [Query Strings](query-strings.md)  
 Performs query string operations for passing data to web applications.  
  
 [Update Entity](update-entity.md)  
 Updates messaging entities.  
  
## Related Sections  
 [REST vs. .NET Client Support](rest-vs.-.net-client-support.md)  
  
 [Message Headers and Properties](message-headers-and-properties.md)  
  
 [Service Bus Management REST (classic)](service-bus-management-rest--classic-.md)  
  
 [Service Bus Runtime REST](service-bus-runtime-rest.md)