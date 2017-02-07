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
  
## Request  
  
|Method|Request URI|  
|------------|-----------------|  
|PUT|`https://management.azure.com/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/applicationgateways/{ApplicationGatewayName}`|  
  
 Replace {ApplicationGatewayName} with the name of the application gateway to be created.  The application gateway name must be unique within the resource group and be in its own empty virtual network subnet.  
  
## Request Body  
  
```json 
{   
  "name": "<gatewayName>",  
  "id": "/subscriptions/<subscriptionId>/../microsoft.network/applicationGateways/<gatewayName> ",  
  "location": "<location>",  
  "tags": {"key": "value"},  
  "etag": "W/\"00000000-0000-0000-0000-000000000000\"",  
  
  "properties": {  
    "provisioningState": "Succeeded",  
    "sku": {  
      "name": "Standard_Medium",  
      "tier": "Standard",  
      "capacity": 2  
    },  
    "operationalState": "Stopped",  
    "gatewayIpConfigurations": [  
      {  
        "name": "<gatewayIpConfigName>",  
        "id": "/subscriptions/<subscriptionId>/../Microsoft.Network/applicationGateways/<gatewayName>/gatewayIpConfigurations/<gatewayIpConfigName>",  
        "properties": {  
          "provisioningState": "Succeeded",  
          "subnet": {  
            "id": "/subscriptions/<subscriptionId>/../Microsoft.Network/virtualNetworks/<vnetName>/subnets/<subnetName>"  
          }  
        }  
      }  
    ],  
    "sslCertificates": [  
      {  
        "name": "<certName>",  
        "id": "/subscriptions/<subscriptionId>/../Microsoft.Network/applicationGateways/<gatewayName>/sslCertificates/<certName>",  
      "location": "<location>",  
      "tags": {"key": "value"},  
      "etag": "W/\"00000000-0000-0000-0000-000000000000\"",  
  
        "properties": {  
          "provisioningState": "Succeeded",  
          "data": "<Base-64 Encoded Private Cert Data>",  
          "password": "<Password>",  
          "publicCertData": "<Base-64 Encoded Public Cert Data>"  
        }  
      }  
    ],  
    "frontendIpConfigurations": [  
      {  
        "name": "<frontendIpConfigName>",  
        "id": "/subscriptions/<subscriptionId>/../Microsoft.Network/applicationGateways/<gatewayName>/frontendIpConfigurations/<frontendIpConfigName>",  
      "location": "<location>",  
      "tags": {"key": "value"},  
      "etag": "W/\"00000000-0000-0000-0000-000000000000\"",  
  
        "properties": {  
          "provisioningState": "Succeeded",  
          "privateIPAllocationMethod": "Dynamic",  
          "publicIPAddress": {  
            "id": "/subscriptions/<subscriptionId>/../Microsoft.Network/publicIPAddresses/<PublicIpName>"  
          }  
        }  
      }  
    ],  
  
    "frontendPorts":[  
    {  
      "name":"<portName>",  
      "id": "/subscriptions/<subscriptionId>/../microsoft.network/applicationGateways/<gatewayName>/frontendPorts/<portName>",  
      "location": "<location>",  
      "tags": {"key": "value"},  
      "etag": "W/\"00000000-0000-0000-0000-000000000000\"",  
  
      "properties": {  
        "port":"<portNumber>"  
      }  
    }  
    ],  
  
    "probes":[  
    {  
      "name":"<probeName>",  
      "id": "/subscriptions/<subscriptionId>/../microsoft.network/applicationGateways/<gatewayName>/probes/<probeName>",  
      "location": "<location>",  
      "tags": {"key": "value"},  
      "etag": "W/\"00000000-0000-0000-0000-000000000000\"",  
  
      "properties": {  
        "protocol": "<probeProtocol>",  
        "host": "<probeHost>",  
        "path": "<probePath>",  
        "interval": "<probeIntervalInSec>",  
        "timeout": "<probeTimeoutInSec>",  
        "unhealthyThreshold": "<probeUnhealthyThreshold>"  
      }  
    }  
    ],  
  
    "backendAddressPools":[  
    {  
      "name":"<poolName>",  
      "id": "/subscriptions/<subscriptionId>/../microsoft.network/applicationGateways/<gatewayName>/backendAddressPools/<poolName>",  
      "location": "<location>",  
      "tags": {"key": "value"},  
      "etag": "W/\"00000000-0000-0000-0000-000000000000\"",  
  
        "properties": {  
          "provisioningState": "Succeeded",  
          "backendAddresses": [  
            {  
              "ipAddress": "ip1"  
            },  
            {  
              "ipAddress": "ip2"  
            }  
          ]  
        }  
      }  
    ],   
  
    "backendHttpSettingsCollection":[  
    {  
      "name":"<settingsName>",  
      "id": "/subscriptions/<subscriptionId>/../microsoft.network/applicationGateways/<gatewayName>/backendHttpSettingsList/<settingsName>",  
      "location": "<location>",  
      "tags": {"key": "value"},  
      "etag": "W/\"00000000-0000-0000-0000-000000000000\"",  
  
      "properties": {  
        "port":"<backendPortNumber>",  
        "protocol":"<backendProtocol>" ,  
        "cookieBasedAffinity":"Enabled",  
        "requestTimeout": "<requestTimeoutInSec>",  
        "probe": {"id": "/subscriptions/<subscriptionId>/../microsoft.network/applicationGateways/<gatewayName>/probes/<probeName>"}  
      }  
    }  
    ],  
  
    "httpListeners":[  
    {  
      "name":"<listenerName>",  
      "id": "/subscriptions/<subscriptionId>/../microsoft.network/applicationGateways/<gatewayName>/httpListeners/<listenerName>",  
      "location": "<location>",  
      "tags": {"key": "value"},  
      "etag": "W/\"00000000-0000-0000-0000-000000000000\"",  
  
      "properties": {  
        "frontendIp": {"id": "/subscriptions/<subscriptionId>/../microsoft.network/applicationGateways/<gatewayName>/frontendIpConfigurations/<ipConfigName>"},  
        "frontendPort": {"id": "/subscriptions/<subscriptionId>/../microsoft.network/applicationGateways/<gatewayName>/frontendPorts/<portName>"},          
        "protocol":"<listenerProtocol>",  
        "hostName":"<listenerHostName>",   
  
        "sslCert": {"id":     "/subscriptions/<subscriptionId>/../microsoft.network/applicationGateways/<gatewayName>/sslCertificates/<certificateName>"},  
        "requireServerNameIndication":"<true|false>"   
      }  
    }  
    ],  
  
    "urlPathMaps":[   
    {   
      "name":"<urlPathMapName>",   
      "id": "/subscriptions/<subscriptionId>/../microsoft.network/applicationGateways/<gatewayName>/ urlPathMaps/<urlPathMapName>",   
       "location": "<location>",  
      "tags": {"key": "value"},  
      "etag": "W/\"00000000-0000-0000-0000-000000000000\"",  
  
      "properties": {   
         "defaultBackendAddressPool": {"id": "/subscriptions/<subscriptionId>/../microsoft.network/applicationGateways/<gatewayName>/backendAddressPools/<poolName>"},           
        "defaultBackendHttpSettings": {"id":     "/subscriptions/<subscriptionId>/../microsoft.network/applicationGateways/<gatewayName>/backendHttpSettingsList/<settingsName>"},   
  
        "pathRules":[   
        {   
          "paths":[   
            <pathPattern>   
          ],   
          "backendAddressPool": {"id": "/subscriptions/<subscriptionId>/../microsoft.network/applicationGateways/<gatewayName>/backendAddressPools/<poolName2>"},           
          "backendHttpsettings": {"id":     "/subscriptions/<subscriptionId>/../microsoft.network/applicationGateways/<gatewayName>/backendHttpsettingsList/<settingsName2>"},   
        },   
        ],   
      }   
    }   
    ],  
  
    "requestRoutingRules":[  
    {  
      "name":"<ruleName>",  
      "id": "/subscriptions/<subscriptionId>/../microsoft.network/applicationGateways/<gatewayName>/requestRoutingRules/<ruleName>",  
      "location": "<location>",  
      "tags": {"key": "value"},  
      "etag": "W/\"00000000-0000-0000-0000-000000000000\"",  
  
      "properties": {  
        "ruleType": "<ruleType>",  
        "httpListener": {"id": "/subscriptions/<subscriptionId>/../microsoft.network/applicationGateways/<gatewayName>/httpListeners/<listenerName>"},  
        "backendAddressPool": {"id": "/subscriptions/<subscriptionId>/../microsoft.network/applicationGateways/<gatewayName>/backendAddressPools/<poolName>"},          
        "backendHttpsettings": {"id":     "/subscriptions/<subscriptionId>/../microsoft.network/applicationGateways/<gatewayName>/backendHttpsettingsList/<settingsName>"}  
      }  
    ]  
  }  
}  
  
```  
  
