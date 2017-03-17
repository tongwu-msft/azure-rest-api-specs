---
title: "Routes"
ms.date: 03/15/2017
ms.service: virtual-network
ms.topic: reference
ms.devlang: rest
author: georgewallace
ms.author: gwallace
ms.manager: timlt
---
# Routes
Route resource describes the packet forwarding rule for a given IP address or a range of IP addresses.  A route resource is associated with a route table.  
  
##  <a name="bk_common"></a> Common parameters and headers  
 The following information is common to all tasks:  
  
-   Replace {api-version} with **2016-09-01**.  
  
-   Replace {subscription-id} with your subscription identifier in the URI.  
  
-   Replace {resource-group-name} with the resource group. For more information, see [Using Resource groups to manage your Azure resources](http://azure.microsoft.com/documentation/articles/azure-preview-portal-using-resource-groups).  
  
-   Set the Content-Type header to application/json.  
  
-   Set the Authorization header to a JSON Web Token that you obtain from Azure Active Directory. For more information, see [Authenticating Azure Resource Manager requests](../../index.md).  
  
## Tasks  
 You can do the following with Routes:  
  
-   [Create or update a route](create-or-update-a-route.md)  
  
-   [Delete a route](delete-a-route.md)  
  
-   [Get information about a route](get-information-about-a-route.md)  
  
-   [List routes within a route table](list-routes-within-a-route-table2.md)
