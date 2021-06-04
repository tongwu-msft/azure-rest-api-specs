---
title: Features not supported in Azure Files (REST API) - Azure Storage
description: Azure Files supports a subset of SMB 3.1.1, 3.0 and 2.1 features. Some applications may not work properly with Azure Files if they rely on unsupported features.
author: wmgries

ms.date: 09/23/2019
ms.service: storage
ms.topic: reference
ms.author: wgries
---

# Features not supported in Azure Files
Azure Files supports a subset of SMB 3.1.1, 3.0 and 2.1 features. Some applications may not work properly with Azure Files if they rely on unsupported features. Azure Files does not support the following features:
  
- [SMB Direct](https://technet.microsoft.com/library/jj134210.aspx)  
- [SMB Directory Leasing](https://technet.microsoft.com/library/hh831795.aspx)  
- [Volume Shadow Copy Service for SMB file share](https://blogs.technet.com/b/clausjor/archive/2012/06/14/vss-for-smb-file-shares.aspx)  
- [Alternate data streams](https://msdn.microsoft.com/library/windows/desktop/aa364404\(v=vs.85\).aspx)  
- [Extended attributes](https://en.wikipedia.org/wiki/Extended_file_attributes)
- [Object identifiers](https://msdn.microsoft.com/library/windows/desktop/aa363997\(v=vs.85\).aspx)  
- [Hard links](https://msdn.microsoft.com/library/windows/desktop/aa365006\(v=vs.85\).aspx)
- [Soft links](https://msdn.microsoft.com/library/windows/desktop/aa363878\(v=vs.85\).aspx)  
- [Reparse points](https://msdn.microsoft.com/library/windows/desktop/aa365503\(v=vs.85\).aspx)  
- [Sparse files](https://msdn.microsoft.com/library/windows/desktop/aa365564\(v=vs.85\).aspx)
- [Short file names (8.3 alias)](https://support.microsoft.com/kb/142982)  
- [Compression](https://msdn.microsoft.com/library/windows/desktop/aa364592\(v=vs.85\).aspx)  
- [Named pipes](https://msdn.microsoft.com/library/windows/desktop/aa365590\(v=vs.85\).aspx)  
- [Server service](https://technet.microsoft.com/library/cc958790.aspx)  
- [File system transactions (TxF)](https://msdn.microsoft.com/magazine/cc163388.aspx)
  
## See also
[File Service REST API](File-Service-REST-API.md)
