---
title: Formatting DateTime values (REST API) - Azure Storage
description: Azure Storage DateTime values must be represented as combined Coordinated Universal Time (UTC) values.
author: pemari-msft

ms.date: 11/19/2020
ms.service: storage
ms.topic: reference
ms.author: pemari
---

# Formatting DateTime values

Azure Storage `DateTime` values must be represented as combined Coordinated Universal Time (UTC) values. UTC formats are described by [ISO 8601](https://go.microsoft.com/fwlink/?LinkId=156016).

## Accepted ISO 8601 UTC formats

The following ISO 8601 UTC formats are currently accepted by Azure Storage. The date value is required, while the time value is optional:  
  
- `YYYY-MM-DD`  
- `YYYY-MM-DDThh:mm<TZDSuffix>`  
- `YYYY-MM-DDThh:mm:ss<TZDSuffix>`  
  
For the date value in these formats, `YYYY` is a four-digit year representation, `MM` is a two-digit month representation starting at 1, and `DD` is a two-digit day representation starting at 1.

If the optional time value is included, a literal designator `T` is required to separate the time value from the date value. For the time value, `hh` is the hour representation in 24-hour notation, `mm` is the two-digit minute representation, and `ss` is the two-digit second representation. Each of these values is expressed as an integer, starting at zero.

If the time value includes seconds, it may optionally also include up to 7 decimal digits of fractional seconds, following the pattern `hh:mm:ss[.f{1,7}]`.  This pattern is supported by the Azure Storage APIs, tools, and client libraries. You must use a period rather than commas to delineate the fractional seconds value.

If you include the optional time zone suffix `<TZDSuffix>`, it must be expressed as either:

- A literal value `Z`, designating that the time value is expressed as UTC time; or
- An offset indicating the time bias from UTC time. The offset requires a leading `+` for a positive offset and leading `-` for a negative offset. The value of the offset must fall between -23:59 and +23:59.

An example of the combined UTC format is shown below. The date is specified first, followed by the literal value `T`, which designates the beginning of the time element. The literal value `Z` at the end of the string indicates that the time is expressed in UTC.

The date/time value for *November 16, 2020 at 4:25:03 AM* in UTC time is expressed as:

`2020-11-16T04:25:03Z`
  
To express the same time in Eastern Standard Time (EST), which is five hours earlier that UTC, add the offset to the value:

`2020-11-16T04:25:03-05:00`

## See also

[Azure Storage REST API reference](Azure-Storage-Services-REST-API-Reference.md)