---
ms.assetid: 
ms.title: Network Watcher REST APIs
ms.service: network-watcher
author: georgewallace
ms.author: gwallace
ms.manager: timt
---


# Network Watcher

Network Watcher is the resource that exposes networking diagnostic APIs in Azure. Before any calls can be made into the APIs below, you must create a Network Watcher resource. Network Watcher is a regional resource. You must create one Network Watcher resource per subscription per region. The simplest way to create a Network Watcher is from within the portal, but you can also manually create and manage your Network Watcher resources using the REST API below.

Network Watcher REST APIs include:

- **[Network Watcher](network-watcher-rest-api.md)**: This API provides the ability to manage Network Watchers.
- **[Topology](topology/topology-rest-api.md)**: This API provides the ability to view the relationships of your networking resources. 
- **[Packet Capture](packet-capture/packet-capture-rest-api.md)**: This API provides the ability to capture network traffic on a virtual machine.
- **[Security Group View](security-group-view/security-group-view-rest-api.md)**: This API provides a view of the security rules associated with a virtual machine.
- **[IP Flow verify](ip-flow-verify/ip-flow-verify-rest-api.md)**: This API provides information on whether or not traffic is allowed or denied from a virtual machine.
- **[Next hop](next-hop/next-hop-rest-api.md)**: This API provides the ability to find the next hop from a virtual machine NIC.
- **[Troubleshoot](troubleshoot/troubleshoot-rest-api.md)**: This API provides the ablity to troubleshoot your networking resources in Azure.
