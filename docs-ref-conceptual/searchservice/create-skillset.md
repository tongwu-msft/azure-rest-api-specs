---
title: Create Skillset (Azure Cognitive Search REST API)
description: A skillset is a collection of cognitive skills that comprise an enriched indexing pipeline in Azure Cognitive Search.
ms.date: 08/17/2021

ms.service: cognitive-search
ms.devlang: rest-api
ms.topic: reference

author: HeidiSteen
ms.author: heidist
ms.manager: nitinme
---
# Create Skillset (Azure Cognitive Search REST API)

A skillset is a collection of [cognitive skills](/azure/search/cognitive-search-predefined-skills) used for AI enrichment, with an optional specification for creating an external knowledge store in Azure Storage. Skills invoke natural language processing and other transformations, such as entity recognition, key phrase extraction, chunking text into logical pages, among others.

A skillset is attached to an [indexer](create-indexer.md). To use the skillset, reference it in an indexer and then run the indexer to import data, invoke transformations and enrichment, and map the output fields to an index. A skillset is high-level resource, but it is operational only within indexer processing. As a high-level resource, you can design a skillset once, and then reference it in multiple indexers. 

You can use either POST or PUT on the request. For either one, the JSON document in the request body provides the object definition.

```http  
PUT https://[servicename].search.windows.net/skillsets/[skillset name]?api-version=[api-version]
  Content-Type: application/json  
  api-key: [admin key]  
```  

 HTTPS is required for all service requests. If the skillset doesn't exist, it is created. If it already exists, it is updated to the new definition.

> [!NOTE]
> Skillsets are the basis of [AI enrichment](/azure/search/cognitive-search-concept-intro). A free resource is available for limited processing, but for larger or more frequent workloads, a [billable Cognitive Services resource](/azure/search/cognitive-search-attach-cognitive-services) is required.

## URI Parameters

| Parameter	  | Description  | 
|-------------|--------------|
| service name | Required. Set this to the unique, user-defined name of your search service. |
| skillset name  | Required on the URI if using PUT. The name must be lower case, start with a letter or number, have no slashes or dots, and be less than 128 characters. After starting the name with a letter or number, the rest of the name can include any letter, number and dashes, as long as the dashes are not consecutive. |
| api-version | Required. The current stable version is `api-version=2020-06-30`. See [API versions](search-service-api-versions.md) for more versions.|

## Request Headers 

 The following table describes the required and optional request headers.  

