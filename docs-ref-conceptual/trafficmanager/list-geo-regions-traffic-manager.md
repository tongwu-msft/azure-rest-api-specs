---
title: "List the regions used by Traffic Manager Geographic routing type"
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
# List the  regions used by Traffic Manager Geographic routing type
Each endpoint that is associated with a Traffic Manager profile with Geographic routing type needs to have one or more geographic regions mapped to it. This API call returns the exhaustive list of supported regions, the hierarchy in which they are organized and the associated code that should be used when assigning region(s) to endpoints.

## Request  
 See [Traffic Manager profiles and endpoints](traffic-manager-profiles-and-endpoints.md) for headers and parameters that are used by all requests related to Traffic Manager profiles and endpoints.  

|Method|Request URI|  
|------------|-----------------|  
|GET|`/Microsoft.Network/trafficManagerGeographicHierarchies/default?api-version={api-version}`|  

## Response  
 **Status code:** 200 OK or 404 Not Found.  

 Example
 <br>**NOTE: the following is a truncated response of this API and is for illustration purposes. The API call will return all the regions**

```json  
{
  "id": "/providers/Microsoft.Network/trafficManagerGeographicHierarchies/default",
  "name": "default",
  "type": "Microsoft.Network/trafficManagerGeographicHierarchies",
  "properties": {
    "geographicHierarchy": {
      "code": "WORLD",
      "name": "World",
      "regions": [
        {
          "code": "GEO-EU",
          "name": "Europe",
          "regions": [
            {
              "code": "AD",
              "name": "Andorra",
              "regions": []
            },
          ]
        }
      ]
    }
  }
}

```  


|Element name|Description|  
|------------------|-----------------|  
|id|Specifies the ID of this ARM resource|  
|name|Specifies the name of this ARM resource|  
|type|Specifies the type of THIS ARM resource|  
|properties|Container for the information within this resource|  
|geographicHierarchy|The hierarchical listing of the regions|  
|code|The string that represents this region and to be used when making API calls|  
|name|The name of the region|  
|regions|Listing of any regions that are under this region in the hierarchy|
