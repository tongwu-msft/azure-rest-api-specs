---
ms.assetid: 35b959eb-17b8-4877-af18-247582a0e67e
ms.title: Azure Server Management
ms.service: azure-server-management
author: steved0x
ms.author: sdanie
ms.manager: douge
---


# Azure Server Manager

The Azure Server Management REST API provides programmatic access to much of the functionality available through the [Azure Portal](https://portal.azure.com).

> [!IMPORTANT]
> The Azure Server Management REST API provides access to the classic model of deployment, which is not supported by all new services. Microsoft recommends using the Resource Manager deployment model. For more information, see [Azure Resource Manager vs. classic deployment: Understand deployment models and the state of your resources](https://azure.microsoft.com/en-us/documentation/articles/resource-manager-deployment-model/).

## REST Operation Groups

| Resource Groups             | Description                                                        |
|-----------------------------|--------------------------------------------------------------------|
| [Gateway](./gateway)        | Provides operations for working with management service gateways.  |
| [Node](./node)              | Provides operations for configuring management nodes.              |
| [Power Shell](./powershell) | Provides operations for managing PowerShell commands and sessions. |
| [Session](./session)        | Provides operations for managing a node's sessions.                |

