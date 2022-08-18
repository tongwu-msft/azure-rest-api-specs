---
title: Create Permission (FileREST API) - Azure Files
description: The Create Permission operation creates a permission (a security descriptor) at the share level. The created security descriptor can be used for the files and directories in the share. 
author: wmgries

ms.date: 06/05/2021
ms.service: storage
ms.topic: reference
ms.author: wgries
---

# Create Permission

The `Create Permission` operation creates a permission (a security descriptor) at the share level. You can use the created security descriptor for the files and directories in the share. This API is available as of version 2019-02-02.

## Protocol availability

| Enabled file share protocol | Available |
|-|:-:|
| SMB | ![Yes](./media/yes-icon.png) |
| NFS | ![No](./media/no-icon.png) |
  
## Request

You can construct the `Create Permission` request as shown here. We recommend that you use HTTPS.  
  
|Method|Request URI|HTTP version|  
|------------|-----------------|------------------|  
|`PUT`|`https://myaccount.file.core.windows.net/myshare?restype=share&comp=filepermission`|HTTP/1.1|  
  
Replace the path components shown in the request URI with your own components, as shown here:  
  
|Path component|Description|  
|--------------------|-----------------|  
|`myaccount`|The name of your storage account.|  
|`myshare`|The name of your file share. The name can contain only lowercase characters.|  
  
For information about path-naming restrictions, see [Name and reference shares, directories, files, and metadata](Naming-and-Referencing-Shares--Directories--Files--and-Metadata.md).  
  
### URI parameters
  
You can specify additional parameters on the request URI as shown here:  
  
|Parameter|Description|  
|---------------|-----------------|  
|`timeout`|Optional. The `timeout` parameter is expressed in seconds. For more information, see [Set time-outs for Queue service operations](Setting-Timeouts-for-Queue-Service-Operations.md).|  

### Request headers

The required and optional request headers are described in the following table:  
  
|Request header|Description|  
|--------------------|-----------------|  
| `Authorization` | Required. Specifies the authorization scheme, storage account name, and signature. For more information, see [Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md).
|`Date` or `x-ms-date`|Required. Specifies the Coordinated Universal Time (UTC) for the request. For more information, see [Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md).|  
|`x-ms-version`|Optional. Specifies the version of the operation to use for this request. For more information, see [Versioning for Azure Storage services](Versioning-for-the-Azure-Storage-Services.md).|
|`x-ms-client-request-id`|Optional. Provides a client-generated, opaque value with a 1-kibibyte (KiB) character limit that's recorded in the Azure Monitor logs when logging is configured. We highly recommend that you use this header to correlate client-side activities with requests that the server receives. For more information, see [Monitor Azure Files](/azure/storage/files/storage-files-monitoring).|    
  
### Request body

You create a security descriptor by using a request body, which is a JSON document that describes permission in the [Security Descriptor Definition Language (SDDL)](/windows/win32/secauthz/security-descriptor-definition-language). SDDL must have an owner, group, and [discretionary access control list (DACL)](/windows/win32/secauthz/access-control-lists). The provided SDDL string format of the security descriptor shouldn't have a domain relative identifier (for example, DU, DA, or DD) in it.

```json
{
    "Permission": "SDDL"
}
```
  
### Sample request  
  
```
PUT https://myaccount.file.core.windows.net/myshare?restype=share&comp=filepermission HTTP/1.1  

Request Headers:  
x-ms-date: Mon, 27 Jan 2014 22:15:50 GMT  
x-ms-version: 2014-02-14  
Authorization: SharedKey myaccount:4KdWDiTdA9HmIF9+WF/8WfYOpUrFhieGIT7f0av+GEI=  

Request Body:
{"permission": "O:S-1-5-21-2127521184-1604012920-1887927527-21560751G:S-1-5-21-2127521184-1604012920-1887927527-513D:AI(A;;FA;;;SY)(A;;FA;;;BA)(A;;0x1200a9;;;S-1-5-21-397955417-626881126-188441444-3053964)"}
```  
  
## Response

The response includes an HTTP status code and a set of response headers.  
  
### Status code

A successful operation returns status code 201 (Created).
  
