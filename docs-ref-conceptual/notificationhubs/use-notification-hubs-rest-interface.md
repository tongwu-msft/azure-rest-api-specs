---
title: How to Use the Notification Hubs REST Interface
TOCTitle: How to Use the Notification Hubs REST Interface
ms:assetid: 11e63fc2-fbd6-4d0d-a80f-03d2cd75d53f
ms:mtpsurl: https://msdn.microsoft.com/en-us/library/Dn530746(v=Azure.100)
ms:contentKeyID: 59682990
ms.date: 04/22/2016
mtps_version: v=Azure.100
---

# How to Use the Notification Hubs REST Interface

 


This section describes how to use the Azure Notification Hubs REST APIs to send notifications and manage registrations.

Notification Hubs use the same security infrastructure as Microsoft Azure Service Bus, and thus supports Microsoft Azure Active Directory Access Control (also known as Access Control Service or ACS). This section focuses on Shared Access Secret authentication (SAS) as the most common form of accessing Notification Hubs.

Microsoft already provides a .NET wrapper around the REST API in the [Microsoft.Azure.NotificationHubs.NotificationHubClient](https://msdn.microsoft.com/en-us/library/azure/microsoft.azure.notificationhubs.notificationhubclient.aspx) (NuGet package) assembly. As such, this section focuses on Java and Javascript clients.

## In this section

[Common Concepts](dn495627\(v=azure.100\).md)

[Using REST APIs from a Backend](dn495628\(v=azure.100\).md)

[Using REST APIs from the Device](dn495631\(v=azure.100\).md)

