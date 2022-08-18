---
title: Create or Update Skillset (2021-04-30-Preview)
description: Preview version of the Create or Update Skillset REST API for Azure Cognitive Search.
ms.date: 03/22/2022

ms.service: cognitive-search
ms.devlang: rest-api
ms.topic: reference

author: gmndrg
ms.author: gimondra
ms.manager: nitinme
---

# Create or Update Skillset (Preview REST API)

**API Version: 2021-04-30-Preview**

> [!Important]
> 2021-04-30-Preview adds managed identity support for skillset-related connections:
> + **"storageConnectionString"** under [knowledge store](#knowledgestore) accepts an Azure resource ID for Azure AD authentication.
> + **"identity"** accepts a user-assigned managed identity. This property is under [knowledge store](#knowledgestore). It's also under [**"encryptionKey"**](#encryptionkey) for retrieving a customer-managed key in Azure Key Vault.
>
> This preview API also supports a managed identity connection from a custom skill. See [Custom Web API reference](/azure/search/cognitive-search-custom-skill-web-api) for details.

A skillset is a collection of [cognitive skills](/azure/search/cognitive-search-predefined-skills) used for AI enrichment, with the option of also creating an external knowledge store in Azure Storage. Skills invoke natural language processing and other machine learning processes, such as entity recognition, key phrase extraction, chunking text into logical pages, among others.

A skillset is attached to an [indexer](create-or-update-indexer.md). To use the skillset, reference it in an indexer and then run the indexer to import data, invoke enrichment, and send output to an index. A skillset is high-level resource, but it's operational only within indexer processing. As a high-level resource, you can reference it in multiple indexers. 

You can use either POST or PUT on a create request. For either one, the request body provides the object definition.

```http
POST https://[service name].search.windows.net/skillsets?api-version=[api-version]
    Content-Type: application/json  
    api-key: [admin key]  
```  

For update requests, use PUT and specify the skillset name on the URI. 

```http  
PUT https://[servicename].search.windows.net/skillsets/[skillset name]?api-version=[api-version]
  Content-Type: application/json  
  api-key: [admin key]  
```  

 HTTPS is required for all service requests.

**Creating a skillset** adds it to your search service. 

**Updating a skillset** fully overwrites an existing skillset with the contents of the request payload. A best practice for updates is to retrieve the skillset definition with a GET, modify it, and then update with PUT.  

> [!NOTE]
> Skillsets are the basis of [AI enrichment](/azure/search/cognitive-search-concept-intro). A free resource is available for limited processing, but for larger or more frequent workloads, a [attach a billable Cognitive Services resource](/azure/search/cognitive-search-attach-cognitive-services).

## URI Parameters

| Parameter	  | Description  | 
|-------------|--------------|
| service name | Required. Set this property to the unique, user-defined name of your search service. |
| skillset name  | Required on the URI if using PUT. The name must be lower case, start with a letter or number, have no slashes or dots, and be less than 128 characters. After starting the name with a letter or number, the rest of the name can include any letter, number and dashes, as long as the dashes are not consecutive. |
| api-version | Required. The current stable version is `api-version=2020-06-30`. See [API versions](../search-service-api-versions.md) for more versions.|
| disableCacheReprocessingChangeDetection | Optional (`false` by default). Applies to update scenarios and using cached enrichments during skillset execution. Set to `true` to prevent updates to existing documents based on the current action, for example if you want to update a skillset without running the skillset. For more information, see [Bypass skillset evaluation](/azure/search/cognitive-search-incremental-indexing-conceptual#bypass-skillset-evaluation).|

## Request Headers 

 The following table describes the required and optional request headers.  

|Fields              |Description      |  
|--------------------|-----------------|  
|Content-Type|Required. Set this property to `application/json`|  
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
| name |Required. The name of the skillset. The name must be lower case, start with a letter or number, have no slashes or dots, and be less than 128 characters. After starting the name with a letter or number, the rest of the name can include any letter, number and dashes, as long as the dashes are not consecutive.|  
| skills | An array of skills. Each skill has an odata.type, name, context, and input and output parameters. Skill reference can be found in the conceptual documentation. The array can include [built-in skills](/azure/search/cognitive-search-predefined-skills) and [custom skills](/azure/search/cognitive-search-custom-skill-web-api). At least one skill is required. If you are using a knowledge store, include a [Shaper skill](/azure/search/cognitive-search-skill-shaper?) unless you are [defining the data shape within the projection](/azure/search/knowledge-store-projection-shape). |
| cognitiveServices | An all-in-one key is required for [billable skills](/azure/search/cognitive-search-predefined-skills) that call Cognitive Services APIs on more than 20 documents daily, per indexer. The key must be for a resource in the same region as the search service. For more information, see [Attach a Cognitive Services resource](/azure/search/cognitive-search-attach-cognitive-services). </br></br>You can omit the key and this section if your skillset consists of only custom skills, utility skills (Conditional, Shaper, Text Merge, Text Split), or the [Document Extraction skill](/azure/search/cognitive-search-skill-document-extraction). </br></br>If you are using the [Custom Entity Lookup](/azure/search/cognitive-search-skill-custom-entity-lookup) skill, include this section and a key to enable transactions beyond 20 transactions daily per indexer. |
| [knowledgeStore](#knowledgestore) | Optional. Destination for enrichment output to Azure Storage. Requires a connection string to an Azure Storage account and [projections](/azure/search/knowledge-store-projection-overview). |
| [encryptionKey](#encryptionkey) | Optional. Used to encrypt sensitive data in a skillset definition with your own keys, managed in your Azure Key Vault. To learn more, see [Azure Cognitive Search encryption using customer-managed keys in Azure Key Vault](/azure/search/search-security-manage-encryption-keys). |

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

**Example: Knowledge store with full access connection string and shaped inputs**

A [knowledge store](/azure/search/knowledge-store-concept-intro) requires a connection string to an Azure Storage account and [projections](/azure/search/knowledge-store-projection-overview) that determine whether enriched content lands in table or blob storage (as objects or files). 

Projections, especially table projections, require an upstream [Shaper skill](/azure/search/cognitive-search-skill-shaper) that collects nodes from an enrichment tree as input, outputting a single shape that can be passed to projection. A shaper is typically the last skill to be processed. In a table projection, nodes in the shaper skill determine the fields in the table.

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
      "storageConnectionString": "DefaultEndpointsProtocol=https;AccountName=<storage-account-name>;AccountKey=<storage-account-key>;EndpointSuffix=core.windows.net;", 
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

**Example: Connections using a managed identity**

Managed identities can be used on connections to a knowledge store and to external code from a custom skill. This example demonstrates both scenarios. For knowledge store, the additional "identity" property specifies a search service user-assigned managed identity that Azure AD uses to authenticate the request. If you omit "identity", the search service's system-assigned managed identity is used. In order for Azure AD to authenticate the caller, the search service must be [configured for managed identity](/azure/search/search-howto-managed-identities-data-sources). The search identity must have "Storage Blob Data Contributor" permissions to write to Azure Storage.

A custom skill can use a managed identity for authentication to the Azure function or app hosting your custom code. It includes an "authResourceId" property to indicate the connection is authenticated using a managed identity. The value of "authResourceId" is the application ID created by the Microsoft Identity provider. This value will be used to validate the authentication token retrieved by the indexer, and will be sent along with the custom Web skill API request. 

```json
{
  "name": "reviews-ss",
  "description": "A short description",
  "skills":
  [
    { ... },
    { ... },
    {
        "@odata.type": "#Microsoft.Skills.Custom.WebApiSkill",
        "name": "sampleCustomSkill",
        "description": "A custom skill that requests an access token for the application ID specified in authResourceID",
        "context": "/document",
        "uri": "https://[your-app-name].azurewebsites.net/api/EntitySearch",
        "authResourceId": "api://xyz*****-****-****-****-********9876",
        "batchSize": 4,
        "degreeOfParallelism": null,
        "inputs": [
          {
            "name": "text",
            "source": "/document/content"
          },
          {
            "name": "language",
            "source": "/document/languageCode"
          },
          {
            "name": "phraseList",
            "source": "/document/keyphrases"
          }
        ],
        "outputs": [
          {
            "name": "<customSkillOutput>"
          }
        ]
      }
    {
      "@odata.type": "#Microsoft.Skills.Util.ShaperSkill",
      "context": "/document/content",
      "inputs": [ ... ],
      "outputs": [ ...]
    }
  ],
  "cognitiveServices": { ... },
  "knowledgeStore": { 
      "storageConnectionString": "ResourceId=/subscriptions/[subscription ID]/resourceGroups/[resource group name]/providers/Microsoft.Storage/storageAccounts/[storage account name]/;",
      "identity": {
          "@odata.type": "#Microsoft.Azure.Search.DataUserAssignedIdentity",
          "userAssignedIdentity": "/subscriptions/[subscription ID]/resourceGroups/[resource group name]/providers/Microsoft.ManagedIdentity/userAssignedIdentities/[user identity name]",
      "projections": [ 
          { 
            "tables": [ ], 
            "objects": [ ], 
            "files": [ ]  
          }
      ]     
  }
  "encryptionKey": { }
}
```

**Example: Encryption keys**

Encryption keys are customer-managed keys used for [supplemental encryption](/azure/search/search-security-manage-encryption-keys) of sensitive content. This example shows you how to specify customer-managed encryption on a skillset.

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

## Definitions

|Link|Description|
|--|--|
| [knowledgeStore](#knowledgestore) | Configures a connection to Azure Storage and projects enriched content in the form of objects, files, and tables for using knowledge mining and data processing scenarios. |
| [encryptionKey](#encryptionkey) | Configures a connection to Azure Key Vault for customer-managed encryption. |

<a name="knowledgestore"></a>

### knowledgeStore

A knowledge store is a repository of enriched data created a skillset and AI enrichment pipeline. It resides in Azure Storage and consists of [data projections](/azure/search/knowledge-store-projection-overview) in the form of objects, files, and tables. It's used for non-search scenarios such as knowledge mining, data exploration in Power BI, or as a data sink for more downstream processing by other apps.

The connection to Azure Storage is either a full access connection string that includes a key, or the storage resource ID provided that search service runs under a managed identity and has an Azure role assignment granting write access to the knowledge store endpoint.

|Attribute|Description|  
|---------------|-----------------|  
| storageConnectionString | Required. A string in one of these formats: </p>`"DefaultEndpointsProtocol=https;AccountName=<ACCOUNT-NAME>;AccountKey=<ACCOUNT-KEY>;EndpointSuffix=core.windows.net"`</p>`"ResourceId=/subscriptions/[subscription ID]/resourceGroups/[resource group name]/providers/Microsoft.Storage/storageAccounts/[storage account name]/;"`|
| identity | Optional. It contains a `userAssignedIdentity` of type `#Microsoft.Azure.Search.DataUserAssignedIdentity` and specifies the [user-assigned managed identity](/azure/active-directory/managed-identities-azure-resources/how-to-manage-ua-identity-portal) of the search service. This property depends on `storageConnectionString` having the connection string that specifies a Resource ID of your storage account. </p>If the `identity` property is null, the connection to a resource ID is made using the system-managed property. </p>If this property is assigned to the type `#Microsoft.Azure.Search.DataNoneIdentity`, any explicit identity that was previously specified is cleared. |
| [projections](#projections) | Required. An array of projections consisting of `tables`, `objects`, `files`, which are either specified or null. |

<a name="projections"></a>

### Projections

Projections are definitions of the data structures within a knowledge store. All names are user-defined. You can adopt a naming convention that helps you identify related content in Azure Storage.

|Attribute|Description|  
|---------------|-----------------|  
| tables | Projects data shapes into one or more tables in Azure Table Storage, where elements from each document are projected into rows in a table. Each table can have the following three properties. </p>First, `name` (required) determines the table to create or use in Azure Table Storage. </p>Second, `generatedKeyName` (optional) is the name of a column that uniquely identifies a document. Values for this column will be generated during enrichment. If you omit it, the search service will create a default key column based on the table name. </p>Third, `source` (required) is the path to a node of the enrichment tree that provides the [shape of the projection](/azure/search/knowledge-store-projection-shape). It's usually the output of a Shaper skill. Paths start with `/document/`, representing the root enriched document, and are then extended to `/document/<shaper-output>/`, or `/document/content/`, or another node within the enrichment tree. Examples: `/document/countries/*` (all countries), or `/document/countries/*/states/*` (all states in all countries).
| objects | Projects documents as blobs in Azure Blob Storage. Each object has two required properties. </p>First, `storageContainer` is the name of the container to create or use in Azure Blob Storage. </p>Second, `source` is the path to the node of the enrichment tree that provides the shape of the projection. It must be valid JSON. The node must provide a JSON object, either from a skill that emits valid JSON or the output of a Shaper skill. |  
| files | Each file entry defines storage of binary images in Blob Storage. </p>File projections have two required properties. First, `storageContainer` is the name of the container to create or use in Azure Blob Storage. </p>Second, `source` is the  path to the node of the enrichment tree that is the root of the projection. A valid value for this property is `"/document/normalized_images/*"` for images that were sourced from Blob Storage. |

<a name="encryptionkey"></a>

### encryptionKey

Configures a connection to Azure Key Vault for supplemental [customer-managed encryption keys (CMK)](/azure/search/search-security-manage-encryption-keys). Encryption with customer-managed keys is not available for free services. For billable services, it's only available for search services created on or after 2019-01-01.

A connection to the key vault must be authenticated. You can use either "accessCredentials" or a managed identity for this purpose. 

Managed identities can be system or user-assigned (preview). If the search service has both a system-assigned managed identity and a role assignment that grants read access to the key vault, you can omit both "identity" and "accessCredentials", and the request will authenticate using the managed identity. If the search service has user-assigned identity and role assignment, set the "identity" property to the resource ID of that identity.

|Attribute|Description|  
|---------------|-----------------|  
| keyVaultKeyName | Required. Name of the Azure Key Vault key used for encryption. |
| keyVaultKeyVersion | Required. Version of the Azure Key Vault key. |
| keyVaultUri  | Required. URI of Azure Key Vault, also referred to as DNS name, that provides the key. An example URI might be `https://my-keyvault-name.vault.azure.net`. |
| accessCredentials | Omit if you're using a managed identity. Otherwise, the properties of `accessCredentials` include `applicationId` (an Azure Active Directory Application ID that has access permissions to your specified Azure Key Vault), and `applicationSecret` (the authentication key of the specified Azure AD application). |
| identity | Optional unless you are using a user-assigned managed identity for the search service connection to Azure Key Vault. The format is `"/subscriptions/[subscription ID]/resourceGroups/[resource group name]/providers/Microsoft.ManagedIdentity/userAssignedIdentities/[managed identity name]"`. |

## See also

+ [Define a skillset](/azure/search/cognitive-search-defining-skillset)
+ [AI enrichment overview](/azure/search/cognitive-search-concept-intro)
+ [Skillset overview](/azure/search/cognitive-search-working-with-skillsets)
+ [Knowledge store overview](/azure/search/knowledge-store-concept-intro)
+ [Projection overview](/azure/search/knowledge-store-projection-overview)
+ [Tutorial: Use REST and AI to generate searchable content from blobs](/azure/search/cognitive-search-tutorial-blob)
+ [Built-in skills](/azure/search/cognitive-search-predefined-skills)
