---
title: "Snapshots REST API"
ms.date: 2016-06-29
ms.prod: azure
ms.service: managed-disks
ms.topic: reference
ms.assetid: 
author: davidmu
manager: timt
---

# Snapshots REST API  
  
This table lists the operations included in the Snapshots REST API.  
  
| Operation | REST Verb | Description | 
|---------|---------|-----------|
| [Begin access to a blob associated with a snapshot](../snapshots/snapshots-grant-access.md) |  POST | Provides access to a blob associated with a snapshot. |  
| [Create a snapshot](../snapshots/snapshots-create-or-update.md) | PUT | Creates a new snapshot. | 
| [Delete a snapshot](../snapshots/snapshots-delete.md) | DELETE | Deletes the specified snapshot. |  
| [End access to a blob associated with a snapshot](../snapshots/snapshots-revoke-access.md) | POST | Removes access to the blob associated with a snapshot. |
| [Get information about a snapshot](../snapshots/snapshots-get.md) | GET | Gets information about the specified snapshot. |  
| [List snapshots in a resource group](../snapshots/snapshots-list-by-resource-group.md) | GET | Gets a list of snapshots in the specified resource group. |  
| [List snapshots in a subscription](../snapshots/snapshots-list-by-subscription.md) | GET | Gets a list of snapshots in your subscription. |  
| [Update a snapshot](../snapshots/snapshots-update.md) | PATCH | Updates some properties of the specified snapshot. |