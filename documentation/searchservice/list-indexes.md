---
title: "List Indexes (Azure Search Service REST API)"
ms.custom: ""
ms.date: "2016-11-09"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "search"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "language-reference"
applies_to:
  - "Azure"
ms.assetid: 54c762c8-805d-4319-844d-d3669bb63521
caps.latest.revision: 26
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
# List Indexes (Azure Search Service REST API)
  The **List Indexes** operation returns a list of the indexes currently in your Azure Search service.  

```  
GET https://[service name].search.windows.net/indexes?api-version=[api-version]  
api-key: [admin key]  
```  

## Request  
 HTTPS is required for all service requests. The **List Indexes** request can be constructed using the GET method.  

 The `api-version` parameter is required. See [API versions in Azure Search](https://go.microsoft.com/fwlink/?linkid=834796) for a list of available versions.  

### Request Headers  
 The following table describes the required and optional request headers.  

|Request Header|Description|  
|--------------------|-----------------|  
|*api-key:*|Required. The `api-key` is used to authenticate the request to your Search service. It is a string value, unique to your service URL. The **List Indexes** request must include an `api-key` set to an admin key (as opposed to a query key).|  

 You will also need the service name to construct the request URL. You can get the service name and `api-key` from your service dashboard in the Azure Preview Portal. See [Create an Azure Search service in the portal](http://azure.microsoft.com/documentation/articles/search-create-service-portal/) for page navigation help.  

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

 Note that you can filter the response down to just the properties you're interested in. For example, if you want only a list of index names, use the OData `$select` query option:  

```  
GET /indexes?api-version=2014-07-31-Preview&$select=name  
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

## See Also  
 [Azure Search Service REST](index.md)   
 [Index operations &#40;Azure Search Service REST API&#41;](index-operations.md)  
