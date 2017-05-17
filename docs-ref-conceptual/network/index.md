---
ms.title: Network REST APIs
ms.date: 03/15/2017
ms.service: virtual-network
ms.topic: reference
ms.devlang: rest
author: anavinahar 
ms.author: annahar 
ms.manager: narayan
---
# Network

Use these APIs to manage your Azure Networking resources. All task operations conform to the HTTP/1.1 protocol specification and each operation returns an x-ms-request-id header that can be used to obtain information about the request. You must make sure that requests made to these resources are secure.

Network REST APIs include:

## Application Gateway

|Operation Group|Description|
|---|---|
|[Application Gateway](applicationgateway/index.md) |Provides operations for managing Application Gateways.|

## ExpressRoute

|Operation Group|Description|
|---|---|
|[ExpressRoute Service Providers](~/docs-ref-autogen/network/expressrouteserviceproviders.json)    |Provides operations listing ExpressRoute providers.|
|[ExpressRoute Circuits](~/docs-ref-autogen/network/expressroutecircuits.json)   | Provides operations for managing ExpressRoute circuit authorizations.|
|[ExpressRoute Authorizations](~/docs-ref-autogen/network/expressroutecircuitauthorizations.json)  |Provides operations for managing ExpressRoute BGP peerings.|
|[ExpressRoute BGP Peering](~/docs-ref-autogen/network/expressroutecircuitpeerings.json)  |Provides operations for managing ExpressRoute BGP peerings.|
|[BGP Service communities](~/docs-ref-autogen/network/bgpservicecommunities.json)    |Gets all available BGP service comunities.|

## Load Balancer

|Operation Group|Description|
|---|---|
|[Load Balancer](loadbalancer/index.md) |Provides operations for managing Load Balancers.|

## Network Gateway

|Operation Group|Description|
|---|---|
|[Connections](~/docs-ref-autogen/network/virtualnetworkgatewayconnections.json)  |Provides operations for managing connections|
|[Local Network Gateways](~/docs-ref-autogen/network/localnetworkgateways.json) | Provides operations for managing local network gateways|
|[Virtual Network Gateways](~/docs-ref-autogen/network/virtualnetworkgateways.json) |Provides operations for managing virtual network gateways|

## Network Watcher

|Operation Group|Description|
|---|---|
|[Network Watcher](~/docs-ref-autogen/network/networkwatchers.json) |Provides the ability to manage Network Watchers.|
|[Topology](~/docs-ref-autogen/network/networkwatchers.json#NetworkWatchers_GetTopology)   | Provides the ability to view the relationships of your networking resources. |
|[Packet Capture](~/docs-ref-autogen/network/packetcaptures.json)   |Provides the ability to capture network traffic on a virtual machine.| 
|[Security Group View](~/docs-ref-autogen/network/networkwatchers.json#NetworkWatchers_GetVMSecurityRules)   | Provides a view of the security rules associated with a virtual machine.| 
|[IP Flow verify](~/docs-ref-autogen/network/networkwatchers.json#NetworkWatchers_VerifyIPFlow)  |Provides information on whether or not traffic is allowed or denied from a virtual machine.| 
|[Next hop](~/docs-ref-autogen/network/networkwatchers.json#NetworkWatchers_GetNextHop)  |Provides operations for managing Virtual Networks.| 
|[Troubleshoot](~/docs-ref-autogen/network/networkwatchers.json#NetworkWatchers_GetTroubleshooting)   |Provides the ablity to troubleshoot your networking resources in Azure.| 
|[NSG Flow Logging](~/docs-ref-autogen/network/networkwatchers.json#NetworkWatchers_GetFlowLogStatus)   |Provides the ablity to configure and manage Network Security Group Flow Logs.| 

## Virtual Network

|Operation Group|Description|
|---|---|
|[Network Interface Cards](virtualnetwork/network-interface-cards.md) |Provides operations for managing Network Interface Cards.|
|[Network Security Groups](virtualnetwork/network-security-groups.md)   | Provides operations for managing Network Security Groups.|
|[Network Security Rules](virtualnetwork/network-security-rules.md)   |Provides operations for managing Network Security Rules.|
|[Public IP Addresses](virtualnetwork/public-ip-addresses.md)   | Provides operations for managing Public IP Addresses.|
|[Subnets](virtualnetwork/virtualnetworksubnets.md)  |Provides operations for managing Subnets.|
|[Virtual Networks](virtualnetwork/index.md)  |Provides operations for managing Virtual Networks.|
|[Route Tables](virtualnetwork/route-tables.md)   |Provides operations for managing Route Tables.|
|[Routes](virtualnetwork/networkroutes.md)   |Provides operations for managing Routes.|

## General

|Operation Group|Description|
|---|---|
| [Check DNS name availability](virtualnetwork/check-dns-name-availability.md)       |  Checks if the DNS name is available. |
| [Check subscription usages](~/docs-ref-autogen/network/usages.json)           |  Returns the subscription usage for a region. |