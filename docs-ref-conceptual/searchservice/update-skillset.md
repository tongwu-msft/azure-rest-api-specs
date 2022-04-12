---
title: Update Skillset (Azure Cognitive Search REST API)
description: Modify an existing skillset. A skillset is a collection of cognitive skills that comprise an enrichment pipeline in Azure Cognitive Search indexing.
ms.date: 06/30/2020

ms.service: cognitive-search
ms.topic: reference
ms.devlang: rest-api

author: HeidiSteen
ms.author: heidist
ms.manager: nitinme
---
# Update Skillset (Azure Cognitive Search REST API)

You can update an existing [skillset](create-skillset.md) and [knowledge store](create-skillset.md) using an HTTP PUT, specifying the name of the skillset to update on the request URI.

```http  
PUT https://[servicename].search.windows.net/skillsets/[skillset name]?api-version=[api-version]
  Content-Type: application/json
  api-key: [admin key]
``` 

> [!NOTE]
> Skillsets are the basis of [AI enrichment](/azure/search/cognitive-search-concept-intro) in Azure Cognitive Search. A free resource is available for limited processing, but for larger and more frequent workloads, a billable Cognitive Services resource is required. For more information, see [Attach a Cognitive Services resource to an Azure Cognitive Search skillset](/azure/search/cognitive-search-attach-cognitive-services).

## URI Parameters

| Parameter	  | Description  | 
|-------------|--------------|
| service name | Required. Set this to the unique, user-defined name of your search service. |
| skillset name  | Required. The request URI specifies the name of the skillset to update. |
| api-version | Required. The current stable version is `api-version=2020-06-30`. See [API versions](search-service-api-versions.md) for more versions. |
| disableCacheReprocessingChangeDetection | Optional. Used for incremental enrichment (`false` by default). Set to `true` to prevent updates to existing documents based on the current action. For more information, see [cache management](/azure/search/cognitive-search-incremental-indexing-conceptual#cache-management).|

## Request Headers 
 The following table describes the required and optional request headers.  

|Fields              |Description      |  
|--------------------|-----------------|  
|Content-Type|Required. Set this to `application/json`|  
|api-key|Required. The `api-key` is used to authenticate the request to your Search service. It is a string value, unique to your service. Update requests must include an `api-key` header set to your admin key (as opposed to a query key). You can [find the API key](/azure/search/search-security-api-keys#find-existing-keys) in your search service dashboard in the Azure portal.|  

## Request Body  

The request body syntax is the same as for [Create Skillset](create-skillset.md). 

When updating an existing skillset, the entire definition is replaced with the contents of the request body. In general, the best pattern to use for updates is to retrieve the skillset definition with a GET, modify it, and then update it with PUT.  

## Response  

 For a successful request, you should see status code "201 Created".  

 By default, the response body will contain the JSON for the skillset definition that was created. However, if the Prefer request header is set to return=minimal, the response body will be empty, and the success status code will be "204 No Content" instead of "201 Created". This is true regardless of whether PUT or POST is used to create the skillset.  

## Examples
 The following example updates a skillset used for enriching a collection of financial documents.

```http
PUT https://[servicename].search.windows.net/skillsets/financedocenricher?api-version=2020-06-30
api-key: [admin key]
Content-Type: application/json
```

The body of request is a JSON document. This particular skillset uses two skills asynchronously, independently processing the substance of `/document/content` as two different transformations. Alternatively, you can direct the output of one transformation to be the input of another. For more information, see [How to define a skillset](/azure/search/cognitive-search-defining-skillset).

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

+ [AI enrichment overview](/azure/search/cognitive-search-concept-intro)
+ [Tutorial: Enriched indexing with AI](/azure/search/cognitive-search-tutorial-blob)
+ [How to define a skillset](/azure/search/cognitive-search-defining-skillset)
+ [How to map fields](/azure/search/cognitive-search-output-field-mapping)
+ [How to define a custom interface](/azure/search/cognitive-search-custom-skill-interface)
+ [Built-in skills](/azure/search/cognitive-search-predefined-skills)