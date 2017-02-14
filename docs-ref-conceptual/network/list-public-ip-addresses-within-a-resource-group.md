---
title: "List public IP addresses within a resource group&#160;"
ms.custom: ""
ms.date: "2016-07-07"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "virtual-network"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: ce855fe2-8bcf-4017-a7d2-dd2e71188393
caps.latest.revision: 9
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
# List public IP addresses within a resource group&#160;
## Request  
 See [Common parameters and headers](public-ip-addresses.md#bk_common) for headers and parameters that are used by all requests related to public IP addresses.  
  
|Method|Request URI|  
|------------|-----------------|  
|GET|`/subscriptions/{subscription-id}/resourceGroups/{resource-group-name}/providers/Microsoft.Network/publicIPAddresses?api-version={api-version}`|  
  
## Response  
 **Status code:** 200  
  
```json  
[  
   {  
      "name": "myPublicIP1",  
      "id": "/subscriptions/{guid}/resourceGroups/rg1/Microsoft.Network/publicIpAddresses/ip1",  
      "location": "North US",  
      "tags": {  
         "key": "value"  
      },  
      "etag": "W/\"00000000-0000-0000-0000-000000000000\"",  
      "properties": {  
         "resourceGuid":"0CB6BF8A-FFBD-486A-A6A2-DA6633481B50",  
         "provisioningState": "Succeeded",           
         "ipAddress": "1.1.1.1",  
         "publicIPAllocationMethod": "Static",   
      "publicIPAddressVersion": "IPv4",  
         "idleTimeoutInMinutes": 4,   
         "ipConfiguration": {   
            "id": "/subscriptions/{guid}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/networkInterfaces/vm1nic1/ipConfigurations/ip1"  
         },  
         "dnsSettings": {  
            "domainNameLabel": "mylabel",  
            "fqdn": "mylabel.northus.cloudapp.azure.com.",  
            "reverseFqdn": "contoso.com."  
         }  
      }  
   }  
]  
```  
  
|Element name|Description|  
|------------------|-----------------|  
|name|The name of the Public IP Address.|  
|id|The identifying URL of the Public IP Address.|  
|location|Specifies the supported Azure location of the Public IP Address. For more information, see List all of the available geo-locations|  
|tags|The tags and their values that are used by the Public IP Address|  
|etag|System generated meta-data enabling concurrency control|  
|resourceGuid|System generated unique identifier used for internal correlation and logging purpose by the platform|  
|provisioningState|Provisioning state of the Public IP Address|  
|ipAddress|The IP address value that was allocated.|  
|publicIPAllocationMethod|Defines whether the IP address is stable or dynamic. Options are Static or Dynamic|  
|publicIPAddressVersion|Available from Api-Version 2016-03-30 onwards, it represents whether the specific publicIP address is IPv4 or IPv6. Options are IPv4 or IPv6|  
|idleTimeoutInMinutes|Specifies the timeout for the TCP idle connection. The value can be set between 4 and 30 minutes|  
|ipConfiguration.id|Reference to a NIC’s IP Configuration if this Public IP Address is associated with a NIC|  
|dnsSettings.domainNameLabel|The concatenation of the domain name label and the regionalized DNS zone make up the fully qualified domain name associated with the public IP address. If a domain name label is specified, an A DNS record is created for the public IP in the Microsoft Azure DNS system.|  
|dnsSettings.fqdn|Fully qualified domain name of the A DNS record associated with the public IP. This is the concatenation of the domainNameLabel and the regionalized DNS zone|  
|dnsSettings.reverseFqdn|A fully qualified domain name that resolves to this public IP address. If the reverseFqdn is specified, then a PTR DNS record is created pointing from the IP address in the in-addr.arpa domain to the reverse FQDN.|
