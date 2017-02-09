---
title: "Local Network Gateways&#160;"
ms.custom: ""
ms.date: "05/03/2015"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "virtual-network"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: e7e51c17-0153-4b26-bc89-ed43d644f843
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
# Local Network Gateways&#160;
Enables you to interact with on-premises VPN devices represented in the Gateway Manager.  
  
## Common parameters and headers  
 The following information is common to all tasks that you might do related to network gateways:  
  
-   Replace {api-version} with 2015-05-01-preview.  
  
-   Replace {subscription-id} with your subscription identifier in the URI.  
  
-   Replace {resource-group-name} with the name of the resource group. For more information, see [Using Resource groups to manage your Azure resources](http://azure.microsoft.com/en-us/documentation/articles/azure-preview-portal-using-resource-groups/).  
  
-   Replace {local-network-gateway-name} with the name of the virtual network gateway.  
  
-   Set the Content-Type header to `application/json`.  
  
-   Set the Authorization header to a JSON Web Token that you obtain from Azure Active Directory. For more information, see [Authenticating Azure Resource Manager requests](../Topic/Authenticating%20Azure%20Resource%20Manager%20requests.md).  
  
## Tasks  
  
 You can do the following with local network gateways:  
  
-   [Create or update a local network gateway ](../NetworkGatewayREST/create-or-update-a-local-network-gateway .md)  
  
-   [Delete a local network gateway](../NetworkGatewayREST/delete-a-local-network-gateway.md)  
  
-   [Get a VPN device configuration script](../NetworkGatewayREST/get-a-vpn-device-configuration-script.md)  
  
-   [Get information about a local network gateway](../NetworkGatewayREST/get-information-about-a-local-network-gateway.md)  
  
-   [List all of the local network gateways](../NetworkGatewayREST/list-all-of-the-local-network-gateways.md)