---
title: Connections
ms.date: 03/09/2017
ms.service: expressroute
ms.devlang: rest-api
ms.topic: reference
author: yushwang
ms.author: yushwang
manager: rossort
---
# Connections
The Connection resource represents a connection between two gateways. One of the gateways in the connection must be a virtual network gateway, but the other gateway could be another virtual network gateway, a local network gateway, or a dedicated circuit.  

This table lists the operations included in the Connections REST API.  
  
| Operation | REST Verb | Description | 
|---------|---------|-----------|
| [Create or update a connection](create-or-update-a-connection.md)  |  PUT | Creates or updates a connection resource.  |  
| [Delete a connection ](delete-a-connection.md)   |  DELETE | Deletes a connection. |  
| [Get information about a connection ](get-information-about-a-connection.md)   |  GET | Gets a connection. |  
| [Get the shared key for a connection ](get-the-shared-key-for-a-connection.md)  |  GET | Gets the shared key for a connection. |  
| [List all of the connections for a virtual network gateway ](list-all-of-the-connections-for-a-virtual-network-gateway.md)   |  GET | Gets all connections for a virtual network gateway. |  
| [Reset the shared key of a connection ](reset-the-shared-key-of-a-connection.md) |  POST | Resets the shared key of a connection. |  
| [Set the shared key of a connection ](set-the-shared-key-of-a-connection.md) |  PUT | Sets the shared key for a connection. |  