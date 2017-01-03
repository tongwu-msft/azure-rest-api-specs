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
  
 The following table lists the [Microsoft.ServiceBus.Messaging.BrokeredMessage](/dotnet/api/microsoft.servicebus.messaging.brokeredmessage) properties. The properties can appear in any order. If a property is not specified, Service Bus uses the default value for that property. Broker properties other than the ones listed are ignored. The accepted properties are independent of the value of the specified **api-version**. The **api-version** specifier is not required in the HTTP request.  
  
 If the **SessionId** and **PartitionKey** properties are both set, they must be set to the same value.  
  
|Property Name|Default|Property Description|  
|-------------------|-------------|--------------------------|  
|CorrelationId|(empty)|[CorrelationId](/dotnet/api/microsoft.servicebus.messaging.brokeredmessage#Microsoft_ServiceBus_Messaging_BrokeredMessage_CorrelationId)|  
|ForcePersistence|false|[ForcePersistence](/dotnet/api/microsoft.servicebus.messaging.brokeredmessage#Microsoft_ServiceBus_Messaging_BrokeredMessage_ForcePersistence)|  
|Label|(empty)|[Label](/dotnet/api/microsoft.servicebus.messaging.brokeredmessage#Microsoft_ServiceBus_Messaging_BrokeredMessage_Label)|  
|MessageId|(empty)|[MessageId](/dotnet/api/microsoft.servicebus.messaging.brokeredmessage#Microsoft_ServiceBus_Messaging_BrokeredMessage_MessageId)|  
|PartitionKey|(empty)|[PartitionKey](/dotnet/api/microsoft.servicebus.messaging.brokeredmessage#Microsoft_ServiceBus_Messaging_BrokeredMessage_PartitionKey)|  
|ReplyTo|(empty)|[ReplyTo](/dotnet/api/microsoft.servicebus.messaging.brokeredmessage#Microsoft_ServiceBus_Messaging_BrokeredMessage_ReplyTo)|  
|ReplyToSessionId|(empty)|[ReplyToSessionId](/dotnet/api/microsoft.servicebus.messaging.brokeredmessage#Microsoft_ServiceBus_Messaging_BrokeredMessage_ReplyToSessionId)|  
|ScheduledEnqueueTimeUtc|(empty)|[ScheduledEnqueueTimeUtc](/dotnet/api/microsoft.servicebus.messaging.brokeredmessage#Microsoft_ServiceBus_Messaging_BrokeredMessage_ScheduledEnqueueTimeUtc)|  
|SessionId|(empty)|[SessionId](/dotnet/api/microsoft.servicebus.messaging.brokeredmessage#Microsoft_ServiceBus_Messaging_BrokeredMessage_SessionId)|  
|TimeToLive|(empty)|[TimeToLive](/dotnet/api/microsoft.servicebus.messaging.brokeredmessage#Microsoft_ServiceBus_Messaging_BrokeredMessage_TimeToLive)|  
|To|(empty)|[To](/dotnet/api/microsoft.servicebus.messaging.brokeredmessage#Microsoft_ServiceBus_Messaging_BrokeredMessage_To)|  
|ViaPartitionKey|(empty)|[ViaPartitionKey](/dotnet/api/microsoft.servicebus.messaging.brokeredmessage#Microsoft_ServiceBus_Messaging_BrokeredMessage_ViaPartitionKey)|  
  
 In addition to these properties, you can specify custom properties. If a single message is sent or received, each custom property is placed in its own HTTP header. If a batch of messages is sent, custom properties are part of the JSON-encoded HTTP body. For more information, see [Send Message](send-message.md) and [Send Message Batch](send-message-batch.md).