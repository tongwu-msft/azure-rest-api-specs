---
title: Event Grid REST API | Microsoft Docs
author: spelluru
ms.author: spelluru
ms.date: 08/21/2019
ms.topic: reference
ms.service: Azure
ms.devlang: rest-api
service_description: Build applications with event-based architecture
---

# Event Grid REST API

Azure Event Grid enables you to easily build applications with event-based architectures. You can publish topics to Event Grid, and subscribe to topics through Event Grid. When subscribing, you provide an endpoint to respond to the event. 

## REST Operation Groups 

| Operation group | Description                                                        |
|-----------------|--------------------------------------------------------------------|
| [Domain Topics](/rest/api/eventgrid/controlplane-version2021-12-01/domain-topics)  | Returns information about Event Grid domain topics. |
| [Domains](/rest/api/eventgrid/controlplane-version2021-12-01/domains) | Provides operations for working with Event Grid domains. |
| [Event Subscriptions](/rest/api/eventgrid/controlplane-version2021-12-01/event-subscriptions) | Provides operations for indicating which events to route to an endpoint. |
| [Operations](/rest/api/eventgrid/controlplane-version2021-12-01/operations) | Shows operations from the Event Grid resource provider. |
| [Topic Types](/rest/api/eventgrid/controlplane-version2021-12-01/topic-types) | Returns information about topic and event types. |
| [Topics](/rest/api/eventgrid/controlplane-version2021-12-01/topics) | Provides operations for working publisher topics. |

## See also

- For more information, see [An introduction to Azure Event Grid](/azure/event-grid/overview).
- To get started with Event Grid, see [Create and route custom events with Azure Event Grid](/azure/event-grid/custom-event-quickstart).
