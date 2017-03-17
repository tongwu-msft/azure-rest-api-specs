---
title: "Network Security Rules"
ms.date: 03/15/2017
ms.service: virtual-network
ms.topic: reference
ms.devlang: rest
author: georgewallace
ms.author: gwallace
ms.manager: timlt
---
# Network Security Rules
Network security rules define a pattern of traffic to be enabled or denied. Network security rules are contained within a Network Security Group (NSG). NSGs can be applied at the subnet or NIC level.  
  
 Default network security rules are created to protect your virtual network by default. It is not possible to edit or delete a default network security rule, but they can be overridden by creating a network security rule with a lower priority. Default network security rules have priorities of 65000 and greater. To override a default network security rule, create a network security rule with a priority of less than 65000.  
  
##  <a name="bk_common"></a> Common parameters and headers  
 The following information is common to all tasks:  
  
-   Replace {api-version} with **2016-09-01**.  
  
-   Replace {subscription-id} with your subscription identifier in the URI.  
  
-   Replace {resource-group-name} with the resource group. For more information, see [Using Resource groups to manage your Azure resources](http://azure.microsoft.com/en-us/documentation/articles/azure-preview-portal-using-resource-groups).  
  
-   Set the Content-Type header to application/json.  
  
-   Set the Authorization header to a JSON Web Token that you obtain from Azure Active Directory. For more information, see [Authenticating Azure Resource Manager requests](../../index.md).  
  
## Tasks  
 You can do the following with Network Security Rules:  
  
-   [Create or update a network security rule](create-or-update-a-network-security-rule.md)  
  
-   [Delete a network security rule](delete-a-network-security-rule.md)  
  
-   [Get information about a default network security rule ](get-information-about-a-default-network-security-rule.md)  
  
-   [Get information about a network security rule ](get-information-about-a-network-security-rule.md)  
  
-   [List default networks security rules within a network security group](list-default-networks-security-rules-within-a-network-security-group.md)  
  
-   [List networks security rules within a network security group](list-networks-security-rules-within-a-network-security-group.md)

-   [Get effective route table](get-effective-route-table.md)