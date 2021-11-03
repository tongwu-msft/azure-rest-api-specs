---
title: Operations on FileShares - Azure Files
description: The FileShare resource provides management settings for Azure file shares. Learn how to programmatically interact with the FileShare resource.   
author: wmgries

ms.date: 06/05/2021
ms.service: storage
ms.topic: reference
ms.author: wgries
---

# Operations on FileShares
The `FileShare` resource provides the management interface for the Azure file share, allowing you to control the file share name, enabled protocol, allocated size ("quota"), etc. The `FileShare` resource is a child of the `FileService` resource, and a storage account can contain infinitely many file shares, subject to the resource limits of the storage account.

There are two ways to interact with `FileShare` resources:

- (Recommended) The storage resource provider (Microsoft.Storage), which provides a control plane API to manage through Azure Resource Manager.
- (Legacy) The FileREST API, which provides additional HTTPS endpoints to manage `FileShares`.

Unless you have a specific reason, you should use the control plane API (the storage resource provider) for all management activities. APIs to manage `FileShares` are exposed through the data plane for legacy reasons. Data plane APIs that do management actions are fully supported, and acceptable for use in the following circumstances:

- You have a legacy application or service that is already using these APIs.
- You have very high scale requirements; the control API provided by the storage resource provider has much lower scale guarantees than the FileREST API.

New parameters and actions on the `FileService` may not be added to the data plane REST SDKs, even if they are exposed in FileREST. Use the control plane SDKs to access parameters and actions.

To learn more about Azure Files' API surface area, see [Azure Files REST API](./File-Service-REST-API.md).

## Management APIs

| Action | Control plane API (Microsoft.Storage) | Data plane API (FileREST) | Available on SMB file shares | Available on NFS file shares |
|-|-|-|:-:|:-:|
| Create `FileShare` | [File Shares - Create](/rest/api/storagerp/file-shares/create) | [Create Share](Create-Share.md) | ![Yes](./media/yes-icon.png) | ![Yes](./media/yes-icon.png) |
| Delete `FileShare` | [File Shares - Delete](/rest/api/storagerp/file-shares/delete) | [Delete Share](Delete-Share.md) | ![Yes](./media/yes-icon.png) | ![Yes](./media/yes-icon.png) |
| Get `FileShare` | [File Shares - Get](/rest/api/storagerp/file-shares/get) | <ul><li>[Get Share Properties](Get-Share-Properties.md)</li><li>[Get Share Metadata](Get-Share-Metadata.md)</li><li>[Get Share Stats](Get-Share-Stats.md)</li></ul> | ![Yes](./media/yes-icon.png) | ![Yes](./media/yes-icon.png) |
| Lease `FileShare` | [File Shares - Lease](/rest/api/storagerp/file-shares/lease) | [Lease Share](lease-share.md) | ![Yes](./media/yes-icon.png) | ![Yes](./media/yes-icon.png) |
| List `FileShares` | [File Shares - List](/rest/api/storagerp/file-shares/list) | [List Shares](List-Shares.md) | ![Yes](./media/yes-icon.png) | ![Yes](./media/yes-icon.png) |
| Restore `FileShare` | [File Shares - Restore](/rest/api/storagerp/file-shares/restore) | [Restore Share](restore-share.md) | ![Yes](./media/yes-icon.png) | ![No](./media/no-icon.png) |
| Update `FileShare` | [File Shares - Update](/rest/api/storagerp/file-shares/update) | <ul><li>[Set Share Properties](Set-Share-Properties.md)</li><li>[Set Share Metadata](Set-Share-Metadata.md)</li></ul> | ![Yes](./media/yes-icon.png) | ![Yes](./media/yes-icon.png) |
| Snapshot `FileShare` | -- | [Snapshot Share](snapshot-share.md) | ![Yes](./media/yes-icon.png) | ![No](./media/no-icon.png) |
| Get `FileShare` stored access policies | -- | [Get Share ACL](Get-Share-ACL.md) | ![Yes](./media/yes-icon.png) | ![No](./media/no-icon.png) |
| Set `FileShare` stored access policies | -- | [Set Share ACL](Set-Share-ACL.md) | ![Yes](./media/yes-icon.png) | ![No](./media/no-icon.png) |

## Data APIs

| Action | API | Available on SMB file shares | Available on NFS file shares |
|-|-|:-:|:-:|
| Create access control list permission | [Create Permission](create-permission.md) | ![Yes](./media/yes-icon.png) | ![No](./media/no-icon.png) |
| Get access control list permission | [Get Permission](get-permission.md) | ![Yes](./media/yes-icon.png) | ![No](./media/no-icon.png) |

## See also

- [File Service REST API](File-Service-REST-API.md)
- [Operations on the FileService](Operations-on-the-Account--File-Service-.md)
