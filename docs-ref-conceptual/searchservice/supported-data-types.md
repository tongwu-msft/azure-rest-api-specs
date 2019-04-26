---
title: Supported data types - Azure Search
description: Allowed data types for fields in an Azure Search index. 
ms.date: 04/25/2019
services: search
ms.service: search
ms.topic: "language-reference"
author: "Brjohnstmsft"
ms.author: "brjohnst"
ms.manager: cgronlun
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
# Supported data types (Azure Search)

In Azure Search, document fields and values in expressions (for example, in filters) are typed according to the Entity Data Model, or EDM (see [Entity Data Model (MSDN)](https://docs.microsoft.com/dotnet/framework/data/adonet/entity-data-model) for details).

> [!NOTE]  
>  If you're using indexers to pull data into Azure Search, indexers have different data type mappings for JSON and SQL Server data sources. For more information, see [Data type map for indexers in Azure Search](data-type-map-for-indexers-in-azure-search.md).  

## EDM data types used in Azure Search indexes and documents  

|||  
|-|-|  
|Edm.String|Text data.|  
|Edm.Boolean|Contains true/false values.|  
|Edm.Int32|32-bit integer values.|  
|Edm.Int64|64-bit integer values.|  
|Edm.Double|Double-precision IEEE 754 floating-point values.|  
|Edm.DateTimeOffset|Date and time values represented in the OData V4 format: `yyyy-MM-ddTHH:mm:ss.fffZ` or `yyyy-MM-ddTHH:mm:ss.fff[+&#124;-]HH:mm`. Precision of `DateTimeOffset` fields is limited to milliseconds. If you upload `DateTimeOffset` values with sub-millisecond precision, the value returned will be rounded up to milliseconds (for example, `2015-04-15T10:30:09.7552052Z` will be returned as `2015-04-15T10:30:09.7550000Z`). When you upload `DateTimeOffset` values with time zone information to your index, Azure Search normalizes these values to UTC. For example, `2017-01-13T14:03:00-08:00` will be stored as `2017-01-13T22:03:00Z`. If you need to store time zone information, you will need to add an extra field to your index.|  
|Edm.GeographyPoint|A point representing a geographic location on the globe. For request and response bodies the representation of values of this type follows the GeoJSON "Point" type format. For URLs OData uses a literal form based on the WKT standard. A point literal is constructed as geography'POINT(lon lat)'.|  
|Edm.ComplexType|Objects whose properties map to sub-fields that can be of any other supported data type. This enables indexing of structured hierarchical data such as JSON. Objects in a field of type `Edm.ComplexType` can contain nested objects, but the level of nesting is limited. The limits are described in [Service limits for Azure Search](https://azure.microsoft.com/documentation/articles/search-limits-quotas-capacity/).|
|Collection(Edm.String)|A list of strings.|  
|Collection(Edm.Boolean)|A list of boolean values.|
|Collection(Edm.Int32)|A list of 32-bit integer values.|
|Collection(Edm.Int64)|A list of 64-bit integer values.|
|Collection(Edm.Double)|A list of double-precision numeric values.|
|Collection(Edm.DateTimeOffset)|A list of date time values.|
|Collection(Edm.GeographyPoint)|A list of points representing geographic locations.|
|Collection(Edm.ComplexType)|A list of objects of type `Edm.ComplexType`. There is a limit on the maximum number of elements across all collections of type `Edm.ComplexType` in a document. See [Service limits for Azure Search](https://azure.microsoft.com/documentation/articles/search-limits-quotas-capacity/) for details.|

> [!NOTE]  
>  All of the above types are nullable, except for collections of primitive and complex types, for example, `Collection(Edm.String)`. Nullable fields can be explicitly set to null. They are automatically set to null when omitted from a document that is uploaded to an Azure Search index. Collection fields are automatically set to empty ('[]' in JSON) when they are omitted from a document. Also, it is not possible to store a null value in a collection field.

> Unlike complex collections, there is no upper limit specifically on the number of items in a collection of primitive types, but the 16 MB upper limit on payload size applies to all parts of documents, including collections.

<a name="Anchor_1"></a>
## Other EDM structures used in Azure Search  

 **Edm.GeographyPolygon** is a polygon representing a geographic region on the globe. While this type cannot be used in document fields, it can be used as an argument to the `geo.intersects` function. The literal form for URLs in OData is based on the [WKT (Well-known text) and OGC's simple feature access standards](https://www.opengeospatial.org/standards/sfa). A polygon literal is constructed as geography'POLYGON((lon lat, lon lat, ...))'.

To learn more about geospatial search in Azure, see this video: [Azure Search and Geospatial Data](https://azure.microsoft.com/documentation/videos/azure-search-and-geospatial-data/)

> [!IMPORTANT]  
>  Points in a polygon *must* be in counterclockwise order. Points in a polygon are interpreted in counterclockwise order, relative to the inside of the polygon. For example, a 4-point closed polygon around London would be -0.3°W 51.6°N [top left] , -0.3°W 51.4°N [bottom left], 0.1°E 51.4°N [bottom right], 0.1°E 51.6°N [top right], -0.3°W 51.6°N [starting point].

## See also  

+ [Azure Search Service REST](index.md)   
+ [HTTP status codes &#40;Azure Search&#41;](http-status-codes.md)   
+ [Support for OData &#40;Azure Search&#41;](support-for-odata.md)   
+ [Create Index &#40;Azure Search Service REST API&#41;](create-index.md)   
+ [Add, Update or Delete Documents &#40;Azure Search Service REST API&#41;](addupdate-or-delete-documents.md)   
+ [Indexer operations &#40;Azure Search Service REST API&#41;](indexer-operations.md)   
+ [Azure Search .NET SDK](https://docs.microsoft.com/dotnet/api/overview/azure/search?view=azure-dotnet)  
