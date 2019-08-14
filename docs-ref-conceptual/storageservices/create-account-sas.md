---
title: Create an account SAS - Azure Storage
description: An account shared access signature (SAS) delegates access to resources in a storage account. An account SAS can provide access to resources in more than one Azure Storage service or to service-level operations.
author: tamram

ms.date: 08/12/2019
ms.author: tamram
ms.reviewer: cbrooks
ms.service: storage
ms.topic: reference
---

# Create an account SAS

Beginning with version 2015-04-05, Azure Storage supports creating a new type of shared access signature (SAS) at the level of the storage account. Creating an account SAS enables you to:  
  
- Delegate access to service-level operations that are not currently available with a service-specific SAS, such as the `Get/Set Service Properties` and `Get Service Stats` operations.  
  
- Delegate access to more than one service in a storage account at a time. For example, you can delegate access to resources in both the Blob and File services with an account SAS.  
  
- Delegate access to write and delete operations for containers, queues, tables, and file shares, which are not available with an object-specific SAS.  
  
- Specify an IP address or range of IP addresses from which to accept requests.  
  
- Specify the HTTP protocol from which to accept requests (either HTTPS or HTTP/HTTPS).  
  
Stored access policies are currently not supported for account SAS.
  
> [!CAUTION]
> Shared access signature are keys that grant permissions to storage resources, and should be protected in the same manner as an account key. It's important to protect a SAS from malicious or unintended use. Use discretion in distributing a SAS, and have a plan in place for revoking a compromised SAS. Operations that use shared access signatures should be performed only over an HTTPS connection, and shared access signature URIs should only be distributed on a secure connection such as HTTPS.  

## Authorization of an account SAS

An account SAS is secured using the storage account key. To create an account SAS, a client application must possess the account key.

To use Azure AD credentials to secure a SAS for a container or blob, create a user delegation SAS. For more information, see [Create a user delegation SAS](create-user-delegation-sas.md).
  
## Constructing the Account SAS URI  

The account SAS URI consists of the URI to the resource for which the SAS will delegate access, followed by the SAS token. The SAS token is the query string that includes all of the information required to authorize a request to the resource, as well as to specify the service, resource, and permissions available for access, and the time interval over which the signature is valid.  
  
### Specifying Account SAS Parameters  

The following table describes the required and optional parameters for the SAS token.  
  
|SAS Query Parameter|Description|  
|-------------------------|-----------------|  
|`api-version`|Optional. Specifies the storage service version to use to execute the request made using the account SAS URI.|  
|`SignedVersion (sv)`|Required. Specifies the signed storage service version to use to authorize requests made with this account SAS. Must be set to version 2015-04-05 or later.|  
|`SignedServices (ss)`|Required. Specifies the signed services accessible with the account SAS. Possible values include:<br /><br /> -   Blob (`b`)<br />-   Queue (`q`)<br />-   Table (`t`)<br />-   File (`f`)<br /><br /> You can combine values to provide access to more than one service. For example, `ss=bf` specifies access to the Blob and File endpoints.|  
|`SignedResourceTypes (srt)`|Required. Specifies the signed resource types that are accessible with the account SAS.<br /><br /> -   Service (`s`): Access to service-level APIs (*e.g.*, Get/Set Service Properties, Get Service Stats, List Containers/Queues/Tables/Shares)<br />-   Container (`c`): Access to container-level APIs (*e.g.*, Create/Delete Container, Create/Delete Queue, Create/Delete Table, Create/Delete Share, List Blobs/Files and Directories)<br />-   Object (`o`): Access to object-level APIs for  blobs, queue messages,  table entities, and files(*e.g.* Put Blob, Query Entity, Get Messages, Create File, etc.)<br /><br /> You can combine values to provide access to more than one resource type. For example, `srt=sc` specifies access to service and container resources.|  
|`SignedPermission (sp)`|Required. Specifies the signed permissions for the account SAS. Permissions are only valid if they match the specified signed resource type; otherwise they are ignored.<br /><br /> -   Read (`r`): Valid for all signed resources types (Service, Container, and Object). Permits read permissions to the specified resource type.<br />-   Write (`w`): Valid for all signed resources types (Service, Container, and Object). Permits write permissions to the specified resource type.<br />-   Delete (`d`): Valid for Container and Object resource types, except for queue messages.<br />-   List (`l`): Valid for Service and Container resource types only.<br />-   Add (`a`): Valid for the following Object resource types only: queue messages, table entities, and append blobs.<br />-   Create (`c`): Valid for the following Object resource types only: blobs and files. Users can create new blobs or files, but may not overwrite existing blobs or files.<br />-   Update (`u`): Valid for the following Object resource types only:   queue messages and table entities.<br />-   Process (`p`): Valid for the following Object resource type only: queue messages.|  
|`SignedStart (st)`|Optional. The time at which the SAS becomes valid, in an ISO 8601 format. If omitted, start time for this call is assumed to be the time when the storage service receives the request.|  
|`SignedExpiry (se)`|Required. The time at which the shared access signature becomes invalid, in an ISO 8601 format.|  
|`SignedIP (sip)`|Optional. Specifies an IP address or a range of IP addresses from which to accept requests. When specifying a range, note that the range is inclusive.<br /><br /> For example, `sip=168.1.5.65` or `sip=168.1.5.60-168.1.5.70`.|  
|`SignedProtocol (spr)`|Optional. Specifies the protocol permitted for a request made with the account SAS. Possible values are both HTTPS and HTTP (`https,http`) or HTTPS only (`https`).  The default value is `https,http`.<br /><br /> Note that HTTP only is not a permitted value.|  
|`Signature (sig)`|Required.  The signature part of the URI is used to authorize the request made with the shared access signature.<br /><br /> The string-to-sign is a unique string constructed from the fields that must be verified in order to authorize the request. The signature is an HMAC computed over the string-to-sign and key using the SHA256 algorithm, and then encoded using Base64 encoding.|  
  