|Fields              |Description      |  
|--------------------|-----------------|  
|Content-Type|Required. Set this to `application/json`|  
|api-key|Required. The `api-key` is used to authenticate the request to your Search service. It is a string value, unique to your service. Create requests must include an `api-key` header set to your admin key (as opposed to a query key). You can [find the API key](/azure/search/search-security-api-keys#find-existing-keys) in your search service dashboard in the Azure portal.|   

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
  "knowledgeStore": (optional) { ... },
  "encryptionKey": (optional) { }
} 
```

 Request contains the following properties:  

|Property|Description|  
|--------------|-----------------|  
|name|Required. The name of the skillset. The name must be lower case, start with a letter or number, have no slashes or dots, and be less than 128 characters. After starting the name with a letter or number, the rest of the name can include any letter, number and dashes, as long as the dashes are not consecutive.|  
|skills| An array of skills. Each skill has an odata.type, name, context, and input and output parameters. The array can include [built-in skills](/azure/search/cognitive-search-predefined-skills) and [custom skills](/azure/search/cognitive-search-custom-skill-web-api). At least one skill is required. If you are using a knowledge store, include a [Shaper skill](/azure/search/cognitive-search-skill-shaper?) unless you are defining the data shape within the projection. |
|cognitiveServices | An all-in-one key is required for [billable skills](/azure/search/cognitive-search-predefined-skills) that call Cognitive Services APIs on more than 20 documents daily, per indexer. The key must be for a resource in the same region as the search service. For more information, see [Attach a Cognitive Services resource](/azure/search/cognitive-search-attach-cognitive-services). </br></br>You can omit the key and this section if your skillset consists of only custom skills, utility skills (Conditional, Shaper, Text Merge, Text Split), or the [Document Extraction skill](/azure/search/cognitive-search-skill-document-extraction). </br></br>If you are using the [Custom Entity Lookup](/azure/search/cognitive-search-skill-custom-entity-lookup) skill, include this section and a key to enable transactions beyond 20 transactions daily per indexer. |
|knowledgeStore| Optional. Destination for enrichment output to Azure Storage. Requires a connection string to an Azure Storage account and [projections](/azure/search/knowledge-store-projection-overview). </br></br>`storageConnectionString` (required) A string in this format: `"DefaultEndpointsProtocol=https;AccountName=<ACCOUNT-NAME>;AccountKey=<ACCOUNT-KEY>;EndpointSuffix=core.windows.net"`.  </br></br>`projections` (required) An array of projection objects consisting of `tables`, `objects`, `files`, which are either specified or null. </br></br>`tables` </br>Creates one or more tables in Azure Table Storage, projecting content from each document as rows in a table. Each table can have the following three properties:  <ul><li>`name` (required) determines the table to create or use in Azure Table Storage.</li> <li>`generatedKeyName` (optional) is the name of a column that uniquely identifies a document. Values for this column will be generated during enrichment. If you omit it, the search service will create a default key column based on the table name.</li> <li>`source` (required) is the path to a node of the enrichment tree that provides the [shape of the projection](/azure/search/knowledge-store-projection-shape). It's usually the output of a Shaper skill. Paths start with `/document/`, representing the root enriched document, and are then extended to `/document/<shaper-output>/`, or `/document/content/`, or another node within the enrichment tree. Examples: `/document/countries/*` (all countries), or `/document/countries/*/states/*` (all states in all countries).</li></ul> </br>`objects` </br>Projects documents as blobs in Azure Blob Storage. Each object has two required properties: <ul><li>`storageContainer` is the name of the container to create or use in Azure Blob Storage.</li> <li>`source` is the path to the node of the enrichment tree that provides the shape of the projection. It must be valid JSON. The node must provide a JSON object, either from a skill that emits valid JSON or the output of a Shaper skill.</li></ul> </br>`files` </br>Each file entry defines storage of binary images in Blob Storage. File projections have two required properties: <ul><li>`storageContainer` is the name of the container to create or use in Azure Blob Storage.</li> <li>`source` is the  path to the node of the enrichment tree that is the root of the projection. A valid value for this property is `"/document/normalized_images/*"` for images that were sourced from Blob Storage.</li></ul> |
|encryptionKey| Optional. Used to encrypt a skillset definition at rest with your own keys, managed in your Azure Key Vault. Available for billable search services created on or after 2019-01-01. </br></br> An `encryptionKey` section contains a user-defined `keyVaultKeyName` (required), a system-generated `keyVaultKeyVersion` (required), and a `keyVaultUri` providing the key (required, also referred to as DNS name). An example URI might be "https://my-keyvault-name.vault.azure.net". </br></br>Optionally, you can specify `accessCredentials` if you are not using a managed system identity. Properties of `accessCredentials` include `applicationId` (Azure Active Directory Application ID that was granted access permissions to your specified Azure Key Vault), and `applicationSecret` (authentication key of the specified Azure AD application). An example in the next section illustrates the syntax. |

## Response  

For a successful request, you should see status code "201 Created".  

By default, the response body will contain the JSON for the skillset definition that was created. However, if the Prefer request header is set to return=minimal, the response body will be empty, and the success status code will be "204 No Content" instead of "201 Created". This is true regardless of whether PUT or POST is used to create the skillset.   

## Examples

**Example: Skillset that recognizes business entities and sentiment in customer reviews**

This skillset uses two skills asynchronously, independently processing `/document/content` as two different transformations. The skills are [Entity Recognition](/azure/search/cognitive-search-skill-entity-recognition-v3) and [Sentiment](/azure/search/cognitive-search-skill-sentiment-v3). In the enrichment tree, `/document/content` provides the content (or customer reviews) from the external data source. 

```json
{
  "name": "reviews-ss",
  "description": 
  "Extract company names from customer reviews, and detect positive or negative sentiment from the same reviews.",
  "skills":
  [
    {
      "@odata.type": "#Microsoft.Skills.Text.V3.EntityRecognitionSkill",
      "context": "/document/content",
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
          "targetName": "companyName"
        }
      ]
    },
    {
      "@odata.type": "#Microsoft.Skills.Text.V3.SentimentSkill",
      "inputs": [
           {
              "name": "text",
              "source": "/document/content"
           },
          {
               "name": "languageCode",
               "source": "/document/languageCode"
           }
        ],
      "outputs": [
        {
            "name": "sentiment",
            "targetName": "reviewSentiment"
        },
        {
            "name": "confidenceScores",
            "targetName": "sentimentScore"
        }
      ]
    }
  ],
  "cognitiveServices": 
    {
    "@odata.type": "#Microsoft.Azure.Search.CognitiveServicesByKey",
    "description": "mycogsvcs resource in West US 2",
    "key": "<your cognitive services all-in-one key goes here>"
    },
  "knowledgeStore": { },
  "encryptionKey": { }
}
```

**Example: Knowledge store**

A skillset can optionally send output to [knowledge store](/azure/search/knowledge-store-concept-intro) in Azure Storage. It requires a connection string to an Azure Storage account and [projections](/azure/search/knowledge-store-projection-overview) that determine whether enriched content lands in table or blob storage (as objects or files). Projections usually require an upstream [Shaper skill](/azure/search/cognitive-search-skill-shaper) that collects nodes from an enrichment tree as input, outputting a single shape that can be passed to projection. A shaper is typically the last skill to be processed.

```json
{
  "name": "reviews-ss",
  "description": 
  "Extract company names from customer reviews, and detect positive or negative sentiment from the same reviews.",
  "skills":
  [
    { ... },
    { ... },
    {
      "@odata.type": "#Microsoft.Skills.Util.ShaperSkill",
      "context": "/document/content",
      "inputs": [
        {
            "name": "Company",
            "source": "/document/content/companyName"
        },
        {
            "name": "Sentiment_Score",
            "source": "/document/content/sentimentScore"
        },
        {
            "name": "Sentiment_Label",
            "source": "/document/content/reviewSentiment"
        }
      ],
      "outputs": [
        {
          "name": "output",
          "targetName": "shapeCustomerReviews"
        }
      ]
    }
  ],
  "cognitiveServices": 
    {
    "@odata.type": "#Microsoft.Azure.Search.CognitiveServicesByKey",
    "description": "mycogsvcs resource in West US 2",
    "key": "<your cognitive services all-in-one key goes here>"
    },
  "knowledgeStore": { 
      "storageConnectionString": "<your storage account connection string>", 
      "projections": [ 
          { 
            "tables": [ 
                { "tableName": "CustomerReviews", "generatedKeyName": "DocID", "source": "/document/shapeCustomerReviews" }
                . . .
            ], 
            "objects": [ ], 
            "files": [ ]  
          }
      ]     
  } 
  "encryptionKey": { }
}
```

**Example: Encryption keys**

Encryption keys are customer-managed keys used for [additional encryption](/azure/search/search-security-manage-encryption-keys) of sensitive content. This example shows you how to specify customer-managed encryption on a skillset.

```json
{
    "name": "reviews-ss",
    "description": "A brief description of the skillset",
    "skills":  [ omitted for brevity ],
    "cognitiveServices": { omitted for brevity },
    "knowledgeStore":  { omitted for brevity  },
    "encryptionKey": (optional) { 
        "keyVaultKeyName": "Name of the Azure Key Vault key used for encryption",
        "keyVaultKeyVersion": "Version of the Azure Key Vault key",
        "keyVaultUri": "URI of Azure Key Vault, also referred to as DNS name, that provides the key. An example URI might be https://my-keyvault-name.vault.azure.net",
        "accessCredentials": (optional, only if not using managed system identity) {
            "applicationId": "Azure Active Directory Application ID that was granted access permissions to your specified Azure Key Vault",
            "applicationSecret": "Authentication key of the specified Azure AD application)"}
    }
}
```

## See also

+ [Define a skillset](/azure/search/cognitive-search-defining-skillset)
+ [AI enrichment overview](/azure/search/cognitive-search-concept-intro)
+ [Skillset overview](/azure/search/cognitive-search-working-with-skillsets)
+ [Knowledge store overview](/azure/search/knowledge-store-concept-intro)
+ [Projection overview](/azure/search/knowledge-store-projection-overview)
+ [Tutorial: Use REST and AI to generate searchable content from blobs](/azure/search/cognitive-search-tutorial-blob)
+ [Built-in skills](/azure/search/cognitive-search-predefined-skills)
