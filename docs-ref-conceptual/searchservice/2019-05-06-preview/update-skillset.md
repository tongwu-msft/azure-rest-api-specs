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
ms.date: 01/24/2020
---
# Update Skillset (Search REST API)

**API Version: 2019-05-06-Preview**

> [!Important]
> This preview API includes a `knowledgeStore` property used for persisting enriched documents created during AI enrichment for use in other apps and processes. For more information, see [Knowledge stores](https://docs.microsoft.com/azure/search/knowledge-store-concept-intro).

You can update an existing [skillset](create-skillset.md) using an HTTP PUT, specifying the name of the skillset to update on the request URI.

> [!NOTE]
> Skillsets are used in [AI enrichment](https://docs.microsoft.com/azure/search/cognitive-search-concept-intro). A free resource is available for limited processing, but for larger and more frequent workloads, a billable Cognitive Services resource is required. For more information, see [Attach a Cognitive Services resource to an Azure Cognitive Search skillset](https://docs.microsoft.com/azure/search/cognitive-search-attach-cognitive-services).

```http  
PUT https://[servicename].search.windows.net/skillsets/[skillset name]?api-version=2019-05-06-Preview
api-key: [admin key]
Content-Type: application/json
```  

## Request  
 HTTPS is required for all service requests. The **Update Skillset** request can be constructed using a PUT method, with the skillset name as part of the URL. When the request is on a skillset that already exists, it is updated to the new definition. If the skillset doesn't exist, it is created. Notice that you can only PUT one skillset at a time.  

 The **api-version** is required. It is case-sensitive. The preview version is `api-version=2019-05-06-Preview`. 

### Request headers  

 The following table describes the required and optional request headers.  

|Request Header|Description|  
|--------------------|-----------------|  
|*Content-Type:*|Required. Set this to `application/json`|  
|*api-key:*|Required. The `api-key` is used to authenticate the request to your Search service. It is a string value, unique to your service. The **Create Skillset** request must include an `api-key` header set to your admin key (as opposed to a query key).|  

You also need the service name to construct the request URL. You can get both the service name and `api-key` from your service dashboard in the Azure portal. See [Create an Azure Cognitive Search service in the portal](https://docs.microsoft.com/azure/search/search-create-service-portal) for page navigation help.  

### Request body syntax  

The body of the request contains the skillset definition, consisting of one or more fully specified skills, as well as optional name and description parameters.  

The syntax for structuring the request payload is as follows. A sample request is provided later in this article and also in [How to define a skillset](https://docs.microsoft.com/azure/search/cognitive-search-defining-skillset).  

```
{   
    "name" : "Required for POST, optional for PUT. Friendly name of the skillset",  
    "description" : "Optional. Anything you want, or null",  
    "Skills" : "Required. An array of skills. Each skill has an odata.type, name, input and output parameters",
    "cognitiveServices": "A billable Cognitive Services resource under the same region as Azure Cognitive Search. 
    The resource has an odata.type of #Microsoft.Azure.Search.CognitiveServicesByKey (required), 
    an optional description, and a key authorizing access to the specific resource",
    "knowledgeStore": Optional. Use for storing enriched documents for apps and other non-search scenarios.
    { 
      "storageConnectionString": "<YOUR-AZURE-STORAGE-ACCOUNT-CONNECTION-STRING>", 
      "projections": [ 
      { 
        "tables": [ ], 
        "objects": [ ], 
        "files": [ ]
      }
}  
```

### Request example
 The following example updates a skillset used for enriching a collection of financial documents.

```http
PUT https://[servicename].search.windows.net/skillsets/financedocenricher?api-version=2019-05-06-Preview
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

## Response  

 For a successful request, you should see status code "201 Created".  

 By default, the response body will contain the JSON for the skillset definition that was created. However, if the Prefer request header is set to return=minimal, the response body will be empty, and the success status code will be "204 No Content" instead of "201 Created". This is true regardless of whether PUT or POST is used to create the skillset.   

## See also

+ [AI enrichment overview](https://docs.microsoft.com/azure/search/cognitive-search-concept-intro)
+ [Tutorial: Enriched indexing with AI](https://docs.microsoft.com/azure/search/cognitive-search-tutorial-blob)
+ [How to define a skillset](https://docs.microsoft.com/azure/search/cognitive-search-defining-skillset)
+ [How to map fields](https://docs.microsoft.com/azure/search/cognitive-search-output-field-mapping)
+ [How to define a custom interface](https://docs.microsoft.com/azure/search/cognitive-search-custom-skill-interface)
+ [Example: creating a custom skill](https://docs.microsoft.com/azure/search/cognitive-search-create-custom-skill-example)
+ [Built-in skills](https://docs.microsoft.com/azure/search/cognitive-search-predefined-skills)