### Specifying the signature validity interval

The `SignedStart` and `SignedExpiry` fields must be expressed as UTC times and must adhere to a valid ISO 8601 format. Supported ISO 8601 formats include the following:  
  
- YYYY-MM-DD  
  
- YYYY-MM-DDThh:mmTZD  
  
- YYYY-MM-DDThh:mm:ssTZD  
  
For the date portion of these formats, YYYY is a four-digit year representation, MM is a two-digit month representation, and DD is a two-digit day representation. For the time portion, hh is the hour representation in 24-hour notation, mm is the two-digit minute representation, and ss is the two-digit second representation. A time designator T separates the date and time portions of the string, while a time zone designator TZD specifies the UTC time zone.

### Constructing the signature string

To construct the signature string for an account SAS, first construct the string-to-sign from the fields comprising the request, then encode the string as UTF-8 and compute the signature using the HMAC-SHA256 algorithm. Note that fields included in the string-to-sign must be URL-decoded.  
  
 To construct the string-to-sign for an account SAS, use the following format:  
  
```  
StringToSign = accountname + "\n" +  
    signedpermissions + "\n" +  
    signedservice + "\n" +  
    signedresourcetype + "\n" +  
    signedstart + "\n" +  
    signedexpiry + "\n" +  
    signedIP + "\n" +  
    signedProtocol + "\n" +  
    signedversion + "\n"  
  
```  
  
## Account sas permissions by operation

 The tables in the following sections list various APIs for each service and the signed resource types and signed permissions supported for each operation.  
  
### Blob service
  
The following table lists Blob service operations and indicates which signed resource type and signed permissions to specify to delegate access to those operations.  
  
|Operation|Signed Service|Signed Resource Type|Signed Permission|  
|---------------|--------------------|--------------------------|-----------------------|  
|List Containers|Blob (b)|Service (s)|List (l)|  
|Get Blob Service Properties|Blob (b)|Service (s)|Read (r)|  
|Set Blob Service Properties|Blob (b)|Service (s)|Write (w)|  
|Get Blob Service Stats|Blob (b)|Service (s)|Read (r)|  
|Create Container|Blob (b)|Container (c)|Create(c) or Write (w)|  
|Get Container Properties|Blob (b)|Container (c)|Read (r)|  
|Get Container Metadata|Blob (b)|Container (c)|Read (r)|  
|Set Container Metadata|Blob (b)|Container (c)|Write (w)|  
|Lease Container|Blob (b)|Container (c)|Write (w) or Delete (d)<Sup>1</Sup>|  
|Delete Container|Blob (b)|Container (c)|Delete (d)|  
|List Blobs|Blob (b)|Container (c)|List (l)|  
|Put Blob (create new block blob)|Blob (b)|Object (o)|Create (c) or Write (w)|  
|Put Blob (overwrite existing block blob)|Blob (b)|Object (o)|Write (w)|  
|Put Blob (create new page blob)|Blob (b)|Object (o)|Create (c) or Write (w)|  
|Put Blob (overwrite existing page blob)|Blob (b)|Object (o)|Write (w)|  
|Get Blob|Blob (b)|Object (o)|Read (r)|  
|Get Blob Properties|Blob (b)|Object (o)|Read (r)|  
|Set Blob Properties|Blob (b)|Object (o)|Write (w)|  
|Get Blob Metadata|Blob (b)|Object (o)|Read (r)|  
|Set Blob Metadata|Blob (b)|Object (o)|Write (w)|  
|Delete Blob|Blob (b)|Object (o)|Delete (d)|  
|Lease Blob|Blob (b)|Object (o)|Write (w) or Delete (d)<Sup>1</Sup>|  
|Snapshot Blob|Blob (b)|Object (o)|Create (c)  or Write (w)|  
|Copy Blob (destination is new blob)|Blob (b)|Object (o)|Create (c)  or Write (w)|  
|Copy Blob (destination is an existing blob)|Blob (b)|Object (o)|Write (w)|  
|Incremental Copy|Blob (b)|Object (o)|Create (c)  or Write (w)| 
|Abort Copy Blob|Blob (b)|Object (o)|Write (w)|  
|Put Block|Blob (b)|Object (o)|Write (w)|  
|Put Block List (create new blob)|Blob (b)|Object (o)|Write (w)|  
|Put Block List (update existing blob)|Blob (b)|Object (o)|Write (w)|  
|Get Block List|Blob (b)|Object (o)|Read (r)|  
|Put Page|Blob (b)|Object (o)|Write (w)|  
|Get Page Ranges|Blob (b)|Object (o)|Read (r)|  
|Append Block|Blob (b)|Object (o)|Add (a) or Write (w)|  
|Clear Page|Blob (b)|Object (o)|Write (w)|  
  
