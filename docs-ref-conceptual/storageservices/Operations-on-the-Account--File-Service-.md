---
title: Operations on the FileService - Azure Files
description: The FileService resource provides Azure Files specific management settings that apply to all of the file shares in the storage account. Learn how to programmatically interact with the FileService resource. 
author: wmgries

ms.date: 06/05/2021
ms.service: storage
ms.topic: reference
ms.author: wgries
---

# Operations on the FileService
The `FileService` resource provides Azure Files specific management settings that apply to all of the file shares in the storage account. The `FileService` resource is a child of the storage account resource, and a storage account only ever has one `FileService` resource, called `default`.

There are two ways to interact the `FileService` resource:

- (Recommended) The storage resource provider (Microsoft.Storage), which provides a control plane API to manage through Azure Resource Manager.
- (Legacy) The FileREST API, which provides additional HTTPS endpoints to manage the `FileService`.

Unless you have a specific reason, you should use the control plane API (the storage resource provider) for all management activities. APIs to manage the `FileService` are exposed through the data plane for legacy reasons. Data plane APIs that do management actions are fully supported, and acceptable for use in the following circumstances:

- You have a legacy application or service that is already using these APIs.
- You have very high scale requirements; the control plane API provided by the storage resource provider has much lower scale guarantees than the FileREST API.

New parameters and actions on the `FileService` may not be added to the data plane REST SDKs, even if they are exposed in FileREST. Use the control plane SDKs to access parameters and actions.

To learn more about Azure Files' API surface area, see [Azure Files REST API](./File-Service-REST-API.md).

## Management APIs
This section contains the following topics.

| Action | Control plane API (Microsoft.Storage) | Data plane API (FileREST) | Available on SMB file shares | Available on NFS file shares |
|-|-|-|:-:|:-:|
| Get `FileService` | <ul><li>[File Services - Get Service Properties](/rest/api/storagerp/file-services/get-service-properties)</li><li>[File Services - List](/rest/api/storagerp/file-services/list)</li></ul> | [Get File Service Properties](Get-File-Service-Properties.md) | ![Yes](./media/yes-icon.png) | ![Yes](./media/yes-icon.png) |
| Set `FileService` | [File Services - Set Service Properties](/rest/api/storagerp/file-services/set-service-properties) | [Set File Service Properties](Set-File-Service-Properties.md) | ![Yes](./media/yes-icon.png) | ![Yes](./media/yes-icon.png) |
| Preflight File Request | -- | [Preflight File Request](Preflight-File-Request.md) | ![Yes](./media/yes-icon.png) | ![Yes](./media/yes-icon.png) |

## See also

- [File Service REST API](File-Service-REST-API.md)
- [Operations on FileShares](./Operations-on-Shares--File-Service-.md)
