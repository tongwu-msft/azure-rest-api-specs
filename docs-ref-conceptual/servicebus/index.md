---
ms.assetid: 650f91bc-3b04-4bca-b10f-16da6c509b80
ms.title: Azure Service Bus REST API reference
ms.prod: azure
ms.service: service-bus-messaging
author: sethmanheim
ms.author: sethm
ms.manager: timlt
---

# Azure Service Bus REST API

Azure Service Bus provides cloud-enabled communication with enterprise messaging and relayed communication that helps you connect on-premises solutions with the cloud. 

The REST APIs fall into the following categories:

- **Azure Resource Manager**: APIs that perform resource manager operations, and have `/providers/Microsoft.ServiceBus/` as part of the request URI. 
- **Service Bus service**: APIs that enable operations directly on the Service Bus service, and have `<namespaceName>.servicebus.windows.net/` in the request URI. 
- **"Classic" or RDFE management**: APIs that provide programmatic access to much of the functionality available through the Azure portal. These APIs have `management.core.windows.net` in the URI.

## REST operation groups

The Service Bus REST API provides operations for working with the following resources.

### Azure Resource Manager

[Resource manager APIs](/rest/api/servicebus/namespaces) are management APIs that perform operations on Service Bus entities, such as namespaces, queues, and topics. They are useful in scenarios that enable global authentication, rather than at the namespace or entity level.

| Operation group               | Description                                                                             |
|-------------------------------|-----------------------------------------------------------------------------------------|
| [Namespaces](~/docs-ref-autogen/servicebus/Namespaces.json)          | Provides operations for managing Service Bus namespaces. |
| [Queues](~/docs-ref-autogen/servicebus/Queues.json)  | Operations for managing Service Bus queues. |
| [Subscriptions](~/docs-ref-autogen/servicebus/Subscriptions.json)  | Operations for managing Service Bus topic subscriptions. |
| [Topics](~/docs-ref-autogen/servicebus/Topics.json)  | Operations for managing Service Bus topics. |

### Service Bus service

Service Bus [service APIs](/rest/api/servicebus/service-bus-runtime-rest) access the Service Bus service directly, and perform various management operations at the entity level, rather than at the namespace level (such as [sending a message to a queue](/rest/api/servicebus/send-message-to-queue). These APIs use [SAS authentication](/azure/service-bus-messaging/service-bus-sas). 

### RDFE management

These [management APIs](/rest/api/servicebus/resource-provider-apis) provide programmatic access to much of the functionality available through the Azure portal.

Service Bus also has a set of [RDFE APIs](https://msdn.microsoft.com/library/dn249730.aspx) that enable you to manage Service Bus [entity metrics](/rest/api/servicebus/service-bus-entity-metrics-rest-apis).

## See also

- [Azure Service Bus documentation](https://docs.microsoft.com/azure/service-bus)
- [Azure Service Bus Messaging code samples on GitHub](https://github.com/Azure-Samples/azure-servicebus-messaging-samples)
- [Azure Service Bus Relay code samples on GitHub](https://github.com/Azure-Samples/azure-servicebus-relay-samples)
