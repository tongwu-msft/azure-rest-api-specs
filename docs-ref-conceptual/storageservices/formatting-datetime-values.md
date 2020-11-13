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

Supported ISO 8601 formats include the following:  
  
- `YYYY-MM-DD`  
- `YYYY-MM-DDThh:mmTZD`  
- `YYYY-MM-DDThh:mm:ssTZD`  
  
For the date portion of these formats, `YYYY` is a four-digit year representation, `MM` is a two-digit month representation, and `DD` is a two-digit day representation. For the time portion, `hh` is the hour representation in 24-hour notation, `mm` is the two-digit minute representation, and `ss` is the two-digit second representation. A time designator `T` separates the date and time portions of the string, while a time zone designator `TZD` specifies a time zone (UTC).

Microsoft recommends that the time portion of the format follows the pattern `mm:hh:ss[.f{1,7}]`. This pattern is supported by the Azure Storage APIs, tools, and client libraries. Avoid using commas to designate fractional seconds, and avoid fractional seconds longer than 7 digits.

An example of the combined UTC format is as follows. The date is specified first, followed by the literal string "T", which designates the beginning of the time element. The literal string "Z" at the end of the string designates that the time is expressed in UTC:  
  
`2009-03-18T04:25:03Z`  
  
The following code example shows one way to construct the combined UTC format from the current UTC date:  
  
```csharp
string roundtripDateTime = XmlConvert.ToString(DateTime.UtcNow, XmlDateTimeSerializationMode.RoundtripKind);  
```  

## See also

[Azure Storage REST API reference](Azure-Storage-Services-REST-API-Reference.md)