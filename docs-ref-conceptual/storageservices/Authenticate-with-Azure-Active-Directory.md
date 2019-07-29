---
title: "Authenticate with Azure Active Directory"
ms.date: 03/13/2019
ms.prod: azure
ms.service: storage
ms.topic: reference
ms.author: tamram
author: tamram
translation.priority.mt: 
  - de-de
  - es-es
  - fr-fr
  - it-it
  - ja-jp
  - ko-kr
  - pt-br
  - ru-ru
  - zh-cn
  - zh-tw
---

# Authenticate with Azure Active Directory

Azure Storage provides integration with [Azure Active Directory (Azure AD)](https://docs.microsoft.com/azure/active-directory/fundamentals/active-directory-whatis) for identity-based authentication of requests to the Blob and Queue services. With Azure AD, you can use role-based access control (RBAC) to grant access to your Azure Storage resources to users, groups, or applications. You can grant permissions that are scoped to the level of an individual container or queue. 

To learn more about Azure AD integration in Azure Storage, see [Authenticating requests to Azure Storage using Azure Active Directory](https://docs.microsoft.com/azure/storage/common/storage-auth-aad).

For more information on the advantages of using Azure AD in your application, see [Integrating with Azure Active Directory](https://docs.microsoft.com/azure/active-directory/develop/active-directory-how-to-integrate). 

> [!TIP]
> Authenticating and authorizing access to blob and queue data with Azure AD provides superior security and ease of use over other authorization options. For example, by using Azure AD, you avoid having to store your account access key with your code, as you do with Shared Key authorization. While you can continue to use Shared Key authorization with your blob and queue applications, Microsoft recommends moving to Azure AD where possible.
>
> Similarly, you can continue to use shared access signatures (SAS) to grant fine-grained access to resources in your storage account, but Azure AD offers similar capabilities without the need to manage SAS tokens or worry about revoking a compromised SAS.
>
> For more information about Azure AD integration in Azure Storage, see [Authenticating requests to Azure Storage using Azure Active Directory](https://docs.microsoft.com/azure/storage/common/storage-auth-aad).

## Use OAuth access tokens for authentication

Azure Storage accepts OAuth 2.0 access tokens from the Azure AD tenant associated with the subscription that contains the storage account. Azure Storage accepts access tokens for:

- Users
- Service principals 
- Managed service identities for Azure resources
- Applications using permissions delegated by users 

Azure Storage exposes a single delegation scope named `user_impersonation` that permits applications to take any action allowed by the user.

To request tokens for Azure Storage, specify the value `https://storage.azure.com/` for the Resource ID.

For more information on requesting access tokens from Azure AD for users and service principals, see [Authentication scenarios for Azure AD](https://docs.microsoft.com/azure/active-directory/develop/active-directory-authentication-scenarios).

For more information about requesting access tokens for resources configured with managed identities, see [How to use managed identities for Azure resources on an Azure VM to acquire an access token](https://docs.microsoft.com/azure/active-directory/managed-service-identity/how-to-use-vm-token).

## Call storage operations with OAuth tokens

To call Blob and Queue service operations using OAuth access tokens, pass the access token in the **Authorization** header using the **Bearer** scheme, and specify a service version of 2017-11-09 or higher, as shown in the following example:

```
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

## Manage access rights with RBAC

Azure AD handles the authorization of access to secured resources through RBAC. Using RBAC, you can assign roles to users, groups, or service principals. Each role encompasses a set of permissions for a resource. Once the role is assigned to the user, group, or service principal, they have access to that resource. You can assign access rights using the Azure portal, Azure command-line tools, and Azure Management APIs. For more information on RBAC, see [Get started with Role-Based Access Control](https://docs.microsoft.com/azure/role-based-access-control/overview).

For Azure Storage, you can grant access to data in a container or queue in the storage account. Azure Storage offers these built-in RBAC roles for use with Azure AD:

- [Storage Blob Data Owner](https://docs.microsoft.com/azure/role-based-access-control/built-in-roles#storage-blob-data-owner)
- [Storage Blob Data Contributor](https://docs.microsoft.com/azure/role-based-access-control/built-in-roles#storage-blob-data-contributor)
- [Storage Blob Data Reader](https://docs.microsoft.com/azure/role-based-access-control/built-in-roles#storage-blob-data-reader)
- [Storage Queue Data Contributor](https://docs.microsoft.com/azure/role-based-access-control/built-in-roles#storage-queue-data-contributor)
- [Storage Queue Data Reader](https://docs.microsoft.com/azure/role-based-access-control/built-in-roles#storage-queue-data-reader)
- [Storage Queue Data Message Processor](https://docs.microsoft.com/azure/role-based-access-control/built-in-roles#storage-queue-data-message-processor)
- [Storage Queue Data Message Sender](https://docs.microsoft.com/azure/role-based-access-control/built-in-roles#storage-queue-data-message-sender)

For more information about how built-in roles are defined for Azure Storage, see [Understand role definitions for Azure resources](https://docs.microsoft.com/azure/role-based-access-control/role-definitions).

You can also define custom roles for use with Blob storage and Azure Queues. For more information, see [Create custom roles for Azure Role-Based Access Control](https://docs.microsoft.com/azure/role-based-access-control/custom-roles). 

## Permissions for calling blob and queue data operations

The following tables describe the permissions necessary for an Azure AD user, group, or service principal to call specific Azure Storage operations. To enable a client to call a particular operation, ensure that the client's assigned RBAC role offers sufficient permissions for that operation.

### Permissions for Blob service operations

| Blob service operation                                                                                                            | RBAC action                                                                                                                                                                                                                                                                                                                                                                              |
|-----------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [List Containers](https://docs.microsoft.com/rest/api/storageservices/fileservices/list-containers2)                        | Microsoft.Storage/storageAccounts/blobServices/containers/read (scoped to the storage account)                                                                                                                                                                                                                                                                                                |
| [Set Blob Service Properties](https://docs.microsoft.com/rest/api/storageservices/fileservices/set-blob-service-properties) | Microsoft.Storage/storageAccounts/blobServices/write                                                                                                                                                                                                                                                                                                                                     |
| [Get Blob Service Properties](https://docs.microsoft.com/rest/api/storageservices/fileservices/get-blob-service-properties) | Microsoft.Storage/storageAccounts/blobServices/read                                                                                                                                                                                                                                                                                                                                      |
| [Preflight Blob Request](https://docs.microsoft.com/rest/api/storageservices/fileservices/preflight-blob-request)           | Anonymous                                                                                                                                                                                                                                                                                                                                                                                     |
| [Get Blob Service Stats](https://docs.microsoft.com/rest/api/storageservices/fileservices/get-blob-service-stats)           | Microsoft.Storage/storageAccounts/blobServices/read                                                                                                                                                                                                                                                                                                                                      |
| [Create Container](https://docs.microsoft.com/rest/api/storageservices/fileservices/create-container)                       | Microsoft.Storage/storageAccounts/blobServices/containers/write                                                                                                                                                                                                                                                                                                                          |
| [Get Container Properties](https://docs.microsoft.com/rest/api/storageservices/fileservices/get-container-properties)       | Microsoft.Storage/storageAccounts/blobServices/containers/read                                                                                                                                                                                                                                                                                                                           |
| [Get Container Metadata](https://docs.microsoft.com/rest/api/storageservices/fileservices/get-container-metadata)           | Microsoft.Storage/storageAccounts/blobServices/containers/read                                                                                                                                                                                                                                                                                                                           |
| [Set Container Metadata](https://docs.microsoft.com/rest/api/storageservices/fileservices/set-container-metadata)           | Microsoft.Storage/storageAccounts/blobServices/containers/write                                                                                                                                                                                                                                                                                                                          |
| [Get Container ACL](https://docs.microsoft.com/rest/api/storageservices/fileservices/get-container-acl)                     | Not available via OAuth                                                                                                                                                                                                                                                                                                                                                                  |
| [Set Container ACL](https://docs.microsoft.com/rest/api/storageservices/fileservices/set-container-acl)                     | Not available via OAuth                                                                                                                                                                                                                                                                                                                                                                  |
| [Delete Container](https://docs.microsoft.com/rest/api/storageservices/fileservices/delete-container)                       | Microsoft.Storage/storageAccounts/blobServices/containers/delete                                                                                                                                                                                                                                                                                                                         |
| [Lease Container](https://docs.microsoft.com/rest/api/storageservices/fileservices/lease-container)                         | Microsoft.Storage/storageAccounts/blobServices/containers/write                                                                                                                                                                                                                                                                                                                          |
| [List Blobs](https://docs.microsoft.com/rest/api/storageservices/fileservices/list-blobs)                                   | Microsoft.Storage/storageAccounts/blobServices/containers/blobs/read (scoped to container)                                                                                                                                                                                                                                                                                                |
| [Put Blob](https://docs.microsoft.com/rest/api/storageservices/fileservices/put-blob)                                       |  For create or replace: Microsoft.Storage/storageAccounts/blobServices/containers/blobs/write <br/>To create new blob: Microsoft.Storage/storageAccounts/blobServices/containers/blobs/add/action                                                                                                                                                                                        |
| [Get Blob](https://docs.microsoft.com/rest/api/storageservices/fileservices/get-blob)                                       | Microsoft.Storage/storageAccounts/blobServices/containers/blobs/read                                                                                                                                                                                                                                                                                                                     |
| [Get Blob Properties](https://docs.microsoft.com/rest/api/storageservices/fileservices/get-blob-properties)                 | Microsoft.Storage/storageAccounts/blobServices/containers/blobs/read                                                                                                                                                                                                                                                                                                                     |
| [Set Blob Properties](https://docs.microsoft.com/rest/api/storageservices/fileservices/set-blob-properties)                 | Microsoft.Storage/storageAccounts/blobServices/containers/blobs/write                                                                                                                                                                                                                                                                                                                    |
| [Get Blob Metadata](https://docs.microsoft.com/rest/api/storageservices/fileservices/get-blob-metadata)                     | Microsoft.Storage/storageAccounts/blobServices/containers/blobs/read                                                                                                                                                                                                                                                                                                                     |
| [Set Blob Metadata](https://docs.microsoft.com/rest/api/storageservices/fileservices/set-blob-metadata)                     | Microsoft.Storage/storageAccounts/blobServices/containers/blobs/write                                                                                                                                                                                                                                                                                                                    |
| [Lease Blob](https://docs.microsoft.com/rest/api/storageservices/fileservices/lease-blob)                                   | Microsoft.Storage/storageAccounts/blobServices/containers/blobs/write                                                                                                                                                                                                                                                                                                                    |
| [Snapshot Blob](https://docs.microsoft.com/rest/api/storageservices/fileservices/snapshot-blob)                             | Microsoft.Storage/storageAccounts/blobServices/containers/blobs/write or <br/>Microsoft.Storage/storageAccounts/blobServices/containers/blobs/add/action                                                                                                                                                                                                                                      |
| [Copy Blob](https://docs.microsoft.com/rest/api/storageservices/fileservices/copy-blob)                                     | For destination blob: Microsoft.Storage/storageAccounts/blobServices/containers/blobs/write or Microsoft.Storage/storageAccounts/blobServices/containers/blobs/add/action (when writing a new blob to the destination)<br/>For source blob in the same storage account: Microsoft.Storage/storageAccounts/blobServices/containers/blobs/read<br/>For source blob in a different storage account: Available as anonymous, or include valid SAS token |
| [Abort Copy Blob](https://docs.microsoft.com/rest/api/storageservices/fileservices/abort-copy-blob)                         | Microsoft.Storage/storageAccounts/blobServices/containers/blobs/write                                                                                                                                                                                                                                                                                                                    |
| [Delete Blob](https://docs.microsoft.com/rest/api/storageservices/fileservices/delete-blob)                                 | Microsoft.Storage/storageAccounts/blobServices/containers/blobs/delete                                                                                                                                                                                                                                                                                                                   |
| [Put Block](https://docs.microsoft.com/rest/api/storageservices/fileservices/put-block)                                     | Microsoft.Storage/storageAccounts/blobServices/containers/blobs/write                                                                                                                                                                                                                                      |
| [Put Block List](https://docs.microsoft.com/rest/api/storageservices/fileservices/put-block-list)                           | Microsoft.Storage/storageAccounts/blobServices/containers/blobs/write                                                                                                                                                                                                                                                                                                                    |
| [Get Block List](https://docs.microsoft.com/rest/api/storageservices/fileservices/get-block-list)                           | Microsoft.Storage/storageAccounts/blobServices/containers/blobs/read                                                                                                                                                                                                                                                                                                                     |
| [Put Page](https://docs.microsoft.com/rest/api/storageservices/fileservices/put-page)                                       | Microsoft.Storage/storageAccounts/blobServices/containers/blobs/write                                                                                                                                                                                                                                                                                                                    |
| [Get Page Ranges](https://docs.microsoft.com/rest/api/storageservices/fileservices/get-page-ranges)                         | Microsoft.Storage/storageAccounts/blobServices/containers/blobs/read                                                                                                                                                                                                                                                                                                                     |
| [Incremental Copy Blob](https://docs.microsoft.com/rest/api/storageservices/fileservices/incremental-copy-blob)             | For destination blob: Microsoft.Storage/storageAccounts/blobServices/containers/blobs/write <br/>For source blob: Microsoft.Storage/storageAccounts/blobServices/containers/blobs/read <br/>For new blob: Microsoft.Storage/storageAccounts/blobServices/containers/blobs/add/action                                                                                                                       |
| [Append Block](https://docs.microsoft.com/rest/api/storageservices/fileservices/append-block)                               | Microsoft.Storage/storageAccounts/blobServices/containers/blobs/write or Microsoft.Storage/storageAccounts/blobServices/containers/blobs/add/action                                                                                                                                                                                                                                      |

### Permissions for Queue service operations

| Queue service operation                                                                                                             | RBAC action                                                                                                                                                                                                                       |
|-------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [List Queues](https://docs.microsoft.com/rest/api/storageservices/fileservices/list-queues1)                                  | Microsoft.Storage/storageAccounts/queueServices/queues/read (scoped storage account)                                                                                                                                            |
| [Set Queue Service Properties](https://docs.microsoft.com/rest/api/storageservices/fileservices/set-queue-service-properties) | Microsoft.Storage/storageAccounts/queueServices/read                                                                                                                                                                              |
| [Get Queue Service Properties](https://docs.microsoft.com/rest/api/storageservices/fileservices/get-queue-service-properties) | Microsoft.Storage/storageAccounts/queueServices/read                                                                                                                                                                              |
| [Preflight Queue Request](https://docs.microsoft.com/rest/api/storageservices/fileservices/preflight-queue-request)           | Anonymous                                                                                                                                                                                                                              |
| [Get Queue Service Stats](https://docs.microsoft.com/rest/api/storageservices/fileservices/get-queue-service-stats)           | Microsoft.Storage/storageAccounts/queueServices/read                                                                                                                                                                              |
| [Create Queue](https://docs.microsoft.com/rest/api/storageservices/fileservices/create-queue4)                                | Microsoft.Storage/storageAccounts/queueServices/queues/write                                                                                                                                                                      |
| [Delete Queue](https://docs.microsoft.com/rest/api/storageservices/fileservices/delete-queue3)                                | Microsoft.Storage/storageAccounts/queueServices/queues/delete                                                                                                                                                                     |
| [Get Queue Metadata](https://docs.microsoft.com/rest/api/storageservices/fileservices/get-queue-metadata)                     | Microsoft.Storage/storageAccounts/queueServices/queues/read                                                                                                                                                                       |
| [Set Queue Metadata](https://docs.microsoft.com/rest/api/storageservices/fileservices/set-queue-metadata)                     | Microsoft.Storage/storageAccounts/queueServices/queues/write                                                                                                                                                                      |
| [Get Queue ACL](https://docs.microsoft.com/rest/api/storageservices/fileservices/get-queue-acl)                               | Not available via OAuth                                                                                                                                                                                                           |
| [Set Queue ACL](https://docs.microsoft.com/rest/api/storageservices/fileservices/set-queue-acl)                               | Not available via OAuth                                                                                                                                                                                                           |
| [Put Message](https://docs.microsoft.com/rest/api/storageservices/fileservices/put-message)                                   | Microsoft.Storage/storageAccounts/queueServices/queues/messages/add/action or Microsoft.Storage/storageAccounts/queueServices/queues/messages/write                                                                                                                                                          |
| [Get Messages](https://docs.microsoft.com/rest/api/storageservices/fileservices/get-messages)                                 | Microsoft.Storage/storageAccounts/queueServices/queues/messages/process/action or (Microsoft.Storage/storageAccounts/queueServices/queues/messages/delete and Microsoft.Storage/storageAccounts/queueServices/queues/messages/read)                                                                                                                                                         |
| [Peek Messages](https://docs.microsoft.com/rest/api/storageservices/fileservices/peek-messages)                               | Microsoft.Storage/storageAccounts/queueServices/queues/messages/read                                                                                                                                                              |
| [Delete Message](https://docs.microsoft.com/rest/api/storageservices/fileservices/delete-message2)                            | Microsoft.Storage/storageAccounts/queueServices/queues/messages/process/action or Microsoft.Storage/storageAccounts/queueServices/queues/messages/delete                                                                                                                                                         |
| [Clear Messages](https://docs.microsoft.com/rest/api/storageservices/fileservices/clear-messages)                             | Microsoft.Storage/storageAccounts/queueServices/queues/messages/delete                                                                                                                                                            |
| [Update Message](https://docs.microsoft.com/rest/api/storageservices/fileservices/update-message)                             | Microsoft.Storage/storageAccounts/queueServices/queues/messages/write                                                                                                                                                             |
## See also

- [Authorization for the Azure Storage Services](authorization-for-the-azure-storage-services.md)
