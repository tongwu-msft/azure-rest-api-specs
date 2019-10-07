---
title: Data type map for indexers - Azure Cognitive Search
description: Source and destination field data type map combinations, used when crawling external data sources for data ingestion in an Azure Cognitive Search index.
ms.date: "05/02/2019"
ms.service: search
ms.topic: "language-reference"
author: "Brjohnstmsft"
ms.author: "brjohnst"
ms.manager: nitinme
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
|char, nchar, varchar, nvarchar|Edm.String <br /><br/>Collection(Edm.String). See [Field Mapping Functions](create-indexer.md#FieldMappingFunctions) for details on how to transform a string column into a Collection(Edm.String)|  
|smalldatetime, datetime, datetime2, date, datetimeoffset|Edm.DateTimeOffset, Edm.String||  
|uniqueidentifer|Edm.String||  
|rowversion|N/A|Row-version columns cannot be stored in the search index, but they can be used for change tracking.|  
|geography|Edm.GeographyPoint|Only geography instances of type POINT with SRID 4326 (which is the default) are supported.|  
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
|GeoJSON point objects|Edm.GeographyPoint<br /><br /> GeoJSON points are JSON objects in the following format: {"type" : "Point", "coordinates": [long], [lat] }|  
|JSON objects|N/A<br /><br /> Not supported; Azure Cognitive Search currently supports only primitive types and string collections|  

## See also  

+ [Create Data Source &#40;Azure Cognitive Search REST API&#41;](create-data-source.md)   
+ [Create Indexer &#40;Azure Cognitive Search REST API&#41;](create-indexer.md)   
+ [Supported data types &#40;Azure Cognitive Search&#41;](supported-data-types.md)   
+ [Indexer operations &#40;Azure Cognitive Search REST API&#41;](indexer-operations.md)   
+ [Azure Cognitive Search REST APIs](index.md)  
