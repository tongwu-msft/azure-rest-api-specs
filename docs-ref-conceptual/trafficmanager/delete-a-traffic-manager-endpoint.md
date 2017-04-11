---
title: Delete a Traffic Manager endpoint
ms.date: 03/23/2017
ms.service: traffic-manager
ms.devlang: rest-api
ms.topic: reference
author: georgewallace
ms.author: gwallace
manager: timlt
---
# Delete a Traffic Manager endpoint
Each profile contains a list of endpoints.  These endpoints are child resource of the profile, each with their own unique resource id.  Thus an endpoint can be deleted in two ways: both by updating the endpoints list in the profile, or by deleting the endpoint resource directly.  
  
This page explains the latter approach—how to delete an individual Traffic Manager endpoint directly as a child resource within an existing profile.  

For information about getting started with Azure REST operations including request authentication, see [Azure REST API Reference](../../index.md).
  
## Request  

|Method|Request URI|  
|------------|-----------------|  
|DELETE|`/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/trafficManagerProfiles/{profileName}/{endpointType}/{endpointName}?api-version={api-version}`|  

| Parameter | Description |
| --------- | ----------- |
| subscriptionId | The identifier of your subscription where the Traffic Manager endpoint exists. |
| resourceGroupName | The name of the resource group that contains the Traffic Manager endpoint. |
| profileName | The name of the Traffic Manager profile.|
| endpointType | The type of endpoint.  One of: azureEndPoints, externalEndpoints, or nestedEndpoints |
| endpointName | The name of the Traffic Manager endpoint. |
| api-version | The version of the API to use. The current version is 2017-03-01. | 
  
## Response  
 **Status code:** 200 or 204 depending on whether the Traffic Manager endpoint was deleted or was not found:
