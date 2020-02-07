---
title: "Analyze Text (Azure Cognitive Search REST API)"
description: Test predefined and custom analyzers used for breaking text into tokens during Azure Cognitive Search indexing.
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
# Analyze Text (Azure Cognitive Search REST API)

The **Analyze API** shows how an analyzer breaks text into tokens.

```http
POST https://[service name].search.windows.net/indexes/[index name]/analyze?api-version=[api-version]
    Content-Type: application/json
    api-key: [admin key]
```

 ## URI Parameters

| Parameter	  | Description  | 
|-------------|--------------|
| service name | Required. Set this to the unique, user-defined name of your search service. |
| index name  | Required. The request URI specifies the name of the index that contains the field you want to analyze.   |
| api-version | Required. The current version is `api-version=2019-05-06`. See [API versions in Azure Cognitive Search](https://docs.microsoft.com/azure/search/search-api-versions) for a list of available versions.|

## Request Headers 
 The following table describes the required and optional request headers.  

|Fields              |Description      |  
|--------------------|-----------------|  
|Content-Type|Required. Set this to `application/json`|  
|api-key|Required. The `api-key` is used to authenticate the request to your Search service. It is a string value, unique to your service. Analyzer requests must include an `api-key` header set to your admin key (as opposed to a query key).|  

You can get the `api-key` from your service dashboard in the Azure portal. For more information, see [Find existing keys](https://docs.microsoft.com/azure/search/search-security-api-keys#find-existing-keys).   

## Request Body

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
The `analyzer_name`, `tokenizer_name`, `token_filter_name` and `char_filter_name` need to be valid names of predefined or custom analyzers, tokenizers, token filters, and char filters for the index. To learn more about the process of lexical analysis, see [Analysis in Azure Cognitive Search](https://aka.ms/azsanalysis).


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

## Examples

Request body includes the string and analyzer you want to use.
```json
     {
       "text": "The quick brown fox",
       "analyzer": "standard"
     }
```

The response shows the tokens emitted by the analyzer for the string you provide.

```json
{
    "tokens": [
        {
            "token": "the",
            "startOffset": 0,
            "endOffset": 3,
            "position": 0
        },
        {
            "token": "quick",
            "startOffset": 4,
            "endOffset": 9,
            "position": 1
        },
        {
            "token": "brown",
            "startOffset": 10,
            "endOffset": 15,
            "position": 2
        },
        {
            "token": "fox",
            "startOffset": 16,
            "endOffset": 19,
            "position": 3
        }
    ]
}
```

 > [!Tip]
 > The [Search Analyzer Demo](https://alice.unearth.ai/) provides side-by-side comparison of results produced by the standard Lucene analyzer, Lucene's English language analyzer, and Microsoft's English natural language processor. For each search input you provide, results from each analyzer are displayed in adjacent panes.
 
## See also  
 [Azure Cognitive Search REST APIs](index.md)  
 [Custom analyzers in Azure Cognitive Search](https://docs.microsoft.com/azure/search/index-add-custom-analyzers)  
 [Language support](https://docs.microsoft.com/azure/search/index-add-language-analyzers)  
 [HTTP status codes &#40;Azure Cognitive Search&#41;](http-status-codes.md) 
 [API versions in Azure Cognitive Search](https://docs.microsoft.com/azure/search/search-api-versions)
