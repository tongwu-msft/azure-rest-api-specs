---
ms.assetid: 650f91bc-3b04-4bca-b10f-16da6c509b80
title: Azure Service Bus REST API reference
ms.prod: azure
ms.service: service-bus-messaging
author: spelluru
ms.author: spelluru
ms.manager: femila
service_description: To be added
---

# Azure Service Bus REST API

Azure Service Bus provides cloud-enabled communication with enterprise messaging and relayed communication that helps you connect on-premises solutions with the cloud. See [Azure Service Bus documentation](https://docs.microsoft.com/azure/service-bus-messaging/) for a comprehensive conceptual documentation for the service. 

The REST APIs fall into the following categories:

- **Azure Resource Manager**: APIs that perform Resource Manager operations, and have `/providers/Microsoft.ServiceBus/` as part of the request URI. 
- **Service Bus service**: APIs that enable operations directly on the Service Bus service, and have the public cloud endpoint `namespaceName.servicebus.windows.net` in the request URI. Other possible domain names are as follows:
   - Azure Germany: `namespaceName.servicebus.cloudapi.de`
   - Azure China 21Vianet: `namespaceName.servicebus.chinacloudapi.cn`
   - United States government: `namespaceName.servicebus.usgovcloudapi.net`

> [!IMPORTANT]
> If you are using **"Classic" or RDFE management APIs**, they are [**obsolete and retired**](https://techcommunity.microsoft.com/t5/Service-Bus-blog/Deprecating-Service-Management-support-for-Azure-Service-Bus/ba-p/370909/) and should no longer be used.


## REST operation groups
The Service Bus REST API provides operations for working with the following resources:

### Azure Resource Manager

[Resource Manager APIs](/rest/api/servicebus/namespaces) are management APIs that perform operations on Service Bus entities, such as namespaces, queues, and topics. They are useful in scenarios that enable global authentication, rather than at the namespace or entity level.

| Operation group               | Description                                                                             |
|-------------------------------|-----------------------------------------------------------------------------------------|
| [Namespaces](xref:management.azure.com.servicebus.namespaces)          | Provides operations for managing Service Bus namespaces. |
| [Queues](xref:management.azure.com.servicebus.queues)  | Operations for managing Service Bus queues. |
| [Subscriptions](xref:management.azure.com.servicebus.subscriptions)  | Operations for managing Service Bus topic subscriptions. |
| [Topics](xref:management.azure.com.servicebus.topics)  | Operations for managing Service Bus topics. |

### Service Bus service

Service Bus [service APIs](/rest/api/servicebus/service-bus-runtime-rest) access the Service Bus service directly, and perform various management operations at the entity level, rather than at the namespace level (such as [sending a message to a queue](/rest/api/servicebus/send-message-to-queue). These APIs use [SAS authentication](https://docs.microsoft.com/azure/service-bus-messaging/service-bus-sas) or [Azure Active Directory authentication](https://docs.microsoft.com/azure/service-bus-messaging/authenticate-application).  

## See also

- [Azure Service Bus documentation](https://docs.microsoft.com/azure/service-bus)
- [Azure Service Bus Messaging code samples on GitHub](https://github.com/Azure-Samples/azure-servicebus-messaging-samples)
