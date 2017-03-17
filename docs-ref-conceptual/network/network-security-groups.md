---
title: "Network Security Groups"
ms.date: 03/15/2017
ms.service: virtual-network
ms.topic: reference
ms.devlang: rest
author: georgewallace
ms.author: gwallace
ms.manager: timlt
---
# Network Security Groups
A network security group (NSG) resource contains a list of network security rules. NSGs enable inbound or outbound traffic to be enabled or denied.  
  
 NSGs are created with a set of default network security rules which are designed to enable all communications from and within a virtual network, but deny external access to same.  
  
 NSGs can be assigned to subnets or individual NICs. Where NSGs are assigned to both a subnet and a NIC, the combination of both NSGs applies to that NIC.  
  
##  <a name="bk_common"></a> Common parameters and headers  
 The following information is common to all tasks:  
  
-   Replace {api-version} with **2016-09-01**.  
  
-   Replace {subscription-id} with your subscription identifier in the URI.  
  
-   Replace {resource-group-name} with the resource group. For more information, see [Using Resource groups to manage your Azure resources](http://azure.microsoft.com/en-us/documentation/articles/azure-preview-portal-using-resource-groups) .  
  
-   Set the Content-Type header to application/json.  
  
-   Set the Authorization header to a JSON Web Token that you obtain from Azure Active Directory. For more information, see [Authenticating Azure Resource Manager requests](../../index.md).  
  
## Tasks  
 You can do the following with network security groups:  
  
-   [Create or update a network security group](create-or-update-a-network-security-group.md)  
  
-   [Delete a network security group](delete-a-network-security-group.md)  
  
-   [Get information about a network security group](get-information-about-a-network-security-group.md)  
  
-   [List network security groups within a resource group](list-network-security-groups-within-a-resource-group.md)

-   [Get effective network security group](get-effective-network-security-group.md)
