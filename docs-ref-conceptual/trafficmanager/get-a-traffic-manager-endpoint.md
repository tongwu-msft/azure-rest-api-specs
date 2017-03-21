---
title: "Get a Traffic Manager endpoint"
ms.custom: ""
ms.date: "2016-02-01"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "traffic-manager"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: c4600957-4f13-4e84-8502-541c62a8670d
caps.latest.revision: 3
ms.author: "v-joagut"
manager: "carolz"
---
# Get a Traffic Manager endpoint
Each profile contains a list of endpoints.  These endpoints are child resource of the profile, each with their own unique ARM resource id.  Thus an endpoint can be retrieved in two ways: both by retrieving the profile, or by retrieving the endpoint resource directly.  

 This page explains the latter approach—how to retrieve an individual Traffic Manager endpoint directly as a child resource within an existing profile.  

## Request  
 See [Traffic Manager profiles and endpoints](traffic-manager-profiles-and-endpoints.md) for headers and parameters that are used by all requests related to Traffic Manager profiles and endpoints.  

|Method|Request URI|  
|------------|-----------------|  
|GET|`/subscriptions/{subscriptionId}/resourceGroups/{resource-group-name}/providers/Microsoft.Network/trafficManagerProfiles/{profile-name}/{endpoint-type}/{endpoint-name}?api-version={api-version}`|  

 Replace {profile-name} with the name of the Traffic Manager profile.  

 Replace {endpoint-type} with the type of the endpoint, one of:  

-   azureEndpoints  

-   externalEndpoints  

-   nestedEndpoints  

 Replace {endpoint-name} with the name of the endpoint.  

## Response  
 **Status code:** 200 OK or 404 Not Found.  

 Example 1: AzureEndpoints  

```json  
{  
  "id": "{ARM resource ID of this endpoint}",  
  "name": "{endpoint-name}",  
  "type": "Microsoft.Network/trafficManagerProfiles/azureEndpoints",  
  "properties": {  
    "endpointStatus": "Enabled",  
    "endpointMonitorStatus": "Online"  
    "targetResourceId": "{resource ID of target resource in Azure}",  
    "target": "myapp.azurewebsites.net",  
    "weight": 10,  
    "priority": 3  
    "endpointLocation": "centralus"  
  }  
}  
```  

 Example 2: ExternalEndpoints  

```json  
{  
  "id": "{ARM resource ID of this endpoint}",  
  "name": "{endpoint-name}",  
  "type": "Microsoft.Network/trafficManagerProfiles/externalEndpoints",  
  "properties": {  
    "endpointStatus": "Enabled",  
    "endpointMonitorStatus": "Online"  
    "target": "myendpoint.contoso.com",  
    "weight": 10,  
    "priority": 5,  
    "endpointLocation": "northeurope"  
  }  
}  
```  

 Example 3: NestedEndpoints  

```json  
{  
  "id": "{ARM resource ID of this endpoint}",  
  "name": "{endpoint-name}",  
  "type": "Microsoft.Network/trafficManagerProfiles/nestedEndpoints",  
  "properties": {  
    "endpointStatus": "Enabled",  
    "endpointMonitorStatus": "Online"  
    "targetResourceId": "{resource ID of child Traffic Manager profile}",  
    "weight": 10,  
    "priority": 1,  
    "endpointLocation": "westeurope",  
    "minChildEndpoints": 1,
    "geoMapping": [
                "GEO-EU",
                "GEO-AF"
            ]

  }  
}  
```  

|Element name|Description|  
|------------------|-----------------|  
|id|Specifies the ARM resource ID of the endpoint.  Each endpoint is a child resource of the parent profile resource, hence each endpoint has a unique ARM resource ID.|  
|name|Specifies the name (ARM resource name) of the endpoint.|  
|type|Specifies the type of the endpoint.|  
|properties|Container for settings relating to this Traffic Manager endpoint.|  
|target|The fully-qualified DNS name of the endpoint.  Traffic Manager returns this value in DNS responses when it directs traffic to this endpoint.<br /><br /> Applicable to endpoints of type ‘AzureEndpoints’ and ‘ExternalEndpoints’ only.|  
|targetResourceId|For endpoints of type ‘AzureEndpoints’, this specifies resource ID of the resource in Azure that this endpoint will direct traffic to.<br /><br /> For endpoints of type ‘NestedEndpoints’, this specifies the resource ID of the child profile that this endpoint will direct traffic to.<br /><br /> This parameter is not applicable to endpoints of type ‘ExternalEndpoints’.|  
|endpointStatus|Specifies the status of the endpoint. If the endpoint is Enabled, it is probed for endpoint health and is included in the traffic routing method.<br /><br /> Possible values are:<br /><br /> -   Enabled<br />-   Disabled|  
|weight|Specifies the weight assigned by Traffic Manager to the endpoint.|  
|priority|Specifies the priority of this endpoint when using the ‘Priority’ traffic routing method.|  
|endpointLocation|Specifies the location of the endpoint.  This value is used in the ‘Performance’ traffic-routing method when determining which endpoint is closest to the end user.|  
|endpointMonitorStatus|Indicates the health status for the endpoint.<br /><br /> This is a read-only property.  Possible values are:<br /><br /> -   Online<br />-   Degraded<br />-   Inactive<br />-   Disabled<br />-   Stopped<br />-   CheckingEndpoint<br /><br /> See [About Traffic Manager Monitoring](https://azure.microsoft.com/documentation/articles/traffic-manager-monitoring/) for further details.|  
|minChildEndpoints|This parameter specifies the minimum number of endpoints that must be ‘online’ in the child profile in order for the parent profile to direct traffic to any of the endpoints in that child profile.<br /><br /> It only applies to endpoints of type NestedEndpoints.|
|geoMapping|This parameter specifies the geographic regions that are mapped to this endpoint. <br /><br /> It is only used if the endpoint is part of a profile that has routing type Geographic (for which it is required).|
