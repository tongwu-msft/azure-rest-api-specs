---
title: "Supported data types (Azure Search)"
ms.custom: ""
ms.date: "2016-11-09"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "search"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "language-reference"
applies_to:
  - "Azure"
ms.assetid: cc08c9f9-2aff-420f-b01a-bbde2e051c08
caps.latest.revision: 30
author: "Brjohnstmsft"
ms.author: "brjohnst"
manager: "jhubbard"
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
  Document fields and values in expressions (for example, in filters) are typed according to the Entity Data Model, or EDM (see [Entity Data Model (MSDN)](http://msdn.microsoft.com/library/vstudio/ee382825(v=vs.100).aspx) for details). Azure Search uses the following data types.  

> [!NOTE]  
>  If you're using indexers to pull data into Azure Search, indexers have different data type mappings for JSON and SQL Server data sources. See [Data type map for indexers in Azure Search](data-type-map-for-indexers-in-azure-search.md) for details.  

## EDM data types used in Azure Search indexes and documents  

|||  
|-|-|  
|Edm.String|Text that can optionally be tokenized for full-text search (word-breaking, stemming, etc.)|  
|Collection(Edm.String)|A list of strings that can optionally be tokenized for full-text search. There is no theoretical upper limit on the number of items in a collection, but the 16 MB upper limit on payload size applies to collections.|  
|Edm.Boolean|Contains true/false values.|  
|Edm.Int32|32-bit integer values.|  
|Edm.Int64|64-bit integer values.|  
|Edm.Double|Double-precision numeric data|  
|Edm.DateTimeOffset|Date time values represented in the OData V4 format: `yyyy-MM-ddTHH:mm:ss.fffZ` or `yyyy-MM-ddTHH:mm:ss.fff[+&#124;-]HH:mm`. Precision of DateTime fields is limited to milliseconds. If you upload datetime values with sub-millisecond precision, the value returned will be rounded up to milliseconds (for example, 2015-04-15T10:30:09.7552052Z will be returned as 2015-04-15T10:30:09.7550000Z).|  
|Edm.GeographyPoint|A point representing a geographic location on the globe. For request and response bodies the representation of values of this type follows the GeoJSON "Point" type format. For URLs OData uses a literal form based on the WKT standard. A point literal is constructed as geography'POINT(lon lat)'.|  

> [!NOTE]  
>  All of the above types are nullable, except for Collection(Edm.String). Nullable fields can be explicitly set to null. They are automatically set to null when omitted from a document that is uploaded t an Azure Search index. Collection(Edm.String) fields are automatically set to empty ('[]' in JSON) when they are omitted from a document.  

<a name="Anchor_1"></a>
## Other EDM structures used in Azure Search  

 **Edm.GeographyPolygon** is a polygon representing a geographic region on the globe. While this type cannot be used in document fields, it can be used as an argument to the `geo.intersects` function. The literal form for URLs in OData is based on the [WKT (Well-known text) and OGC's simple feature access standards](http://www.opengeospatial.org/standards/sfa). A polygon literal is constructed as geography'POLYGON((lon lat, lon lat, ...))'.

To learn more about geospatial search in Azure, see this video: [Azure Search and Geospatial Data](https://azure.microsoft.com/documentation/videos/azure-search-and-geospatial-data/)

> [!IMPORTANT]  
>  Points in a polygon *must* be in counterclockwise order. Points in a polygon are interpreted in counterclockwise order, relative to the inside of the polygon. For example, a 4-point closed polygon around London would be -0.3°W 51.6°N [top left] , -0.3°W 51.4°N [bottom left], 0.1°E 51.4°N [bottom right], 0.1°E 51.6°N [top right], -0.3°W 51.6°N [starting point].

## See Also  
 [Azure Search Service REST](index.md)   
 [HTTP status codes &#40;Azure Search&#41;](http-status-codes.md)   
 [Support for OData &#40;Azure Search&#41;](support-for-odata.md)   
 [Create Index &#40;Azure Search Service REST API&#41;](create-index.md)   
 [Add, Update or Delete Documents &#40;Azure Search Service REST API&#41;](addupdate-or-delete-documents.md)   
 [Indexer operations &#40;Azure Search Service REST API&#41;](indexer-operations.md)   
 [Azure Search .NET SDK](https://msdn.microsoft.com/library/azure/dn951165.aspx)  
