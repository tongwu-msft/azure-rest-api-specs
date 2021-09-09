---
title: Managing file locks (FileREST API) - Azure Files
description: Azure Files provides access to cloud file shares through the SMB, NFS, and the FileREST protocols. SMB file shares can be concurrently accessed with SMB and FileREST, meaning the developers that access the Azure file share using the FileREST protocol must consideration file locking interactions between SMB and FileREST. 
author: wmgries

ms.date: 06/05/2021
ms.service: storage
ms.topic: reference
ms.author: wgries
---

# Managing file locks
Azure Files provides access to cloud file shares using through three different protocols:  
  
- Server Message Block (SMB)
- Network File System (NFS)
- FileREST (HTTPS)  

This topic describes how to manage file locking interactions between SMB and FileREST. NFS file shares have different locking semantics and support a subset of the FileREST APIs, so this topic is not applicable for NFS file shares.
  
## SMB file locking
SMB clients that mount file shares can leverage file system locking mechanisms to manage access to shared files. These include:  
  
- Whole file access sharing for read, write, and delete.  
- Byte range locks to manage read and write access to regions within a single file.  
  
When an SMB client opens a file, it specifies both the file access and share mode. The following file access options are typically used by SMB clients, though all combinations are legal:  
  
- **None:** Opens a file for query attribute access only.  
- **Read:** Opens a file for read access only.
- **Write:** Opens a file for write access only.  
- **Read/Write:** Opens a file with read/write permissions.  
- **Delete:** Opens a file for delete access only.

The following file share modes are typically used by SMB clients:  
  
- **None:** Declines sharing of the current file. Any request to open the file with read, write, or delete access will fail until the file is closed.
- **Shared Read:** Allows subsequent opening of the file for reading. If this flag is not specified, any request to open the file for reading will fail until the file is closed.  
- **Shared Write:** Allows subsequent opening of the file for writing. If this flag is not specified, any request to open the file for writing will fail until the file is closed.
- **Shared Read/Write:** Allows subsequent opening of the file for reading or writing. If this flag is not specified, any request to open the file for reading or writing will fail until the file is closed.  
- **Shared Delete:** Allows subsequent deleting of a file. If this flag is not specified, any request to delete the file will fail until the file is closed.
  
## SMB client open file examples
Consider the following open file examples:  
  
- **File Opens without Sharing Violation**
    - Client A opens the file with ``FileAccess.Read`` and FileShare.Write (denies subsequent Read/Delete while open).
    - Client B then opens the file with `FileAccess.Write` with FileShare.Read (denies subsequent Write/Delete while open).  
    - *Result:* Allowed since there is no conflict between file access and file share modes.
  
- **Sharing Violation Due to File Access**
    - Client A opens the file with `FileAccess.Write` and FileShare.Read (denies subsequent Write/Delete while open).  
    - Client B then opens the file with `FileAccess.Write` with FileShare.Write (denies subsequent Read/Delete while open).  
    - *Result:* Client B encounters a sharing violation since it specified a file access that is denied by the share mode specified previously by Client A.  
  
-   **Sharing Violation Due to Share Mode**
    - Client A opens the file with `FileAccess.Write` and FileShare.Write (denies subsequent Read/Delete while open).
    - Client B then opens the file with `FileAccess.Write` with FileShare.Read (denies subsequent Write/Delete while open).
    - *Result:* Client B encounters a sharing violation since it specified a share mode that denies write access to a file that is still open for write access.
  
## FileREST file access
When a FileREST operation is performed, it must respect the share mode specified for any file open on an SMB client. The following file access mode is used to determine whether the operation can be completed:  
  
| FileREST operation | File access equivalent |  
|--------------------|-------------------------------------------|  
|[List Directories and Files](List-Directories-and-Files.md)|N/A.|  
|[Create File](Create-File.md)|Write, Delete.|  
|[Get File](Get-File.md)|Read.|  
|[Set File Properties](Set-File-Properties.md)|Write.|  
|[Get File Properties](Get-File-Properties.md)|N/A.|  
|[Set File Metadata](Set-File-Metadata.md)|Write.|  
|[Get File Metadata](Get-File-Metadata.md)|N/A.|  
|[Delete File](Delete-File2.md)|Delete.|  
|[Put Range](Put-Range.md)|Write.|  
|[List Ranges](List-Ranges.md)|Read.|  
|[Lease File](lease-file.md)|Write, Delete, and Shared Read for the duration of the lease.|
  
