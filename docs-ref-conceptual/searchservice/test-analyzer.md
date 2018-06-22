---
title: "Analyze Text (Azure Search Service REST API) | Microsoft Docs"
description: Test predefined and custom analyzers used for breaking text into tokens during Azure Search indexing.
ms.date: "04/20/2018"
ms.prod: "azure"
ms.service: "search"
ms.topic: "language-reference"
author: "Brjohnstmsft"
ms.author: "brjohnst"
ms.manager: cgronlun
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

`api-version=[string]` (required). The current version is `api-version=2017-11-11`. See [API versions in Azure Search](https://docs.microsoft.com/azure/search/search-api-versions) for a list of available versions.

### Request Headers  
The following list describes the required and optional request headers.

|Request Header|Description|  
|--------------------|-----------------|  
|*api-key:*|The `api-key` is used to authenticate the request to your Search service. It is a string value, unique to your service. The **Analyze API** request must include an `api-key` set to an admin key (as opposed to a query key).|  

 You also need the service name to construct the request URL. You can get the service name and `api-key` from your service dashboard in the Azure portal. See [Create an Azure Search service in the portal](https://azure.microsoft.com/documentation/articles/search-create-service-portal/) for page navigation help.  

### Request Body
```json
{
  "text": "Text to analyze",
  "analyzer": "analyzer_name"
}
```  
or
```json
{
  "text": "Text to analyze",
  "tokenizer": "tokenizer_name",
  "tokenFilters": (optional) [ "token_filter_name" ],
  "charFilters": (optional) [ "char_filter_name" ]
}
```  
The `analyzer_name`, `tokenizer_name`, `token_filter_name` and `char_filter_name` need to be valid names of predefined or custom analyzers, tokenizers, token filters, and char filters for the index. To learn more about the process of lexical analysis, see [Analysis in Azure Search](https://aka.ms/azsanalysis).


## Response  

Status Code: 200 OK is returned for a successful response.

The response body is in the following format:
```json
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
```json
     {
       "text": "Text to analyze",
       "analyzer": "standard"
     }
```
 **Response**
```json
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

 > [!Tip]
 > The [Search Analyzer Demo](http://alice.unearth.ai/) provides side-by-side comparison of results produced by the standard Lucene analyzer, Lucene's English language analyzer, and Microsoft's English natural language processor. For each search input you provide, results from each analyzer are displayed in adjacent panes.
 
## See also  
 [Azure Search Service REST](index.md)  
 [Custom analyzers in Azure Search](custom-analyzers-in-azure-search.md)  
 [Language support](language-support.md)  
 [HTTP status codes &#40;Azure Search&#41;](http-status-codes.md) 
 [API versions in Azure Search](https://docs.microsoft.com/azure/search/search-api-versions)
