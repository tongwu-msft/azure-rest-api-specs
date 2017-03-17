---
title: "Subnets"
ms.date: 03/15/2017
ms.service: virtual-network
ms.topic: reference
ms.devlang: rest
author: georgewallace
ms.author: gwallace
ms.manager: timlt
---
# Subnets
Subnets represent network segments within the IP space defined by the virtual network.  
  
 Subnets are child resources of a virtual network. Subnets have names unique within a VNET and they can be addressed via URIs. Subnets can be added and deleted by updating VNET or via PUT/DELETE against individual subnets.  
  
##  <a name="bk_common"></a> Common parameters and headers  
 The following information is common to all tasks:  
  
-   Replace {api-version} with **2016-09-01**.  
  
-   Replace {subscription-id} with your subscription identifier in the URI.  
  
-   Replace {resource-group-name} with the resource group. For more information, see [Using Resource groups to manage your Azure resources](http://azure.microsoft.com/documentation/articles/azure-preview-portal-using-resource-groups).  
  
-   Replace {virtual-network-name} with the name of the virtual network that contains the subnet.  
  
-   Set the Content-Type header to application/json.  
  
-   Set the Authorization header to a JSON Web Token that you obtain from Azure Active Directory. For more information, see [Authenticating Azure Resource Manager requests](../../index.md).  
  
## Tasks  
 You can do the following with subnets:  
  
-   [Create or update a subnet](create-or-update-a-subnet.md)  
  
-   [Delete a subnet](delete-a-subnet.md)  
  
-   [Get information about a subnet](get-information-about-a-subnet.md)  
  
-   [List subnets within a virtual network](list-subnets-within-a-virtual-network.md)
