---
title: "Delete a Traffic Manager profile"
ms.custom: ""
ms.date: "2016-02-01"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "traffic-manager"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: e820aefd-0f9c-4294-832d-6ea91fa7549d
caps.latest.revision: 8
ms.author: "cherylmc"
manager: "carolz"
---
# Delete a Traffic Manager profile
Delete an existing Traffic Manager profile.  
  
## Request  
 See [Common parameters and headers](../TrafficManagerREST/traffic-manager-profiles-and-endpoints.md#bk_common) for headers and parameters that are used by all requests related to Traffic Manager profiles and endpoints.  
  
|Method|Request URI|  
|------------|-----------------|  
|DELETE|`https://management.azure.com/subscriptions/{subscription-id}/resourceGroups/{resource-group-name}/providers/Microsoft.Network/trafficManagerProfiles/{profile-name}?api-version={api-version}`|  
  
 *Replace {profile-name} with the name of the Traffic Manager profile to be deleted.*  
  
## Response  
 **Status code:** 200 or 204 depending on whether the Traffic Manager profile was deleted or was not found.