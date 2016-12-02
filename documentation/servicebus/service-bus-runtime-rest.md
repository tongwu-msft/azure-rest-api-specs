---
title: "Service Bus Runtime REST"
ms.custom: ""
ms.date: "05/15/2015"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "service-bus"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 81854468-1309-416e-8aea-afda0e265289
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
# Service Bus Runtime REST
This section describes the Service Bus REST run-time APIs.  
  
## In This Section  
 [Introduction](introduction.md)  
 An introduction to the Service Bus REST run-time APIs.  
  
 [Send Message](send-message1.md)  
 Enqueues a message into the specified queue or topic.  
  
 [Send Message Batch](send-message-batch.md)  
 Enqueues a batch of messages into the specified queue or topic.  
  
 [Receive and Delete Message (Destructive Read)](receive-and-delete-message--destructive-read-.md)  
 Reads and deletes a message from a queue or subscription as an atomic operation.  
  
 [Peek-Lock Message (Non-Destructive Read)](peek-lock-message--non-destructive-read-.md)  
 Retrieves and locks a message for processing as an atomic operation.  
  
 [Unlock Message](unlock-message.md)  
 Unlocks a message for processing by other receivers on a specified queue or subscription.  
  
 [Delete Message](delete-message.md)  
 Completes processing on a locked message and deletes it from the queue or subscription.  
  
 [Renew-Lock for a Message](renew-lock-for-a-message.md)  
 Renews the lock of an already locked message for continuing processing (long running operations).  
  
 [Request a Token from ACS](request-a-token-from-acs.md)  
 Request a new SWT token from Microsoft Azure Active Directory Access Control (also known as Access Control Service or ACS).  
  
## Related Sections  
 [Service Bus Management REST (classic)](service-bus-management-rest--classic-.md)  
  
 [Message Headers and Properties](message-headers-and-properties.md)  
  
 [Addressing and Protocol](addressing-and-protocol.md)