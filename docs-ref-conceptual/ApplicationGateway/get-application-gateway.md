---
title: Get Application Gateway | Microsoft Docs
ms.date: 03/29/2017
ms.service: application-gateway
ms.devlang: rest-api
ms.topic: reference
author: amitsriva
ms.author: amsriva
manager: rossort
---
# Get Application Gateway
Retrieve an application gateway properties.  

For information about getting started with Azure REST operations including request authentication, see [Azure REST API Reference](../../index.md).

## Request  
  
|Method|Request URI|  
|------------|-----------------|  
|GET|`/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/applicationGateways/{applicationGatewayName}?api-version={api-version}`|  
  
| Parameter | Description |
| --------- | ----------- |
| subscriptionId | The identifier of your subscription where the Application Gateway exists. |
| resourceGroupName | The name of the resource group that contains the Application Gateway. |
| applicationGatewayName | The name of the Application Gateway.|
| api-version | The version of the API to use. The current version is 2016-09-01. | 

## Request body  

```json 
{
"name": "{appGatewayName}",
"location": "{location}",
"tags": {  
    "key1": "value1"
}, 
"properties": {
  "provisioningState": "Updating | Succeeded | Failed",
  "sku": {
    "name": "Standard_Small | Standard_Medium | Standard_Large | WAF_Medium | WAF_Large",
    "tier": "Standard | WAF",
    "capacity": 2,
    "operationalState": "Stopping | Starting | Running"
  },
  "gatewayIPConfigurations": [
    {
      "properties": {
        "subnet": {
          "id": "/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/virtualNetworks/{vnetName}/subnets/{subnetName}"
        }
      },
      "name": "{gatewayConfigName}",
      "id": ""
    }
  ],
  "authenticationCertificates": [
    {
      "properties": {
        "data": "{certData}"
      },
      "name": "{authCertName}",
      "id": ""
    }
  ],
  "sslCertificates": [
    {
      "properties": {
        "data": "{sslCertData}",
        "password": "{sslCertPassword}"
      },
      "name": "{sslCertFriendlyName}",
      "id": ""
    }
  ],
  "frontendIPConfigurations": [
    {
      "properties": {
        "publicIPAddress": {
          "id": "/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/publicIPAddresses/{publicIPName}"
        }
      },
      "name": "{frontendIPConfigName}",
      "id": ""
    }
  ],
  "frontendPorts": [
    {
      "properties": {
        "port": 443
      },
      "name": "{frontEndPortName}",
      "id": ""
    }
  ],
    "probes":[  
    {  
      "name":"{probeName}",  
      "id": "",  
      "location": "{location}",  
      "tags": {"key": "value"},  
      "etag": "W/\"00000000-0000-0000-0000-000000000000\"",  

      "properties": {  
        "protocol": "{probeProtocol}",  
        "host": "{probeHealth}",  
        "path": "{probePath}",  
        "interval": "probeIntervalInSec}",  
        "timeout": "{probeTimeoutInSec}",  
        "unhealthyThreshold": "{probeUnhealthyThreshold}"  
      }  
    }  
    ], 
  "backendAddressPools": [
    {
      "properties": {
        "backendIPConfigurations": [],
        "backendAddresses": [
          {
            "ipAddress": "{ipAddress}"
          },
          {
            "ipAddress": "{ipAddress2}"
          },
          ...
        ]
      },
      "name": "{backendPoolName}",
      "id": ""
    }
  ],
  "backendHttpSettingsCollection": [
    {
      "properties": {
        "port": 443,
        "protocol": "Https | Http",
        "cookieBasedAffinity": "Enabled | Disabled",
        "requestTimeout": 30,
        "authenticationCertificates": [
          {
            "id": "/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/applicationGateways/{appGatewayName}/authenticationCertificates/{authCertName}"
          }
        ]
      },
      "name": "{backendHttpSettingsName}",
      "id": ""
    }
  ],
  "httpListeners": [
    {
      "name": "{listenerName}",
      "id": "",
      "hostName": "{hostName}", 
      "requireServerNameIndication": "True | False", 
      "properties": {
        "frontendIPConfiguration": {
          "id": "/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/applicationGateways/{appGatewayName}/frontendIpConfigurations/{frontendIPName}"
        },
        "frontendPort": {
          "id": "/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/applicationGateways/{appGatewayName}/frontendPorts/{frontEndPortName}"
        },
        "protocol": "Https",
        "sslCertificate": {
          "id": "/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/applicationGateways/{appGatewayName}/sslCertificates/{sslCertFriendlyName}"
        }
      }
    }
  ],
  "urlPathMaps":[   
  {   
    "name":"{urlPathMapName}",   
    "id": "/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/applicationGateways/{gatewayName}/urlPathMaps/{urlPathMapName}",   
    "location": "{location}",  
    "tags": {"key": "value"},  
    "etag": "W/\"00000000-0000-0000-0000-000000000000\"", 
    "properties": {   
      "defaultBackendAddressPool": {
        "id": "/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/applicationGateways/{gatewayName}/backendAddressPools/{poolName}"
      },           
      "defaultBackendHttpSettings": {
        "id":     "/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/applicationGateways/{gatewayName}/backendHttpSettingsList/{settingsName}"
      },
      "pathRules":[   
      {   
        "paths":[   
          {"pathPattern"}   
        ],   
        "backendAddressPool": {
          "id": "/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/applicationGateways/{gatewayName}/backendAddressPools/{poolName2}"
        },           
        "backendHttpsettings": {
          "id": "/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/applicationGateways/{gatewayName}/backendHttpsettingsList/{settingsName2}"
        },   
      },   
      ],   
    }   
  }   
  ],  
  "requestRoutingRules": [
    {
      "properties": {
        "ruleType": "basic",
        "backendAddressPool": {
          "id": "/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/applicationGateways/{appGatewayName}/backendAddressPools/{backendPoolName}"
        },
        "backendHttpSettings": {
          "id": "/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/applicationGateways/{appGatewayName}/backendHttpSettingsCollection/{backendHttpSettingsName}"
        },
        "httpListener": {
          "id": "/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/applicationGateways/{appGatewayName}/httpListeners/{listenerName}"
        }
      },
      "name": "{ruleName}",
      "id": ""
    }
  ],
  "webApplicationFirewallConfiguration": {
    "enabled": true | false,
    "firewallMode": "Prevention | Detection",
    "ruleSetType": "OWASP",
    "ruleSetVersion": "2.2.9 | 3.0",
    "disabledRuleGroups": [
      {
        "ruleGroupName":"{rulegroupName}", 
        "rules":[
          "{ruleId}"
        ]
      }
    ]
  }
}
}
``` 
  
### Response  
 **Status code:** If successful, the operation returns HTTP status code of 200(OK). 404 (Not Found) if resource does not exist.
