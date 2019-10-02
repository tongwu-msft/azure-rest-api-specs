---
title: Setting the OData data service version headers (REST API) - Azure Storage
description: Setting the OData data service version headers.
author: pemari-msft

ms.date: 09/30/2019
ms.service: storage
ms.topic: reference
ms.author: pemari
---

# Setting the OData data service version headers

The following Table service operations are OData-compatible:  
  
-   [Query Tables](Query-Tables.md)  
  
-   [Create Table](Create-Table.md)  
  
-   [Query Entities](Query-Entities.md)  
  
-   [Insert Entity](Insert-Entity.md)  
  
-   [Update Entity](Update-Entity2.md)  
  
-   [Merge Entity](Merge-Entity.md)  
  
-   [Delete Entity](Delete-Entity1.md)  
  
-   [Insert Or Replace Entity](Insert-Or-Replace-Entity.md)  
  
-   [Insert Or Merge Entity](Insert-Or-Merge-Entity.md)  
  
 When you call one of these operations, you must specify the OData data service version, using one of the following request headers:  
  
-   `MaxDataServiceVersion`, to specify the maximum data service version  
  
-   `DataServiceVersion`, to specify the exact data service version  
  
 If both headers are present, precedence is given to `MaxDataServiceVersion`.  
  
 Note that the headers which specify the OData protocol version are similar to the `x-ms-version` header, which indicates the version of the Table service to use when making a request against the service. You must specify both headers for the operations listed above.  
  
 Not all versions of the Table service are compatible with all OData data service versions, so you must ensure that both `x-ms-version` and `DataServiceVersion`/`MaxDataServiceVersion` are set to compatible versions, as summarized in the following table:  
  
|DataServiceVersion/MaxDataServiceVersion Header Value|Compatible Table Service Versions (x-ms-version Header Values)|  
|------------------------------------------------------------|------------------------------------------------------------------------|  
|1.0;NetFx|Any version|  
|[2.0;NetFx](http://www.odata.org/)|2011-08-18 or later|  
|[3.0;NetFx](http://www.odata.org/)|2013-08-15 or later|  
  
 Note that if you are accessing the Table service using the Azure Storage Client Library, these headers are automatically set for you.  
  
## See Also  
 [Table Service Concepts](Table-Service-Concepts.md)
