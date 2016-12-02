---
title: "Introduction"
ms.custom: ""
ms.date: "05/13/2015"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "service-bus"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: ebbc7baa-0060-4c1c-a1f3-329dd771e1f4
caps.latest.revision: 6
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
# Introduction
This section describes the Service Bus REST run-time APIs. Runtime operations can send messages to or receive messages from a Service Bus messaging entity, and perform other tasks related to sending or receiving messages.  
  
 Service Bus run-time operations can be executed against a queue, topic, or a subscription to a topic.  
  
 The table below compares the runtime features that are exposed via REST with the .NET APIs.  
  
|**Feature**|**HTTP**|**.NET**|  
|-----------------|--------------|--------------|  
|Send to queue/topic|X|X|  
|Receive from queue/subscription|X|X|  
|Support for partitioned entities|X|X|  
|Support for express entities|X|X|  
|Scheduled messages|X|X|  
|Batching|send only|X|  
|Session Receivers||X|  
|Deadlettering||X|  
|Message deferral||X|  
  
## Message Properties  
 When sending a message, you can specify the following message properties. If a single message is sent or received, then these properties are contained in the **BrokerProperties** HTTP header in a JSON-encoded format. If a batch of messages is sent, these properties are part of the JSON-encoded HTTP body. For more information, see [Send Message](send-message.md) and [Send Message Batch](send-message-batch.md).  
  
 The following table lists the <xref:Microsoft.ServiceBus.Messaging.BrokeredMessage> properties. The properties can appear in any order. If a property is not specified, Service Bus uses the default value for that property. Broker properties other than the ones listed are ignored. The accepted properties are independent of the value of the specified **api-version**. The **api-version** specifier is not required in the HTTP request.  
  
 If the **SessionId** and **PartitionKey** properties are both set, they must be set to the same value.  
  
|Property Name|Default|Property Description|  
|-------------------|-------------|--------------------------|  
|CorrelationId|(empty)|<xref:Microsoft.ServiceBus.Messaging.BrokeredMessage.CorrelationId%2A>|  
|ForcePersistence|false|<xref:Microsoft.ServiceBus.Messaging.BrokeredMessage.ForcePersistence%2A>|  
|Label|(empty)|<xref:Microsoft.ServiceBus.Messaging.BrokeredMessage.Label%2A>|  
|MessageId|(empty)|<xref:Microsoft.ServiceBus.Messaging.BrokeredMessage.MessageId%2A>|  
|PartitionKey|(empty)|<xref:Microsoft.ServiceBus.Messaging.BrokeredMessage.PartitionKey%2A>|  
|ReplyTo|(empty)|<xref:Microsoft.ServiceBus.Messaging.BrokeredMessage.ReplyTo%2A>|  
|ReplyToSessionId|(empty)|<xref:Microsoft.ServiceBus.Messaging.BrokeredMessage.ReplyToSessionId%2A>|  
|ScheduledEnqueueTimeUtc|(empty)|<xref:Microsoft.ServiceBus.Messaging.BrokeredMessage.ScheduledEnqueueTimeUtc%2A>|  
|SessionId|(empty)|<xref:Microsoft.ServiceBus.Messaging.BrokeredMessage.SessionId%2A>|  
|TimeToLive|(empty)|<xref:Microsoft.ServiceBus.Messaging.BrokeredMessage.TimeToLive%2A>|  
|To|(empty)|<xref:Microsoft.ServiceBus.Messaging.BrokeredMessage.To%2A>|  
|ViaPartitionKey|(empty)|<xref:Microsoft.ServiceBus.Messaging.BrokeredMessage.ViaPartitionKey%2A>|  
  
 In addition to these properties, you can specify custom properties. If a single message is sent or received, each custom property is placed in its own HTTP header. If a batch of messages is sent, custom properties are part of the JSON-encoded HTTP body. For more information, see [Send Message](send-message.md) and [Send Message Batch](send-message-batch.md).