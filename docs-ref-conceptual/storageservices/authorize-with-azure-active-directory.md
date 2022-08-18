---
title: Authorize with Azure Active Directory (REST API) - Azure Storage
description: Azure Storage provides integration with Azure Active Directory (Azure AD) for identity-based authorization of requests to the Blob, Queue and Table services. With Azure AD, you can use role-based access control (RBAC) to grant access to your Azure Storage resources to users, groups, or applications.
author: tamram

ms.date: 09/27/2021
ms.author: tamram
ms.service: storage
ms.topic: reference
---

# Authorize with Azure Active Directory

Azure Storage provides integration with [Azure Active Directory (Azure AD)](/azure/active-directory/fundamentals/active-directory-whatis) for identity-based authorization of requests to the Blob, Queue and Table services. With Azure AD, you can use role-based access control (RBAC) to grant access to blob, queue and table resources to users, groups, or applications. You can grant permissions that are scoped to the level of an individual container, queue or table.

To learn more about Azure AD integration in Azure Storage, see [Authorize access to Azure blobs and queues using Azure Active Directory](/azure/storage/common/storage-auth-aad).

For more information on the advantages of using Azure AD in your application, see [Integrating with Azure Active Directory](/azure/active-directory/develop/active-directory-how-to-integrate).

> [!TIP]
> Authorizing access to blob, queue and table data with Azure AD provides superior security and ease of use over other authorization options. When you use Azure AD to authorize requests make from your applications, you avoid having to store your account access key with your code, as you do with Shared Key authorization. While you can continue to use Shared Key authorization with your blob, queue and table applications, Microsoft recommends moving to Azure AD where possible. For more information about Azure AD integration in Azure Storage, see [Authorize access to Azure blobs and queues using Azure Active Directory](/azure/storage/common/storage-auth-aad).

## Use OAuth access tokens for authentication

Azure Storage accepts OAuth 2.0 access tokens from the Azure AD tenant associated with the subscription that contains the storage account. Azure Storage accepts access tokens for:

- Users
- Service principals
- Managed identities for Azure resources
- Applications using permissions delegated by users 

Azure Storage exposes a single delegation scope named `user_impersonation` that permits applications to take any action allowed by the user.

To request tokens for Azure Storage, specify the value `https://storage.azure.com/` for the Resource ID.

For more information on requesting access tokens from Azure AD for users and service principals, see [Authentication scenarios for Azure AD](/azure/active-directory/develop/active-directory-authentication-scenarios).

For more information about requesting access tokens for resources configured with managed identities, see [How to use managed identities for Azure resources on an Azure VM to acquire an access token](/azure/active-directory/managed-service-identity/how-to-use-vm-token).

## Call storage operations with OAuth tokens

To call Blob, Queue and Table service operations using OAuth access tokens, pass the access token in the **Authorization** header using the **Bearer** scheme, and specify a service version of 2017-11-09 or higher, as shown in the following example:

```http
Request:
GET /container/file.txt
x-ms-version: 2017-11-09
Authorization: Bearer eyJ0eXAiO...V09ccgQ
User-Agent: PostmanRuntime/7.6.0
Accept: */*
Host: sampleoautheast2.blob.core.windows.net
accept-encoding: gzip, deflate

Response:
HTTP/1.1 200
status: 200
Content-Length: 28
Content-Type: text/plain
Content-MD5: dxG7IgOBzApXPcGHxGg5SA==
Last-Modified: Wed, 30 Jan 2019 07:21:32 GMT
Accept-Ranges: bytes
ETag: "0x8D686838F9E8BA7"
Server: Windows-Azure-Blob/1.0 Microsoft-HTTPAPI/2.0
x-ms-request-id: 09f31964-e01e-00a3-8066-d4e6c2000000
x-ms-version: 2017-11-09
x-ms-creation-time: Wed, 29 Aug 2018 04:22:47 GMT
x-ms-lease-status: unlocked
x-ms-lease-state: available
x-ms-blob-type: BlockBlob
x-ms-server-encrypted: true
Date: Wed, 06 Mar 2019 21:50:50 GMT
Welcome to Azure Storage!!
```

## Bearer Challenge

