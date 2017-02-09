---
title: "Create or update a Traffic Manager endpoint"
ms.custom: ""
ms.date: "2016-02-01"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "traffic-manager"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: d2fc256d-0e38-45b5-b3c1-fed632f0ca81
caps.latest.revision: 3
ms.author: "v-joagut"
manager: "carolz"
---
# Create or update a Traffic Manager endpoint
Each profile contains a list of endpoints.  These endpoints are child resource of the profile, each with their own unique ARM resource id.  Thus endpoints can be managed in two ways: both by modifying the endpoints list when updating a profile, or by modifying the endpoint resource directly.  
  
 This page explains the latter approach—how to create or update an individual Traffic Manager endpoint directly as a child resource within an existing profile.  
  
## Request  
 See [Traffic Manager profiles and endpoints](../TrafficManagerREST/traffic-manager-profiles-and-endpoints.md) for headers and parameters that are used by all requests related to Traffic Manager profiles and endpoints.  
  
|Method|Request URI|  
|------------|-----------------|  
|PUT|`https://management.azure.com/subscriptions/{subscription-id}/resourceGroups/{resource-group-name}/providers/Microsoft.Network/trafficManagerProfiles/{profile-name}/{endpoint-type}/{endpoint-name}?api-version={api-version}`|  
  
 Replace {profile-name} with the name of the Traffic Manager profile.  
  
 Replace {endpoint-type} with the type of the endpoint, one of:  
  
-   azureEndpoints  
  
-   externalEndpoints  
  
-   nestedEndpoints  
  
 Replace {endpoint-name} with the name of the endpoint.  
  
 Example 1: AzureEndpoints  
  
```  
{  
  "name": "{endpoint-name}",  
  "type": "Microsoft.Network/trafficManagerProfiles/azureEndpoints",  
  "properties": {  
    "targetResourceId": "{resource ID of target resource in Azure}",  
    "endpointStatus": "Enabled",  
    "weight": 10,  
    "priority": 3  
  }  
}  
```  
  
 Example 2: ExternalEndpoints  
  
```  
{  
  "name": "{endpoint-name}",  
  "type": "Microsoft.Network/trafficManagerProfiles/externalEndpoints",  
  "properties": {  
    "target": "myendpoint.contoso.com",  
    "endpointStatus": "Enabled",  
    "weight": 10,  
    "priority": 5,  
    "endpointLocation": "northeurope"  
  }  
}  
```  
  
 Example 3: NestedEndpoints  
  
```  
{  
  "name": "{endpoint-name}",  
  "type": "Microsoft.Network/trafficManagerProfiles/nestedEndpoints",  
  "properties": {  
    "targetResourceId": "{resource ID of child Traffic Manager profile}",  
    "endpointStatus": "Enabled",  
    "weight": 10,  
    "priority": 1,  
    "endpointLocation": "westeurope",  
    "minChildEndpoints": 1,  
  }  
}  
```  
  
|Element name|Required|Type|Description|  
|------------------|--------------|----------|-----------------|  
|name|Yes|String|Specifies the name (ARM resource name) of the endpoint|  
|type|Yes|String|Specifies the type of the endpoint.  Possible values are:<br /><br /> -   Microsoft.Network/trafficManagerProfies/azureEndpoints<br />-   Microsoft.Network/trafficManagerProfies/externalEndpoints<br />-   Microsoft.Network/trafficManagerProfies/nestedEndpoints|  
|properties|Yes|String|Container for settings relating to this Traffic Manager endpoint.|  
|target|No|String|The fully-qualified DNS name of the endpoint.  Traffic Manager returns this value in DNS responses to direct traffic to this endpoint.  For example, 'www.contoso.com'.<br /><br /> This parameter must be specified for the ExternalEndpoints endpoint type. For other endpoint types, specify the TargetResourceId parameter instead.|  
|targetResourceId|No|String|For endpoints of type ‘AzureEndpoints’, this specifies resource ID of the resource in Azure that this endpoint will direct traffic to.<br /><br /> For endpoints of type ‘NestedEndpoints’, this specifies the resource ID of the child profile that this endpoint will direct traffic to.<br /><br /> This parameter is not applicable to endpoints of type ‘ExternalEndpoints’.  The ‘target’ parameter should be specified instead.|  
|endpointStatus|No|String|Specifies the status of the endpoint. If the endpoint is Enabled, it is probed for endpoint health and is included in the traffic routing method.<br /><br /> Possible values are:<br /><br /> -   Enabled<br />-   Disabled<br /><br /> This parameter is optional, default value ‘Enabled’.|  
|weight|No|Positive Integer|Specifies the weight assigned by Traffic Manager to the endpoint.  This is only used if the Traffic Manager profile is configured to use the 'weighted' traffic routing method.Possible values are from 1 to 1000.  This parameter is optional, if omitted a default weight of ‘1’ is used.|  
|priority|No|Positive Integer|Specifies the priority of this endpoint when using the ‘priority’ traffic routing method.<br /><br /> Priority must lie in the range 1…1000.  Lower values represent higher priority.  No two endpoints can share the same priority value.<br /><br /> This is an optional parameter.  If omitted, Traffic Manager assigns endpoints with default priority values 1, 2, 3 etc in the order the endpoints are provided.|  
|endpointLocation|No|String|Specifies the location of the endpoint.  This value is used in the ‘Performance’ traffic-routing method when determining which endpoint is closest to the end user.<br /><br /> This property can only be specified on endpoints of type ‘ExternalEndpoints’ or ‘NestedEndpoints’.  For endpoints of type ‘AzureEndpoints’, the location is taken from the Azure resource specified in the targetResourceId.<br /><br /> This parameter is mandatory ExternalEndpoints and NestedEndpoints whenever the ‘Performance’ traffic-routing method is used.<br /><br /> For more information and possible values, see List all of the available geo-locations|  
|minChildEndpoints|No|Positive Integer|This parameter specifies the minimum number of endpoints that must be ‘online’ in the child profile in order for the parent profile to direct traffic to any of the endpoints in that child profile.<br /><br /> It only applies to endpoints of type NestedEndpoints.  It is optional, with default ‘1’.|  
  
## Response  
 **Status code:** 200 or 201 depending on whether the endpoint resource is updated or created.  
  
 Example 1: AzureEndpoints  
  
```  
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
  
```  
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
  
```  
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