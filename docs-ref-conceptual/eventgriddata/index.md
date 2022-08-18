---
title: Event Grid REST API | Microsoft Docs
description: Learn how Azure Event Grid enables you to easily build applications with event-based architectures.
author: spelluru
ms.author: spelluru
ms.date: 08/21/2019
ms.topic: reference
ms.service: azure
ms.devlang: rest-api
service_description: Build applications with event-based architecture
---

# Event Grid REST API

Azure Event Grid enables you to easily build applications with event-based architectures. You can publish topics to Event Grid, and subscribe to topics through Event Grid. When subscribing, you provide an endpoint to respond to the event. 

## REST Operation Groups 

| Operation group | Description                                                        |
|-----------------|--------------------------------------------------------------------|
| [Domain Topics](xref:management.azure.com.eventgrid.controlplane-version2021-10-15-preview.domaintopics)  | Returns information about Event Grid domain topics. |
| [Domains](xref:management.azure.com.eventgrid.controlplane-version2021-10-15-preview.domains) | Provides operations for working with Event Grid domains. |
| [Event Subscriptions](xref:management.azure.com.eventgrid.controlplane-version2021-10-15-preview.eventsubscriptions) | Provides operations for indicating which events to route to an endpoint. |
| [Operations](xref:management.azure.com.eventgrid.controlplane-version2021-10-15-preview.operations) | Shows operations from the Event Grid resource provider. |
| [Topic Types](xref:management.azure.com.eventgrid.controlplane-version2021-10-15-preview.topictypes) | Returns information about topic and event types. |
| [Topics](xref:management.azure.com.eventgrid.controlplane-version2021-10-15-preview.topics) | Provides operations for working publisher topics. |

## See also

- For more information, see [An introduction to Azure Event Grid](/azure/event-grid/overview).
- To get started with Event Grid, see [Create and route custom events with Azure Event Grid](/azure/event-grid/custom-event-quickstart).