Bearer challenge is part of the OAuth protocol [RFC 6750](https://www.rfc-editor.org/rfc/rfc6750.txt) and is used for authority discovery. For anonymous requests, or requests with an invalid OAuth bearer token, the server will return status code 401 (Unauthorized) with identity provider and resource information. Refer to [link](/azure/storage/common/storage-auth-aad-app?toc=/azure/storage/blobs/toc.json#well-known-values-for-authentication-with-azure-ad) for how to use these values during authentication with Azure AD.

> Azure Storage Blob and Queue services return a bearer challenge for version 2019-12-12 and newer. Azure Storage Table service returns a bearer challenge from version 2020-12-06. Azure Data Lake Storage Gen2 returns a bearer challenge for version 2017-11-09 and newer. 

The following is an example of a bearer challenge response when the client request does not include the bearer token in the anonymous download blob request:

```http
Request:
GET /container/file.txt
x-ms-version: 2019-12-12
Host: sampleoautheast2.blob.core.windows.net

Response:
HTTP/1.1 401 Unauthorized
WWW-Authenticate: Bearer authorization_uri=https://login.microsoftonline.com/<tenant_id>/oauth2/authorize resource_uri=https://storage.azure.com

<?xml version="1.0" encoding="utf-8"?>
<Error>
    <Code>NoAuthenticationInformation</Code>
    <Message>Server failed to authenticate the request. Please refer to the information in the www-authenticate header.
RequestId:ec4f02d7-1003-0006-21f9-c55bc8000000
Time:2020-01-08T08:01:46.2063459Z</Message>
</Error>
```

|Parameter|Description|
|----------------|----------------------|
|authorization_uri|The URI (physical endpoint) of the authorization server. This value is also used as a lookup key to get more information about the server from a discovery endpoint. The client must validate that the authorization server is trusted. When the resource is protected by Azure AD, it is sufficient to verify that the URL begins with https://login.microsoftonline.com or other hostname that Azure AD supports. A tenant-specific resource should always return a tenant-specific authorization URI.|
|resource_id|Returns the unique identifier of the resource. The client application can use this identifier as the value of the resource parameter when it requests an access token for the resource. It is important for the client application to verify this value, otherwise a malicious service might be able to induce an elevation-of-privileges attack. The recommended strategy for preventing an attack is to verify that the resource_id matches the base of the web API URL that being accessed. https://storage.azure.com is the generally used Azure Storage resource ID. |

## Manage access rights with RBAC

Azure AD handles the authorization of access to secured resources through RBAC. Using RBAC, you can assign roles to users, groups, or service principals. Each role encompasses a set of permissions for a resource. Once the role is assigned to the user, group, or service principal, they have access to that resource. You can assign access rights using the Azure portal, Azure command-line tools, and Azure Management APIs. For more information on RBAC, see [Get started with Role-Based Access Control](/azure/role-based-access-control/overview).

For Azure Storage, you can grant access to data in a container or queue in the storage account. Azure Storage offers these built-in RBAC roles for use with Azure AD:

- [Storage Blob Data Owner](/azure/role-based-access-control/built-in-roles#storage-blob-data-owner)
- [Storage Blob Data Contributor](/azure/role-based-access-control/built-in-roles#storage-blob-data-contributor)
- [Storage Blob Data Reader](/azure/role-based-access-control/built-in-roles#storage-blob-data-reader)
- [Storage Blob Delegator](/azure/role-based-access-control/built-in-roles#storage-blob-delegator)
- [Storage Queue Data Contributor](/azure/role-based-access-control/built-in-roles#storage-queue-data-contributor)
- [Storage Queue Data Reader](/azure/role-based-access-control/built-in-roles#storage-queue-data-reader)
- [Storage Queue Data Message Processor](/azure/role-based-access-control/built-in-roles#storage-queue-data-message-processor)
- [Storage Queue Data Message Sender](/azure/role-based-access-control/built-in-roles#storage-queue-data-message-sender)
- [Storage Table Data Reader](/azure/role-based-access-control/built-in-roles)
- [Storage Table Data Contributor](/azure/role-based-access-control/built-in-roles)

For more information about how built-in roles are defined for Azure Storage, see [Understand role definitions for Azure resources](/azure/role-based-access-control/role-definitions).

You can also define custom roles for use with Blob storage and Azure Queues. For more information, see [Create custom roles for Azure Role-Based Access Control](/azure/role-based-access-control/custom-roles). 

## Permissions for calling data operations

The following tables describe the permissions necessary for an Azure AD user, group, or service principal to call specific Azure Storage operations. To enable a client to call a particular operation, ensure that the client's assigned RBAC role offers sufficient permissions for that operation.

### Permissions for Blob service operations

| Blob service operation | RBAC action |
|--|--|
| [List Containers](list-containers2.md) | Microsoft.Storage/storageAccounts/blobServices/containers/read (scoped to the storage account or above) |
| [Set Blob Service Properties](set-blob-service-properties.md) | Microsoft.Storage/storageAccounts/blobServices/write |
| [Get Blob Service Properties](get-blob-service-properties.md) | Microsoft.Storage/storageAccounts/blobServices/read |
| [Preflight Blob Request](preflight-blob-request.md) | Anonymous |
| [Get Blob Service Stats](get-blob-service-stats.md) | Microsoft.Storage/storageAccounts/blobServices/read |
| [Get Account Information](get-account-information.md) | Not supported |
| [Get User Delegation Key](get-user-delegation-key.md) | Microsoft.Storage/storageAccounts/blobServices/generateUserDelegationKey/action |
| [Create Container](create-container.md) | Microsoft.Storage/storageAccounts/blobServices/containers/write |
| [Get Container Properties](get-container-properties.md) | Microsoft.Storage/storageAccounts/blobServices/containers/read |
| [Get Container Metadata](get-container-metadata.md) | Microsoft.Storage/storageAccounts/blobServices/containers/read |
| [Set Container Metadata](set-container-metadata.md) | Microsoft.Storage/storageAccounts/blobServices/containers/write |
| [Get Container ACL](get-container-acl.md) | Not supported |
| [Set Container ACL](set-container-acl.md) | Not supported |
| [Lease Container](lease-container.md) | Microsoft.Storage/storageAccounts/blobServices/containers/write |
| [Delete Container](delete-container.md) | Microsoft.Storage/storageAccounts/blobServices/containers/delete |
| [Restore Container](restore-container.md) | Microsoft.Storage/storageAccounts/blobServices/containers/write |
| [List Blobs](list-blobs.md) | Microsoft.Storage/storageAccounts/blobServices/containers/blobs/read |
| [Find Blobs by Tags in Container](find-blobs-by-tags-container.md) | Microsoft.Storage/storageAccounts/blobServices/containers/blobs/filter/action |
| [Put Blob](put-blob.md) | For create or replace: Microsoft.Storage/storageAccounts/blobServices/containers/blobs/write <br/>To create new blob: Microsoft.Storage/storageAccounts/blobServices/containers/blobs/add/action |
| [Put Blob from URL](put-blob-from-url.md) | For create or replace: Microsoft.Storage/storageAccounts/blobServices/containers/blobs/write <br/>To create new blob: Microsoft.Storage/storageAccounts/blobServices/containers/blobs/add/action |
| [Get Blob](get-blob.md) | Microsoft.Storage/storageAccounts/blobServices/containers/blobs/read |
| [Get Blob Properties](get-blob-properties.md) | Microsoft.Storage/storageAccounts/blobServices/containers/blobs/read |
| [Set Blob Properties](set-blob-properties.md) | Microsoft.Storage/storageAccounts/blobServices/containers/blobs/write |
| [Get Blob Metadata](get-blob-metadata.md) | Microsoft.Storage/storageAccounts/blobServices/containers/blobs/read |
| [Set Blob Metadata](set-blob-metadata.md) | Microsoft.Storage/storageAccounts/blobServices/containers/blobs/write |
| [Get Blob Tags](get-blob-tags.md) | Microsoft.Storage/storageAccounts/blobServices/containers/blobs/tags/read |
| [Set Blob Tags](set-blob-tags.md) | Microsoft.Storage/storageAccounts/blobServices/containers/blobs/tags/write |
| [Find Blob by Tags](find-blobs-by-tags.md) | Microsoft.Storage/storageAccounts/blobServices/containers/blobs/filter/action |
| [Lease Blob](lease-blob.md) | Microsoft.Storage/storageAccounts/blobServices/containers/blobs/write |
| [Snapshot Blob](snapshot-blob.md) | Microsoft.Storage/storageAccounts/blobServices/containers/blobs/write or <br/>Microsoft.Storage/storageAccounts/blobServices/containers/blobs/add/action |
| [Copy Blob](copy-blob.md) | For destination blob: Microsoft.Storage/storageAccounts/blobServices/containers/blobs/write or Microsoft.Storage/storageAccounts/blobServices/containers/blobs/add/action (when writing a new blob to the destination)<br/>For source blob in the same storage account: Microsoft.Storage/storageAccounts/blobServices/containers/blobs/read<br/>For source blob in a different storage account: Available as anonymous, or include valid SAS token |
| [Copy Blob from URL](copy-blob-from-url.md) | For destination blob: Microsoft.Storage/storageAccounts/blobServices/containers/blobs/write or Microsoft.Storage/storageAccounts/blobServices/containers/blobs/add/action (when writing a new blob to the destination)<br/>For source blob in the same storage account: Microsoft.Storage/storageAccounts/blobServices/containers/blobs/read<br/>For source blob in a different storage account: Available as anonymous, or include valid SAS token |
| [Abort Copy Blob](abort-copy-blob.md) | Microsoft.Storage/storageAccounts/blobServices/containers/blobs/write |
| [Delete Blob](delete-blob.md) | Microsoft.Storage/storageAccounts/blobServices/containers/blobs/delete |
| [Undelete Blob](delete-blob.md) | Microsoft.Storage/storageAccounts/blobServices/containers/write |
| [Set Blob Tier](set-blob-tier.md) | Microsoft.Storage/storageAccounts/blobServices/containers/blobs/write |
| [Blob Batch](blob-batch.md) | Parent request: Microsoft.Storage/storageAccounts/blobServices/containers/write <br/>Sub-requests: See permissions for that request type. |
| [Set Immutability Policy](set-blob-immutability-policy.md) | Microsoft.Storage/storageAccounts/blobServices/containers/write |
| [Delete Immutability Policy](delete-blob-immutability-policy.md) | Microsoft.Storage/storageAccounts/blobServices/containers/write |
| [Set Blob Legal Hold](set-blob-legal-hold.md) | Microsoft.Storage/storageAccounts/blobServices/containers/write |
| [Put Block](put-block.md) | Microsoft.Storage/storageAccounts/blobServices/containers/blobs/write |
| [Put Block from URL](put-block-from-url.md) | Microsoft.Storage/storageAccounts/blobServices/containers/blobs/write |
| [Put Block List](put-block-list.md) | Microsoft.Storage/storageAccounts/blobServices/containers/blobs/write |
| [Get Block List](get-block-list.md) | Microsoft.Storage/storageAccounts/blobServices/containers/blobs/read |
| [Query Blob Contents](query-blob-contents.md) | Microsoft.Storage/storageAccounts/blobServices/containers/blobs/read |
| [Put Page](put-page.md) | Microsoft.Storage/storageAccounts/blobServices/containers/blobs/write |
| [Put Page from URL](put-page-from-url.md) | Microsoft.Storage/storageAccounts/blobServices/containers/blobs/write |
| [Get Page Ranges](get-page-ranges.md) | Microsoft.Storage/storageAccounts/blobServices/containers/blobs/read |
| [Incremental Copy Blob](incremental-copy-blob.md) | For destination blob: Microsoft.Storage/storageAccounts/blobServices/containers/blobs/write <br/>For source blob: Microsoft.Storage/storageAccounts/blobServices/containers/blobs/read <br/>For new blob: Microsoft.Storage/storageAccounts/blobServices/containers/blobs/add/action |
| [Append Block](append-block.md) | Microsoft.Storage/storageAccounts/blobServices/containers/blobs/write or Microsoft.Storage/storageAccounts/blobServices/containers/blobs/add/action |
| [Append Block from URL](append-block-from-url.md) | Microsoft.Storage/storageAccounts/blobServices/containers/blobs/write or Microsoft.Storage/storageAccounts/blobServices/containers/blobs/add/action |
| [Set Blob Expiry](set-blob-expiry.md) | Microsoft.Storage/storageAccounts/blobServices/containers/blobs/write |

### Permissions for Queue service operations

| Queue service operation | RBAC action |
|--|--|
| [List Queues](list-queues1.md) | Microsoft.Storage/storageAccounts/queueServices/queues/read (scoped to the storage account or above) |
| [Set Queue Service Properties](set-queue-service-properties.md) | Microsoft.Storage/storageAccounts/queueServices/read |
| [Get Queue Service Properties](get-queue-service-properties.md) | Microsoft.Storage/storageAccounts/queueServices/read |
| [Preflight Queue Request](preflight-queue-request.md) | Anonymous |
| [Get Queue Service Stats](get-queue-service-stats.md) | Microsoft.Storage/storageAccounts/queueServices/read |
| [Create Queue](create-queue4.md) | Microsoft.Storage/storageAccounts/queueServices/queues/write |
| [Delete Queue](delete-queue3.md) | Microsoft.Storage/storageAccounts/queueServices/queues/delete |
| [Get Queue Metadata](get-queue-metadata.md) | Microsoft.Storage/storageAccounts/queueServices/queues/read |
| [Set Queue Metadata](set-queue-metadata.md) | Microsoft.Storage/storageAccounts/queueServices/queues/write |
| [Get Queue ACL](get-queue-acl.md) | Not available via OAuth |
| [Set Queue ACL](set-queue-acl.md) | Not available via OAuth |
| [Put Message](put-message.md) | Microsoft.Storage/storageAccounts/queueServices/queues/messages/add/action or Microsoft.Storage/storageAccounts/queueServices/queues/messages/write |
| [Get Messages](get-messages.md) | Microsoft.Storage/storageAccounts/queueServices/queues/messages/process/action or (Microsoft.Storage/storageAccounts/queueServices/queues/messages/delete and Microsoft.Storage/storageAccounts/queueServices/queues/messages/read) |
| [Peek Messages](peek-messages.md) | Microsoft.Storage/storageAccounts/queueServices/queues/messages/read |
| [Delete Message](delete-message2.md) | Microsoft.Storage/storageAccounts/queueServices/queues/messages/process/action or Microsoft.Storage/storageAccounts/queueServices/queues/messages/delete |
| [Clear Messages](clear-messages.md) | Microsoft.Storage/storageAccounts/queueServices/queues/messages/delete |
| [Update Message](update-message.md) | Microsoft.Storage/storageAccounts/queueServices/queues/messages/write |

### Permissions for Table service operations

| Table service operation | RBAC action |
|--|--|
| [Set Table Service Properties](set-table-service-properties.md) | Microsoft.Storage/storageAccounts/tableServices/write |
| [Get Table Service Properties](get-table-service-properties.md) | Microsoft.Storage/storageAccounts/tableServices/read |
| [Preflight Table Request](preflight-table-request.md) | Anonymous |
| [Get Table Service Stats](get-table-service-stats.md) | Microsoft.Storage/storageAccounts/tableServices/read |
| [Performing Entity Group Transactions](performing-entity-group-transactions.md) | Sub-operation authorizes separately |
| [Query Tables](query-tables.md) | Microsoft.Storage/storageAccounts/tableServices/tables/read (scoped to the storage account or above) |
| [Create Table](create-table.md) | Microsoft.Storage/storageAccounts/tableServices/tables/write |
| [Delete Table](delete-table.md) | Microsoft.Storage/storageAccounts/tableServices/tables/delete |
| [Get Table ACL](get-table-acl.md) | Not available via OAuth |
| [Set Table ACL](set-table-acl.md) | Not available via OAuth |
| [Query Entities](query-entities.md) | Microsoft.Storage/storageAccounts/tableServices/tables/entities/read |
| [Insert Entity](insert-entity.md) | Microsoft.Storage/storageAccounts/tableServices/tables/entities/write or Microsoft.Storage/storageAccounts/tableServices/tables/entities/add/action |
| [Insert Or Merge Entity](insert-or-merge-entity.md) | Microsoft.Storage/storageAccounts/tableServices/tables/entities/write or (Microsoft.Storage/storageAccounts/tableServices/tables/entities/add/action and Microsoft.Storage/storageAccounts/tableServices/tables/entities/update/action) |
| [Insert Or Replace Entity](insert-or-replace-entity.md) | Microsoft.Storage/storageAccounts/tableServices/tables/entities/write or (Microsoft.Storage/storageAccounts/tableServices/tables/entities/add/action and Microsoft.Storage/storageAccounts/tableServices/tables/entities/update/action) |
| [Update Entity](update-entity2.md) | Microsoft.Storage/storageAccounts/tableServices/tables/entities/write or Microsoft.Storage/storageAccounts/tableServices/tables/entities/update/action |
| [Merge Entity](merge-entity.md) | Microsoft.Storage/storageAccounts/tableServices/tables/entities/write or Microsoft.Storage/storageAccounts/tableServices/tables/entities/update/action |
| [Delete Entity](delete-entity1.md) | Microsoft.Storage/storageAccounts/tableServices/tables/entities/delete |

## See also

- [Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md)
