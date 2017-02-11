---
title: "Create or update an application gateway"
ms.custom: ""
ms.date: "2016-02-18"
ms.prod: "azure"
ms.reviewer: ""
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: cc786154-d03c-4533-9471-8fbdfd5b08bf
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
# Create or update an application gateway

Create or update an application gateway zone within a resource *group*.  

For information about getting started with Azure REST operations including request authentication, see [Azure REST API Reference](../../index.md).

## Request  
  
|Method|Request URI|  
|------------|-----------------|  
|PUT|`/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/applicationgateways/{ApplicationGatewayName}`|  
  
 Replace {ApplicationGatewayName} with the name of the application gateway to be created.  The application gateway name must be unique within the resource group and be in its own empty virtual network subnet.  
  
## Request Body  
  
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
  
|Element name|Type|Required|Description|  
|------------------|----------|--------------|-----------------|  
|name|String|Yes|Application Gateway Name|  
|id|String|ReadOnly|Resource Id of application gateway.|  
|location|String|Yes|Location of application gateway|  
|tags|String|No|tags associated with application gateway|  
|properties|ComplexType|Yes|Properties of Application Gateway Resource. All below elements are within the properties.{br /}{br /} Also properties is dropped in all child elements below.|  
|provisioningState|String|ReadOnly|Provisioning State of the resource. Updating &#124; Succeeded &#124; Failed [Read Only]|  
|sku.name|String|Yes|Possible Values: Standard_Small &#124; Standard_Medium &#124; Standard_Large &#124; WAF_Medium &#124; WAF_Large|  
|sku.tier|String|Yes|Possible Values: Standard &#124; WAF|  
|sku.capacity|Integer|Yes|Specifies instance count. Can be 1 to 10.|  
|operationalState|String|ReadOnly|Possible Values: Stopped &#124; Starting &#124; Running &#124; Stopping [Read Only]|  
|gatewayIpConfigurations|ComplexType|Yes|Ip configurations for a gateway. Currently we allow only one IpConfiguration. Here you can specify which Subnet to deploy Application gateway.|  
|gatewayIpConfigurations[i].name|String|Yes|Name of the gateway Ip configuration.|  
|gatewayIpConfigurations[i].subnet|String|Yes|Reference to a Subnet. Application Gateway is deployed in this subnet. No other resource can be deployed in a subnet where Application Gateway is deployed.|
|authenticationCertificates|ComplexType|No|List of authenication certificates.|  
|authenticationCertificates[i].name|String|Yes|Name of the authenication Certificate|  
|authenticationCertificates[i].data|String|Yes|Base-64 encoded cer certificate. Only applicable in PUT Request.|   
|sslCertificates|ComplexType|No|List of Ssl certificates.|  
|sslCertificates[i].name|String|Yes|Name of the ssl Certificate|  
|sslCertificates[i].data|String|Yes|Base-64 encoded pfx certificate. Only applicable in PUT Request.|  
|sslCertificates[i].password|String|Yes|Password for the pfx file specified in data. Only applicable in PUT request.|  
|sslCertificates[i].publicCertData|String|ReadOnly|Base-64 encoded Public cert data corresponding to pfx specified in data. Only applicable in GET request.|  
|frontendIpConfigurations|ComplexType|Yes|Specifies lists of front end IP configurations. Currently only one Public and/or one Private IP address can be specified. Also one frontendIpConfiguration element can specify either Public or Private IP address, not both.|  
|frontendIpConfigurations[i].name|String|Yes|User defined name for a frontend IP configuration|  
|frontendIpConfigurations[i].publicIpAddress.Id|String|ReadOnly|Specifies resource Id of a Public Ip Address resource. IPAllocationMethod should be Dynamic.|  
|frontendIpConfigurations[i].privateIPAllocationMethod|String|Yes|Static &#124; Dynamic.|  
|frontendIpConfigurations[i].privateIPAddress|String|No|Private IP address.|  
|frontendPorts|ComplexType|Yes|Frontend ports|  
|frontendPorts[i].name|String|Yes|User defined name for frontend Port|  
|frontendPorts[i].port|Integer|Yes|Port number|  
|probes|ComplexType|No|Specifies list of URL probes|  
|probes[i].name|String|Yes|Name of probe|  
|probes[i].protocol|String|Yes|Protocol used to send probe. Http only.|  
|probes[i].host|String|Yes|Host name to send probe to|  
|probes[i].path|String|Yes|Relative path of probe. Valid path starts from '/'. Probe is sent to \{Protocol}://\{host}:\{port}\{path}|  
|probes[i].interval|Integer|Yes|Probe interval in seconds. This is the time interval between two consecutive probes. Minimum 1 second and Maximum 86400 secs.|  
|probes[i]timeout|Integer|Yes|Probe timeout in seconds. Probe marked as failed if valid response is not received with this timeout period. Minimum 1 second and Maximum 86400 secs.|  
|probes[i].unhealthyThreshold|Integer|Yes|Probe retry count. Backend server is marked down after consecutive probe failure count reaches UnhealthyThreshold. Minimum 1 second and Maximum 20.|  
|backendAddressPools|ComplexType|Yes|Backend Address Pools for Application Gateway|  
|backendAddressPools[i].name|String|Yes|User defined name for backend Address Pool|  
|backendAddressPools[i].ipaddresses|String|Yes|List of public IPAdresses, or internal IP addresses or FQDN in backend address pool|  
|backendHttpSettingsList|ComplexType|Yes|List of Http settings for backend address pools|  
|backendHttpSettingsList[i].name|String|Yes|User defined name for http settings.|  
|backendHttpSettingsList[i].port|Integer|Yes|Backend port for backend address pool.|  
|backendHttpSettingsList[i].protocol|String|Yes|Protocol for backend address pool. Http &#124; Https|  
|backendHttpSettingsList[i].cookieBasedAffinity|String|Yes|Cookie Based Affinity - Enabled &#124; Disabled|  
|backendHttpSettingsList[i].requestTimeout|Integer|No|RequestTimeout in second. Application Gateway will fail the request if response is not received within RequestTimeout. Minimum 1 second and Maximum 86400 secs.|  
|backendHttpSettingsList[i].probe|String|No|Reference to URL probe|  
|httpListeners|ComplexType|Yes|http Listeners on Application Gateway|  
|httpListeners[i].name|String|Yes|Name of http listener.|  
|httpListeners[i].frontendIp|String|Yes|Reference to frontend Ip configuration|  
|httpListeners[i].frontendPort|String|Yes|Reference to front end port|  
|httpListeners[i].protocol|String|Yes|Protocol of the listener. Http &#124; Https|  
|httpListeners[i].hostName|String|No|HostName for http listener. It has to be a valid DNS name.|  
|httpListeners[i].sslCert|String|No|Reference to ssl certificate. Valid only if protocol is https.|  
|httpListeners[i].requireServerNameIndication|String|No|Applicable only if protocol is https. Enables SNI for multi-hosting. true &#124; false|  
|urlPathMaps|ComplexType|No|UrlPathMaps give url Path to backend mapping information for PathBasedRouting.|  
|urlPathMaps[i].name|String|Yes|URL Path Map Name|  
|urlPathMaps[i].defaultBackendAddressPool|String|Yes|Default Backend Address Pool to route in case none of the pathRules match.|  
|urlPathMaps[i].defaultBackendHttpSettings|String|Yes|Default Backend Http Settings to use in case none of the pathRules match.|  
|urlPathMaps[i].pathRules|String|Yes|List of pathRules. Note that pathRules are order sensitive. Are applied in order they are specified.|  
|urlPathMaps[i].pathRules[i].paths|String|Yes|The list of path patterns to match. Each must start with / and the only place a * is allowed is at the end following a /. The string fed to the path matcher does not include any text after the first ? or #, and those chars are not allowed here.|  
|urlPathMaps[i].pathRules[i].backendAddressPool|String|Yes|Backend Address Pool to route request to in case any of the paths matched.|  
|urlPathMaps[i].pathRules[i].backendHttpSettings|String|Yes|Backend Http Settings to use in case any of the paths matched.|  
|requestRoutingRules|ComplexType|Yes|Request routing rules, Note that request routing rules are order sensitive.|  
|requestRoutingRules[i].type|String|Yes|Rule Type. Supported values: Basic &#124; PathBasedRouting|  
|requestRoutingRules[i].httpListener|String|Yes|Reference to http listener|  
|requestRoutingRules[i].backendAddressPool|String|No|Reference to backend address pool. Valid for Basic Rule only.|  
|requestRoutingRules[i].backendHttpSettings|String|No|Reference to backend Http settings. Valid for Basic Rule only.|  
|requestRoutingRules[i].urlPathMap|String|No|Reference to url Path Map. Valid for PathBasedRouting Rule only.|
|webApplicationFirewallConfiguration| ComplexType|No|Web Application Firewall configuration settings |
|webApplicationFirewallConfiguration[i].enabled| boolean | Yes | Switch to determine if WAF is enabled or not|
|webApplicationFirewallConfiguration[i].firewallMode|String|Yes|Firewall mode Supported values: Prevention &#124; Detection|  
  
### Response  
 
**Status code:** If successful, if gateway does not exist return HTTP Status code of 201(Created) otherwise HTTP status code of 200(OK).
