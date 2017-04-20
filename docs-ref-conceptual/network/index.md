---
ms.title: Azure Network REST APIs
ms.date: 04/13/2017
ms.service: virtual-network
ms.topic: reference
ms.devlang: rest
author: anavinahar 
ms.author: annahar 
ms.manager: narayan
---
# Network

This is the documentation for the REST APIs for Azure networking resources.


## Application Gateway

|Operation Group|Description|
|---|---|
|[Application Gateway](~/docs-ref-autogen/network/applicationgateways.json) |Provides operations for managing Application Gateways.|

## Express Route

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
|[Load Balancers](~/docs-ref-autogen/network/loadbalancers.json) |Provides operations for managing Load Balancers.|

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
|[Network Interface Cards](~/docs-ref-autogen/network/networkinterfaces.json) |Provides operations for managing Network Interface Cards.|
|[Network Security Groups](~/docs-ref-autogen/network/networksecuritygroups.json)   | Provides operations for managing Network Security Groups.|
|[Network Security Rules](~/docs-ref-autogen/network/securityrules.json)   |Provides operations for managing Network Security Rules.|
|[Public IP Addresses](~/docs-ref-autogen/network/publicipaddresses.json)   | Provides operations for managing Public IP Addresses.|
|[Subnets](~/docs-ref-autogen/network/subnets.json)  |Provides operations for managing Subnets.|
|[Virtual Networks](~/docs-ref-autogen/network/virtualnetworks.json)  |Provides operations for managing Virtual Networks.|
|[Route Tables](~/docs-ref-autogen/network/routetables.json)   |Provides operations for managing Route Tables.|
|[Routes](~/docs-ref-autogen/network/routes.json)   |Provides operations for managing Routes.|
|[Route filters](~/docs-ref-autogen/network/routefilters.json)   |Provides operations for managing Route filters.|
|[Network Interfce Cards (Virtual Machine scale sets)](~/docs-ref-autogen/network/Network%20Interfaces%20VM%20Scale%20Sets.json)   |Provides operations for managing Network Interface Cards on virtual machine scale sets.|

## General

|Operation Group|Description|
|---|---|
| [Check DNS name availability](~/docs-ref-autogen/network/checkdnsnameavailability.json)       |  Checks if the DNS name is available. |
| [Check subscription usages](~/docs-ref-autogen/network/usages.json)           |  Returns the subscription usage for a region. |