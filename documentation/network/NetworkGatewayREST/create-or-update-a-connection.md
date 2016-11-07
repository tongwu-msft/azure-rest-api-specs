---
title: "Create or update a connection"
ms.custom: ""
ms.date: "05/03/2015"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "virtual-network"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: c6c5ea34-f53b-41fa-b080-9dbe9e2883cf
caps.latest.revision: 4
author: "georgewallace"
ms.author: "gwallace"
manager: "carmonm"
translation.priority.mt: 
  - "de-de"
  - "es-es"
  - "fr-fr"
  - "it-it"
  - "ja-jp"
  - "ko-kr"
  - "pt-br"
  - "ru-ru"
  - "zh-cn"
  - "zh-tw"
---
# Create or update a connection
Create a connection between two provided gateway resources.  
  
## Request  
 See [Connections](../NetworkGatewayREST/connections.md) for headers and parameters that are used by all requests related to connections.  
  
|Method|Request URI|  
|------------|-----------------|  
|PUT|`https://management.azure.com/subscriptions/{subscription-id}/resourceGroup/{resource-group-name}/providers/microsoft.network/connections/{connection-name}?api-version={api-version}`|  
|PATCH|`https://management.azure.com/subscriptions/{subscription-id}/resourceGroup/{resource-group-name}/providers/microsoft.network/connections/{connection-name}?api-version={api-version}`|  
  
 The Patch method can be used to update individual properties.  
  
```json  
{  
   "name": "cn1",  
   "location": "West US",  
   "tags": { "key1": "value1" },  
   "properties": {  
   "gateway1": {  
      "name": "firstgateway"  
   },  
   "gateway2": {  
      "name": "secondgateway"  
   },  
   "connectionType": "SiteToSite",  
   "connectivityState": "Connected",  
   "ipsecParameters": {  
      "encryptionType": "{encryptionType}",  
      "pfsGroup": {pfsGroup}",  
      "saDataSizeKilobytes": "{saDataSizeKilobytes}",  
      "saLifeTimeSeconds": "{saLifeTimeSeconds}",  
      "hashAlgorithm": "{hashAlgorithm}"  
   }  
}  
  
```  
  
|Element name|Required|Type|Description|  
|------------------|--------------|----------|-----------------|  
|name|Yes|String|The name of the request connection.|  
|location|*Yes*|String|The location value for the NRP instance that will receive this request. Connections are global objects, so this could be any location.|  
|gateway1|Yes|String|The name of the first gateway in this connection.|  
|gateway2|Yes|String|The name of the second gateway in this connection.|  
|connectionType|Yes|String|The type of this connection. This could be either `SiteToSite`, `PointToSite`, or `Dedicated`.|  
|connectivityState|Yes|String|The current state of this connection. Valid values are `Connected` or `Disconnected`.|  
|encryptionType|Yes|String|The type of encryption that will be used in a SiteToSite connection.|  
|pfsGroup|Yes|String|The pfs group that will be used in a SiteToSite connection.|  
|saDataSizeKilobytes|Yes|String|The number of kilobytes that can be sent across a SiteToSite connection before the connection’s IPsec SA will need to be renegotiated.|  
|saLifeTimeSeconds|Yes|String|The number of seconds that a SiteToSite connection’s IPsec SA will be valid before it needs to be renegotiated.|  
|hashAlgorithm|Yes|String|The hash algorithm that will be used when negotiating SiteToSite IPsec SAs.|  
  
## Response  
 Status code: 200 (OK) if the connection was successfully created or updated. 400 (Bad Request) if one of the gateways does not exist.  
  
```json  
{  
   "name": "connection1",  
   "id": "/subscriptions/{subscription-id}/resourceGroups/myrg1/providers/microsoft.network/connections/connection1",  
   "location": "West US",  
   "tags": { "key1": "value1" },  
   "etag": "W/\"00000000-0000-0000-0000-000000000000\"",  
   "properties": {  
      "gateway1": {  
         "name": "firstgateway",  
         "id": "/subscriptions/{subscription-id}/resourceGroups/myrg1/providers/microsoft.network/SiteToSite/firstgateway"  
      },  
      "gateway2": {  
         "name": "secondgateway",  
"id": "/subscriptions/{subscription-id}/resourceGroups/myrg1/providers/microsoft.network/SiteToSite/secondgateway"  
      },  
      "connectionType": "SiteToSite",  
      "connectivityState": "Connected",  
      "allocatedIPAddresses": [ "{ip-address}" ],  
      "ipsecParameters": {  
         "encryptionType": "{encryptionType}",  
         "pfsGroup": {pfsGroup}",  
         "saDataSizeKilobytes": "{saDataSizeKilobytes}",  
         "saLifeTimeSeconds": "{saLifeTimeSeconds}",  
         "hashAlgorithm": "{hashAlgorithm}"  
      }  
   }  
}  
  
```  
  
|Element name|Description|  
|------------------|-----------------|  
|name|The name of the request connection.|  
|location|The location value for the NRP instance that will receive this request. Connections are global objects, so this could be any location.|  
|gateway1|The name of the first gateway in this connection.|  
|gateway2|The name of the second gateway in this connection.|  
|connectionType|The type of this connection. This could be either `SiteToSite`, `PointToSite`, or `Dedicated`.|  
|connectivityState|The current state of this connection. Valid values are `Connected` or `Disconnected`.|  
|allocatedIPAddress|An IP address that has been allocated to a client in a PointToSite connection.|  
|encryptionType|The type of encryption that will be used in a SiteToSite connection.|  
|pfsGroup|The pfs group that will be used in a SiteToSite connection.|  
|saDataSizeKilobytes|The number of kilobytes that can be sent across a SiteToSite connection before the connection’s IPsec SA will need to be renegotiated.|  
|saLifeTimeSeconds|The number of seconds that a SiteToSite connection’s IPsec SA will be valid before it needs to be renegotiated.|  
|hashAlgorithm|The hash algorithm that will be used when negotiating SiteToSite IPsec SAs.|