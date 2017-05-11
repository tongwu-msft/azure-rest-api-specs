---
title: Create or update a network security rule
ms.date: 03/15/2017
ms.service: virtual-network
ms.topic: reference
ms.devlang: rest
author: anavinahar 
ms.author: annahar 
ms.manager: narayan
---
# Create or update a network security rule

This operation creates or updates an a network security rule.

For information about getting started with Azure REST operations including request authentication, see [Azure REST API Reference](../../../index.md).

## Request  

|Method|Request URI|  
|------------|-----------------|  
|PUT|`/subscriptions/{subscriptionId}/resourceGroups/{resourceGroup}/providers/Microsoft.Network/networkSecurityGroups/{networkSecurityGroupName}/securityRules/{securityRuleName}?api-version={api-version}`|  
  
| Parameter | Description |
| --------- | ----------- |
| subscriptionId | The identifier of your subscription where the network security group exists. |
| resourceGroup | The name of the resource group that contains the network security group. |
| networkSecurityGroupName | The name of the network security group. |
| securityRuleName | The name of the network security rule. |
| api-version | The version of the API to use. The current version is 2016-09-01. | 

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
