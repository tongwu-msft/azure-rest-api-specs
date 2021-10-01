---
title: Analyze Text (2021-04-30-Preview)
description: Test predefined and custom analyzers/normalizers used for pre-processing text during Azure Cognitive Search indexing.
ms.date: 09/30/2021

ms.service: cognitive-search
ms.topic: language-reference
ms.devlang: rest-api

author: "Brjohnstmsft"
ms.author: "brjohnst"
ms.manager: nitinme
---
# Analyze Text (2021-04-30-Preview)

The **Analyze API** shows how an analyzer breaks text into tokens and how a normalizer pre-proceses text. It's intended for interactive testing so that you can see how a given analyzer/normalizer will process a string input.

```http
POST https://[service name].search.windows.net/indexes/[index name]/analyze?api-version=[api-version]
    Content-Type: application/json
    api-key: [admin key]
```

To specify an analyzer used during indexing and query execution, set the analyzer property on string fields in the index. Likewise, to specify a normalizer, set the normalizer property on the string field in the index. More details can be found in the [Create Index API docs](create-or-update-index.md).

## URI Parameters

| Parameter	  | Description  | 
|-------------|--------------|
| service name | Required. Set this to the unique, user-defined name of your search service. |
| index name  | Required. The request URI specifies the name of the index that contains the field you want to analyze.   |
| api-version | Required. The current version is `api-version=2021-04-30-Preview` See [API versions](../search-service-api-versions.md) for more versions. |

## Request Headers

The following table describes the required and optional request headers.  

|Fields              |Description      |  
|--------------------|-----------------|  
|Content-Type|Required. Set this to `application/json`|  
|api-key|Required. The `api-key` is used to authenticate the request to your Search service. It is a string value, unique to your service. Analyzer requests must include an `api-key` header set to your admin key (as opposed to a query key). You can [find the API key](/azure/search/search-security-api-keys#find-existing-keys) in your search service dashboard in the Azure portal.|  

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

or

```json
{
  "text": "Text to normalize",
  "normalizer": "normalizer_name"
}
```
 
The `analyzer_name`, `tokenizer_name`, `token_filter_name` and `char_filter_name` need to be valid names of predefined or custom analyzers, tokenizers, token filters, and char filters for the index. To learn more about the process of lexical analysis, see [Analysis in Azure Cognitive Search](https://aka.ms/azsanalysis).

The `normalizer_name` also needs to be a valid name of a predefined or custom normalizer for the index. To learn more about normalizers, see [Text normalization for filtering, faceting, and sorting](/azure/search/search-normalizers).

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

## See also  

+ [Analyzers in Azure Cognitive Search](/azure/search/search-analyzers)  
+ [Add a custom analyzer](/azure/search/index-add-custom-analyzers)  
+ [Add a language analyzer](/azure/search/index-add-language-analyzers) 
+ [Text normalization for filtering, faceting, and sorting](/azure/search/search-normalizers) 

