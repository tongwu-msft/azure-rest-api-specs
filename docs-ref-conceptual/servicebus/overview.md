---
title: "Overview"
ms.custom: ""
ms.date: "05/14/2015"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "service-bus"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 34ddb818-0781-4043-ba25-9627bfd1d1f3
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
# Overview
The simplified REST API sets for managing entities are as follows:  
  
-   GET on any unoccupied naming node (for example, / or /test) is a discovery operation and returns an AtomPub feed listing children. It will only return the “immediate node.” For example, if you have queues at A/B/C, and perform a GET on “/”, it returns “/A”. If you perform a GET on “/A”, it returns only “/A/B”, and so on.  
  
-   “GET” against any occupied node (for example, /test1/test2, /test1/example, or /test2) is a get operation and returns an `AtomPub` entry with the description.  
  
-   “PUT” against any unoccupied node is a create operation. The request body is and `AtomPub` entry with the description.  
  
-   “DELETE” against any occupied node is a delete operation.  
  
-   “DELETE” against any unoccupied node is ignored and returns success.

## Entity Descriptions 

A queue is described with a ```QueueDescription``` element. The detail schema for the 
element can be directly inferred from the [QueueDescription](https://docs.microsoft.com/dotnet/api/microsoft.servicebus.messaging.queuedescription) .NET Framework class. The XML payload for creating or updating a queue therefore may take the following form, whereby all omitted properties assume their default values:

```xml  
<?xml version="1.0" encoding="utf-8" ?>  
<entry xmlns="http://www.w3.org/2005/Atom">  
  <content type="application/xml">  
    <QueueDescription xmlns="http://schemas.microsoft.com/netservices/2010/10/servicebus/connect">
       <LockDuration>T1M</LockDuration>
    </QueueDescription>
  </content>  
</entry>  
```

Topics are described with  ```<TopicDescription>``` element. The detail schema for the 
element can be directly inferred from the [TopicDescription](https://docs.microsoft.com/dotnet/api/microsoft.servicebus.messaging.topicdescription) .NET Framework class.

Subscriptions are described with the ```<SubscriptionDescription>``` element. The detail schema for the 
element can be directly inferred from the [SubscriptionDescription](https://docs.microsoft.com/dotnet/api/microsoft.servicebus.messaging.subscriptiondescription) .NET Framework class. 

Subscriptions are subordinates of Topics and must therefore be created 
within the "subscriptions" collection of an existing topic. If the entity path of the topic is ```https://{serviceNamespace}.servicebus.windows.net/{topic-name}```, the correct path for creating a new subscription is ```https://{serviceNamespace}.servicebus.windows.net/{topic-name}/subscriptions/{subscription-name}```. Subscription names can't have multiple segments. 


Rules are described with the ```<RuleDescription>``` element. The detail schema for the 
element can be directly inferred from the [RuleDescription](https://docs.microsoft.com/dotnet/api/microsoft.servicebus.messaging.ruledescription) .NET Framework class. 

Rules are subordinates of topic subscriptions and must therefore be created 
within the "rules" collection of an existing topic subscription. If the entity path of the topic subscription is ```https://{serviceNamespace}.servicebus.windows.net/{topic-name}/subscriptions/{subscription-name}```, the correct path for creating a new rule is ```https://{serviceNamespace}.servicebus.windows.net/{topic-name}/subscriptions/{subscription-name}/rules/{rule-name}```. Subscription names can't have multiple segments. 
