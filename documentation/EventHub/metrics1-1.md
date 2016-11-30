---
title: "Metrics1 1"
ms.custom: ""
ms.date: "2016-11-14"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "event-hubs"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 2192dabe-ad05-457a-a404-7f1e8169fbe3
caps.latest.revision: 5
author: "sethmanheim"
ms.author: "sethm"
manager: "timlt"
---
# Metrics
These APIs enable you to obtain metrics for an Event Hub. You can also access this data either through the Azure portal or by using the [Service Bus Entity Metrics REST APIs]().  
  
##  <a name="bk_common"></a> Common parameters and headers  
 The following information is common to all tasks that you might do related to Event Hubs metrics:  
  
-   Replace {api-version} with "2012-03-01" in the URL.  
  
-   Replace {servicebusNamespace} with the namespace obtained from the Azure classic portal.  
  
-   Replace {eventHubPath} with the path to your Event Hub.  
  
-   Replace {partitionId} with the ID of a partition on an Event Hub.  
  
-   Replace {consumerGroupId} with the ID of a consumer group in an Event Hub.  
  
-   Set the Content-Type header to **application/json**.  
  
-   Set the Authorization header to a SAS token (see the [Generate SAS token](generate-sas-token.md) section for more information), or a WRAPv0.9.7.2 token containing a SimpleWebToken acquired from ACS. Set to WRAP access_token=”{swt}”.  
  
## Tasks  
 For information about how to compose the URL for getting available metrics and rollups, see the following pages:  
  
-   [Available resource paths for Event Hubs](available-resource-paths-for-event-hubs.md)  
  
-   [Available metrics for Event Hubs](available-metrics-for-event-hubs.md)  
  
-   [Get Supported Metrics]()  
  
-   [Get Metrics Rollups]()  
  
-   [Supported Rollups]()  
  
-   [Get Metrics Data]()