[List Directories and Files](List-Directories-and-Files.md), [Get File Properties](Get-File-Properties.md), and [Get File Metadata](Get-File-Metadata.md) do not operate on file content and do not require read access to the file (that is, these operations will still succeed even if an SMB client has the file open for exclusive read access).  
  
The following are examples of FileREST requests interacting with the SMB share modes:  
  
- **FileREST Get File Sharing Violation**  
    - The SMB client opens the file with `FileAccess.Read`  and FileShare.Write (denies subsequent Read/Delete while open).
    - The REST client then performs a [Get File](Get-File.md) operation on the file (thereby using `FileAccess.Read` as specified in the table above).  
    - **Result:** The REST client's request fails with status code 409 (Conflict) and error code SharingViolation since the SMB client still has the file open while denying Read/Delete access.
  
- **FileREST Put Range Sharing Violation**  
    - The SMB client opens the file with `FileAccess.Write` and FileShare.Read (denies subsequent Write/Delete while open).  
    - The REST client then performs a [Put Range](Put-Range.md) operation on the file (thereby using `FileAccess.Write` as specified in the table above).  
    - Result: The REST client's request fails with status code 409 (Conflict) and error code SharingViolation since SMB client still has the file open while denying Write/Delete access.
  
The next section includes a comprehensive table of FileREST API sharing violation scenarios.  
  
## SMB client sharing mode implications on FileREST
Depending on the share mode specified when an SMB client opens a file, it is possible for FileREST to return status code 409 (Conflict) with error code `SharingViolation` as described in the following table:  
  
| SMB client file sharing mode | FileREST operations failing with a sharing violation |  
|----------------------------------|-------------------------------------------------------------------|  
|`None`<br /><br /> `(Deny Read, Write, Delete)`|The following read, write, lease, and delete operations on the file will fail:<br /><br /><ul><li>Create File</li><li>Get File</li><li>Set File Properties</li><li>Set File Metadata</li><li>Delete File</li><li>Put Range</li><li>List Ranges</li><li>Lease File</li></ul>|  
|`Shared Read`<br /><br /> `Deny Write, Delete)`|The following write, lease and delete operations on the file will fail:<br /><br /><ul><li>Create File</li><li>Set File Properties</li><li>Set File Metadata</li><li>Delete File</li><li>Put Range</li><li>Lease File</li></ul>|  
|`Shared Write`<br /><br /> `(Deny Read, Delete)`|The following read, lease, and delete operations on the file will fail:<br /><br /><ul><li>Create File.</li><li>Get File.</li><li>Delete File.</li><li>List Ranges.</li><li>Lease File</li></ul>|  
|`Shared Delete`<br /><br /> `(Deny Read, Write)`|The following read, write, and lease operations on the file will fail:<br /><br /><ul><li>Create File</li><li>Get File</li><li>Set File Properties</li><li>Set File Metadata</li><li>Put Range</li><li>List Ranges</li><li>Delete File</li><li>Lease File</li></ul>|  
|`Shared Read/Write`<br /><br /> `(Deny Delete)`|The following lease and delete operations on the file will fail:<br /><br /><ul><li>Create File.</li><li>Delete File.</li><li>Lease File</li></ul>|  
|`Shared Read/Delete`<br /><br /> `(Deny Write)`|The following write, lease, and delete operations on the file will fail:<br /><br /><ul><li>Create File</li><li>Set File Properties</li><li>Set File Metadata</li><li>Put Range</li><li>Delete File</li><li>Lease File</li></ul>|  
|`Shared Write/Delete`<br /><br /> `(Deny Read)`|The following read and lease operations on the file will fail:<br /><br /><ul><li>Get File</li><li>List Ranges</li><li>Delete File</li><li>Lease File</li></ul>|  
|`Shared Read/Write/Delete`<br /><br /> `(Deny Nothing)`|Delete File|  
  
