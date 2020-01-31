---
title: "List Indexes (Azure Cognitive Search REST API)"
description: Return a list of index names for indexes in the current Azure Cognitive Search service.
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
# List Indexes (Azure Cognitive Search REST API)
  The **List Indexes** operation returns a list of the indexes currently in your Azure Cognitive Search service.  

```https
GET https://[service name].search.windows.net/indexes?api-version=[api-version]  
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
 Status Code: "200 OK" is returned for a successful response.  

## Examples

```json 
{  
  "value": [  
    {  
      "name": "Books",  
      "fields": [  
        {"name": "ISBN", ...},  
        ...  
      ]  
    },  
    {  
      "name": "Games",  
      ...  
    },  
    ...  
  ]  
}  
```  

 You can filter the response down to just the properties you're interested in. For example, if you want only a list of index names, use the OData `$select` query option:  

```  
GET /indexes?api-version=2019-05-06&$select=name  
```  

 In this case, the response from the above example would appear as follows:  

```  
{  
  "value": [  
    {"name": "Books"},  
    {"name": "Games"},  
    ...  
  ]  
}  
```  

 This is a useful technique to save bandwidth if you have a lot of indexes in your Search service.  

## See also  
 [Azure Cognitive Search REST APIs](index.md)   
 [Index operations &#40;Azure Cognitive Search REST API&#41;](index-operations.md)  
