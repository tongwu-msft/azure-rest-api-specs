---
title: "Application Gateway REST"
ms.custom: ""
ms.date: "2016-02-17"
ms.prod: "azure"
ms.reviewer: ""
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: ed66e2e5-ed60-4d12-ac1e-a8e215395a57
caps.latest.revision: 4
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
# Application Gateway REST
Application Gateway is a Network Service which provides HTTP Load balancing as a Service to Azure customers. This is a fully managed service implemented as dedicated Hosted Service in a subscription owned by Gateway Manager but deployed in customer vnet. In addition to basic HTTP Load balancing, it provides other Layer 7 features like Cookie based client affinity and SSL offload, URL routing and multi-site hosting.  

##  <a name="bk_common"></a> Common parameters and headers  
 The following information is common to all tasks:  
  
-   Replace {api-version} with **2016-09-01**.  
  
-   Replace {subscription-id} with your subscription identifier in the URI.  
  
-   Replace {resource-group-name} with the resource group. For more information, see [Using Resource groups to manage your Azure resources](http://azure.microsoft.com/en-us/documentation/articles/azure-preview-portal-using-resource-groups/) .  
  
-   Set the Content-Type header to **application/json**.  
  
-   Set the Authorization header to a JSON Web Token that you obtain from Azure Active Directory. For more information, see ["Authenticating Azure Resource Manager requests"](../../index.md). 

For information about getting started with Azure REST operations including request authentication, see [Azure REST API Reference](../../index.md).

## Tasks  
 You can do the following with application gateways:  
  
-   [Create or update an application gateway](create-or-update-an-application-gateway.md)  
  
-   [Get Application Gateway](get-application-gateway.md)  
  
-   [List application gateways (GET)](list-application-gateways--get-.md)  
  
-   [Delete Application Gateway (DELETE)](delete-application-gateway--delete-.md)  
  
-   [Start Application Gateway](start-application-gateway.md)  
  
-   [Stop Application Gateway](stop-application-gateway.md)