|Element name|Type|Required|Description|  
|------------------|----------|--------------|-----------------|  
|name|String|Yes|Application Gateway Name|  
|id|String|ReadOnly|Resource Id of application gateway.|  
|location|String|Yes|Location of application gateway|  
|tags|String|No|tags associated with application gateway|  
|properties|ComplexType|Yes|Properties of Application Gateway Resource. All below elements are within the properties.<br /><br /> Also properties is dropped in all child elements below.|  
|provisioningState|String|ReadOnly|Provisioning State of the resource. Updating &#124; Succeeded &#124; Failed [Read Only]|  
|sku.name|String|Yes|Possible Values: Standard_Small &#124; Standard_Medium &#124; Standard_Large|  
|sku.tier|String|Yes|Possible Values: Standard|  
|sku.capacity|Integer|Yes|Specifies instance count. Can be 1 to 10.|  
|operationalState|String|ReadOnly|Possible Values: Stopped &#124; Starting &#124; Running &#124; Stopping [Read Only]|  
|gatewayIpConfigurations|ComplexType|Yes|Ip configurations for a gateway. Currently we allow only one IpConfiguration. Here you can specify which Subnet to deploy Application gateway.|  
|gatewayIpConfigurations[i].name|String|Yes|Name of the gateway Ip configuration.|  
|gatewayIpConfigurations[i].subnet|String|Yes|Reference to a Subnet. Application Gateway is deployed in this subnet. No other resource can be deployed in a subnet where Application Gateway is deployed.|  
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
|Probes[i].name|String|Yes|Name of probe|  
|probes[i].protocol|String|Yes|Protocol used to send probe. Http only.|  
|probes[i].host|String|Yes|Host name to send probe to|  
|probes[i].path|String|Yes|Relative path of probe. Valid path starts from '/'. Probe is sent to \<Protocol>://\<host>:\<port>\<path>|  
|probes[i].interval|Integer|Yes|Probe interval in seconds. This is the time interval between two consecutive probes. Minimum 1 second and Maximum 86400 secs.|  
|probes[i]timeout|Integer|Yes|Probe timeout in seconds. Probe marked as failed if valid response is not received with this timeout period. Minimum 1 second and Maximum 86400 secs.|  
|probes[i].unhealthyThreshold|Integer|Yes|Probe retry count. Backend server is marked down after consecutive probe failure count reaches UnhealthyThreshold. Minimum 1 second and Maximum 20.|  
|backendAddressPools|ComplexType|Yes|Backend Address Pools for Application Gateway|  
|backendAddressPools[i].name|String|Yes|User defined name for backend Address Pool|  
|backendAddressPools[i].ipaddresses|String|Yes|List of public IPAdresses, or internal IP addresses or FQDN in backend address pool|  
|backendHttpSettingsList|ComplexType|Yes|List of Http settings for backend address pools|  
|backendHttpSettingsList[i].name|String|Yes|User defined name for http settings.|  
|backendHttpSettingsList[i].port|Integer|Yes|Backend port for backend address pool.|  
|backendHttpSettingsList[i].protocol|String|Yes|Protocol for backend address pool. Http only is supported.|  
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
|requestRoutingRules [i].type|String|Yes|Rule Type. Supported values: Basic &#124; PathBasedRouting|  
|requestRoutingRules [i].httpListener|String|Yes|Reference to http listener|  
|requestRoutingRules [i].backendAddressPool|String|No|Reference to backend address pool. Valid for Basic Rule only.|  
|requestRoutingRules [i].backendHttpSettings|String|No|Reference to backend Http settings. Valid for Basic Rule only.|  
|requestRoutingRules [i].urlPathMap|String|No|Reference to url Path Map. Valid for PathBasedRouting Rule only.|  
  
### Response  
 The same as in Get Application Gateway.  
  
 **Status code:** If successful, if gateway does not exist return HTTP Status code of 201(Created) otherwise HTTP status code of 200(OK).