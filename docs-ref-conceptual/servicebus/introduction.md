---
title: "Introduction"
description: Learn about brokered message properties and how you can specify message properties when you send a message.
ms.custom: ""
ms.date: "07/08/2020"
ms.reviewer: ""
ms.service: "service-bus"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: ebbc7baa-0060-4c1c-a1f3-329dd771e1f4
caps.latest.revision: 6
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
  
# Brokered message Properties  
 When sending a message, you can specify the following message properties. If a single message is sent or received, then these properties are contained in the **BrokerProperties** HTTP header in a JSON-encoded format. If a batch of messages is sent, these properties are part of the JSON-encoded HTTP body. For more information, see [Send Message](send-message.md) and [Send Message Batch](send-message-batch.md).  
  
 The following table lists the [Microsoft.ServiceBus.Messaging.BrokeredMessage](/dotnet/api/microsoft.servicebus.messaging.brokeredmessage) properties. The properties can appear in any order. If a property is not specified, Service Bus uses the default value for that property. Broker properties other than the ones listed are ignored. The accepted properties are independent of the value of the specified **api-version**. The **api-version** specifier is not required in the HTTP request.  
  
 If the **SessionId** and **PartitionKey** properties are both set, they must be set to the same value.  
  
|Property Name|Default|Property Description|  
|-------------------|-------------|--------------------------|  
|CorrelationId|(empty)|[CorrelationId](/dotnet/api/microsoft.servicebus.messaging.brokeredmessage.correlationid)|  
|ForcePersistence|false|[ForcePersistence](/dotnet/api/microsoft.servicebus.messaging.brokeredmessage.forcepersistence)|  
|Label|(empty)|[Label](/dotnet/api/microsoft.servicebus.messaging.brokeredmessage.label)|  
|MessageId|(empty)|[MessageId](/dotnet/api/microsoft.servicebus.messaging.brokeredmessage.messageid)|  
|PartitionKey|(empty)|[PartitionKey](/dotnet/api/microsoft.servicebus.messaging.brokeredmessage.partitionkey)|  
|ReplyTo|(empty)|[ReplyTo](/dotnet/api/microsoft.servicebus.messaging.brokeredmessage.replyto)|  
|ReplyToSessionId|(empty)|[ReplyToSessionId](/dotnet/api/microsoft.servicebus.messaging.brokeredmessage.replytosessionid)|  
|ScheduledEnqueueTimeUtc|(empty)|[ScheduledEnqueueTimeUtc](/dotnet/api/microsoft.servicebus.messaging.brokeredmessage.scheduledenqueuetimeutc)|  
|SessionId|(empty)|[SessionId](/dotnet/api/microsoft.servicebus.messaging.brokeredmessage.sessionid)|  
|TimeToLive|(empty)|[TimeToLive](/dotnet/api/microsoft.servicebus.messaging.brokeredmessage.timetolive)|  
|To|(empty)|[To](/dotnet/api/microsoft.servicebus.messaging.brokeredmessage.to)|  
|ViaPartitionKey|(empty)|[ViaPartitionKey](/dotnet/api/microsoft.servicebus.messaging.brokeredmessage.viapartitionkey)|  
  
 In addition to these properties, you can specify custom properties. If a single message is sent or received, each custom property is placed in its own HTTP header. If a batch of messages is sent, custom properties are part of the JSON-encoded HTTP body. For more information, see [Send Message](send-message.md) and [Send Message Batch](send-message-batch.md).
