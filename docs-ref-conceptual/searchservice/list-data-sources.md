---
title: "List Data Sources (Azure Cognitive Search REST API)"
description: Return a list of data source connection objects used by an Azure Cognitive Search indexer.
ms.date: 01/30/2020

ms.service: cognitive-search
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
# List Data Sources (Azure Cognitive Search REST API)

The **List Data Sources** operation returns a list of the data sources in your Azure Cognitive Search service.  

```http
GET https://[service name].search.windows.net/datasources?api-version=[api-version]  
  Content-Type: application/json  
  api-key: [admin key]  
```  

## URI Parameters

| Parameter	  | Description  | 
|-------------|--------------|
| service name | Required. Set this to the unique, user-defined name of your search service. |
| api-version | Required. The current version is `api-version=2019-05-06`. See [API versions in Azure Cognitive Search](https://docs.microsoft.com/azure/search/search-api-versions) for a list of available versions.|

## Request Header 

The following table describes the required and optional request headers.  

|Fields              |Description      |  
|--------------------|-----------------|  
|Content-Type|Required. Set this to `application/json`|  
|api-key|Required. The api-key is used to authenticate the request to your Search service. It is a string value, unique to your service. Get requests about objects in your service must include an api-key field set to your admin key (as opposed to a query key).|  

You can get the api-key value from your service dashboard in the Azure portal. For more information, see [Find existing keys](https://docs.microsoft.com/azure/search/search-security-api-keys#find-existing-keys). 

## Request Body  
 None.  

## Response  
 For a successful request: 200 OK. Here is an example response body:  

```  
    {  
      "value" : [  
        {  
          "name": "datasource1",  
          "type": "azuresql",  
          ... other data source properties  
        }]  
    }  
```  

 You can filter the response down to just the properties you're interested in. For example, if you want only a list of data source names, use the OData **select** query option:  

```  
GET /datasources?api-version=2019-05-06&$select=name  
```  

 In this case, the response from the above example would appear as follows:  

```  
    {  
      "value" : [ { "name": "datasource1" }, ... ]  
    }  
```  

## See also  
 [Azure Cognitive Search REST APIs](index.md)   
 [HTTP status codes &#40;Azure Cognitive Search&#41;](http-status-codes.md)   
 [Indexer operations &#40;Azure Cognitive Search REST API&#41;](indexer-operations.md)   
 [Naming rules &#40;Azure Cognitive Search&#41;](naming-rules.md)   
 [OData Expression Syntax for Azure Cognitive Search](https://docs.microsoft.com/azure/search/query-odata-filter-orderby-syntax)   
 [Support for OData &#40;Azure Cognitive Search&#41;](support-for-odata.md)  
