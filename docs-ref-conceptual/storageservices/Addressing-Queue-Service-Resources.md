---
title: Addressing Queue Service Resources (REST API) - Azure Storage
description: Learn about Azure Queue service resources - the storage account, queues, and messages.
author: tamram

ms.date: 09/09/2019
ms.author: tamram
ms.service: storage
ms.topic: reference
---

# Addressing Queue Service Resources
The Queue service exposes the following resources via the REST API:  
  
-   **Account.** The storage account is a uniquely identified entity within the storage system. The account is the parent namespace for the Queue service. All queues are associated with an account.  
  
-   **Queue.** A queue stores messages that may be retrieved by a client application or service.  
  
-   **Messages.** Messages are UTF-8 encoded text that can be the value of an XML element. A message can be 64 KB in size.  
  
## Resource URI Syntax  
 Each resource has a corresponding base URI, which refers to the resource itself.  
  
 For the storage account, the base URI for queue operations includes the name of the account only:  
  
```  
https://myaccount.queue.core.windows.net  
```  
  
 For a queue, the base URI includes the name of the account and the name of the queue:  
  
```  
https://myaccount.queue.core.windows.net/myqueue  
```  
  
 For messages in a queue, the base URI includes the name of the account, the name of the queue, and the set of messages in that queue:  
  
```  
https://myaccount.queue.core.windows.net/myqueue/messages  
```  
  
 An individual message may be updated or deleted by referring to the message ID. Note that this syntax is available only to the [Update Message](Update-Message.md) and [Delete Message](Delete-Message2.md) operation and requires a `popreceipt` parameter for verification:  
  
```  
https://myaccount.queue.core.windows.net/myqueue/messages/messageid?popreceipt=string-value  
```  
  
 Each resource may also have components, which are expressed as part of the query string on the base URI. The syntax for the query string is `?comp=<component_name>`. Currently, the following resource components are available for queue resources, as parameters on the URI.  
  
|Component|Supported resources|Description|  
|---------------|-------------------------|-----------------|  
|`list`|Account|Enumerates the entities beneath this resource. On the account, returns the list of queues.|  
|`metadata`|Queue|Sets or returns queue properties, including user-defined metadata.|  
  
 Note that all values for query parameters must be URL encoded before they are sent to the Azure storage services.  
  
## Supported HTTP Operations  
 Each resource supports operations based on the HTTP verbs GET, PUT, HEAD, and DELETE. The verb, syntax, and supported HTTP version(s) for each operation appears on the reference page for each operation. For a complete list of operation reference pages, see [Queue Service REST API](Queue-Service-REST-API.md).  
  
## See Also  
 [Naming Queues and Metadata](Naming-Queues-and-Metadata.md)   
 [Operations on Queues](Operations-on-Queues.md)   
 [Operations on Messages](Operations-on-Messages.md)   
 [Queue Service REST API](Queue-Service-REST-API.md)
