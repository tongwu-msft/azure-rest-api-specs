---
title: "Event Hubs service REST"
description: Learn that these APIs enable you to access the Event Hubs service to perform operations on event hubs.
ms.custom: ""
ms.date: 07/14/2020
ms.reviewer: ""
ms.service: "event-hubs"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: b42dd0f8-2cb5-45db-b0fc-479da8518781
caps.latest.revision: 10
author: "spelluru"
ms.author: "spelluru"
manager: "femila"
---

# Event Hubs service REST - Common parameters and headers
These APIs enable you to access the Event Hubs service to perform operations on event hubs.  
  
##  Common parameters
 The following information is common to all tasks related to Event Hubs publisher policy:  
  
-   Replace `{api-version}` with `2014-01` in the URL.  
  
-   Replace `{servicebusNamespace}` with the name of the namespace.  
  
-   Replace `{eventHubPath}` with the path to your event hub.  
  
-   Replace `{publisherName}` with the name of your publisher.  
  
-   Replace `{partitionId}` with the ID of a partition on an event hub.  


## Common headers  
-   Set the `Content-Type` header to `application/atom+xml;type=entry;charset=utf-8`.  
-   Set the `Authorization` header to one of the following tokens:
    - Azure Active Directory (**Azure AD**) JSON Web Token (JWT) token. Example: `Authorization: Bearer <Azure AD JWT token>`. 
        
        For information on generating an Azure AD token, see [Get Azure AD token](get-azure-active-directory-token.md).
    - A **SAS** token. Example: `Authorization: SharedAccessSignature sr=<NAMESPACE NAME>.servicebus.windows.net&sig=<SHARED ACCESS KEY>&se=<TOKEN EXPIRY INSTANT>&skn=<SHARED KEY NAME>`. 
    
        For information on generating a SAS token, see [Generate a Shared Access Signature token](generate-sas-token.md).
- (Optional) Set the **x-ms-retrypolicy** header to `NoRetry`, to disable automatic retry on send operations when transient errors occur.   
- Set the optional [broker properties](/rest/api/servicebus/message-headers-and-properties) header to a JSON-encoded list. For example, to target a specific partition via `PartitionKey`, use the following example:  
  
    ```  
    POST https://your-namespace.servicebus.windows.net/your-event-hub/messages?timeout=60&api-version=2014-01 HTTP/1.1  
    Authorization: SharedAccessSignature sr=your-namespace.servicebus.windows.net&sig=tYu8qdH563Pc96Lky0SFs5PhbGnljF7mLYQwCZmk9M0%3d&se=1403736877&skn=RootManageSharedAccessKey  
    Content-Type: application/atom+xml;type=entry;charset=utf-8  
    Host: your-namespace.servicebus.windows.net  
    BrokerProperties: {"PartitionKey": "32119834-65f3-48c1-b366-619df2e4c400"}  
  
    { "DeviceId":"dev-01", "Temperature":"37.0" }  
    ```  
  
-   Set the optional `UserProperties` header to a list of custom properties with property name as key and property value as value. For example:  
  
    ```  
    WindAlert: Strong Winds  
    GeneralAlert: Thunderstorms  
  
    ```  
  
## Tasks  
 You can perform the following publisher policy operations:  
  
-   [Send event](send-event.md)  
  
-   [Send event with publisher ID](send-event-with-publisher-id.md)  
  
-   [Send partition event](send-partition-event.md)  
  
-   [Send batch events](send-batch-events.md)