> [!NOTE]
> The `Delete` permission allows breaking a lease on a blob or container with version 2017-07-29 and later.
  
### Queue service

The following table lists Queue service operations and indicates which signed resource type and signed permissions to specify to delegate access to those operations.  
  
|Operation|Signed Service|Signed Resource Type|Signed Permission|  
|---------------|--------------------|--------------------------|-----------------------|  
|Get Queue Service Properties|Queue (q)|Service (s)|Read (r)|  
|Set Queue Service Properties|Queue (q)|Service (s)|Write (w)|  
|List Queues|Queue (q)|Service (s)|List (l)|  
|Get Queue Service Stats|Queue (q)|Service (s)|Read (r)|  
|Create Queue|Queue (q)|Container (c)|Create(c) or Write (w)|  
|Delete Queue|Queue (q)|Container (c)|Delete (d)|  
|Get Queue Metadata|Queue (q)|Container (c)|Read (r)|  
|Set Queue Metadata|Queue (q)|Container (c)|Write (w)|  
|Put Message|Queue (q)|Object (o)|Add (a)|  
|Get Messages|Queue (q)|Object (o)|Process (p)|  
|Peek Messages|Queue (q)|Object (o)|Read (r)|  
|Delete Message|Queue (q)|Object (o)|Process (p)|  
|Clear Messages|Queue (q)|Object (o)|Delete (d)|  
|Update Message|Queue (q)|Object (o)|Update (u)|  
  
### Table service

The following table lists Table service operations and indicates which signed resource type and signed permissions to specify to delegate access to those operations.  
  
|Operation|Signed Service|Signed Resource Type|Signed Permission|  
|---------------|--------------------|--------------------------|-----------------------|  
|Get Table Service Properties|Table (t)|Service (s)|Read (r)|  
|Set Table Service Properties|Table (t)|Service (s)|Write (w)|  
|Get Table Service Stats|Table (t)|Service (s)|Read (r)|  
|Query Tables|Table (t)|Service (s)|List (l)|  
|Create Table|Table (t)|Container (c)|Create (c) or Write (w)|  
|Delete  Table|Table (t)|Container (c)|Delete (d)|  
|Query Entities|Table (t)|Object (o)|Read (r)|  
|Insert Entity|Table (t)|Object (o)|Add (a)|  
|Insert Or Merge Entity|Table (t)|Object (o)|Add (a) and Update (u)<sup>1</sup>|  
|Insert Or Replace Entity|Table (t)|Object (o)|Add (a) and Update (u)<sup>1</sup>|  
|Update Entity|Table (t)|Object (o)|Update (u)|  
|Merge Entity|Table (t)|Object (o)|Update (u)|  
|Delete Entity|Table (t)|Object (o)|Delete (d)|  

<sup>1</sup>Add and Update permissions are required for upsert operations on the Table Service.
  
### File Service

The following table lists File service operations and indicates which signed resource type and signed permissions to specify to delegate access to those operations.  
  
