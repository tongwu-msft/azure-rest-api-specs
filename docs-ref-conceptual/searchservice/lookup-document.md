---
title: "Lookup Document (Azure Search Service REST API)"
ms.custom: ""
ms.date: "2017-03-28"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "search"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "language-reference"
applies_to:
  - "Azure"
ms.assetid: 74a67156-c579-4b5f-8f61-3c2e8b83070c
caps.latest.revision: 27
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
# Lookup Document (Azure Search Service REST API)
  The **Lookup Document** operation retrieves a document from Azure Search. This is useful when a user clicks on a specific search result, and you want to look up specific details about that document.  

```  
GET https://[service name].search.windows.net/indexes/[index name]/docs/key?[query parameters]  
api-key: [admin key]  
```  

## Request  
 HTTPS is required for service requests. The **Lookup Document** request can be constructed as follows.  

```  
GET /indexes/[index name]/docs/[key]?[query parameters]   
```  

 Alternatively, you can use the traditional OData syntax for key lookup:  

```  
GET /indexes/[index name]/docs('[key]')?[query parameters]  
```  

 The request URI includes an `[index name]` and `[key]`, specifying which document to retrieve from which index. The `[key]` is an `Edm.String` value that uniquely identifies each document in the index. You can only get one document at a time. Use **Search** to get multiple documents in a single request.  

### Query Parameters  

|Parameter|Description|  
|---------------|-----------------|  
|`$select=[string]`|Optional. A list of comma-separated fields to retrieve. Only fields marked as retrievable can be included in this clause. If unspecified or set to *, all fields marked as retrievable in the schema are included in the projection.|  
|`api-version=[string]`|The `api-version` parameter is required.  See [API versions in Azure Search](https://go.microsoft.com/fwlink/?linkid=834796) for details. **Note:**  For this operation, the api-version is specified as a query parameter.|  

### Request Headers  
 The following table describes the required and optional request headers.  

|Request Header|Description|  
|--------------------|-----------------|  
|*api-key*|The `api-key` is used to authenticate the request to your Search service. It is a string value, unique to your service URL. The **Lookup Document** request can specify either an admin key or query key for the `api-key`.|  

 You will also need the service name to construct the request URL. You can get the service name and `api-key` from your service dashboard in the Azure Preview Portal. See [Create an Azure Search service in the portal](http://azure.microsoft.com/documentation/articles/search-create-service-portal/) for page navigation help.  

### Request Body  
 None.  

## Response  
 Status Code: "200 OK" is returned for a successful response.  

```  
{   
   field_name: field_value (fields matching the default or specified projection)   
}  
```  

## Example  
 Lookup the document that has key '2':  

```  
GET /indexes/hotels/docs/2?api-version=2016-09-01  
```  

 Lookup the document that has key '3' using OData syntax:  

```  
GET /indexes/hotels/docs('3')?api-version=2016-09-01  
```  

## See also  
 [Azure Search Service REST](index.md)   
 [Document operations &#40;Azure Search Service REST API&#41;](document-operations.md)   
 [OData Expression Syntax for Azure Search](odata-expression-syntax-for-azure-search.md)   
 [API versions in Azure Search](https://go.microsoft.com/fwlink/?linkid=834796)
