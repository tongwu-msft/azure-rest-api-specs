---
ms.assetid: 7b406a24-3966-484a-b926-af54421b1dc1
title: "Azure Web PubSub REST API reference"
description: Describes the REST APIs Azure Web PubSub service supports to manage the connections and send messages to them.
ms.date: "04/27/2021"
ms.service: azure-web-pubsub
author: lianwei
ms.author: lianwei
service_description: Azure Web PubSub enables you to build real-time messaging web applications using WebSockets and the publish-subscribe pattern.
---

# Azure Web PubSub

[Azure Web PubSub](https://aka.ms/awps/doc) is a service that enables you to build real-time messaging web applications using WebSockets and the publish-subscribe pattern. Any platform supporting WebSocket APIs can connect to the service easily, e.g. web pages, mobile applications, edge devices, etc. The service manages the WebSocket connections for you and allows up to 100K concurrent connections. It provides powerful APIs for you to manage these clients and deliver real-time messages.

## REST Operation Groups

| Operation Group | Description |
|-----------------|-------------|
|[Service Status](/rest/api/webpubsub/healthapi)| Provides operations to check the service status |
|[Hub Operations](/rest/api/webpubsub/webpubsub)| Provides operations to manage the connections and send messages to them. |
## See Also

- [Azure Web PubSub](https://aka.ms/awps/doc)
