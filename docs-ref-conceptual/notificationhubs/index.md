---
title: Azure Notification Hubs REST API reference
description: Use this API reference documentation to provide an easy-to-use and scaled-out push engine that allows you to send notifications to any platform.
ms.service: notification-hubs
author: spelluru
ms.author: spelluru
ms.manager: timlt
service_description: Azure Notification Hubs provide an easy-to-use and scaled-out push engine that allows you to send notifications to any platform (iOS, Android, Windows, Kindle, Baidu, etc.) from any backend (cloud or on-premises). 
---

# Azure Notification Hubs REST API

Azure Notification Hubs provide an easy-to-use and scaled-out push engine that allows you to send notifications to any platform (iOS, Android, Windows, Kindle, Baidu, etc.) from any backend (cloud or on-premises). For more information about the service, see [Azure Notification Hubs conceptual documentation](https://docs.microsoft.com/azure/notification-hubs/)

The REST APIs fall into the following categories:

- **Azure Resource Manager**: APIs that perform Resource Manager operations, and have `/providers/Microsoft.NotificationHubs/` as part of the request URI. 
- **Notification Hubs service**: APIs that enable operations directly on the Notification Hubs service, and have `<namespaceName>.servicebus.windows.net/` in the request URI. 
- **"Classic" or RDFE management**: APIs that provide programmatic access to much of the functionality available through the Azure portal. These APIs have `management.core.windows.net` in the URI. Notification Hubs does not have RDFE REST APIs at this time.

## REST operation groups

The Notification Hubs REST API provides operations for working with the following resources.

### Azure Resource Manager

[Resource Manager APIs](/rest/api/notificationhubs/namespaces/checkavailability) are management APIs that perform operations on Notification Hubs entities, such as notification hubs and namespaces. They are useful in scenarios that enable global authentication, rather than at the namespace or entity level.

| Operation group               | Description                                                                             |
|-------------------------------|-----------------------------------------------------------------------------------------|
| [Namespaces](xref:management.azure.com.notificationhubs.namespaces)  | Operations for managing Notification Hubs namespaces. |
| [Notification Hubs](xref:management.azure.com.notificationhubs.notificationhubs)  | Operations for managing notification hubs. |


### Notification Hubs service
Notification Hubs [service APIs](/rest/api/notificationhubs/notification-hubs-rest) access the Notification Hubs service directly, and perform various management operations at the entity level, rather than at the namespace level such as [sending notifications](/rest/api/notificationhubs/direct-send) and [creating registrations](/rest/api/notificationhubs/create-registration)

## See also

- [Azure Notification Hubs documentation](https://docs.microsoft.com/azure/notification-hubs)
