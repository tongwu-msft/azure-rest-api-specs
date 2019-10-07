---
title: "List Indexes (Azure Cognitive Search REST API)"
description: Return a list of index names for indexes in the current Azure Cognitive Search service.
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
# List Indexes (Azure Cognitive Search REST API)
  The **List Indexes** operation returns a list of the indexes currently in your Azure Cognitive Search service.  

```  
GET https://[service name].search.windows.net/indexes?api-version=[api-version]  
api-key: [admin key]  
```  

## Request  
 HTTPS is required for all service requests. The **List Indexes** request can be constructed using the GET method.  

 The `api-version` parameter is required. The current version is `api-version=2019-05-06`. See [API versions in Azure Cognitive Search](https://docs.microsoft.com/azure/search/search-api-versions) for a list of available versions.  

### Request Headers  
 The following table describes the required and optional request headers.  

|Request Header|Description|  
|--------------------|-----------------|  
|*api-key:*|Required. The `api-key` is used to authenticate the request to your Search service. It is a string value, unique to your service URL. The **List Indexes** request must include an `api-key` set to an admin key (as opposed to a query key).|  

 You will also need the service name to construct the request URL. You can get the service name and `api-key` from your service dashboard in the Azure portal. See [Create an Azure Cognitive Search service in the portal](https://azure.microsoft.com/documentation/articles/search-create-service-portal/) for page navigation help.  

### Request Body  
 None.  

## Response  
 Status Code: "200 OK" is returned for a successful response.  

 Here is an example response body:  

```  
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
