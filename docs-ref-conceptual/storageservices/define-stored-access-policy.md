---
title: Define a stored access policy - Azure Storage
description: A stored access policy provides an additional level of control over service-level shared access signatures (SAS) on the server side. You can use a stored access policy to change the start time, expiry time, or permissions for a signature, or to revoke it after it has been issued.
author: tamram

ms.date: 07/29/2019
ms.author: tamram
ms.service: storage
ms.topic: reference
---

# Define a stored access policy

A stored access policy provides an additional level of control over service-level shared access signatures (SAS) on the server side. Establishing a stored access policy serves to group shared access signatures and to provide additional restrictions for signatures that are bound by the policy. You can use a stored access policy to change the start time, expiry time, or permissions for a signature, or to revoke it after it has been issued.  
  
 The following storage resources support stored access policies:  
  
- Blob containers  
- File shares  
- Queues  
- Tables  
  
> [!NOTE]
> Note that a stored access policy on a container can be associated with a shared access signature granting permissions to the container itself or to the blobs it contains. Similarly, a stored access policy on a file share can be associated with a shared access signature granting permissions to the share itself or to the files it contains.  
>
> Stored access policies are currently not supported for account SAS.  
  
## Creating or modifying a stored access policy
  
The access policy for a shared access signature consists of the start time, expiry time, and permissions for the signature. You can specify all of these parameters on the signature URI and none within the stored access policy; all on the container and none on the URI; or some combination of the two. However, you cannot specify a given parameter on both the SAS token and the stored access policy.
  
To create or modify a stored access policy, call the Set ACL operation for the resource (see [Set Container ACL](Set-Container-ACL.md), [Set Queue ACL](Set-Queue-ACL.md), [Set Table ACL](Set-Table-ACL.md), or [Set Share ACL](Set-Share-ACL.md)) with a request body that specifies the terms of the access policy. The body of the request includes a unique signed identifier of your choosing, up to 64 characters in length, and the optional parameters of the access policy, as follows:  
  
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

A maximum of five access policies may be set on a container, table, or queue at any given time. Each `SignedIdentifier` field, with its unique `Id` field, corresponds to one access policy. Attempting to set more than five access policies at one time results in the service returning status code 400 (Bad Request).  

> [!NOTE]
> Table entity range restrictions (`startpk`, `startrk`, `endpk`, and `endrk`) cannot be specified in a stored access policy.  

## Modifying or revoking a stored access policy

To modify the parameters of the stored access policy, you can call the access control list operation for the resource type to replace the existing policy, specifying a new start time, expiry time, or set of permissions. For example, if your existing policy grants read and write permissions to a resource, you can modify it to grant only read permissions for all future requests. In this case, the signed identifier of the new policy, as specified by the `ID` field, would be identical to the signed identifier of the policy you are replacing.  

To revoke a stored access policy, you can delete it, rename it by changing the signed identifier, or change the expiry time to a value in the past. Changing the signed identifier breaks the associations between any existing signatures and the stored access policy. Changing the expiry time to a value in the past causes any associated signatures to expire. Deleting or modifying the stored access policy immediately affects all of the shared access signatures associated with it.  

To remove a single access policy, call the resource's `Set ACL` operation, passing in the set of signed identifiers that you wish to maintain on the container. To remove all access policies from the resource, call the Set ACL operation with an empty request body.  
  
## See also  

- [Delegate access with a shared access signature](delegate-access-with-shared-access-signature.md)
- [Controlling a SAS with a stored access policy](/azure/storage/storage-dotnet-shared-access-signature-part-1#controlling-a-sas-with-a-stored-access-policy)
