---
title: "ExpressRoute REST"
ms.custom: ""
ms.date: "2015-09-25"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "expressroute"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 2a73ee64-0afa-47e7-bc5f-90be39ab3711
caps.latest.revision: 12
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
# ExpressRoute REST
The  Microsoft Azure ExpressRoute Resource Provider REST API allows you to create and modify ExpressRoute Circuit, BGP Peering entities. BGP Peering is child enity of ExpressRoute Circuit object. With this release ,AzureVirtualNetworkGateway and AzureVirtualNetworkGatewayConnection are also modified to support ExpressRoute.  
  
 See "[Using resource groups to manage your Azure resources](https://azure.microsoft.com/en-us/documentation/articles/resource-group-portal/)" for more details on resources groups and Azure resources.  
  
 All operations conform to the HTTP/1.1 protocol specification, you must make sure that requests made to these resources are secure. For more information, see “[Authenticating Azure Resource Manager requests](https://msdn.microsoft.com/en-us/library/azure/dn790557.aspx)”.  
  
 These APIs allow you to manage:  
  
-   [Operations on ExpressRoute Service Providers](operations-on-expressroute-service-providers.md)  
  
-   [Operations on ExpressRoute Circuits](operations-on-expressroute-circuits.md)  
  
-   [Operations on ExpressRoute BGP Peering](operations-on-expressroute-bgp-peering.md)  
  
##  <a name="bk_common"></a> Common parameters and headers  
 The following information is common to all tasks:  
  
-   Replace {api-version} with **2016-09-01**.  
  
-   Replace {subscription-id} with your subscription identifier in the URI.  
  
-   Replace {resource-group-name} with the resource group. For more information, see Using Resource groups to manage your Azure resources.  
  
-   Set the Content-Type header to application/json.  
  
-   Set the Authorization header to a JSON Web Token that you obtain from Azure Active Directory. For more information, see “[Authenticating Azure Resource Manager requests](https://msdn.microsoft.com/en-us/library/azure/dn790557.aspx)”.