|Operation|Signed Service|Signed Resource Type|Signed Permission|  
|---------------|--------------------|--------------------------|-----------------------|  
|List Shares|File (f)|Service (s)|List (l)|  
|Get File Service Properties|File (f)|Service (s)|Read (r)|  
|Set File Service Properties|File (f)|Service (s)|Write (w)|  
|Get Share Stats|File (f)|Container (c)|Read (r)|  
|Create Share|File (f)|Container (c)|Create (c) or Write (w)|  
|Snapshot Share|File (f)|Container (c)|Create (c) or Write (w)|  
|Get Share Properties|File (f)|Container (c)|Read (r)|  
|Set Share Properties|File (f)|Container (c)|Write (w)|  
|Get Share Metadata|File (f)|Container (c)|Read (r)|  
|Set Share Metadata|File (f)|Container (c)|Write (w)|  
|Delete Share|File (f)|Container (c)|Delete (d)|  
|List Directories and Files|File (f)|Container (c)|List (l)|  
|Create Directory|File (f)|Object (o)|Create (c) or Write (w)|  
|Get Directory Properties|File (f)|Object (o)|Read (r)|  
|Get Directory Metadata|File (f)|Object (o)|Read (r)|  
|Set Directory Metadata|File (f)|Object (o)|Write (w)|  
|Delete Directory|File (f)|Object (o)|Delete (d)|  
|Create File (create new)|File (f)|Object (o)|Create (c) or Write (w)|  
|Create File (overwrite existing)|File (f)|Object (o)|Write (w)|  
|Get File|File (f)|Object (o)|Read (r)|  
|Get File Properties|File (f)|Object (o)|Read (r)|  
|Get File Metadata|File (f)|Object (o)|Read (r)|  
|Set File Metadata|File (f)|Object (o)|Write (w)|  
|Delete File|File (f)|Object (o)|Delete (d)|  
|Put Range|File (f)|Object (o)|Write (w)|  
|List Ranges|File (f)|Object (o)|Read (r)|  
|Abort Copy File|File (f)|Object (o)|Write (w)|  
|Copy File|File (f)|Object (o)|Write (w)|  
|Clear Range|File (f)|Object (o)|Write (w)|  

### Account SAS URI example

The following example shows an account SAS URI that provides read and write permissions to a blob. The table breaks down each part of the URI:

```
https://myaccount.blob.core.windows.net/?restype=service&comp=properties&sv=2019-02-02&ss=bf&srt=s&st=2019-08-01T22%3A18%3A26Z&se=2019-08-10T02%3A23%3A26Z&sr=b&sp=rw&sip=168.1.5.60-168.1.5.70&spr=https&sig=F%6GRVAZ5Cdj2Pw4tgU7IlSTkWgn7bUkkAg8P6HESXwmf%4B
```

| Name | SAS portion | Description |
| --- | --- | --- |
| Resource URI |`https://myaccount.blob.core.windows.net/?restype=service&comp=properties` |The service endpoint, with parameters for getting service properties (when called with GET) or setting service properties (when called with SET). Based on the value of the signed services field (`ss`), this SAS can be used with either Blob storage or Azure Files. |
| Storage services version |`sv=2019-02-02` |For storage services version 2012-02-12 and later, this parameter indicates the version to use. |
| Services |`ss=bf` |The SAS applies to the Blob and File services |
| Resource types |`srt=s` |The SAS applies to service-level operations. |
| Start time |`st=2019-08-01T22%3A18%3A26Z` |Specified in UTC time. If you want the SAS to be valid immediately, omit the start time. |
| Expiry time |`se=2019-08-10T02%3A23%3A26Z` |Specified in UTC time. |
| Permissions |`sp=rw` |The permissions grant access to read and write operations. |
| IP range |`sip=168.1.5.60-168.1.5.70` |The range of IP addresses from which a request will be accepted. |
| Protocol |`spr=https` |Only requests using HTTPS are permitted. |
| Signature |`sig=F%6GRVAZ5Cdj2Pw4tgU7IlSTkWgn7bUkkAg8P6HESXwmf%4B` |Used to authorize access to the blob. The signature is an HMAC computed over a string-to-sign and key using the SHA256 algorithm, and then encoded using Base64 encoding. |

Given that permissions are restricted to the service level, accessible operations with this SAS are **Get Blob Service Properties** (read) and **Set Blob Service Properties** (write). However, with a different resource URI, the same SAS token could also be used to delegate access to **Get Blob Service Stats** (read).
  
## See also

- [Delegate access with a shared access signature](delegate-access-with-shared-access-signature.md)
- [Create a user delegation SAS (preview)](create-user-delegation-sas.md)
- [Create a service SAS](create-service-sas.md)
- [SAS Error Codes](SAS-Error-Codes.md)
