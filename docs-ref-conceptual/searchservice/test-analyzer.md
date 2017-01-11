---
title: "Analyze Text (Azure Search Service REST API)"
ms.custom: ""
ms.date: "2017-01-11"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "search"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "language-reference"
applies_to:
  - "Azure"
ms.assetid:
caps.latest.revision: 29
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
# Analyze Text (Azure Search Service REST API)

The **Analyze API** shows how an analyzer breaks text into tokens.

```
    POST https://[service name].search.windows.net/indexes/[index name]/analyze?api-version=[api-version]
    Content-Type: application/json
    api-key: [admin key]
```     
## Request  

HTTPS is required for all services requests. The **Analyze API** request can be constructed using the POST method.

`api-version=[string]` (required). The current version is `api-version=2016-09-01`. See [Search Service Versioning](http://msdn.microsoft.com/library/azure/dn864560.aspx) for details and alternative versions.

### Request Headers  
The following list describes the required and optional request headers.

|Request Header|Description|  
|--------------------|-----------------|  
|*api-key:*|The `api-key` is used to authenticate the request to your Search service. It is a string value, unique to your service. The **Analyze API** request must include an `api-key` set to an admin key (as opposed to a query key).|  

 You will also need the service name to construct the request URL. You can get the service name and `api-key` from your service dashboard in the Azure Preview Portal. See [Create an Azure Search service in the portal](http://azure.microsoft.com/documentation/articles/search-create-service-portal/) for page navigation help.  

### Request Body
```   
{
  "text": "Text to analyze",
  "analyzer": "analyzer_name"
}
```  
or
```  
{
  "text": "Text to analyze",
  "tokenizer": "tokenizer_name",
  "tokenFilters": (optional) [ "token_filter_name" ],
  "charFilters": (optional) [ "char_filter_name" ]
}
```  
The `analyzer_name`, `tokenizer_name`, `token_filter_name` and `char_filter_name` need to be valid names of predefined or custom analyzers, tokenizers, token filters and char filters for the index. To learn more about the process of lexical analysis see [Analysis in Azure Search](https://aka.ms/azsanalysis).


## Response  

Status Code: 200 OK is returned for a successful response.

The response body is in the following format:
```
    {
      "tokens": [
        {
          "token": string (token),
          "startOffset": number (index of the first character of the token),
          "endOffset": number (index of the last character of the token),
          "position": number (position of the token in the input text)
        },
        ...
      ]
    }
 ```

## Analyze API example

 **Request**
```
     {
       "text": "Text to analyze",
       "analyzer": "standard"
     }
```
 **Response**
```
     {
       "tokens": [
         {
           "token": "text",
           "startOffset": 0,
           "endOffset": 4,
           "position": 0
         },
         {
           "token": "to",
           "startOffset": 5,
           "endOffset": 7,
           "position": 1
         },
         {
           "token": "analyze",
           "startOffset": 8,
           "endOffset": 15,
           "position": 2
         }
       ]
     }
     ```
## See Also  
 [Azure Search Service REST](index.md)
 [Custom analyzers in Azure Search](custom-analyzers-in-azure-search.md)
 [Language support](language-support.md)
 [HTTP status codes &#40;Azure Search&#41;](http-status-codes.md)   
 [API versions in Azure Search](https://go.microsoft.com/fwlink/?linkid=834796)
