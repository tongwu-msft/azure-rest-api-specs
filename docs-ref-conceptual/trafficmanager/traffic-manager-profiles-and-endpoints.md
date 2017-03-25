---
title: "Traffic Manager profiles and endpoints"
ms.custom: ""
ms.date: "2016-02-01"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "traffic-manager"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: d066cb34-75f0-46ff-9881-4e6b5d87d3da
caps.latest.revision: 7
ms.author: "cherylmc"
manager: "carolz"
---
# Traffic Manager profiles and endpoints
Enables you to manage Azure Traffic Manager profiles and endpoints.  

 Each profile contains a list of endpoints.  These endpoints are child resource of the profile, each with their own unique ARM resource id.  Thus endpoints can be managed in two ways: both by modifying the endpoints list when updating a profile, or by modifying the endpoint resource directly.  

##  <a name="bk_common"></a> Common parameters and headers  
 The following information is common to all tasks:  

-   Replace {api-version} with **2017-03-01**  

-   Replace {subscription-id} with your subscription identifier in the URI.  

-   Replace {resource-group-name} with the resource group. For more information, see ["Using resource groups to manage your Azure resources"](http://azure.microsoft.com/en-us/documentation/articles/azure-preview-portal-using-resource-groups/)  

-   Set the Content-Type header to **application/json**.  

-   Set the Authorization header to a JSON Web Token that you obtain from Azure Active Directory. For more information, see [Authenticating Azure Resource Manager requests](../../index.md)  

## Tasks  
 The Traffic Manager REST API supports the following operations on Traffic Manager profiles:  

-   [Create or update a Traffic Manager profile](create-or-update-a-traffic-manager-profile.md)  

-   [Get a Traffic Manager profile](get-a-traffic-manager-profile.md)  

-   [Delete a Traffic Manager profile](delete-a-traffic-manager-profile.md)  

-   [List Traffic Manager profiles](list-traffic-manager-profiles.md)  

 In addition, the Traffic Manager REST API supports the following operations on individual Traffic Manager endpoints:  

-   [Create or update a Traffic Manager endpoint](create-or-update-a-traffic-manager-endpoint.md)  

-   [Get a Traffic Manager endpoint](get-a-traffic-manager-endpoint.md)  

-   [Delete a Traffic Manager endpoint](delete-a-traffic-manager-endpoint.md)  

 To list the endpoints in a profile, see [Get a Traffic Manager profile](get-a-traffic-manager-profile.md)

  To get the hierarchical list of regions that can be used with the geographic routing method, see [List the regions used by Traffic Manager Geographic routing type](list-geo-regions-traffic-manager.md)
