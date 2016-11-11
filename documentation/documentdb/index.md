---
title: "Azure DocumentDB REST API Reference"
ms.custom: ""
ms.date: "2016-03-29"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "documentdb"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: f174cfcb-644c-4006-a5e9-2ad30c39b38a
caps.latest.revision: 38
author: "mimig1"
ms.author: "mimig"
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
# Azure DocumentDB REST API Reference
  The DocumentDB REST API supports the following:  
  
-   Access control to resources.  
  
-   Query functionality for resources.  
  
-   Basic CRUD operations for resources.  
  
 This section contains information about working with resources by using the REST API. For general information DocumentDB resources, see [Interact with DocumentDB Resources](http://azure.microsoft.com/documentation/articles/documentdb-interactions-with-resources/).  
  
## Release and retirement dates  
 DocumentDB supports version 2015-12-16 as specified in the x-ms-version header. The version only applies if you explicitly set the x-ms-version header in the request; otherwise, it defaults to the latest version.  
  
 Microsoft will provide notification at least **12 months** in advance before retiring an SDK in order to smooth the transition to a newer/supported version.  
  
> [!WARNING]  
>  All versions of the Azure DocumentDB REST API prior to version **2015-04-08** were retired on **February 29, 2016**.  
  
 We strongly recommend that you upgrade to the latest version as early as possible. It is recommended that you begin application upgrades now in order to avoid being impacted when the earlier service versions are removed.  
  
|Version|Retirement date|Change introduced|  
|-------------|---------------------|-----------------------|  
|2015-12-16||[Partitioned collections](https://azure.microsoft.com/documentation/articles/documentdb-partition-data/) and [user-defined performance levels](https://azure.microsoft.com/documentation/articles/documentdb-performance-levels/).|  
|2015-08-06|||  
|2015-06-03|||  
|2015-04-08|||  
|2014-08-21|February 29th, 2016||  
  
## In this section  
  
-   [RESTful interactions with DocumentDB resources](restful-interactions-with-documentdb-resources.md)  
  
-   [DocumentDB Resource URI Syntax for REST](documentdb-resource-uri-syntax-for-rest.md)  
  
-   [Access Control on DocumentDB Resources](access-control-on-documentdb-resources.md)  
  
-   [Querying DocumentDB resources using the REST API](querying-documentdb-resources-using-the-rest-api.md)  
  
-   [HTTP Status Codes for DocumentDB](http-status-codes-for-documentdb.md)  
  
-   [Common DocumentDB REST request headers](common-documentdb-rest-request-headers.md)  
  
-   [Common DocumentDB REST response headers](common-documentdb-rest-response-headers.md)  
  
-   [Common tasks using the DocumentDB REST API](common-tasks-using-the-documentdb-rest-api.md)  
  
-   [Offers](offers.md)  
  
-   [Databases](databases.md)  
  
-   [Users](users.md)  
  
-   [Permissions](permissions.md)  
  
-   [Collections](collections.md)  
  
-   [Documents](documents.md)  
  
-   [Attachments](attachments.md)  
  
-   [Stored Procedures](stored-procedures.md)  
  
-   [User Defined Functions](user-defined-functions.md)  
  
-   [Triggers](triggers.md)  
  
## See Also  
 [DocumentDB documentation](http://azure.microsoft.com/documentation/services/documentdb/)   
 [Azure DocumentDB Reference Documentation](https://go.microsoft.com/fwlink/?linkid=834805)   
 [DocumentDB SDKs](https://azure.microsoft.com/documentation/articles/documentdb-sdk-dotnet/)   
 [REST from .NET Sample](https://github.com/Azure/azure-documentdb-dotnet/tree/master/samples/rest-from-.net)  
  
  