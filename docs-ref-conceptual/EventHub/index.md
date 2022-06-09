---
ms.assetid: fb2b1bb5-ec2c-44fd-b486-8fc609197c30
title: Azure Event Hubs REST API reference
description: Learn how Azure Event Hubs is a scalable data ingress service that ingests millions of events per second so that you can process and analyze massive amounts of data.
ms.service: event-hubs
author: spelluru
ms.author: spelluru
ms.manager: femila
---

# Azure Event Hubs REST API

Azure Event Hubs is a highly scalable data ingress service that ingests millions of events per second so that you can process and analyze the massive amounts of data produced by your connected devices and applications. Once data is collected into an event hub, it can be transformed and stored using any real-time analytics provider or batching/storage adapters.

The REST APIs fall into the following categories:

- **Azure Resource Manager**: APIs that perform Resource Manager operations, and have `/providers/Microsoft.EventHub/` as part of the request URI. 
- **Event Hubs service**: APIs that enable operations directly on the Event Hubs service, and have `<namespaceName>.servicebus.windows.net/` in the request URI. 
- **"Classic" or RDFE management**: APIs that provide programmatic access to much of the functionality available through the Azure portal. These APIs have `management.core.windows.net` in the URI. Event Hubs doesn't have RDFE REST APIs at this time.

> [!IMPORTANT]
> If you are using **"Classic" or RDFE management APIs**, they are [**obsolete and retired**](https://docs.microsoft.com/azure/service-bus-messaging/deprecate-service-bus-management) as of **11/1/2021** and should no longer be used.


## REST operation groups
The Event Hubs REST API provides operations for working with the following resources.

### Azure Resource Manager
[Resource Manager APIs](/azure/templates/microsoft.eventhub/namespaces/eventhubs/consumergroups) are management APIs that perform operations on Event Hubs entities, such as namespaces, event hubs, and consumer groups. They are useful in scenarios that enable global authentication, rather than at the namespace or entity level.

| Operation group               | Description                                                                             |
|-------------------------------|-----------------------------------------------------------------------------------------|
| [Namespaces](/dotnet/api/microsoft.azure.management.eventhub.eventhubmanagementclient.namespaces)  | Operations for managing Event Hubs namespaces. |
| [Event Hubs](/dotnet/api/microsoft.azure.management.eventhub.eventhubmanagementclient.eventhubs)  | Operations for managing Event Hubs. |
| [Consumer Groups](/dotnet/api/microsoft.azure.management.eventhub.eventhubmanagementclient.consumergroups)          | Provides operations for working with Event Hubs consumer groups. |


### Event Hubs service
Event Hubs [service APIs](/rest/api/eventhub/event-hubs-runtime-rest) access the Event Hubs service directly, and perform various management operations at the entity level, rather than at the namespace level (such as [publisher policy operations](/rest/api/eventhub/publisher-policy-operations) and [sending events](/rest/api/eventhub/send-event). These APIs can use: 

- Azure Active Directory (Azure AD) authentication
    - [Authenticate a managed identity with Azure Active Directory to access Event Hubs Resources](/azure/event-hubs/authenticate-managed-identity)- 
    - [Authenticate an application with Azure Active Directory to access Event Hubs resources](/azure/event-hubs/authenticate-application)
    - [Authorize access to Event Hubs resources using Azure Active Directory](/azure/event-hubs/authorize-access-azure-active-directory)
    - [Get an Azure Active Directory (Azure AD) token and use it send events to an event hub](get-azure-active-directory-token.md)
- SAS authentication
    - [Authenticate access to Event Hubs resources using SAS](/azure/event-hubs/authenticate-shared-access-signature)
    - [Authorizing access to Event Hubs resources using Shared Access Signatures](/azure/event-hubs/authorize-access-shared-access-signature)
    - [Generate SAS token](generate-sas-token.md)

## See also
- [Azure Event Hubs documentation](https://docs.microsoft.com/azure/event-hubs)
