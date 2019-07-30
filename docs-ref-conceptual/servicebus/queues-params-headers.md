---
title: "Common parameters and headers: queues"
ms.custom: ""
ms.date: "2016-11-11"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "service-bus-messaging"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 78095adf-a6a3-456d-8a52-63b5d059b28c
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

# Common parameters and headers: Service Bus queues
  
The following information is common to all tasks that you might do related to Service Bus queues:  
  
-   Replace {subscriptionId} with your subscription identifier in the URI.  
  
-   Replace {api-version} with “2015-08-01” in the URI.  
  
-   Set the Content-Type header to **application/json**.  
  
-   Set the Authorization header to a JSON Web Token that you obtain from Azure Active Directory. For more information, see [Authenticating Azure Resource Manager requests](/rest/api/resources).  
  
-   Replace {resourceGroupName} with the resource group name within your subscriptionId. For more information, see [Manage resource groups](/azure/azure-resource-manager/manage-resource-groups-portal).  
  
-   Replace {namespaceName} with the name of the namespace you created on the portal.  
  
-   Replace {queueName} with the name of the queue you created on the portal.  
  
-   Replace {authorizationRuleName} with the name of the authorization rule.  
  
