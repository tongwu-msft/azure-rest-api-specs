---
title: Create Skillset (Azure Cognitive Search REST API)
description: A skillset is a collection of cognitive skills that comprise an enriched indexing pipeline in Azure Cognitive Search.
ms.date: 06/30/2020

ms.service: cognitive-search
ms.devlang: rest-api
ms.topic: language-reference

author: luiscabrer
ms.author: luisca
ms.manager: nitinme
---
# Create Skillset (Azure Cognitive Search REST API)

A skillset is a collection of [cognitive skills](https://docs.microsoft.com/azure/search/cognitive-search-predefined-skills) used for AI enrichment, with an optional specification for creating an external knowledge store in Azure Storage. Skills invoke natural language processing and other transformations, such as entity recognition, key phrase extraction, chunking text into logical pages, among others.

A skillset is attached to an indexer. To use the skillset, reference it in an [indexer](create-indexer.md) and then run the indexer to import data, invoke transformations and enrichment, and map the output fields to an index. A skillset is high-level resource, but it is operational only within indexer processing. As a high-level resource, you can design a skillset once, and then reference it in multiple indexers. 

You can use either POST or PUT on the request. For either one, the JSON document in the request body provides the object definition.

```http  
PUT https://[servicename].search.windows.net/skillsets/[skillset name]?api-version=[api-version]
  Content-Type: application/json  
  api-key: [admin key]  
```  

 HTTPS is required for all service requests. If the skillset doesn't exist, it is created. If it already exists, it is updated to the new definition.

## URI Parameters

| Parameter	  | Description  | 
|-------------|--------------|
| service name | Required. Set this to the unique, user-defined name of your search service. |
| skillset name  | Required on the URI if using PUT. The name must be lower case, start with a letter or number, have no slashes or dots, and be less than 128 characters. After starting the name with a letter or number, the rest of the name can include any letter, number and dashes, as long as the dashes are not consecutive. |
| api-version | Required. The current version is `api-version=2020-06-30`. See [API versions in Azure Cognitive Search](https://docs.microsoft.com/azure/search/search-api-versions) for a list of available versions.|

## Request Headers 

 The following table describes the required and optional request headers.  

|Fields              |Description      |  
|--------------------|-----------------|  
|Content-Type|Required. Set this to `application/json`|  
|api-key|Required. The `api-key` is used to authenticate the request to your Search service. It is a string value, unique to your service. Create requests must include an `api-key` header set to your admin key (as opposed to a query key).|  

You can get the `api-key` from your service dashboard in the Azure portal. For more information, see [Find existing keys](https://docs.microsoft.com/azure/search/search-security-api-keys#find-existing-keys).  

## Request Body

The body of the request contains the skillset definition. Skills are either standalone or chained together through input-output associations, where the output of one transform becomes input to another. A skillset must have at least one skill. There is no theoretical limit on maximum number of skills, but three to five is a common configuration.  

The following JSON is a high-level representation of the main parts of the definition. 

```json
{   
  "name" : (optional on PUT; required on POST) "Name of the skillset",  
  "description" : (optional) "Anything you want, or nothing at all",   
  "skills" : (required) ["An array of skills. Each skill has an odata.type, name, input and output parameters"],
  "cognitiveServices": 
      {
        "@odata.type": "#Microsoft.Azure.Search.CognitiveServicesByKey",
        "description": "Optional. Anything you want, or null",
        "key": "<YOUR-COGNITIVE-SERVICES-ALL-IN-ONE-KEY>"
      },
  "knowledgeStore": (optional) { ... }
} 
```

 Request contains the following properties:  

|Property|Description|  
|--------------|-----------------|  
|name|Required. The name of the skillset. The name must be lower case, start with a letter or number, have no slashes or dots, and be less than 128 characters. After starting the name with a letter or number, the rest of the name can include any letter, number and dashes, as long as the dashes are not consecutive.|  
|skills| You can use built-in or custom skills. At least one skill is required. If you are using a knowledge store, you must use a Shaper skill unless you are defining the data shape within the projection. | 
|cognitiveServices | A Cognitive Services all-in-one key that attaches all of the resources that back the built-in skills (for image analysis and natural language processing). The key is used for billing but not authentication. For more information, see [Attach a Cognitive Services resource ](https://docs.microsoft.com/azure/search/cognitive-search-attach-cognitive-services).|
 
> [!NOTE]
> Skillsets are the basis of [AI enrichment](https://docs.microsoft.com/azure/search/cognitive-search-concept-intro) in Azure Cognitive Search. A free resource is available for limited processing, but for larger and more frequent workloads, a billable Cognitive Services resource is required. For more information, see [Attach a Cognitive Services resource to an Azure Cognitive Search skillset](https://docs.microsoft.com/azure/search/cognitive-search-attach-cognitive-services).

<a name="kstore"></a>

### "knowledgeStore"

A skillset can have a single, optional [**knowledgeStore**](https://docs.microsoft.com/azure/search/knowledge-store-concept-intro)) definition if you want to send enrichment output to Azure Storage. It requires a connection string to an Azure Storage account and [projections](https://docs.microsoft.com/azure/search/knowledge-store-projection-overview) that determine whether enriched content lands in table or blob storage (as objects or files). 

This section expands knowledgeStore so that you can see its structure. 

```json
{   
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

The knowledgeStore has required and optional properties.

|Property      | Applies to | Description|  
|--------------|------------|------------|  
|storageConnectionString| knowledgeStore | Required. In this format: `DefaultEndpointsProtocol=https;AccountName=<ACCOUNT-NAME>;AccountKey=<ACCOUNT-KEY>;EndpointSuffix=core.windows.net`|  
|projections| knowledgeStore | Required. An array of projection groups, where each group consists of tables, objects, and files, which are either specified or null. Within a projection group, any relationships among the data, if detected, are preserved across tables, objects, and files.|  
|source| All projections| The path to the node of the enrichment tree that is the root of the projection. This node is the output of any of the skills in the skillset. Paths start with `/document/`, representing the enriched document but can be extended to `/document/content/` or to nodes within the document tree. Examples: `/document/countries/*` (all countries), or `/document/countries/*/states/*` (all states in all countries). For more information on document paths, see [Skillset concepts and composition](https://docs.microsoft.com/azure/search/cognitive-search-working-with-skillsets).|
|tableName| tables| A table to create in Azure Table storage. |
|storageContainer| objects, files| Name of a container to create in Azure Blob storage. |
|generatedKeyName| tables| A column created in the table that uniquely identifies a document. The enrichment pipeline populates this column with generated values.|

## Response  

 For a successful request, you should see status code "201 Created".  

 By default, the response body will contain the JSON for the skillset definition that was created. However, if the Prefer request header is set to return=minimal, the response body will be empty, and the success status code will be "204 No Content" instead of "201 Created". This is true regardless of whether PUT or POST is used to create the skillset.   

## Examples
 The following example creates a skillset used for enriching a collection of financial documents.

```http
PUT https://[servicename].search.windows.net/skillsets/financedocenricher?api-version=2020-06-30
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
    "key": "<your cognitive services all-in-one key goes here>"
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
            "objects": [ 
               
            ]      
        }    
    ]     
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
+ [Knowledge store overview](https://docs.microsoft.com/azure/search/knowledge-store-concept-intro)
