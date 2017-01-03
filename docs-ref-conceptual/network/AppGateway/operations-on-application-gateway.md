---
title: "Operations on Application Gateway"
ms.custom: ""
ms.date: "2016-02-18"
ms.prod: "azure"
ms.reviewer: ""
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: a8c78964-af7c-444a-b0ce-ec26b4a7e71f
caps.latest.revision: 5
author: "georgewallace"
ms.author: "gwallace"
manager: "carmonm"
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
# Operations on Application Gateway
Enables you to manage application gateways. It includes operations such as create, update, configure SSL, cookie affinity and others using RESTful API calls.  
  
##  <a name="bk_common"></a> Common parameters and headers  
 The following information is common to all tasks:  
  
-   Replace {api-version} with **2015-05-04-preview**.  
  
-   Replace {subscription-id} with your subscription identifier in the URI.  
  
-   Replace {resource-group-name} with the resource group. For more information, see [Using Resource groups to manage your Azure resources](http://azure.microsoft.com/en-us/documentation/articles/azure-preview-portal-using-resource-groups/) .  
  
-   Set the Content-Type header to **application/json**.  
  
-   Set the Authorization header to a JSON Web Token that you obtain from Azure Active Directory. For more information, see [“Authenticating Azure Resource Manager requests”](https://msdn.microsoft.com/en-us/library/azure/dn790557.aspx).  
  
## Tasks  
 You can do the following with application gateways:  
  
-   [Create or update an application gateway](../appgateway/create-or-update-an-application-gateway.md)  
  
-   [Get Application Gateway](../appgateway/get-application-gateway.md)  
  
-   [List application gateways (GET)](../appgateway/list-application-gateways--get-.md)  
  
-   [Delete Application Gateway (DELETE)](../appgateway/delete-application-gateway--delete-.md)  
  
-   [Start Application Gateway](../appgateway/start-application-gateway.md)  
  
-   [Stop Application Gateway](../appgateway/stop-application-gateway.md)