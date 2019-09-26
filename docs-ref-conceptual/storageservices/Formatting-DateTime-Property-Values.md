---
title: Formatting DateTime property values (REST) - Azure Storage
description: Azure Storage DateTime property values must be represented as combined Coordinated Universal Time (UTC) values. The Timestamp property, which is an opaque property maintained by the Table service, is also represented in this format.
author: pemari-msft

ms.date: 09/23/2019
ms.service: storage
ms.topic: reference
ms.author: pemari
---

# Formatting DateTime property values

Azure Storage `DateTime` property values must be represented as combined Coordinated Universal Time (UTC) values. The `Timestamp` property, which is an opaque property maintained by the Table service, is also represented in this format. UTC formats are described by [ISO 8601](http://go.microsoft.com/fwlink/?LinkId=156016).
  
An example of the combined UTC format is as follows. The date is specified first, followed by the literal string "T", which designates the beginning of the time element. The literal string "Z" at the end of the string designates that the time is expressed in UTC:  
  
```  
2009-03-18T04:25:03Z  
```  
  
 The following code example shows one way to construct the combined UTC format from the current UTC date:  
  
```  
string roundtripDateTime = XmlConvert.ToString(DateTime.UtcNow, XmlDateTimeSerializationMode.RoundtripKind);  
```  
  
## See Also  
 [Understanding the Table Service Data Model](Understanding-the-Table-Service-Data-Model.md)
