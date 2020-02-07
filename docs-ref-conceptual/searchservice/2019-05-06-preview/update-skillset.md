---
title: Update Skillset (api-version=2019-05-06-Preview)
description: Modify an existing skillset. A skillset is a collection of cognitive skills that comprise an enrichment pipeline in Azure Cognitive Search indexing.

ms.manager: nitinme
author: luiscabrer
ms.author: luisca

ms.service: cognitive-search
ms.devlang: rest-api
ms.workload: search
ms.topic: "language-reference"
ms.date: 02/03/2020
---
# Update Skillset (Azure Cognitive Search)

**API Version: 2019-05-06-Preview**

> [!Important]
> This preview adds support for [knowledgeStore](create-skillset.md#kstore) used for persisting AI-enriched output other apps and processes. If you are developing a skillset that sends output to a [knowledge store](https://docs.microsoft.com/azure/search/knowledge-store-concept-intro), use the preview API to update the definition.
>
> This preview also adds a disableCacheReprocessingChangeDetection query parameter used in incremental enrichment scenarios.


You can update an existing [skillset](create-skillset.md) using an HTTP PUT, specifying the name of the skillset to update on the request URI.

```http  
PUT https://[servicename].search.windows.net/skillsets/[skillset name]?api-version=2019-05-06
  Content-Type: application/json
  api-key: [admin key]
``` 

## URI Parameters

| Parameter	  | Description  | 
|-------------|--------------|
| service name | Required. Set this to the unique, user-defined name of your search service. |
| skillset name  | Required. The request URI specifies the name of the skillset to update. |
| api-version | Required. The current preview version is `api-version=2019-05-06-Preview` (case-sensitive). See [API versions in Azure Cognitive Search](https://docs.microsoft.com/azure/search/search-api-versions) for a list of available versions.|
| disableCacheReprocessingChangeDetection | Optional. Used for incremental enrichment (`false` by default). Set to `true` to prevent updates to existing documents based on the current action. For more information, see [cache management](https://docs.microsoft.com/azure/search/cognitive-search-incremental-indexing-conceptual#cache-management).|

## Request Headers 
 The following table describes the required and optional request headers.  

|Fields              |Description      |  
|--------------------|-----------------|  
|Content-Type|Required. Set this to `application/json`|  
|api-key|Required. The `api-key` is used to authenticate the request to your Search service. It is a string value, unique to your service. Update requests must include an `api-key` header set to your admin key (as opposed to a query key).|  

You can get the `api-key` from your service dashboard in the Azure portal. For more information, see [Find existing keys](https://docs.microsoft.com/azure/search/search-security-api-keys#find-existing-keys).  

## Request Body  

The request body syntax is the same as for [Create Skillset (2019-06-06-Preview)](create-skillset.md). 

When updating an existing skillset, the entire definition is replaced with the contents of the request body. In general, the best pattern to use for updates is to retrieve the skillset definition with a GET, modify it, and then update it with PUT.  

## Response  

 For a successful request, you should see status code "201 Created".  

 By default, the response body will contain the JSON for the skillset definition that was created. However, if the Prefer request header is set to return=minimal, the response body will be empty, and the success status code will be "204 No Content" instead of "201 Created". This is true regardless of whether PUT or POST is used to create the skillset.  

## Examples
 The following example updates a skillset used for enriching a collection of financial documents.

```http
PUT https://[servicename].search.windows.net/skillsets/financedocenricher?api-version=2019-05-06
api-key: [admin key]
Content-Type: application/json
```

The body of request is a JSON document. This particular skillset uses two skills asynchronously, independently processing the substance of `/document/content` as two different transformations. Alternatively, you can direct the output of one transformation to be the input of another. For more information, see [How to define a skillset](https://docs.microsoft.com/azure/search/cognitive-search-defining-skillset).

```json
{
  "name": "financedocenricher",
  "description": 
  "An updated version of a skillset used to extract sentiment from financial records, extract company names, and then find additional information about each company mentioned. This version changes the target names.",
  "skills":
  [
    {
      "@odata.type": "#Microsoft.Skills.Text.EntityRecognitionSkill",
      "categories": [ "Organization" ],
      "defaultLanguageCode": "en",
      "inputs": [
        {
          "name": "text",
          "source": "/document/content"
        }
      ],
      "outputs": [
        {
          "name": "organizations",
          "targetName": "companies"
        }
      ]
    },
    {
      "@odata.type": "#Microsoft.Skills.Text.SentimentSkill",
      "inputs": [
        {
          "name": "text",
          "source": "/document/content"
        }
      ],
      "outputs": [
        {
          "name": "score",
          "targetName": "positivityscore"
        }
      ]
    },
  ],
  "cognitiveServices": 
  {
  "@odata.type": "#Microsoft.Azure.Search.CognitiveServicesByKey",
  "description": "mycogsvcs resource in West US 2",
  "key": "<your key goes here>"
  }
}
``` 

## See also

+ [AI enrichment overview](https://docs.microsoft.com/azure/search/cognitive-search-concept-intro)
+ [Tutorial: Enriched indexing with AI](https://docs.microsoft.com/azure/search/cognitive-search-tutorial-blob)
+ [How to define a skillset](https://docs.microsoft.com/azure/search/cognitive-search-defining-skillset)
+ [How to map fields](https://docs.microsoft.com/azure/search/cognitive-search-output-field-mapping)
+ [How to define a custom interface](https://docs.microsoft.com/azure/search/cognitive-search-custom-skill-interface)
+ [Example: creating a custom skill](https://docs.microsoft.com/azure/search/cognitive-search-create-custom-skill-example)
+ [Built-in skills](https://docs.microsoft.com/azure/search/cognitive-search-predefined-skills)