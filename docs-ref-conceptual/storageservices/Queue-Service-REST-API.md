---
title: Queue Storage REST API - Azure Storage
description: Azure Queue Storage stores messages that can be read by any client that has access to the storage account.
author: pemari-msft

ms.date: 09/30/2019
ms.service: storage
ms.topic: reference
ms.author: pemari
---

# Queue Storage REST API

Azure Queue Storage stores messages that can be read by any client that has access to the storage account.  
  
A queue can contain an unlimited number of messages. Each message can be up to 64 KB in size for version 2011-08-18 or later. For earlier versions, the maximum size of a message is 8 KB. Messages are generally added to the end of the queue and retrieved from the front of the queue, although first in, first out (FIFO) behavior is not guaranteed.  
  
If you need to store messages larger than 64 KB, you can store message data as a blob or in a table. You can then store a reference to the data as a message in a queue.  
  
The REST API for Queue Storage includes these operations:  
  
|Operation|Description|  
|---------------|-----------------|  
|[Set Queue Service Properties](Set-Queue-Service-Properties.md)|Sets the properties of Queue Storage.|  
|[Get Queue Service Properties](Get-Queue-Service-Properties.md)|Gets the properties of Queue Storage.|  
|[List Queues](List-Queues1.md)|Lists all queues under an account.|  
|[Preflight Queue Request](Preflight-Queue-Request.md)|Queries the Cross-Origin Resource Sharing (CORS) rules for Queue Storage before sending the request.|  
|[Get Queue Service Stats](Get-Queue-Service-Stats.md)|Retrieves statistics related to replication for Queue Storage. This operation is available only on the secondary location endpoint when read-access geo-redundant replication is enabled for the storage account.|  
|[Create Queue](Create-Queue4.md)|Creates a new queue under an account.|  
|[Delete Queue](Delete-Queue3.md)|Deletes a queue.|  
|[Get Queue Metadata](Get-Queue-Metadata.md)|Returns queue properties, including user-defined metadata.|  
|[Set Queue Metadata](Set-Queue-Metadata.md)|Sets user-defined metadata on the queue.|  
|[Get Queue ACL](Get-Queue-ACL.md)|Returns details on any stored access policies specified on the queue.|  
|[Set Queue ACL](Set-Queue-ACL.md)|Sets stored access policies for the queue that can be used with shared access signatures.|  
|[Put Message](Put-Message.md)|Adds a message to the queue and optionally sets a visibility time-out for the message.|  
|[Get Messages](Get-Messages.md)|Retrieves a message from the queue and makes it invisible to other consumers.|  
|[Peek Messages](Peek-Messages.md)|Retrieves a message from the front of the queue, without changing the message visibility.|  
|[Delete Message](Delete-Message2.md)|Deletes a specified message from the queue.|  
|[Clear Messages](Clear-Messages.md)|Clears all messages from the queue.|  
|[Update Message](Update-Message.md)|Updates the visibility time-out of a message and/or the message contents.|  
  
## In this section  
[Queue Storage concepts](Queue-Service-Concepts.md)    
[Operations on queues](Operations-on-Queues.md)    
[Operations on messages](Operations-on-Messages.md)  
  
## See also  
[Azure Storage REST API reference](Azure-Storage-Services-REST-API-Reference.md)
