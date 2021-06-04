---
title: Lease Share (REST API) - Azure Storage
description: The Lease Share operation creates and manages a lease on an Azure file share.
author: wmgries

ms.date: 04/30/2021
ms.service: storage
ms.topic: reference
ms.author: wgries
---

# Lease Share
The `Lease Share` operation establishes and manages a lock on an Azure file share or a share snapshot. The lock duration can be 15 to 60 seconds, or can be infinite. The `Lease Share` operation can be called in one of five modes:  

- `Acquire`: to request a new lease.
- `Renew`: to renew an existing lease.
- `Change`: to change the ID of an existing lease.  
- `Release`: to free the lease if it is no longer needed so that another client may immediately acquire a lease against the file share.  
- `Break`, to end the lease but ensure that another client cannot acquire a new lease until the current lease period has expired.  
  
> [!NOTE]
> The `Lease Share` operation is available in version 2020-02-10 and newer.
  
## Request  
The `Lease Share` request may be constructed as follows. HTTPS is recommended. Replace *myaccount* with the name of your storage account:  
  
|Method|Request URI|HTTP Version|  
|------------|-----------------|------------------|  
|`PUT`|`https://myaccount.file.core.windows.net/myshare?comp=lease&restype=share`|HTTP/1.1|
|`PUT`|`https://myaccount.file.core.windows.net/myshare?comp=lease&sharesnapshot=<DateTime>&restype=share`|HTTP/1.1|  
  
### URI parameters  
The following additional parameters may be specified on the request URI.  
  
|Parameter|Description|  
|---------------|-----------------|  
|`timeout`|Optional. The `timeout` parameter is expressed in seconds. For more information, see [Setting Timeouts for File Service Operations](Setting-Timeouts-for-File-Service-Operations.md).|  
  
### Request Headers  
The following table describes required and optional request headers.  
  
