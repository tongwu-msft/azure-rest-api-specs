---
title: "Delete a Traffic Manager endpoint"
ms.custom: ""
ms.date: "2016-02-01"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "traffic-manager"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: bba5bc01-7371-457c-a74a-71c6e79cc4af
caps.latest.revision: 3
ms.author: "v-joagut"
manager: "carolz"
---
# Delete a Traffic Manager endpoint
Each profile contains a list of endpoints.  These endpoints are child resource of the profile, each with their own unique ARM resource id.  Thus an endpoint can be deleted in two ways: both by updating the endpoints list in the profile, or by deleting the endpoint resource directly.  
  
 This page explains the latter approach—how to delete an individual Traffic Manager endpoint directly as a child resource within an existing profile.  
  
## Request  
 See [Traffic Manager profiles and endpoints](../TrafficManagerREST/traffic-manager-profiles-and-endpoints.md) for headers and parameters that are used by all requests related to Traffic Manager profiles and endpoints.  
  
|Method|Request URI|  
|------------|-----------------|  
|DELETE|`https://management.azure.com/subscriptions/{subscription-id}/resourceGroups/{resource-group-name}/providers/Microsoft.Network/trafficManagerProfiles/{profile-name}/{endpoint-type}/{endpoint-name}?api-version={api-version}`|  
  
 Replace {profile-name} with the name of the Traffic Manager profile.  
  
 Replace {endpoint-type} with the type of the endpoint, one of:  
  
-   azureEndpoints  
  
-   externalEndpoints  
  
-   nestedEndpoints  
  
 Replace {endpoint-name} with the name of the endpoint.  
  
## Response  
 **Status code:** 200 or 204 depending on whether the Traffic Manager endpoint was deleted or was not found: