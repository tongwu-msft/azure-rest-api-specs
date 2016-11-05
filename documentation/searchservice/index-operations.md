---
title: "Index operations (Azure Search Service REST API)"
ms.custom: ""
ms.date: "2016-08-10"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "search"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "language-reference"
ms.assetid: 028bc3ff-387f-4a42-a485-a32262508be9
caps.latest.revision: 22
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
# Index operations (Azure Search Service REST API)
  You can create and manage indexes in Azure Search service via simple HTTP requests (POST, GET, PUT, DELETE) against a given index resource. To create an index, you first POST a JSON document that that describes the index schema. The schema defines the fields of the index, their data types, and how they can be used (for example, in full-text searches, filters, sorting, faceting, or suggestions). It also defines scoring profiles and other attributes to configure the behavior of the index.  
  
 The following example provides an illustration of a schema used for searching on hotel information with the Description field defined in two languages. Notice how attributes control how the field is used. For example the `hotelId` is used as the document key (`"key":true`) and is excluded from full-text searches (`"searchable":false`).  
  
```  
{ 
   { 
     "name":"hotels",   
     "fields":[ 
         { 
            "name":"hotelId",
            "type":"Edm.String",
            "key":true,
            "searchable":false
         },
         { 
            "name":"baseRate",
            "type":"Edm.Double"
         },
         { 
            "name":"description",
            "type":"Edm.String",
            "filterable":false,
            "sortable":false,
            "facetable":false
         },
         { 
            "name":"description_fr",
            "type":"Edm.String",
            "filterable":false,
            "sortable":false,
            "facetable":false,
            "analyzer":"fr.lucene"
         },
         { 
            "name":"hotelName",
            "type":"Edm.String"
         },
         { 
            "name":"category",
            "type":"Edm.String"
         },
         { 
            "name":"tags",
            "type":"Collection(Edm.String)"
         },
         { 
            "name":"parkingIncluded",
            "type":"Edm.Boolean"
         },
         { 
            "name":"smokingAllowed",
            "type":"Edm.Boolean"
         },
         { 
            "name":"lastRenovationDate",
            "type":"Edm.DateTimeOffset"
         },
         { 
            "name":"rating",
            "type":"Edm.Int32"
         },
         { 
            "name":"location",
            "type":"Edm.GeographyPoint"
         }              
      ],
           "suggesters":[ 
                   { 
                   "name":"sg",
                   "searchMode":"analyzingInfixMatching",
                   "sourceFields":[ 
                       "hotelName"
            ]                  
         }           
      ]       
   } 
```  
  
 After the index is created, you'll upload documents that populate the index. See [Add, Update or Delete Documents &#40;Azure Search Service REST API&#41;](../SearchServiceREST/addupdate-or-delete-documents.md) for this next step.  
  
 For a code sample that shows how to create and build an index using the REST API, see [Get Started with Azure Search using REST](https://github.com/Azure-Samples/search-rest-api-getting-started).  
  
 For a video introduction to indexing, see the [Channel 9 Cloud Cover episode 152 on Azure Search](http://channel9.msdn.com/Shows/Cloud+Cover/Cloud-Cover-152-Azure-Search-with-Liam-Cavanagh).  
  
## Operations on indexes  
  
-   [Create Index &#40;Azure Search Service REST API&#41;](../SearchServiceREST/create-index.md)  
  
-   [Add scoring profiles to a search index &#40;Azure Search Service REST API&#41;](../SearchServiceREST/add-scoring-profiles-to-a-search-index.md)  
  
-   [Language support &#40;Azure Search Service REST API&#41;](../SearchServiceREST/language-support.md)  
  
-   [Update Index &#40;Azure Search Service REST API&#41;](../SearchServiceREST/update-index.md)  
  
-   [Get Index &#40;Azure Search Service REST API&#41;](../SearchServiceREST/get-index.md)  
  
-   [List Indexes &#40;Azure Search Service REST API&#41;](../SearchServiceREST/list-indexes.md)  
  
-   [Delete Index &#40;Azure Search Service REST API&#41;](../SearchServiceREST/delete-index.md)  
  
-   [Get Index Statistics &#40;Azure Search Service REST API&#41;](../SearchServiceREST/get-index-statistics.md)  
  
## See Also  
 [Azure Search Developer Reference](http://msdn.microsoft.com/en-us/a47e2a88-f9f9-4731-ab5f-e30ba1b5262b)   
 [Azure Search Service REST](../SearchServiceREST/service-rest.md)   
 [Service limits in Azure Search](https://azure.microsoft.com/documentation/articles/search-limits-quotas-capacity/)   
 [Azure Search .NET library](https://msdn.microsoft.com/library/azure/dn951165.aspx)  
  
  