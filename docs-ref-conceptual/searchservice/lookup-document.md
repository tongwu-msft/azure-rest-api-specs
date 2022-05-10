---
title: "Lookup Document (Azure Cognitive Search REST API)"
description: Return a specific document by ID from an Azure Cognitive Search index.
ms.date: 03/05/2021

ms.service: cognitive-search
ms.topic: reference
ms.devlang: rest-api

author: bevloh
ms.author: beloh
---
# Lookup Document (Azure Cognitive Search REST API)

The **Lookup Document** operation retrieves a document from Azure Cognitive Search. This is useful when a user clicks on a specific search result, and you want to look up specific details about that document. You can only get one document at a time. Use [Search Documents](search-documents.md) to get multiple documents in a single request.   

```http
GET https://[service name].search.windows.net/indexes/[index name]/docs/key?[query parameters]  
  Content-Type: application/json   
  api-key: [admin or query key]     
```  
Alternatively, you can use the traditional OData syntax for key lookup:  

```http  
GET /indexes/[index name]/docs('[key]')?[query parameters]  
```  

 ## URI Parameters

| Parameter	  | Description  | 
|-------------|--------------|
| service name | Required. Set this to the unique, user-defined name of your search service. |
| index name  | Required. The request URI specifies the name of the index to query. Query parameters are specified on the query string for GET requests and in the request body for POST requests.   |
| key | Required. An `Edm.String` value that uniquely identifies each document in the index. The key is sometimes referred to as a document ID. The value of the key is case-sensitive. For example, a document with key "abc" is distinct from a document with key "ABC". |
| query parameters| A multi-part construction that includes a `$select` (optional) and `api-version=2020-06-30` (required). For this operation, the api-version is specified as a query parameter. <br/>`$select=[string]` is a list of comma-separated fields to retrieve. Only fields marked as retrievable can be included in this clause. If unspecified or set to `*`, all fields marked as retrievable in the schema are included in the projection.|

 ## Request Headers 

The following table describes the required and optional request headers.  

|Fields              |Description      |  
|--------------------|-----------------|  
|Content-Type|Required. Set this to `application/json`|  
|api-key|Required. The `api-key` is used to authenticate the request to your Search service. It is a string value, unique to your service URL. Query requests can specify either an admin-key or query-key as the `api-key`.The query-key is used for read-only operations against the documents collection. You can [find the API key](/azure/search/search-security-api-keys#find-existing-keys) in your search service dashboard in the Azure portal.|  

## Request Body  
 None.  

## Response  
 Status Code: "200 OK" is returned for a successful response.  

```json  
{   
   field_name: field_value (fields matching the default or specified projection)   
}  
```  

## Examples  
 Lookup the document that has key '2':  

```http 
GET /indexes/hotels/docs/2?api-version=2020-06-30
```  

 Lookup the document that has key '3' using OData syntax:  

```http  
GET /indexes/hotels/docs('3')?api-version=2020-06-30
```  

## See also
 
+ [Azure Cognitive Search REST APIs](index.md)   
+ [Document operations](document-operations.md)   
+ [OData Expression Syntax for Azure Cognitive Search](/azure/search/query-odata-filter-orderby-syntax)   
