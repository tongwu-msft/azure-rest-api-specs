---
title: "Publisher policy operations"
ms.custom: ""
ms.date: "2016-11-14"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "event-hubs"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 7131e270-4f57-4818-8bd4-88fbe14073c8
caps.latest.revision: 5
author: "sethmanheim"
ms.author: "sethm"
manager: "timlt"
---
# Publisher policy operations
These APIs enable you to perform publisher policy operations on Event Hubs.  
  
##  <a name="bk_common"></a> Common parameters and headers  
 The following information is common to all tasks that you might do related to Event Hubs publisher policy:  
  
-   Replace {api-version} with "2014-01" in the URL.  
  
-   Replace {servicebusNamespace} with the namespace obtained from the Azure classic portal.  
  
-   Replace {eventHubPath} with the path to your Event Hub.  
  
-   Replace {publisherName} with the name of your publisher.  
  
-   Set the Content-Type header to **application/atom+xml;type=entry;charset=utf-8**.  
  
-   Set the Authorization header to a SAS token (see the [Generate SAS token](generate-sas-token.md) section for more information), or a WRAPv0.9.7.2 token containing a SimpleWebToken acquired from ACS. Set to WRAP access_token=”{swt}”.  
  
## Tasks  
 You can perform the following publisher policy operations:  
  
-   [Get revoked publishers](get-revoked-publishers.md)  
  
-   [Revoke publisher](revoke-publisher.md)  
  
-   [Resume publisher](resume-publisher.md)