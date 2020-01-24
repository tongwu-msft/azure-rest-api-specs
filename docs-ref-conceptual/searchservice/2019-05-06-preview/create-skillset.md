---
title: Create Skillset (api-version=2019-05-06-Preview)
description: A skillset is a collection of cognitive skills that comprise an enriched indexing pipeline in Azure Cognitive Search.

ms.manager: nitinme
author: luiscabrer
ms.author: luisca
ms.service: cognitive-search
ms.devlang: rest-api
ms.workload: search
ms.topic: language-reference
ms.date: 01/24/2020

---
# Create Skillset (Search REST API)

**API Version: 2019-05-06-Preview**

> [!Important]
> This preview API includes a `knowledgeStore` property used for persisting enriched documents created during AI enrichment for use in other apps and processes. For more information, see [Knowledge stores](https://docs.microsoft.com/azure/search/knowledge-store-concept-intro).

A skillset is a collection of [cognitive skills](https://docs.microsoft.com/azure/search/cognitive-search-predefined-skills) used for natural language processing and other transformations. Skills include entity recognition, key phrase extraction, chunking text into logical pages, among others.

To use the skillset, reference it in an [indexer](create-indexer.md) and then run the indexer to import data, invoke transformations and enrichment, and map the output fields to an index. A skillset is high-level resource, but it is operational only within indexer processing. As a high-level resource, you can design a skillset once, and then reference it in multiple indexers. 

A skillset is expressed in Azure Cognitive Search through an HTTP PUT or POST request. The body of the request is a JSON schema that specifies which skills are invoked. 

```http  
PUT https://[servicename].search.windows.net/skillsets/[skillset name]?api-version=2019-05-06-Preview
api-key: [admin key]
Content-Type: application/json
```  

> [!NOTE]
> Skillsets are used in [AI enrichment](https://docs.microsoft.com/azure/search/cognitive-search-concept-intro). A free resource is available for limited processing, but for larger and more frequent workloads, a billable Cognitive Services resource is required. For more information, see [Attach a Cognitive Services resource to an Azure Cognitive Search skillset](https://docs.microsoft.com/azure/search/cognitive-search-attach-cognitive-services).

## Request  
 HTTPS is required for all service requests. The **Create Skillset** request can be constructed using a PUT method, with the skillset name as part of the URL. If the skillset doesn't exist, it is created. If it already exists, it is updated to the new definition. Notice that you can only PUT one skillset at a time.  

 The skillset name must meet the following requirements:

- Be in lower case
- Start and end with a letter or number
- Have no slashes or dots
- Have fewer than 128 characters 

After starting the skillset name with a letter or number, the rest of the name can include any letter, number, and dashes as long as the dashes are not consecutive.  

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

Skills are either standalone or chained together through input-output associations, where the output of one transform becomes input to another.

A skillset must have at least one skill. There is no theoretical limit on maximum number of skills, but three to five is a common configuration. 

A skillset can have a single, optional knowledgeStore definition if you want to send enrichment output to Azure Storage.

The syntax for structuring the request payload is as follows. A sample request is provided later in this article and also in [How to define a skillset](https://docs.microsoft.com/azure/search/cognitive-search-defining-skillset).  

```
{   
    "name" : "Required for POST, optional for PUT requests which sets the name on the URI",  
    "description" : "Optional. Anything you want, or null",  
    "skills" : "Required. An array of skills. Each skill has an odata.type, name, input and output parameters",
    "cognitiveServices":  {
          {
          "@odata.type": "#Microsoft.Azure.Search.CognitiveServicesByKey",
          "description": "Optional. Anything you want, or null",
          "key": "<YOUR-AZURE-STORAGE-KEY>"
          },
    }
    "knowledgeStore": { 
        "storageConnectionString": "<YOUR-AZURE-STORAGE-ACCOUNT-CONNECTION-STRING>", 
        "projections": [ 
            { 
                "tables": [ 
                    { "tableName": "<NAME>", "generatedKeyName": "<FIELD-NAME>", "source": "<DOCUMENT-PATH>" },
                    { "tableName": "<NAME>", "generatedKeyName": "<FIELD-NAME>", "source": "<DOCUMENT-PATH>" },
                    . . .
                ], 
                "objects": [ 
                    {
                    "storageContainer": "<BLOB-CONTAINER-NAME>", 
                    "source": "<DOCUMENT-PATH>", 
                    }
                ], 
                "files": [ 
                    {
                    "storageContainer": "<BLOB-CONTAINER-NAME>",
                    "source": "/document/normalized_images/*"
                    }
                ]  
            }
        ]     
    } 
}
```

### Request example
 The following example creates a skillset used for enriching a collection of financial documents.

```http
PUT https://[servicename].search.windows.net/skillsets/financedocenricher?api-version=2019-05-06-Preview
api-key: [admin key]
Content-Type: application/json
```

The body of request is a JSON document. This particular skillset uses two skills asynchronously, independently processing the substance of the `contents` as two different transformations. Alternatively, you can direct the output of one transformation to be the input of another. For more information, see [How to define a skillset](https://docs.microsoft.com/azure/search/cognitive-search-defining-skillset).

```json
{
  "name": "financedocenricher",
  "description": 
  "Extract sentiment from financial records, extract company names, and then find additional information about each company mentioned.",
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
          "targetName": "organizations"
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
          "targetName": "mySentiment"
        }
      ]
    },
  ],
  "cognitiveServices": 
    {
    "@odata.type": "#Microsoft.Azure.Search.CognitiveServicesByKey",
    "description": "mycogsvcs resource in West US 2",
    "key": "<your key goes here>"
    },
    "knowledgeStore": { 
    "storageConnectionString": "<your storage connection string goes here>", 
    "projections": [ 
        { 
            "tables": [  
             { "tableName": "Records", "generatedKeyName": "RecordId", "source": "/document/Record"}, 
             { "tableName": "Organizations", "generatedKeyName": "OrganizationId", "source": "/document/organizations*"}, 
             { "tableName": "Sentiment", "generatedKeyName": "SentimentId", "source": "/document/mySentiment"}
            ], 
            "objects": [ ],
            "files": [ ]     
        }    
    ]     
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
+ [Knowledge store overview](https://docs.microsoft.com/azure/search/knowledge-store-concept-intro)
