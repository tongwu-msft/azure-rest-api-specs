---
title: "Event Hubs Runtime REST"
ms.custom: ""
ms.date: "2016-09-06"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "event-hubs"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: b42dd0f8-2cb5-45db-b0fc-479da8518781
caps.latest.revision: 10
author: "sethmanheim"
ms.author: "sethm"
manager: "timlt"
---
# Event Hubs Runtime REST
These APIs enable you to perform runtime operations on Event Hubs.  
  
##  <a name="bk_common"></a> Common parameters and headers  
 The following information is common to all tasks that you might do related to Event Hubs publisher policy:  
  
-   Replace {api-version} with "2014-01" in the URL.  
  
-   Replace {servicebusNamespace} with the namespace obtained from the Azure classic portal.  
  
-   Replace {eventHubPath} with the path to your Event Hub.  
  
-   Replace {publisherName} with the name of your publisher.  
  
-   Replace {partitionId} with the ID of a partition on an Event Hub.  
  
-   Set the Content-Type header to **application/atom+xml;type=entry;charset=utf-8**.  
  
-   Set the Authorization header to a SAS token (see the [Generate SAS token](generate-sas-token.md) section for more information), or a WRAPv0.9.7.2 token containing a SimpleWebToken acquired from ACS. Set to WRAP access_token=”{swt}”.  
  
-   (Optional) Set the x-ms-retrypolicy header to `NoRetry`, to disable automatic retry on send operations in the case of transient errors.  
  
-   Set the optional {BrokerProperties} header to a JSON-encoded list of `BrokerProperties`. For example, to target a specific partition via `PartitionKey`, use the following example:  
  
    ```  
    POST https://your-namespace.servicebus.windows.net/your-event-hub/messages?timeout=60&api-version=2014-01 HTTP/1.1  
    Authorization: SharedAccessSignature sr=your-namespace.servicebus.windows.net&sig=tYu8qdH563Pc96Lky0SFs5PhbGnljF7mLYQwCZmk9M0%3d&se=1403736877&skn=RootManageSharedAccessKey  
    Content-Type: application/atom+xml;type=entry;charset=utf-8  
    Host: your-namespace.servicebus.windows.net  
    BrokerProperties: {"PartitionKey": "32119834-65f3-48c1-b366-619df2e4c400"}  
  
    { "DeviceId":"dev-01", "Temperature":"37.0" }  
    ```  
  
-   Set the optional UserProperties header to a list of custom properties with property name as key and property value as value. For example:  
  
    ```  
    WindAlert: Strong Winds  
    GeneralAlert: Thunderstorms  
  
    ```  
  
## Tasks  
 You can perform the following publisher policy operations:  
  
-   [Send event](send-event.md)  
  
-   Se[Send event with publisher ID](send-event-with-publisher-id.md)  
  
-   [Send partition event](send-partition-event.md)  
  
-   [Send batch events](send-batch-events.md)