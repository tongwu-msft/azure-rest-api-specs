---
title: "Event Hubs Management REST (classic)"
description: Learn how these APIs enable you to perform management operations on Event Hubs.
ms.custom: ""
ms.date: 07/14/2020
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
# Event Hubs Management REST (classic) - Common headers and parameters
These APIs enable you to perform management operations on Event Hubs.  
  
> [!IMPORTANT]
> If you are using **"Classic" or RDFE management APIs**, they are [**obsolete and retired**](https://docs.microsoft.com/azure/service-bus-messaging/deprecate-service-bus-management) as of **11/1/2021** and should no longer be used.  
  
  
## Common parameters
 The following information is common to all tasks related to managing event hubs. 
 
-   Replace `{api-version}` with `2014-01` in the URL.   
-   Replace `{servicebusNamespace}` with the name of the namespace.  
-   Replace `{eventHubPath}` with the path to your event hub.    
-   Replace `{consumergroupName}` with the name of a consumer group.    
-   Replace `{partitionId}` with the ID of a partition on your Event Hub.  

## Common headers

 The following table describes common request headers. 
  
|Request Header|Description|  
|--------------------|-----------------|  
|`Authorization`| Specify one of the following:<ul><li> Azure Active Directory (Azure AD) JSON Web Token (JWT) token. <br/>Example: `Authorization: Bearer <Azure AD JWT token>`. <br/>For information on generating an Azure AD token, see [Get Azure AD token](get-azure-active-directory-token.md)..</li><li>A SAS token. <br/>Example: `Authorization: SharedAccessSignature sr=<NAMESPACE NAME>.servicebus.windows.net&sig=<SHARED ACCESS KEY>&se=<TOKEN EXPIRY INSTANT>&skn=<SHARED KEY NAME>`. <br/>For information on generating a SAS token, see [Generate a Shared Access Signature token](https://docs.microsoft.com/azure/service-bus-messaging/service-bus-sas#generate-a-shared-access-signature-token) and [Generate SAS token](generate-sas-token.md).</li></ul> |  
|`Content-Type`|Set to `application/atom+xml;type=entry;charset=utf-8`.|  
  
  
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
