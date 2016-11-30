---
title: "Consumer Groups"
ms.custom: ""
ms.date: "2016-08-12"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "event-hubs"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
helpviewer_keywords: 
  - "Event Hubs REST"
ms.assetid: 83a39521-e60f-48c8-be1a-5b916f95ad7c
caps.latest.revision: 7
author: "sethmanheim"
ms.author: "sethm"
manager: "timlt"
---
# Consumer Groups
These APIs enable you to create and manage Event Hubs consumer groups.  
  
##  <a name="bk_common"></a> Common parameters and headers  
 The following information is common to all tasks that you might do related to the Event Hubs resource provider:  
  
-   Replace {subscriptionId} with your subscription identifier in the URI.  
  
-   Replace {api-version} with “2015-08-01” in the URI.  
  
-   Set the Content-Type header to **application/json**.  
  
-   Set the Authorization header to a JSON Web Token that you obtain from Azure Active Directory. For more information, see [Authenticating Azure Resource Manager requests](https://msdn.microsoft.com/library/dn790557.aspx).  
  
-   Replace {resourceGroupName} with the resource group name within your subscriptionId. For more information, see [Using Resource groups to manage your Azure resources](http://azure.microsoft.com/documentation/articles/azure-preview-portal-using-resource-groups/).  
  
-   Replace {namespaceName} with the name of the namespace you created on the portal.  
  
-   Replace {eventHubName} with the name of the Event hub you created on the portal. This name must be unique within a Service Bus namespace; there can be no other queue, topic, or Event hub with the same name in the same namespace.  
  
-   Replace {consumerGroupName} with the name of the consumer group you created on the portal.  
  
## Tasks  
 You can do the following with consumer groups:  
  
-   [Create a consumer group](create-consumer-group1.md)  
  
-   [Update a consumer group](update-consumer-group.md)  
  
-   [Delete a consumer group](delete-consumer-group1.md)  
  
-   [Get a consumer group](get-consumer-group1.md)  
  
-   [Get all consumer groups in an Event hub](get-all-consumer-groups.md)