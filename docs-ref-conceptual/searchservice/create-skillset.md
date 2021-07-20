---
title: Create Skillset (Azure Cognitive Search REST API)
description: A skillset is a collection of cognitive skills that comprise an enriched indexing pipeline in Azure Cognitive Search.
ms.date: 02/11/2021

ms.service: cognitive-search
ms.devlang: rest-api
ms.topic: language-reference

author: HeidiSteen
ms.author: heidist
ms.manager: nitinme
---
# Create Skillset (Azure Cognitive Search REST API)

A skillset is a collection of [cognitive skills](/azure/search/cognitive-search-predefined-skills) used for AI enrichment, with an optional specification for creating an external knowledge store in Azure Storage. Skills invoke natural language processing and other transformations, such as entity recognition, key phrase extraction, chunking text into logical pages, among others.

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
| api-version | Required. The current stable version is `api-version=2020-06-30`. See [API versions](search-service-api-versions.md) for more versions.|

## Request Headers 

 The following table describes the required and optional request headers.  

|Fields              |Description      |  
|--------------------|-----------------|  
|Content-Type|Required. Set this to `application/json`|  
|api-key|Required. The `api-key` is used to authenticate the request to your Search service. It is a string value, unique to your service. Create requests must include an `api-key` header set to your admin key (as opposed to a query key).|  

You can get the `api-key` from your service dashboard in the Azure portal. For more information, see [Find existing keys](/azure/search/search-security-api-keys#find-existing-keys).  

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
|skills| You can use built-in or custom skills. At least one skill is required. If you are using a knowledge store, you must use a Shaper skill unless you are defining the data shape within the projection. | 
|cognitiveServices |  Cognitive Services all-in-one key that attaches all of the resources that back the built-in skills (for image analysis and natural language processing). The key is used for billing but not authentication. The key is optional if transactions are under the 20 per day, per indexer, threshold; otherwise, it's required. For more information, see [Attach a Cognitive Services resource](/azure/search/cognitive-search-attach-cognitive-services).|
|knowledgeStore| Optional. Destination for enrichment output to Azure Storage. Requires a connection string to an Azure Storage account and [projections](/azure/search/knowledge-store-projection-overview). </br></br>`storageConnectionString` (required) A string in this format: "DefaultEndpointsProtocol=https;AccountName=<ACCOUNT-NAME>;AccountKey=<ACCOUNT-KEY>;EndpointSuffix=core.windows.net".  </br></br>`projections` (required) An array of projection groups, where each group consists of tables, objects, and files, which are either specified or null. Within a projection group, any relationships among the data, if detected, are preserved across tables, objects, and files. </br></br>`source` (required) The path to the node of the enrichment tree that is the root of the projection. This node is the output of any of the skills in the skillset. Paths start with `/document/`, representing the enriched document but can be extended to `/document/content/` or to nodes within the document tree. Examples: `/document/countries/*` (all countries), or `/document/countries/*/states/*` (all states in all countries). For more information on document paths, see [Skillset concepts and composition](/azure/search/cognitive-search-working-with-skillsets). </br></br>`tableName` applies to table projections. It's a table to create in Azure Table storage. </br></br>`storageContainer` applies to object and file projections. It's the name of a container to create in Azure Blob storage. </br></br>`generatedKeyName` applies to table projections. It's a column in the table that uniquely identifies a document. The enrichment pipeline populates this column with generated values.|
|encryptionKey| Optional. Used to encrypt a skillset definition at rest with your own keys, managed in your Azure Key Vault. Available for billable search services created on or after 2019-01-01. </br></br> An `encryptionKey` section contains a user-defined `keyVaultKeyName` (required), a system-generated `keyVaultKeyVersion` (required), and a `keyVaultUri` providing the key (required, also referred to as DNS name). An example URI might be "https://my-keyvault-name.vault.azure.net". </br></br>Optionally, you can specify `accessCredentials` if you are not using a managed system identity. Properties of `accessCredentials` include `applicationId` (Azure Active Directory Application ID that was granted access permissions to your specified Azure Key Vault), and `applicationSecret` (authentication key of the specified Azure AD application). An example in the next section illustrates the syntax. |

> [!NOTE]
> Skillsets are the basis of [AI enrichment](/azure/search/cognitive-search-concept-intro) in Azure Cognitive Search. A free resource is available for limited processing, but for larger and more frequent workloads, a billable Cognitive Services resource is required. For more information, see [Attach a Cognitive Services resource to an Azure Cognitive Search skillset](/azure/search/cognitive-search-attach-cognitive-services).

## Response  

For a successful request, you should see status code "201 Created".  

By default, the response body will contain the JSON for the skillset definition that was created. However, if the Prefer request header is set to return=minimal, the response body will be empty, and the success status code will be "204 No Content" instead of "201 Created". This is true regardless of whether PUT or POST is used to create the skillset.   

## Examples

**Example: Skillset used for enriching a collection of financial document**

This skillset uses two skills asynchronously, independently processing the substance of the `contents` as two different transformations. Alternatively, you can direct the output of one transformation to be the input of another. For more information, see [How to define a skillset](/azure/search/cognitive-search-defining-skillset).

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

**Example: Knowledge store**

A skillset can have a single, optional [knowledge store](/azure/search/knowledge-store-concept-intro) if you want to send enrichment output to Azure Storage. It requires a connection string to an Azure Storage account and [projections](/azure/search/knowledge-store-projection-overview) that determine whether enriched content lands in table or blob storage (as objects or files). 

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

**Example: Encryption keys**

Encryption keys are customer-managed keys used for additional encryption. For more information, see [Encryption using customer-managed keys in Azure Key Vault](/azure/search/search-security-manage-encryption-keys).

```json
{
    "name": "financedocenricher",
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

+ [AI enrichment overview](/azure/search/cognitive-search-concept-intro)
+ [Tutorial: Enriched indexing with AI](/azure/search/cognitive-search-tutorial-blob)
+ [How to define a skillset](/azure/search/cognitive-search-defining-skillset)
+ [How to map fields](/azure/search/cognitive-search-output-field-mapping)
+ [How to define a custom interface](/azure/search/cognitive-search-custom-skill-interface)
+ [Example: creating a custom skill](/azure/search/cognitive-search-create-custom-skill-example)
+ [Built-in skills](/azure/search/cognitive-search-predefined-skills)
+ [Knowledge store overview](/azure/search/knowledge-store-concept-intro)
