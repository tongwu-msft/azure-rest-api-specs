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
| [Domain Topics](xref:eventgrid.controlplane-version2021-06-01-preview.domain-topics) | Returns information about Event Grid domain topics. |
| [Domains](xref:eventgrid.controlplane-version2021-06-01-preview.domains) | Provides operations for working with Event Grid domains. |
| [Event Subscriptions](xref:eventgrid.controlplane-version2021-06-01-preview.event-subscriptions) | Provides operations for indicating which events to route to an endpoint. |
| [Operations](xref:eventgrid.controlplane-version2021-06-01-preview.operations) | Shows operations from the Event Grid resource provider. |
| [Topic Types](xref:eventgrid.controlplane-version2021-06-01-preview.topic-types) | Returns information about topic and event types. |
| [Topics](xref:eventgrid.controlplane-version2021-06-01-preview.topics) | Provides operations for working publisher topics. |

## See also

- For more information, see [An introduction to Azure Event Grid](https://docs.microsoft.com/azure/event-grid/overview).
- To get started with Event Grid, see [Create and route custom events with Azure Event Grid](https://docs.microsoft.com/azure/event-grid/custom-event-quickstart).