For information about status codes, see [Status and error codes](Status-and-Error-Codes2.md).
  
### Response headers

The response for this operation includes the following headers. The response might also include additional standard HTTP headers. All standard headers conform to the [HTTP/1.1 protocol specification](https://go.microsoft.com/fwlink/?linkid=150478).  
  
|Response header|Description|  
|---------------------|-----------------|  
| `x-ms-request-id` | Uniquely identifies the request that was made, and you can use it to troubleshoot the request. |
| `x-ms-version` | Indicates the Azure Files version that was used to execute the request. |
| `Date` or `x-ms-date` | A UTC date/time value that's generated by the service and that indicates the time when the response was initiated. |
| `x-ms-file-permission-key` | The key of the permission created. |
|`x-ms-client-request-id`|Can be used to troubleshoot requests and their corresponding responses. The value of this header is equal to the value of the `x-ms-client-request-id` header if it's present in the request and the value contains no more than 1,024 visible ASCII characters. If the `x-ms-client-request-id` header isn't present in the request, it isn't present in the response.|
  
### Response body

None.  
  
## Authorization

Only the account owner or a caller that has a share-level shared access signature with write and delete authorization may call this operation.

## Remarks

To make the SDDL format portable across domain and non-domain joined machines, the caller can use the ConvertSecurityDescriptorToStringSecurityDescriptor() Windows function to get the base SDDL string for the security descriptor. The caller can then replace the SDDL notation that's listed in the following table with the correct SID value.

| Name | SDDL notation | SID value | Description |
|------|---------------|-----------|-------------|
| Local Administrator | LA | S-1-5-21domain-500 | A user account for the system administrator. By default, it's the only user account that's given full control over the system. |
| Local Guests | LG | S-1-5-21domain-501 | A user account for people who don't have individual accounts. This user account doesn't require a password. By default, the Guest account is disabled. |
| Certificate Publishers | CA | S-1-5-21domain-517 | A global group that includes all computers that are running an enterprise certification authority. Certificate Publishers are authorized to publish certificates for User objects in Active Directory. |
| Domain Admins | DA | S-1-5-21domain-512 | A global group whose members are authorized to administer the domain. By default, the Domain Admins group is a member of the Administrators group on all computers that have joined a domain, including the Domain Controllers. Domain Admins is the default owner of any object that's created by any member of the group. |
| Domain Controllers | DD | S-1-5-21domain-516 | A global group that includes all Domain Controllers in the domain. New Domain Controllers are added to this group by default. |
| Domain Users | DU | S-1-5-21domain-513 | A global group that, by default, includes all user accounts in a domain. When you create a user account in a domain, the account is added to this group by default. |
| Domain Guests | DG | S-1-5-21domain-514 | A global group that, by default, has only one member, the domain's built-in Guest account. |
| Domain Computers | DC | S-1-5-21domain-515 | A global group that includes all clients and servers that have joined the domain. |
| Schema Admins | SA | S-1-5-21root domain-518 | A universal group in a native-mode domain; a global group in a mixed-mode domain. The group is authorized to make schema changes in Active Directory. By default, the only member of the group is the Administrator account for the forest root domain. |
| Enterprise Admins | EA | S-1-5-21root domain-519 | A universal group in a native-mode domain; a global group in a mixed-mode domain. The group is authorized to make forest-wide changes in Active Directory, such as adding child domains. By default, the only member of the group is the Administrator account for the forest root domain. |
| Group Policy Creator Owners | PA | S-1-5-21domain-520 | A global group that's authorized to create new Group Policy objects in Active Directory. |
| RAS and IAS Servers | RS | S-1-5-21domain-553 | A domain local group. By default, this group has no members. Remote Access Server (RAS) and Internet Authentication Service (IAS) servers in this group have Read Account Restrictions and Read Logon Information access to User objects in the Active Directory domain local group. |
| Enterprise Read-only Domain Controllers | ED | S-1-5-21domain-498 | A universal group. Members of this group are Read-only Domain Controllers in the enterprise. |
| Read-only Domain Controllers | RO | S-1-5-21domain-521 | A global group. Members of this group are Read-only Domain Controllers in the domain. |
