---
title: Formatting DateTime values (REST API) - Azure Storage
description: Azure Storage DateTime values must be represented as combined Coordinated Universal Time (UTC) values.
author: pemari-msft

ms.date: 11/13/2020
ms.service: storage
ms.topic: reference
ms.author: pemari
---

# Formatting DateTime values

Azure Storage `DateTime` values must be represented as combined Coordinated Universal Time (UTC) values. UTC formats are described by [ISO 8601](https://go.microsoft.com/fwlink/?LinkId=156016).

Supported UTC formats for Azure Storage include those that follow the pattern for the time format: `mm:hh:ss[.f{1,7}]`. This pattern is supported by the Azure Storage APIs, tools, and client libraries. Avoid using commas to designate fractional seconds, and avoid fractional seconds longer than 7 digits.

An example of the combined UTC format is as follows. The date is specified first, followed by the literal string "T", which designates the beginning of the time element. The literal string "Z" at the end of the string designates that the time is expressed in UTC:  
  
`2009-03-18T04:25:03Z`  
  
 The following code example shows one way to construct the combined UTC format from the current UTC date:  
  
```csharp
string roundtripDateTime = XmlConvert.ToString(DateTime.UtcNow, XmlDateTimeSerializationMode.RoundtripKind);  
```  

## See also

[Azure Storage REST API reference](Azure-Storage-Services-REST-API-Reference.md)