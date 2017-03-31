---
title: List the regions used by Traffic Manager Geographic routing type
ms.date: 03/23/2017
ms.service: traffic-manager
ms.devlang: rest-api
ms.topic: reference
author: georgewallace
ms.author: gwallace
manager: timlt
---
# List the  regions used by Traffic Manager Geographic routing type
Each endpoint that is associated with a Traffic Manager profile with Geographic routing type needs to have one or more geographic regions mapped to it. This API call returns the exhaustive list of supported regions, the hierarchy in which they are organized and the associated code that should be used when assigning region(s) to endpoints.

For information about getting started with Azure REST operations including request authentication, see [Azure REST API Reference](../../index.md).

## Request  

|Method|Request URI|  
|------------|-----------------|  
|GET|`/providers/Microsoft.Network/trafficManagerGeographicHierarchies/default?api-version={api-version}`|  

| api-version | The version of the API to use. The current version is 2017-03-01. | 

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
|id|Specifies the ID of this resource|  
|name|Specifies the name of this resource|  
|type|Specifies the type of this resource|  
|properties|Container for the information within this resource|  
|geographicHierarchy|The hierarchical listing of the regions|  
|code|The string that represents this region and to be used when making API calls|  
|name|The name of the region|  
|regions|Listing of any regions that are under this region in the hierarchy|
