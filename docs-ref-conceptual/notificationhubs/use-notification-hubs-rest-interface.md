---
title: "How to use the Notification Hubs REST interface"
description: Use this API reference documentation to use the Azure Notification Hubs REST APIs to send notifications and manage registrations. 
ms.custom: ""
ms.date: 04/05/2019
ms.reviewer: ""
ms.service: "notification-hubs"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
author: "spelluru"
ms.author: "spelluru"
manager: "timlt"

---

# How to use the Notification Hubs REST Interface
This section describes how to use the Azure Notification Hubs REST APIs to send notifications and manage registrations.

Notification Hubs use the same security infrastructure as Microsoft Azure Service Bus, and thus supports Microsoft Azure Active Directory Access Control (also known as Access Control Service or ACS). This section focuses on Shared Access Secret authentication (SAS) as the most common form of accessing Notification Hubs.

Microsoft already provides a .NET wrapper around the REST API in the [Microsoft.Azure.NotificationHubs.NotificationHubClient](https://msdn.microsoft.com/library/azure/microsoft.azure.notificationhubs.notificationhubclient.aspx) (NuGet package) assembly. As such, this section focuses on Java and Javascript clients.

## In this section

- [Common concepts](common-concepts.md)
- [Using REST APIs from a backend](use-rest-api-backend.md)
- [Using REST APIs from a device](use-rest-api-device.md)

