---
title: "Event Hubs Management REST (classic)"
ms.custom: ""
ms.date: 07/14/2020
ms.prod: "azure"
ms.reviewer: ""
ms.service: "event-hubs"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 1c0d56c4-7d5f-4911-8700-004260625579
caps.latest.revision: 8
author: "spelluru"
ms.author: "spelluru"
manager: "femila"
---
# Event Hubs Management REST (classic)
These APIs enable you to perform management operations on Event Hubs.  
  
##  <a name="bk_common"></a> Common parameters and headers  
 The following information is common to all tasks that you might do related to Event Hubs management:  
  
-   Replace {api-version} with "2014-01" in the URL.  
  
-   Replace {servicebusNamespace} with the namespace obtained from the Azure classic portal.  
  
-   Replace {eventHubPath} with the path to your Event Hub.  
  
-   Replace {consumergroupName} with the name of a consumer group.  
  
-   Replace {partitionId} with the ID of a partition on your Event Hub.  

## Common headers

 The following table describes common request headers. 
  
|Request Header|Description|  
|--------------------|-----------------|  
|Authorization| Specify one of the following:<ul><li> Azure Active Directory (AAD) JSON Web Token (JWT) token. <br/>Example: `Authorization: Bearer <AAD JWT token>`. <br/>For information on generating an AAD token, see [Authenticate from an application](https://docs.microsoft.com/azure/event-hubs/authenticate-application#authenticate-from-an-application).</li><li>A SAS token. <br/>Example: `Authorization: SharedAccessSignature sr=<NAMESPACE NAME>.servicebus.windows.net&sig=<SHARED ACCESS KEY>&se=<TOKEN EXPIRY INSTANT>&skn=<SHARED KEY NAME>`. <br/>For information on generating a SAS token, see [Generate a Shared Access Signature token](https://docs.microsoft.com/azure/service-bus-messaging/service-bus-sas#generate-a-shared-access-signature-token) and [Generate SAS token](generate-sas-token.md).</li></ul> |  
|Content-Type|Set to **application/atom+xml;type=entry;charset=utf-8**.|  
  
  
## Tasks  
 You can perform the following management operations:  
  
-   [Create Event Hub](../EventHub/create-event-hub.md)  
  
-   [Get Event Hub](../EventHub/get-event-hub.md)  
  
-   [List Event Hubs](../EventHub/list-event-hubs.md)  
  
-   [Delete Event Hub](../EventHub/delete-event-hub.md)  
  
-   [Update Event Hub](../EventHub/update-event-hub.md)  
  
-   [List consumer groups](../EventHub/list-consumer-groups.md)  
  
-   [Get consumer group](../EventHub/get-consumer-group.md)  
  
-   [Create consumer group](../EventHub/create-consumer-group.md)  
  
-   [Delete consumer group](../EventHub/delete-consumer-group.md)  
  
-   [Get partition runtime metadata](../EventHub/get-partition-runtime-metadata.md)  
  
-   [List partition runtime metadata](../EventHub/list-partition-runtime-metadata.md)