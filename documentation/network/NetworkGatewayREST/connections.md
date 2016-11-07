---
title: "Connections"
ms.custom: ""
ms.date: "05/03/2015"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "virtual-network"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 5980a5a9-acb0-46bd-94fb-6c0dc50eee29
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
# Connections
The Connection resource represents a connection between two gateways. One of the gateways in the connection must be a virtual network gateway, but the other gateway could be another virtual network gateway, a local network gateway, or a dedicated circuit.  
  
## Common parameters and headers  
 The following information is common to all tasks that you might do related to connections:  
  
-   Replace {api-version} with 2015-05-01-preview.  
  
-   Replace {subscription-id} with your subscription identifier in the URI.  
  
-   Replace {resource-group-name} with the name of the resource group. For more information, see [Using Resource groups to manage your Azure resources](http://azure.microsoft.com/en-us/documentation/articles/azure-preview-portal-using-resource-groups/).  
  
-   Replace {virtual-network-gateway-name} with the name of the virtual network gateway.  
  
-   Set the Content-Type header to `application/json`.  
  
-   Set the Authorization header to a JSON Web Token that you obtain from Azure Active Directory. For more information, see [Authenticating Azure Resource Manager requests](../Topic/Authenticating%20Azure%20Resource%20Manager%20requests.md).  
  
-   Replace {connection-name} with the name of the connection.  
  
## Tasks  
 You can do the following with connections:  
  
-   [Create or update a connection](../NetworkGatewayREST/create-or-update-a-connection.md)  
  
-   [Delete a connection ](../NetworkGatewayREST/delete-a-connection .md)  
  
-   [Get information about a connection ](../NetworkGatewayREST/get-information-about-a-connection .md)  
  
-   [Get the shared key for a connection ](../NetworkGatewayREST/get-the-shared-key-for-a-connection .md)  
  
-   [List all of the connections for a virtual network gateway ](../NetworkGatewayREST/list-all-of-the-connections-for-a-virtual-network-gateway .md)  
  
-   [Reset the shared key of a connection ](../NetworkGatewayREST/reset-the-shared-key-of-a-connection .md)  
  
-   [Set the shared key of a connection ](../NetworkGatewayREST/set-the-shared-key-of-a-connection .md)