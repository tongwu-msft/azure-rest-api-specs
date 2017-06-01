---
ms.assetid: fb2b1bb5-ec2c-44fd-b486-8fc609197c30
ms.title: Azure Event Hubs REST API reference
ms.prod: azure
ms.service: event-hubs
author: sethmanheim
ms.author: sethm
ms.manager: timlt
service_description: To be added
---

# Azure Event Hubs REST API

Azure Event Hubs is a highly scalable data ingress service that ingests millions of events per second so that you can process and analyze the massive amounts of data produced by your connected devices and applications. Once data is collected into an Event Hub, it can be transformed and stored using any real-time analytics provider or batching/storage adapters.

The REST APIs fall into the following categories:

- **Azure Resource Manager**: APIs that perform resource manager operations, and have `/providers/Microsoft.EventHub/` as part of the request URI. 
- **Event Hubs service**: APIs that enable operations directly on the Event Hubs service, and have `<namespaceName>.servicebus.windows.net/` in the request URI. 
- **"Classic" or RDFE management**: APIs that provide programmatic access to much of the functionality available through the Azure portal. These APIs have `management.core.windows.net` in the URI. Event Hubs does not have RDFE REST APIs at this time.

## REST operation groups

The Event Hubs REST API provides operations for working with the following resources.

### Azure Resource Manager

[Resource manager APIs](/rest/api/eventhub/consumergroups) are management APIs that perform operations on Event Hubs entities, such as event hubs, namespaces, and consumer groups. They are useful in scenarios that enable global authentication, rather than at the namespace or entity level.

| Operation group               | Description                                                                             |
|-------------------------------|-----------------------------------------------------------------------------------------|
| [Consumer Groups](~/docs-ref-autogen/EventHub/ConsumerGroups.json)          | Provides operations for working with Event Hubs consumer groups. |
| [Event Hubs](~/docs-ref-autogen/EventHub/EventHubs.json)  | Operations for managing Event Hubs. |
| [Namespaces](~/docs-ref-autogen/EventHub/Namespaces.json)  | Operations for managing Event Hubs namespaces. |

### Event Hubs service

Event Hubs [service APIs](/rest/api/eventhub/event-hubs-runtime-rest) access the Event Hubs service directly, and perform various management operations at the entity level, rather than at the namespace level (such as [publisher policy operations](/rest/api/eventhub/publisher-policy-operations) and [sending events](/rest/api/eventhub/send-event). These APIs use [SAS authentication](/azure/event-hubs/event-hubs-authentication-and-security-model-overview).

At this time, the Event Hubs service APIs are documented on [Microsoft.com](/rest/api/eventhub/event-hubs-runtime-rest) as well as on [MSDN](https://msdn.microsoft.com/library/azure/mt652156.aspx).

## See also

- [Azure Event Hubs documentation](https://docs.microsoft.com/azure/event-hubs)
