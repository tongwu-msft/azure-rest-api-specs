---
title: "Get Application Gateway"
ms.custom: ""
ms.date: "2016-02-18"
ms.prod: "azure"
ms.reviewer: ""
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 7a8c98c4-2c5b-4bc4-825c-7eb6e0e7453d
caps.latest.revision: 3
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
# Get Application Gatewa
Retrieve an application gateway properties.  

For information about getting started with Azure REST operations including request authentication, see [Azure REST API Reference](../../index.md).

## Request  
  
|Method|Request URI|  
|------------|-----------------|  
|GET|`/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/applicationGateways/{applicationGatewayName}`|  
  
 *Replace {ApplicationGatewayName} with the name of the application gateway to get its properties.*  
  
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
            "id": "/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/applicationGateways/{appGatewayName}/authenti
cationCertificates/{authCertName}"
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
          "id": "/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/applicationGateways/{appGatewayName}/frontendIp
Configurations/{frontendIPName}"
        },
        "frontendPort": {
          "id": "/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/applicationGateways/{appGatewayName}/frontendPo
rts/{frontEndPortName}"
        },
        "protocol": "Https",
        "sslCertificate": {
          "id": "/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/applicationGateways/{appGatewayName}/sslCertifi
cates/{sslCertFriendlyName}"
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
          "id": "/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/applicationGateways/{appGatewayName}/backendAdd
ressPools/{backendPoolName}"
        },
        "backendHttpSettings": {
          "id": "/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/applicationGateways/{appGatewayName}/backendHtt
pSettingsCollection/{backendHttpSettingsName}"
        },
        "httpListener": {
          "id": "/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/applicationGateways/{appGatewayName}/httpListen
ers/{listenerName}"
        }
      },
      "name": "{ruleName}",
      "id": ""
    }
  ],
  "webApplicationFirewallConfiguration": {
    "enabled": true | false,
    "firewallMode": "Prevention | Detection"
  }
}
}
``` 
  
### Response  
 **Status code:** If successful, the operation returns HTTP status code of 200(OK). 404 (Not Found) if resource does not exist.
