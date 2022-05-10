---
title: Data type map for indexers - Azure Cognitive Search
description: Source and destination field data type map combinations, used when crawling external data sources for data ingestion in an Azure Cognitive Search index.
ms.date: 06/30/2020

ms.service: cognitive-search
ms.topic: reference
ms.devlang: rest-api

author: bevloh
ms.author: beloh
---
# Data type map for indexers in Azure Cognitive Search

When building a schema for an indexer, the data types used in the data source must map to an allowed data type for the fields in the target index.  

This article provides data type comparisons between SQL Data Types, JSON data types, and Azure Cognitive Search. It contains the following:  

- [SQL Server Data Types to Azure Cognitive Search Data Types](#bkmk_sql_search)  

- [JSON Data Types to Azure Cognitive Search Data Types](#bkmk_json_search)  

For more information, see [Indexer operations &#40;Azure Cognitive Search REST API&#41;](indexer-operations.md) for links to topics about **indexers** and **data sources**.  

##  <a name="bkmk_sql_search"></a> SQL Server Data Types to Azure Cognitive Search Data Types  

|SQL Server Data Type|Allowed target index field types|Notes|  
|--------------------------|--------------------------------------|-----------|  
|bit|Edm.Boolean, Edm.String||  
|int, smallint, tinyint|Edm.Int32, Edm.Int64, Edm.String||  
|bigint|Edm.Int64, Edm.String||  
|real, float|Edm.Double, Edm.String||  
|smallmoney, money<br /><br /> decimal<br /><br /> numeric|Edm.String|Azure Cognitive Search does not support converting decimal types into Edm.Double because doing so would lose precision.|  
|char, nchar, varchar, nvarchar|Edm.String <br /><br/>Collection(Edm.String). See [Field Mapping Functions](/azure/search/search-indexer-field-mappings#field-mapping-functions) for details on how to transform a string column into a Collection(Edm.String)|  
|smalldatetime, datetime, datetime2, date, datetimeoffset|Edm.DateTimeOffset, Edm.String||  
|uniqueidentifer|Edm.String||  
|rowversion|N/A|Row-version columns cannot be stored in the search index, but they can be used for change tracking.|  
|geography|Edm.GeographyPoint, Edm.String| If using [geography data types](/sql/relational-databases/spatial/create-construct-and-query-geography-instances), only geography instances of type POINT with SRID 4326 (which is the default) are supported. If using strings, only GeoJSON points in the [following format](https://tools.ietf.org/html/rfc7946#appendix-A.1) are supported: `{"type": "Point", "coordinates": [long, lat]}`|  
|time, timespan<br /><br /> varbinary<br /><br /> image<br /><br /> xml<br /><br /> geometry<br /><br /> CLR types|N/A|Not supported.|  

##  <a name="bkmk_json_search"></a> JSON Data Types to Azure Cognitive Search Data Types  

|JSON data type|Allowed target index field types|  
|--------------------|--------------------------------------|  
|bool|Edm.Boolean, Edm.String|  
|Integral numbers|Edm.Int32, Edm.Int64, Edm.String|  
|Floating-point numbers|Edm.Double, Edm.String|  
|string|Edm.String|  
|arrays of primitive types, for example [ "a", "b", "c" ]|Collection(Edm.String)|  
|Strings that look like dates|Edm.DateTimeOffset, Edm.String|  
|GeoJSON point objects|Edm.GeographyPoint<br /><br /> GeoJSON points are JSON objects in the [following format](https://tools.ietf.org/html/rfc7946#appendix-A.1): `{"type" : "Point", "coordinates": [long, lat]}`|
|JSON objects|Edm.ComplexType<br /><br /> Azure Cognitive Search will map JSON objects to corresponding complex type schemas|  

## See also  

+ [Create Data Source](create-data-source.md)   
+ [Create Indexer](create-indexer.md)   
+ [Supported data types](supported-data-types.md)   
+ [Indexer operations](indexer-operations.md)   
+ [Azure Cognitive Search REST APIs](index.md)  
