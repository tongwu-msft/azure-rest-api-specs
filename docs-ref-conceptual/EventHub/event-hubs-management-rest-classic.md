---
title: "Event Hubs Management REST (classic)"
ms.custom: ""
ms.date: "2016-11-14"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "event-hubs"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 1c0d56c4-7d5f-4911-8700-004260625579
caps.latest.revision: 8
author: "sethmanheim"
ms.author: "sethm"
manager: "timlt"
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
  
-   Set the Content-Type header to **application/atom+xml;type=entry;charset=utf-8**.  
  
-   Set the Authorization header to a SAS token (see the [Generate SAS token](~/docs-ref-conceptual/EventHub/generate-sas-token.md) section for more information), or a WRAPv0.9.7.2 token containing a SimpleWebToken acquired from ACS. Set to WRAP access_token=”{swt}”.  
  
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