---
title: "Virtual Networks"
ms.date: 03/15/2017
ms.service: virtual-network
ms.topic: reference
ms.devlang: rest
author: georgewallace
ms.author: gwallace
ms.manager: timlt
---
# Virtual Networks
A virtual network represents a computer network in which networking objects can be created. The virtual network reserves an address space and defines subnets in this address space. The DHCP options defined on a virtual network by default get applied to the NICs connected to this network.  
  
##  <a name="bk_common"></a> Common parameters and headers  
 The following information is common to all tasks:  
  
-   Replace {api-version} with 2016-03-30.  
  
-   Replace {subscription-id} with your subscription identifier in the URI.  
  
-   Replace {resource-group-name} with the resource group. For more information, see [Using Resource groups to manage your Azure resources](http://azure.microsoft.com/documentation/articles/azure-preview-portal-using-resource-groups).  
  
-   Set the Content-Type header to application/json.  
  
-   Set the Authorization header to a JSON Web Token that you obtain from Azure Active Directory. For more information,  see [Authenticating Azure Resource Manager requests](../../index.md).  
  
## Tasks  
 You can do the following with Virtual Networks:  
  
-   [Create or update a virtual network](create-or-update-a-virtual-network.md)  
  
-   [List virtual networks within a resource group](list-virtual-networks-within-a-resource-group.md)  
  
-   [List virtual networks within a subscription](list-virtual-networks-within-a-subscription.md)  
  
-   [Get information about a virtual network](get-information-about-a-virtual-network.md)  
  
-   [Delete a virtual network](delete-a-virtual-network.md)

-   [Check private IP address availability in a virtual network](check-private-ip-address-availability.md)

-   [Create or update a virtual network peering](create-or-update-a-virtual-network-peering.md)

-   [List virtual network peerings within a virtual network](list-virtual-network-peerings-within-a-virtual-network.md)

-   [Get information about a virtual network peering](get-information-about-a-virtual-network-peering.md)

-   [Delete a virtual network peering](delete-a-virtual-network-peering.md)

