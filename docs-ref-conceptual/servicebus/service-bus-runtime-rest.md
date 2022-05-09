---
title: "Service Bus Runtime REST"
description: API reference documentation for the operations available in the Service Bus Runtime REST API, a RESTful web service for managing Service Bus Runtime resources in Azure.
ms.custom: ""
ms.date: "07/08/2020"
ms.reviewer: ""
ms.service: "service-bus"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 81854468-1309-416e-8aea-afda0e265289
caps.latest.revision: 7
author: "spelluru"
ms.author: "spelluru"
manager: "femila"
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
# Service Bus Runtime REST
This section describes the Service Bus REST run-time APIs.  
  
## In This Section  
 [Message properties](introduction.md)  
 Describes the properties that can be set on messages. 
 
 [Send Message](send-message-to-queue.md)  
 Sends a message to a Service Bus queue or topic. 
 
 [Send Message Batch](send-message-batch.md)  
 Sends a batch of messages to a Service Bus queue or topic. 
  
 [Receive and Delete Message (Destructive Read)](receive-and-delete-message-destructive-read.md)  
 Receives a message from a queue or subscription, and removes the message from that queue or subscription in one atomic operation.
  
 [Peek-Lock Message (Non-Destructive Read)](peek-lock-message-non-destructive-read.md)  
 Retrieves and locks a message for processing as an atomic operation.  
  
 [Unlock Message](unlock-message.md)  
 Unlocks a message for processing by other receivers on a specified queue or subscription.  
  
 [Delete Message](delete-message.md)  
 Completes processing on a locked message and deletes it from the queue or subscription.  
  
 [Renew-Lock for a Message](renew-lock-for-a-message.md)  
 Renews the lock of an already locked message for continuing processing (long running operations).  
 
  
## Related Sections  
   
 [Message Headers and Properties](message-headers-and-properties.md)  
  
 [Addressing and Protocol](addressing-and-protocol.md)