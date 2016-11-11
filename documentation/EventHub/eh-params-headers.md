---
title: "Common parameters and headers: Event Hubs"
ms.custom: ""
ms.date: "2016-11-11"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "event-hubs"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 4e645ff5-4f5c-42cc-bcae-2d6f4c003e6b
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

# Common parameters and headers: Event Hubs

The following information is common to all tasks that you might do related to the Event Hubs resource provider:  
  
-   Replace {subscriptionId} with your Azure subscription identifier.  
  
-   Replace {api-version} with “2015-08-01”.  
  
-   Set the Content-Type header to **application/json**.  
  
-   Set the Authorization header to a JSON Web Token that you obtain from Azure Active Directory. For more information, see [Authenticating Azure Resource Manager requests](https://msdn.microsoft.com/library/dn790557.aspx).  
  
-   Replace {resourceGroupName} with the resource group name within your subscriptionId. For more information, see [Using Resource groups to manage your Azure resources](http://azure.microsoft.com/documentation/articles/azure-preview-portal-using-resource-groups/).  
  
-   Replace {namespaceName} with the name of the namespace you created on the Azure portal.  
  
-   Replace {eventhubName} with the name of the Event Hub you created on the portal. This name must be unique within a Service Bus namespace; there can be no other queue, topic, or Event Hub with the same name in the same namespace.  
  
-   Replace {authorizationRuleName} with the name of the authorization rule.  
