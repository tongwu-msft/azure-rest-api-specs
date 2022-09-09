---
title: Define a stored access policy - Azure Storage
description: Learn how to use a stored access policy to create, modify, or revoke a shared access signature.
author: tamram

ms.date: 10/18/2021
ms.author: tamram
ms.service: storage
ms.topic: reference
---

# Define a stored access policy

A stored access policy provides an additional level of control over service-level shared access signatures (SASs) on the server side. Establishing a stored access policy serves to group shared access signatures and to provide additional restrictions for signatures that are bound by the policy. 

You can use a stored access policy to change the start time, expiry time, or permissions for a signature. You can also use a stored access policy to revoke a signature after it has been issued.  
  
 The following storage resources support stored access policies:  
  
- Blob containers  
- File shares  
- Queues  
- Tables  
  
> [!NOTE]
> A stored access policy on a container can be associated with a shared access signature that grants permissions to the container itself or to the blobs that it contains. Similarly, a stored access policy on a file share can be associated with a shared access signature that grants permissions to the share itself or to the files that it contains.  
>
> Stored access policies are not supported for the user delegation SAS or the account SAS.  
  
## Create or modify a stored access policy
  
The access policy for a shared access signature consists of the start time, expiry time, and permissions for the signature. You can specify either of the following options or combine them:

- All of these parameters on the signature URI and none on the stored access policy
- All of these parameters on the stored access policy and none on the URI 

However, you can't specify a parameter on both the SAS token and the stored access policy.
  
To create or modify a stored access policy, call the `Set ACL` operation for the resource (see [Set Container ACL](Set-Container-ACL.md), [Set Queue ACL](Set-Queue-ACL.md), [Set Table ACL](Set-Table-ACL.md), or [Set Share ACL](Set-Share-ACL.md)) with a request body that specifies the terms of the access policy. The body of the request includes a unique signed identifier of your choosing, up to 64 characters in length. The body of the request also includes optional parameters of the access policy, as follows:  
  
```xml  
<?xml version="1.0" encoding="utf-8"?>  
<SignedIdentifiers>  
  <SignedIdentifier>
    <Id>unique-64-char-value</Id>  
    <AccessPolicy>  
      <Start>start-time</Start>  
      <Expiry>expiry-time</Expiry>  
      <Permission>abbreviated-permission-list</Permission>  
    </AccessPolicy>  
  </SignedIdentifier>  
</SignedIdentifiers>  
```  

You can set a maximum of five access policies on a container, table, queue, or share at a time. Each `SignedIdentifier` field, with its unique `Id` field, corresponds to one access policy. Trying to set more than five access policies at one time causes the service to return status code 400 (Bad Request).  

> [!NOTE]
> When you create or update a stored access policy on a container, table, queue, or share, the change might take up to 30 seconds to take effect. During this interval, requests against a shared access signature that's associated with the stored access policy might fail with status code 403 (Forbidden), until the access policy becomes active.  
>
> You can't specify range restrictions for table entities (`startpk`, `startrk`, `endpk`, and `endrk`) in a stored access policy.  

## Modify or revoke a stored access policy

To modify the parameters of a stored access policy, you can call the access control list (ACL) operation for the resource type to replace the existing policy. In that operation, specify a new start time, expiry time, or set of permissions. 

For example, if your existing policy grants read and write permissions to a resource, you can modify it to grant only read permissions for all future requests. In this case, the signed identifier of the new policy, as specified by the `ID` field, would be identical to the signed identifier of the policy that you're replacing.  

To revoke a stored access policy, you can delete it, rename it by changing the signed identifier, or change the expiry time to a value in the past. Changing the signed identifier breaks the associations between any existing signatures and the stored access policy. Changing the expiry time to a value in the past causes any associated signatures to expire. Deleting or modifying the stored access policy immediately affects all of the shared access signatures associated with it.  

To remove a single access policy, call the resource's `Set ACL` operation. Pass in the set of signed identifiers that you want to maintain on the container. To remove all access policies from the resource, call the `Set ACL` operation with an empty request body.  
  
## See also  

- [Delegate access by using a shared access signature](delegate-access-with-shared-access-signature.md)
- [Grant limited access to Azure Storage resources by using shared access signatures](/azure/storage/common/storage-sas-overview)
