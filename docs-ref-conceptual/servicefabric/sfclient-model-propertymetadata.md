---
title: "PropertyMetadata"
ms.date: "2018-07-20"
ms.prod: "azure"
ms.service: "service-fabric"
ms.topic: "reference"
applies_to: 
  - "Azure"
  - "Windows Server 2012 R2"
  - "Windows Server 2016"
dev_langs: 
  - "rest-api"
helpviewer_keywords: 
  - "Service Fabric REST API Reference"
author: "rwike77"
ms.author: "ryanwi"
manager: "timlt"
translation.priority.mt: 
  - "de-de"
  - "es-es"
  - "fr-fr"
  - "it-it"
  - "ja-jp"
  - "ko-kr"
  - "pt-br"
  - "ru-ru"
  - "zh-cn"
  - "zh-tw"
---
# PropertyMetadata

The metadata associated with a property, including the property's name.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`TypeId`](#typeid) | string (enum) | No |
| [`CustomTypeId`](#customtypeid) | string | No |
| [`Parent`](#parent) | string | No |
| [`SizeInBytes`](#sizeinbytes) | integer | No |
| [`LastModifiedUtcTimestamp`](#lastmodifiedutctimestamp) | string (date-time) | No |
| [`SequenceNumber`](#sequencenumber) | string | No |

____
### `TypeId`
__Type__: string (enum) <br/>
__Required__: No<br/>
<br/>


The kind of property, determined by the type of data. Following are the possible values.

Possible values are: 

  - `Invalid` - Indicates the property is invalid. All Service Fabric enumerations have the invalid type. The value is zero.
  - `Binary` - The data inside the property is a binary blob. The value is 1.
  - `Int64` - The data inside the property is an int64. The value is 2.
  - `Double` - The data inside the property is a double. The value is 3.
  - `String` - The data inside the property is a string. The value is 4.
  - `Guid` - The data inside the property is a guid. The value is 5.



____
### `CustomTypeId`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The property's custom type ID.

____
### `Parent`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The name of the parent Service Fabric Name for the property. It could be thought of as the name-space/table under which the property exists.

____
### `SizeInBytes`
__Type__: integer <br/>
__Required__: No<br/>
<br/>
The length of the serialized property value.

____
### `LastModifiedUtcTimestamp`
__Type__: string (date-time) <br/>
__Required__: No<br/>
<br/>
Represents when the Property was last modified. Only write operations will cause this field to be updated.

____
### `SequenceNumber`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The version of the property. Every time a property is modified, its sequence number is increased.
