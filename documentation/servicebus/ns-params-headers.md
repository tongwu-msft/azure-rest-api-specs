---
title: "Common parameters and headers: namespaces"
ms.custom: ""
ms.date: "2016-11-11"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "service-bus-messaging"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 0cca3760-d5f0-4228-9bca-def63484c774
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

# Common parameters and headers: Service Bus namespaces
  
The following information is common to all tasks that you might do related to Service Bus namespaces:  
  
-   Replace {subscriptionId} with your subscription identifier in the URI.  
  
-   Replace {api-version} with “2015-08-01” in the URI.  
  
-   Set the Content-Type header to **application/json**.  
  
-   Set the Authorization header to a JSON Web Token that you obtain from Azure Active Directory. For more information, see [Authenticating Azure Resource Manager requests](https://msdn.microsoft.com/library/dn790557.aspx).  
  
-   Replace {subscriptionId} with the Azure subscription ID.  
  
-   Replace {resourceGroupName} with the resource group name within the subscriptionId. For more information, see [Using the Azure Portal to deploy and manage your Azure resources](https://azure.microsoft.com/documentation/articles/resource-group-portal/).  
  
-   Replace {namespaceName} with the name of the namespace you created on the portal.  
  
-   Replace {authRuleName} with the name of an authorization rule.  
  
 The following properties are common to namespace management operations:  
  
|Property|Description|  
|--------------|-----------------|  
|**id**|Specifies the identifying URL of the resource.|  
|**provisioningState**|Creating &#124; Activating|  
|**type**|Microsoft.ServiceBus/namespaces|  
|**name**|Specifes the name of the resource.|  
|**location**|Specifies the supported Azure location in which the resource exists. For more information, see the [List all of the available geo-locations](https://azure.microsoft.com/regions/).|  
|**tags**|Specifies the name/value pairs that can be used to categorize resources.|  
|**kind**|[NamespaceType](https://msdn.microsoft.com/library/azure/microsoft.servicebus.management.namespacetype.aspx) of the namespace.|  
|**sku**|The messaging tier of the namespace.|  
|**properties**|[Detailed list of properties](https://msdn.microsoft.com/library/azure/microsoft.servicebus.management.namespacedescription_properties.aspx) that define the desired semantics for a Service Bus namespace.|  
