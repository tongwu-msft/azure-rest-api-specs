---
ms.assetid: 98458dd8-4036-4de9-aa84-abc4b1df33e0
ms.title: Azure Storage Resource Provider REST API
ms.service: storage
author: robinsh
ms.author: robinsh
ms.manager: carmonm
---


# Azure Storage Resource Provider REST API Reference

The Storage Resource Provider (SRP) enables you to manage your storage account and keys programmatically.

The Storage Resource Provider requires all requests to be versioned. To make a request against the SRP, you must specify the version that you want to use for that operation. The currently supported versions are:

* 2016-12-01
* 2016-01-01
* 2015-06-15
* 2015-05-01-preview

## REST Operation Groups

| Operation Group | Description |
|-----------------|-------------|
| [Storage Accounts](~/docs-ref-autogen/storagerp/storageaccounts.json) |Operations to manage your storage accounts, such as create, update, delete, etc.|
| [Usage](~/docs-ref-autogen/storagerp/usage.json) |Operation to retrieve the current usage count and limit for the subscription's resources.|