Azure Files will return sharing violations only when files are open on SMB clients. For a FileREST [Delete File](Delete-File2.md) operation to succeed, there can be no SMB clients with handles open against that file. For more information, see the [Delete File](Delete-File2.md) operation and [Interaction between FileREST and SMB opportunistic locks](#interaction-between-filerest-and-smb-opportunistic-locks) for more details.  

## SMB file locking implications on FileREST Lease File API
Depending on the file access options specified when an SMB client opens a file, it is possible for the FileREST Lease File API to return status code 409 (Conflict) with error code `SharingViolation` as described in the following table:
 
|SMB client file access option|Acquire lease on file without an active lease with Lease File API|  
|--------------------|-------------------------------------------|  
|None|Succeeds.|  
|Read|Succeeds.|  
|Write|Fails due to `SharingViolation`|  
|Delete|Fails due to `SharingViolation`|  
|Read\|Write|Fails due to `SharingViolation`|  
|Read\|Delete|Fails due to `SharingViolation`|  
|Write\|Delete|Fails due to `SharingViolation`|  
|Read\|Write\|Delete|Fails due to `SharingViolation`|  

Azure Files will return sharing violations only when files are open on SMB clients. Note that for a FileREST [Lease File](lease-file.md) operation to succeed, there can be no SMB clients with Write or Delete handles open against that file. Please refer to the [Lease File](lease-file.md) operation and [Interaction between FileREST and SMB opportunistic locks](#interaction-between-filerest-and-smb-opportunistic-locks) for more details.
 
## FileREST Lease File implications on SMB file locking
A lease on a file provides exclusive write and delete access to the file. When an SMB client opens a file, it must respect the lock for any file leased by FileREST Lease File operation. The following table is used to determine whether the SMB open file operation can be completed:

|FileREST file lease state|SMB operations failing with a sharing violation|  
|--------------------|-------------------------------------------|  
|Leased|SMB clients opening file with following file access will fail:<br /><br /><ul><li>FileAccess.Write</li><li>FileAccess.Delete</li><li>FileAccess.Read\|FileAccess.Write</li><li>FileAccess.Write\|FileAccess.Delete</li><li>FileAccess.Read\|FileAccess.Write\|FileAccess.Delete</li></ul>|  
|Available|None|  
|Broken|None|  
 
## SMB delete implications on FileREST
When an SMB client opens a file for delete, it marks the file as pending delete until all other SMB client open handles on that file are closed. While a file is marked as pending delete, any FileREST operation on that file will return status code 409 (Conflict) with error code SMBDeletePending. Status code 404 (Not Found) is not returned since it is possible for the SMB client to remove the pending deletion flag prior to closing the file. In other words, status code 404 (Not Found) is only expected when the file has been removed.  
  
While a file is in an SMB pending delete state, it will not be included in the `List Files` results.  
  
Also note that the FileREST `Delete File` and `Delete Directory` operations are committed atomically and do not result in pending delete state.  
  
## File attribute implications on FileREST
It is possible for SMB clients to read and set file attributes, including:  
  
- Archive  
- Read-only  
- Hidden
- System  
  
If a file or directory is marked read-only, then any FileREST operation that attempts to write to the file will fail with status code 412 (Precondition Failed) and error code ReadOnlyAttribute. These operations include:  
  
- `Create File`  
- `Set File Properties`  
- `Set File Metadata`
- `Put Range`
  
These file attributes cannot be set or read from REST clients. Once a file is made read-only, REST clients will be unable to write to the file until the SMB client removes the read-only attribute.  
  
## Interaction between FileREST and SMB opportunistic locks
SMB opportunistic lock (*oplock*) is a caching mechanism that SMB clients request in order to improve performance and reduce network transfers. The latest state of a particular file or directory may be cached on an SMB client. There are multiple opportunistic lock types, referred to as *SMB lease types*:  
  
- **Read (R)**: When acquired, the SMB client can read from local cache.
- **Write (W)**: When acquired, the SMB client can write locally without the need to flush the data back to the Azure file share.  
- **Handle (H)**: When acquired, the SMB client is not required to immediately notify the Azure file share when a handle is closed. This lock type is useful when an application continues opening and closing files with the same access and sharing mode.

The above SMB lease types are independent of the access and sharing mode specified. Typically an SMB client attempts to acquire all lease types whenever it opens a new handle against a file, regardless of access and sharing mode.  
  
Depending on the FileREST operation called, it may be necessary for a request to break an existing opportunistic lock. In the case of a write oplock, the SMB client must flush cached changes to the Azure file share. Here are some cases where each type of oplock needs to be broken:  
  
- A **Read (R)** oplock needs to be broken whenever a write operation is issued, such as `Put Range`.  
- A **Write (W)** oplock needs to be broken whenever a read operation is issued, such as `Get File`.
- A **Handle (H)** oplock needs to be broken whenever a client issues a delete operation, since Azure Files requires that no handles can be open if a delete operation is to succeed.  
  
     Handle oplocks are also broken when a FileREST operation faces a sharing violation with an existing SMB handle (see the table on sharing violations above), in order to verify that the handle(s) are still opened by an application running on the client(s).  
  
Breaking the oplock may require flushing cached SMB client changes, which may cause delays in operation response time, or may cause the operation to fail with status code 408 (Request Timeout) and error code `ClientCacheFlushDelay`.  
  
The following examples are some scenarios where oplocks are broken:  
  
**An opblock break and SMB client flush are required, and the REST client experiences a delay:**  
  
1. The SMB client opens a file, acquires an RWH oplock, and writes data locally.
2. The REST client sends a `Get File` request.

    - The Azure file share breaks the write (W) oplock, leaving the client with an RH oplock.
    - The SMB client flushes its cached data against the Azure file share and acknowledges the oplock break.
    - The Azure file share processes the `Get File` request and responds back with the requested data.  
  
In the above example, the REST client will experience delays caused by the oplock break and the time taken by the SMB client to flush its data against the Azure file share.  
  
Subsequent calls to `Get File` will not experience any additional delays since the write (W) oplock has already been broken.  
  
**An oplock break is required, but the REST client won't experience a delay**
  
1. The SMB client has acquired an RH oplock.  
2. The REST client sends a `Put Range` request.

    - The Azure file share sends an oplock break request to the SMB client and does not wait for a response.
    - The Azure file share processes the `Put Range` request.
  
In the above example, the oplock break is required, but the `Put Range` request will not experience any additional delays since a response is not needed when breaking the read oplock.  
  
The following table summarizes the behavior of Azure Files for each FileREST operation, based on the oplock state of the SMB client that has already acquired a handle on the same file, and assuming that the SMB handle access and sharing don't conflict with the FileREST operation. If there is a conflict, the handle oplock is also broken to ensure that the handle is still open on the client. In the case of a *blocking* oplock break, Azure Files must wait for an acknowledgment that the break was successful. In the case of a *non-blocking* oplock break, it does not have to wait.  
  
|FileREST operation|Current OpLock types|OpLock break performed|Resulting Oplock|  
|--------------------|--------------------------|----------------------------|----------------------|  
|Get File|RWH|Yes (Blocking)|RH|  
|Get File|RH|No|RH|  
|Get File|RW|Yes (Blocking)|R|  
|Get File Properties|RWH|Yes (Blocking)|RH|  
|Get File Properties|RH|No|RH|  
|Get File Properties|RW|Yes (Blocking)|R|  
|List Ranges|RWH|Yes (Blocking)|RH|  
|List Ranges|RH|No|RH|  
|List Ranges|RW|Yes (Blocking)|R|  
|Get File Metadata|RWH|Yes (Blocking)|RH|  
|Get File Metadata|RH|No|RH|  
|Get File Metadata|RW|Yes (Blocking)|R|  
|List Files|RWH|No|RWH|  
|List Files|RH|No|RH|  
|List Files|RW|No|RW|  
|Put Range|RWH|Yes (Blocking)|None|  
|Put Range|RH|Yes (Non-Blocking)|None|  
|Put Range|RW|Yes(Blocking)|None|  
|Set File Properties|RWH|Yes (Blocking)|None|  
|Set File Properties|RH|Yes (Non-Blocking)|None|  
|Set File Properties|RW|Yes (Blocking)|None|  
|Set File Metadata|RWH|Yes (Blocking)|None|  
|Set File Metadata|RH|Yes (Non-Blocking)|None|  
|Set File Metadata|RW|Yes (Blocking)|None|  
|Delete File|RWH|Yes (Blocking)|RW|  
|Delete File|RH|Yes (Blocking)|R|  
|Delete File|RW|No|RW|  
  
In the case where a blocking oplock break is required, if the break does not succeed within the specified request timeout or within 30 seconds, whichever completes first, the FileREST operation will fail with status code 408 (Request Timeout) and error code `ClientCacheFlushDelay`.  
  
The `Delete File` request also requires breaking the oplock handle (H) lease. Breaking the handle ensures that there are no file handles still opened by an SMB client application when a REST client calls `Delete File`. If there is a sharing violation, the request fails with status code 409 (Conflict) and error code `SharingViolation`.  
  
## See also  
[Azure Files concepts](File-Service-Concepts.md)
