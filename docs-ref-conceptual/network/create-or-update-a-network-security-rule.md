---
title: "Create or update a network security rule"
ms.custom: ""
ms.date: "2015-11-04"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "virtual-network"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: b6434400-0ff4-48f9-bae3-4f0676ae1ac0
caps.latest.revision: 10
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
# Create or update a network security rule
## Request  
 See [Common parameters and headers](network-security-rules.md#bk_common) for headers and parameters that are used by all requests related to network security rules.  
  
|Method|Request URI|  
|------------|-----------------|  
|PUT|`/subscriptions/{subscription-id}/resourceGroups/{resource-group-name}/providers/Microsoft.Network/networkSecurityGroups/{network-security-group-name}/securityRules/{security-rule-name}?api-version={api-version}`|  
  
 Replace {network-security-group-name} and {security-rule-name} with the name of the network security rule which you want to create or update.  
  
```json  
  
{   
   "properties":{   
      "description":"description-of-this-rule",  
      "protocol":"*",  
      "sourcePortRange":"source-port-range",  
      "destinationPortRange":"destination-port-range",  
      "sourceAddressPrefix":"*",  
      "destinationAddressPrefix":"*",  
      "access":"Allow",  
      "priority":priority-of-the-rule,  
      "direction":"Inbound"  
   }  
}  
  
```  
  
|Element name|Required|Type|Description|  
|------------------|--------------|----------|-----------------|  
|description|No|String|A description for this rule. Restricted to 140 characters.|  
|protocol|Yes|String|Network protocol this rule applies to. Can be Tcp, Udp or * to match both.|  
|sourcePortRange|Yes|String|Source Port or Range. Integer or range between 0 and 65535 or * to match any.|  
|destinationPortRange|Yes|String|Destination Port or Range. Integer or range between 0 and 65535 or * to match any.|  
|sourceAddressPrefix|Yes|String|CIDR or source IP range or * to match any IP. Tags such as ‘VirtualNetwork’, ‘AzureLoadBalancer’ and ‘Internet’ can also be used.|  
|destinationAddressPrefix|Yes|String|CIDR or destination IP range or * to match any IP. Tags such as ‘VirtualNetwork’, ‘AzureLoadBalancer’ and ‘Internet’ can also be used.|  
|access|Yes|String|Specifies whether network traffic is allowed or denied. Possible values are “Allow” and “Deny”.|  
|priority|Yes|Number|Specifies the priority of the rule. The value can be between 100 and 4096. The priority number must be unique for each rule in the collection. The lower the priority number, the higher the priority of the rule.|  
|direction|Yes|String|The direction specifies if rule will be evaluated on incoming or outgoing traffic. Possible values are “Inbound” and “Outbound”.|  
  
## Response  
 **Status code:** 200.  
  
```json  
{  
   "name": "rule1",  
   "id": "/subscriptions/{guid}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/networkSecurityGroups/myNsg/securityRules/rule1",  
   "etag": "W/\"00000000-0000-0000-0000-000000000000\"",  
   "properties": {  
      "description": "description-of-this-rule",  
      "protocol": "*",  
      "sourcePortRange": "source-port-range",  
      "destinationPortRange": "destination-port-range",  
      "sourceAddressPrefix": "*",  
      "destinationAddressPrefix": "*",  
      "access": "Allow",  
      "priority": priority-of-the-rule,  
      "direction": "Inbound"  
   }  
}  
  
```  
  
|Element name|Description|  
|------------------|-----------------|  
|description|A description for this rule.|  
|Protocol|Network protocol this rule applies to.|  
|SourcePortRange|Source Port or Range.|  
|DestinationPortRange|Destination Port or Range.|  
|SourceAddressPrefix|CIDR or source IP range or * to match any IP.|  
|DestinationAddressPrefix|CIDR or destination IP range or * to match any IP.|  
|Access|Specifies whether network traffic is allowed or denied.|  
|Priority|Specifies the priority of the rule.|  
|Direction|The direction specifies if rule will be evaluated on incoming or outgoing traffic.|
