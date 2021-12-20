---
title: Azure Event Grid REST API | Microsoft Docs
description: This article lists REST operation groups for Azure Event Grid. 
author: spelluru
ms.author: spelluru
ms.date: 01/08/2021
ms.topic: reference
ms.service: event-grid
ms.devlang: rest-api
service_description: Build applications with event-based architecture
---

# Azure Event Grid REST API

Azure Event Grid enables you to easily build applications with event-based architectures. You can publish topics to Event Grid, and subscribe to topics through Event Grid. When subscribing, you provide an endpoint to respond to the event. 

> [!NOTE]
> See [Track asynchronous Azure operations](/azure/azure-resource-manager/management/async-operations) to learn how to track the status of asynchronous operations through values returned in the response. 

## REST Operation Groups 

| Operation group | Description                                                        |
|-----------------|--------------------------------------------------------------------|
| [Domain Topics](/rest/api/eventgrid/version2021-06-01-preview/domain-topics) | Returns information about Event Grid domain topics. |
| [Domains](/rest/api/eventgrid/version2021-06-01-preview/domains) | Provides operations for working with Event Grid domains. |
| [Event Channels](/rest/api/eventgrid/version2021-06-01-preview/event-channels) | Provides operations for working with event channels. |
| [Event Subscriptions](/rest/api/eventgrid/version2021-06-01-preview/event-subscriptions) | Provides operations for working with event subscriptions. |
| [Extension Topics](/rest/api/eventgrid/version2021-06-01-preview/extension-topics) | Provides operations for indicating which events to route to an endpoint. |
| [Operations](/rest/api/eventgrid/version2021-06-01-preview/operations) | Shows operations from the Event Grid resource provider. |
| [Partner Namespaces](/rest/api/eventgrid/version2021-06-01-preview/partner-namespaces) | Provides operations for working with partner namespaces. |
| [Partner Registrations](/rest/api/eventgrid/version2021-06-01-preview/partner-registrations) | Provides operations for working with partner registrations. |
| [Partner Topic Event Subscriptions](/rest/api/eventgrid/version2021-06-01-preview/partner-topic-event-subscriptions) | Provides operations for working with partner topic event subscriptions. |
| [Partner Topics](/rest/api/eventgrid/version2021-06-01-preview/partner-topics) | Provides operations for working with partner topics. |
| [Private Endpoint Connections](/rest/api/eventgrid/version2021-06-01-preview/private-endpoint-connections) | Provides operations for working with private endpoint connections. |
| [Private Link Resources](/rest/api/eventgrid/version2021-06-01-preview/private-link-resources) | Provides operations for working with private link resources. |
| [System Topic Event Subscriptions](/rest/api/eventgrid/version2021-06-01-preview/system-topic-event-subscriptions) | Provides operations for working with system topic event subscriptions. |
| [System Topics](/rest/api/eventgrid/version2021-06-01-preview/system-topics) | Provides operations for working with system topics. |
| [Topic Types](/rest/api/eventgrid/version2021-06-01-preview/topic-types) | Returns information about topic and event types. |
| [Topics](/rest/api/eventgrid/version2021-06-01-preview/topics) | Provides operations for working publisher topics. |

## See also

- For more information, see [An introduction to Azure Event Grid](/azure/event-grid/overview).
- To get started with Event Grid, see [Create and route custom events with Azure Event Grid](/azure/event-grid/custom-event-quickstart).