|Request Header|Description|  
|--------------------|-----------------|  
|`Authorization`|Required. Specifies the authorization scheme, account name, and signature. For more information, see [Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md).|  
|`Date` or `x-ms-date`|Required. Specifies the Coordinated Universal Time (UTC) for the request. For more information, see [Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md).|  
|`x-ms-version`|Optional. Specifies the version of the operation to use for this request. For more information, see [Versioning for the Azure Storage Services](Versioning-for-the-Azure-Storage-Services.md).|  
|`x-ms-lease-id: <ID>`|Required to renew, change, or release the lease.<br /><br /> The value of `x-ms-lease-id` can be specified in any valid GUID string format. See [Guid Constructor (String)](/dotnet/api/system.guid.-ctor#System_Guid__ctor_System_String_) for a list of valid GUID string formats.|  
|`x-ms-lease-action: <action>`| `acquire`: Requests a new lease. If the file share does not have an active lease, Azure Files creates a lease on the file share and returns a new lease ID. If the file share has an active lease, you can only request a new lease using the active lease ID, but you can specify a new `x-ms-lease duration`, including negative one (-1) for a lease that never expires.<br /><br />`renew`: Renews the lease. The lease can be renewed if the lease ID specified on the request matches that associated with the file share. Note that the lease may be renewed even if it has expired as long as the file share has not been leased again since the expiration of that lease. When you renew a lease, the lease duration clock resets.<br /><br />`change`: Change the lease ID of an active lease. A `change` must include the current lease ID in x-ms-lease-id and a new lease ID in x-ms-proposed-lease-id.<br /><br />`release`: Release the lease. The lease may be released if the lease ID specified on the request matches that associated with the file share. Releasing the lease allows another client to immediately acquire the lease for the file share as soon as the release is complete.<br /><br />`break`: Break the lease, if the file share has an active lease. Once a lease is broken, it cannot be renewed. Any authorized request can break the lease; the request is not required to specify a matching lease ID. When a lease is broken, the lease break period is allowed to elapse, during which time no lease operation except `break` and `release` can be performed on the file share. When a lease is successfully broken, the response indicates the interval in seconds until a new lease can be acquired.<br /><br />A lease that has been broken can also be released. A client can immediately acquire a file share lease that has been released.|  
|`x-ms-lease-break-period: N`|Optional. For a `break` operation, proposed duration the lease should continue before it is broken, in seconds, between 0 and 60. This break period is only used if it is shorter than the time remaining on the lease. If longer, the time remaining on the lease is used. A new lease will not be available before the break period has expired, but the lease may be held for longer than the break period. If this header does not appear with a `break` operation, a fixed-duration lease breaks after the remaining lease period elapses, and an infinite lease breaks immediately.|  
|`x-ms-lease-duration: -1` |Required for `acquire`. Specifies the duration of the lease, in seconds, or negative one (-1) for a lease that never expires.  A non-infinite lease can be between 15 and 60 seconds. A lease duration cannot be changed using `renew` or `change`.|  
|`x-ms-proposed-lease-id: <ID>`|Optional for `acquire`, required for `change`. Proposed lease ID, in a GUID string format. The Blob service returns `400 (Invalid request)` if the proposed lease ID is not in the correct format. See [Guid Constructor (String)](/dotnet/api/system.guid.-ctor#System_Guid__ctor_System_String_) for a list of valid GUID string formats.|  
|`Origin`|Optional. Specifies the origin from which the request is issued. The presence of this header results in cross-origin resource sharing headers on the response. See [CORS Support for the Storage Services](Cross-Origin-Resource-Sharing--CORS--Support-for-the-Azure-Storage-Services.md) for details.|  
|`x-ms-client-request-id`|Optional. Provides a client-generated, opaque value with a 1 KiB character limit that is recorded in the analytics logs when storage analytics logging is enabled. Using this header is highly recommended for correlating client-side activities with requests received by the server. For more information, see [About Storage Analytics Logging](About-Storage-Analytics-Logging.md) and [Azure Logging: Using Logs to Track Storage Requests](https://blogs.msdn.com/b/windowsazurestorage/archive/2011/08/03/windows-azure-storage-logging-using-logs-to-track-storage-requests.aspx).|  
  
### Request body  
None.  
  
### Sample request  
The following sample request shows how to acquire a lease:  
  
```    
Request Syntax:  
PUT https://myaccount.file.core.windows.net/myshare?restype=share&comp=lease HTTP/1.1  
  
Request Headers:  
x-ms-version: 2020-02-10  
x-ms-lease-action: acquire  
x-ms-lease-duration: -1  
x-ms-proposed-lease-id: 1f812371-a41d-49e6-b123-f4b542e851c5  
x-ms-date: Thu, 26 Jan 2012 23:30:18 GMT  
Authorization: SharedKey testaccount1:esSKMOYdK4o+nGTuTyeOLBI+xqnqi6aBmiW4XI699+o=  
```  
  
## Response  
The response includes an HTTP status code and a set of response headers.  
  
### Status code  
The success status codes returned for lease operations are the following:   
- `Acquire`: A successful operation returns status code 201 (Created).  
- `Renew`: A successful operation returns status code 200 (OK).   
- `Change`: A successful operation returns status code 200 (OK).   
- `Release`: A successful operation returns status code 200 (OK).   
- `Break`: A successful operation returns status code 202 (Accepted).  
  
For information about status codes, see [Status and Error Codes](Status-and-Error-Codes2.md).  
  
### Response Headers  
The response for this operation includes the following headers. The response may also include additional standard HTTP headers. All standard headers conform to the [HTTP/1.1 protocol specification](https://go.microsoft.com/fwlink/?linkid=150478).  
  
|Syntax|Description|  
|------------|-----------------|  
|`ETag`|The ETag for the file share. |  
|`Last-Modified`|Returns the date and time the file share was last modified. The date format follows RFC 1123. For more information, see [Representation of Date-Time Values in Headers](Representation-of-Date-Time-Values-in-Headers.md).<br /><br />Any operation that modifies the file share or its properties or metadata updates the last-modified time, including setting the file share's permissions. Operations on blobs do not affect the last-modified time of the file share. |  
|`x-ms-lease-id: <id>`|When you request a lease, Azure Files returns a unique lease ID. While the lease is active, you must include the lease ID with any request to delete the file share, or to renew, change, or release the lease.<br /><br />A successful renew operation also returns the lease ID for the active lease.|  
|`x-ms-lease-time: seconds`|Approximate time remaining in the lease period, in seconds. This header is returned only for a successful request to break the lease. If the break is immediate, 0 is returned.|  
|`x-ms-request-id`|This header uniquely identifies the request that was made and can be used for troubleshooting the request. For more information, see [Troubleshooting API Operations](Troubleshooting-API-Operations.md).|  
|`x-ms-version`|Indicates the version of the FileREST API used to execute the request.|  
|`Date`|A UTC date/time value generated by the service that indicates the time at which the response was initiated.|  
|`Access-Control-Allow-Origin`|Returned if the request includes an `Origin` header and CORS is enabled with a matching rule. This header returns the value of the origin request header in case of a match.|  
|`Access-Control-Expose-Headers`|Returned if the request includes an `Origin` header and CORS is enabled with a matching rule. Returns the list of response headers that are to be exposed to the client or issuer of the request.|  
|`Access-Control-Allow-Credentials`|Returned if the request includes an `Origin` header and CORS is enabled with a matching rule that does not allow all origins. This header will be set to true.|  
|`x-ms-client-request-id`|This header can be used to troubleshoot requests and corresponding responses. The value of this header is equal to the value of the `x-ms-client-request-id` header if it is present in the request and the value is at most 1024 visible ASCII characters. If the `x-ms-client-request-id` header is not present in the request, this header will not be present in the response.|  
  
### Response body  
None.  
  
### Sample response  
The following is a sample response for a request to acquire a lease:  
  
```  
Response Status:  
HTTP/1.1 201 Created  
  
Response Headers:  
Server: Windows-Azure-File/1.0 Microsoft-HTTPAPI/2.0  
x-ms-request-id: cc6b209a-b593-4be1-a38a-dde7c106f402  
x-ms-version: 2020-02-10  
x-ms-lease-id: 1f812371-a41d-49e6-b123-f4b542e851c5  
Date: Thu, 26 Jan 2012 23:30:18 GMT  
  
```  
  
## Authorization  
Only the account owner may call this operation.  
  
## Remarks  
A lease on a file share provides exclusive delete access to the file share. Get file share operations will succeed on a leased file share without including the lease ID; set file share operations will require the file share lease ID. If the lease ID is not included on set file share operations, the operation fails with 412 (Precondition failed). The lease is granted for the duration specified when the lease is acquired, which can be between 15 seconds and one minute, or an infinite duration.  
  
When a client acquires a lease, a lease ID is returned. Azure Files will generate a lease ID if one is not specified in the acquire request. The client may use this lease ID to renew the lease, change its lease ID, or release the lease. The following diagram shows the five states of a lease, and the commands or events that cause lease state changes.  
  
The following diagram shows the five states of a lease, and the commands or events that cause lease state changes.  
  
![File share lease states and state change triggers](media/ContainerLeaseStates.png "FileShareLeaseStates")  
  
**Lease States**  
A lease can be in 5 states, based on whether the lease is locked or unlocked, and whether the lease is renewable in that state. The lease actions above cause state transitions.  
  
|Renewal status|Locked lease|Unlocked lease|  
|-|------------------|--------------------|  
|Renewable lease|Leased|Expired|  
|Non-renewable lease|Breaking|Broken, Available|  
  
-   `Available`, the lease is unlocked and can be acquired. Allowed action: `acquire`.
-   `Leased`, the lease is locked. Allowed actions: `acquire` (same lease ID only), `renew`, `change`, `release`, and `break`.
-   `Expired`, the lease duration has expired. Allowed actions: `acquire`, `renew`, `release`, and `break`.
-   `Breaking`, lease has been broken, but the lease will continue to be locked until the break period has expired. Allowed actions: `release` and `break`.
-   `Broken`, lease has been broken, and the break period has expired. Allowed actions: `acquire`, `release`, and `break`.
  
The lease ID is maintained by Azure Files after a file share lease has expired. A client can renew or release their lease using their expired lease ID. If the client attempts to renew or release an expired lease with their previous lease ID and the request fails, the client then knows that the file share was leased again or deleted since their lease was last active. If a lease expires rather than being explicitly released, a client may need to wait up to one minute before a new lease can be acquired for the file share. However, the client can renew the lease with the expired lease ID immediately.  
  
The file share's `Last-Modified-Time` property is not updated by calls to `Lease Share`.  
  
The following tables show outcomes of actions on containers with leases in various lease states. Letters (A), (B), and (C) represent lease IDs, and (X) represents a lease ID generated by Azure Files.  
  
### Outcomes of use attempts on shares by lease state  
|Action|Available|Leased (A)|Breaking (A)|Broken (A)|Expired (A)|  
|-|---------------|------------------|--------------------|------------------|-------------------|  
|Delete using (A)|Fails (412)|Leased (A), delete succeeds|Breaking (A), delete succeeds|Fails (412)|Fails (412)|  
|Delete using (B)|Fails (412)|Fails (409)|Fails (412)|Fails (412)|Fails (412)|  
|Delete, no lease specified|Available, delete succeeds|Fails (412)|Fails (412)|Available, delete succeeds|Available, delete succeeds|  
|Other operations using (A)|Fails (412)|Leased (A), operation succeeds|Breaking (A), operation succeeds|Fails (412)|Fails (412)|  
|Other operations using (B)|Fails (412)|Fails (409)|Fails (409)|Fails (412)|Fails (412)|  
perations, no lease specified|Available, operation succeeds|Leased (A), operation succeeds|Breaking (A), operation succeeds|Broken (A), operation succeeds|Expired (A), operation succeeds|  
  
### Outcomes of lease operations on shares by lease state  
|Action|Available|Leased (A)|Breaking (A)|Broken (A)|Expired (A)|  
|---|---------------|------------------|--------------------|------------------|-------------------|  
|`Acquire`, no proposed lease ID|Leased (X)|Fails (409)|Fails (409)|Leased (X)|Leased (X)|  
|`Acquire` (A)|Leased (A)|Leased (A), new duration|Fails (409)|Leased (A)|Leased (A)|  
|`Acquire` (B)|Leased (B)|Fails (409)|Fails (409)|Leased (B)|Leased (B)|  
|`Break`, period=0|Fails (409)|Broken (A)|Broken (A)|Broken (A)|Broken (A)|  
|`Break`, period>0|Fails (409)|Breaking (A)|Breaking (A)|Broken (A)|Broken (A)|  
|`Change`, (A) to (B)|Fails (409)|Leased (B)|Fails (409)|Fails (409)|Fails (409)|  
|`Change`, (B) to (A)|Fails (409)|Leased (A)|Fails (409)|Fails (409)|Fails (409)|  
|`Change`, (B) to (C)|Fails (409)|Fails (409)|Fails (409)|Fails (409)|Fails (409)|  
|`Renew` (A)|Fails (409)|Leased (A), expiration clock reset|Fails (409)|Fails (409)|Leased (A)|  
|`Renew` (B) |Fails (409)|Fails (409)|Fails (409)|Fails (409)|Fails (409)|  
|`Release` (A)|Fails (409)|Available|Available|Available|Available|  
|`Release` (B)|Fails (409)|Fails (409)|Fails (409)|Fails (409)|Fails (409)|  
|Duration expires|Available|Expired (A)|Broken (A)|Broken (A)|Expired (A)|  