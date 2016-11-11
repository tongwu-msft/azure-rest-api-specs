---
title: "Common parameters and headers: subscriptions"
ms.custom: ""
ms.date: "2016-11-11"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "service-bus-messaging"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: c61bd2c3-ac92-4047-9a8c-de5274035dc8
caps.latest.revision: 1
author: "sethmanheim"
ms.author: "sethm"
manager: "timlt"
translation.priority.mt: 
  - "de-de"
  - "es-es"
  - "fr-fr"
  - "it-it"
  - "ja-jp"
  - "ko-kr"
  - "pt-br"
  - "ru-ru"
  - "zh-cn"
  - "zh-tw"
---

# Common parameters and headers: Service Bus topic subscriptions
  
 The following information is common to all tasks that you might do related to Service Bus subscriptions:  
  
-   Replace {subscriptionId} with your subscription identifier in the URI.  
  
-   Replace {api-version} with “2014-09-01” in the URI.  
  
-   Set the Content-Type header to **application/json**.  
  
-   Set the Authorization header to a JSON Web Token that you obtain from Azure Active Directory. For more information, see [Authenticating Azure Resource Manager requests](https://msdn.microsoft.com/library/dn790557.aspx).  
  
-   Replace {resourceGroupName} with the resource group name within your subscriptionId. For more information, see [Using Resource groups to manage your Azure resources](http://azure.microsoft.com/documentation/articles/azure-preview-portal-using-resource-groups/).  
  
-   Replace {namespaceName} with the name of the namespace you created on the portal.  
  
-   Replace {queueName} with the name of the queue you created on the portal.  
  
-   Replace {topicName} with the name of the topic you created on the portal.  
  
-   Replace {subscriptionName} with the name of the topic subscription you created on the portal.  
  
-   Replace {eventhubName} with the name of the Event hub you created on the portal. This name must be unique within a Service Bus namespace; there can be no other queue, topic, or Event hub with the same name in the same namespace.  
  
-   Replace {ConsumerGroupName} with the name of the consumer group you created on the portal.  
