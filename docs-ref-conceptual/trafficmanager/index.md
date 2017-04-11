---
title: Traffic Manager REST
ms.date: 03/23/2017
ms.service: traffic-manager
ms.devlang: rest-api
ms.topic: reference
author: georgewallace
ms.author: gwallace
manager: timlt
---
# Traffic Manager REST

Microsoft Azure Traffic Manager allows you to control the distribution of user traffic for service endpoints in different datacenters. Service endpoints supported by Traffic Manager include Azure VMs, Web Apps, and cloud services. You can also use Traffic Manager with external, non-Azure endpoints.

Each profile contains a list of endpoints.  These endpoints are child resource of the profile, each with their own unique resource id.  Thus endpoints can be managed in two ways: both by modifying the endpoints list when updating a profile, or by modifying the endpoint resource directly.  

| Operation | REST Verb | Description | 
|---------|---------|-----------|
| [Create or update a Traffic Manager profile](create-or-update-a-traffic-manager-profile.md)    |  PUT | Creates or updates a Traffic Manager profile. |  
| [Get a Traffic Manager profile](get-a-traffic-manager-profile.md)       |  GET | Gets a Traffic Manager profile. | 
| [Delete a Traffic Manager profile](delete-a-traffic-manager-profile.md)    |  DELETE | Deletes a Traffic Manager profile. |  
| [List Traffic Manager profiles](list-traffic-manager-profiles.md)  |  GET | Lists all Traffic Manager profiles in a resource group. |    
| [Create or update a Traffic Manager endpoint](create-or-update-a-traffic-manager-endpoint.md)   |  PUT | Creates a Traffic Manager endpoint. |   
| [Get a Traffic Manager endpoint](get-a-traffic-manager-endpoint.md)     |  GET | Gets a Traffic Manager endpoint. |   
| [Delete a Traffic Manager endpoint](delete-a-traffic-manager-endpoint.md)   |  DELETE | Deletes Traffic Manager endpoint. |   
| [List the regions used by Traffic Manager Geographic routing type](list-geo-regions-traffic-manager.md)   |  GET | Gets the hierarchical list of regions that can be used with the geographic routing method. |   
