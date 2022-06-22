---
title: Create or Update Index (2021-04-30-Preview)
titleSuffix: Azure Cognitive Search
description: Preview version of the Create or Update Index REST API for Azure Cognitive Search.
ms.date: 03/20/2022

ms.service: cognitive-search
ms.topic: reference
ms.devlang: rest-api

author: bevloh
ms.author: beloh
---

# Create or Update Index (Preview REST API)

**API Version: 2021-04-30-Preview, 2020-06-30-Preview** 

> [!Important]
> 2021-04-30-Preview adds:
> + [**"semanticConfiguration"**](#semantic) used for scoping semantic ranking to specific fields.
> + **"identity"**, under [**"encryptionKey"**](#encryptionkey), used to retrieve a customer-managed encryption key from Azure Key Vault using a user-assigned managed identity.
> 
> 2020-06-30-Preview adds:
> + [**"normalizers"**](#normalizers), used for case-insensitivity on sorts and filters.

An [index](/azure/search/search-what-is-an-index) specifies the index schema, including the fields collection (field names, data types, and attributes), but also additional constructs (suggesters, scoring profiles, and CORS configuration) that define other search behaviors.

You can use either POST or PUT on a create request. For either one, the request body provides the object definition.

```http
POST https://[servicename].search.windows.net/indexes?api-version=[api-version]  
  Content-Type: application/json
  api-key: [admin key]  
```  

For update requests, use PUT and specify the index name on the URI. 

```http
PUT https://[servicename].search.windows.net/indexes/[index name]?api-version=[api-version]
  Content-Type: application/json
  api-key: [admin key]
```  

HTTPS is required for all service requests. If the index doesn't exist, it is created. If it already exists, it is updated to the new definition.

**Creating an index** establishes the schema and metadata. Populating the index is a separate operation. For this step, you can use an indexer (see [Indexer operations](../indexer-operations.md), available for supported data sources) or an [Add, Update or Delete Documents](../addupdate-or-delete-documents.md). The maximum number of indexes that you can create varies by pricing tier. Within each index, there are limits on individual elements. For more information, see [Service limits for Azure Cognitive Search](/azure/search/search-limits-quotas-capacity#index-limits).  

**Updating an existing index** must include the full schema definition, including any original definitions that you want to preserve. In general, the best pattern for updates is to retrieve the index definition with a GET, modify it, and then update it with PUT. 

Because an existing index contains content, many index modifications require an [index drop and rebuild](/azure/search/search-howto-reindex). The following schema changes are an exception to this rule:

+ Adding new fields
+ Adding or changing [scoring profiles](/azure/search/index-add-scoring-profiles)
+ Adding or changing [semantic configurations](/azure/search/semantic-how-to-query-request)
+ Changing CORS options
+ Changing existing fields with any of the following three modifications:

  + Show or hide fields (`retrievable`: true | false)
  + Change the analyzer used at query time (`searchAnalyzer`)
  + Add or edit the synonymMap used at query time (`synonymMaps`) 

To make any of the above schema changes to an existing index, specify the name of the index on the request URI, and then include a fully specified index definition with the new or changed elements. 

When a new field is added, all existing documents in the index automatically have a null value for that field. No additional storage space is consumed until one of two things occurs: a value is provided for the new field ([using merge](../addupdate-or-delete-documents.md)), or new documents are added.

**Updates to a [`suggester`](/azure/search/index-add-suggesters)** have similar constraints: new fields can be added to a `suggester` at the same time fields are added, but existing fields cannot be removed from nor added to `suggesters` without an index rebuild.

**Updates to an analyzer, a tokenizer, a token filter or a char filter** are not allowed. New ones can be created with the changes you want, but you will need to take the index offline when adding the new analyzer definitions. Setting the `allowIndexDowntime` flag to true in the index update request will take the index offline:

`PUT https://[search service name].search.windows.net/indexes/[index name]?api-version=[api-version]&allowIndexDowntime=true`

This operation takes your index offline for at least a few seconds, which means indexing and query requests will fail until the index is back online and ready to handle requests.

## URI Parameters

| Parameter      | Description  |
|----------------|--------------|
| service name | Required. Set this to the unique, user-defined name of your search service. |
| index name  | Required on the URI if using PUT. The name must be lower case, start with a letter or number, have no slashes or dots, and be fewer than 128 characters. Dashes can't be consecutive.  |
| api-version | Required. The current version is `api-version=2021-04-30-Preview`. See [API versions](../search-service-api-versions.md) for more versions.|
| allowIndexDowntime | Optional. False by default. Set to true for certain updates, such as adding or modifying an analyzer, tokenizer, token filter, char filter, or similarity property. The index is taken offline for the duration of the update, usually no more than several seconds. |

## Request Headers

 The following table describes the required and optional request headers.  

|Fields              |Description      |  
|--------------------|-----------------|  
|Content-Type|Required. Set this to `application/json`|  
|api-key|Required. The `api-key` is used to authenticate the request to your Search service. It is a string value, unique to your service. Create requests must include an `api-key` header set to your admin key (as opposed to a query key). You can [find the API key](/azure/search/search-security-api-keys#find-existing-keys) in your search service dashboard in the Azure portal.|     

## Request Body

 The body of the request contains a schema definition, which includes the list of data fields within documents that will be fed into this index.  

The following JSON is a high-level representation of the main parts of the definition.

```json
{  
  "name": (optional on PUT; required on POST) "Name of the index",
  "description": (optional) "Description of the index",  
  "fields": [  
    {  
      "name": "name_of_field",  
      "type": "Edm.String | Edm.Int32 | Edm.Int64 | Edm.Double | Edm.Boolean | Edm.DateTimeOffset | Edm.GeographyPoint | Edm.ComplexType | Collection(Edm.String) | Collection(Edm.Int32) | Collection(Edm.Int64) | Collection(Edm.Double) | Collection(Edm.Boolean) | Collection(Edm.DateTimeOffset) | Collection(Edm.GeographyPoint) | Collection(Edm.ComplexType)",  
      "searchable": true (default where applicable) | false (only Edm.String and Collection(Edm.String) fields can be searchable),  
      "filterable": true (default) | false,  
      "sortable": true (default where applicable) | false (Collection(Edm.String) fields cannot be sortable),  
      "facetable": true (default where applicable) | false (Edm.GeographyPoint fields cannot be facetable),  
      "key": true | false (default, only Edm.String fields can be keys, enable on one field only),  
      "retrievable": true (default) | false,  
      "analyzer": "name_of_analyzer_for_search_and_indexing", (only if 'searchAnalyzer' and 'indexAnalyzer' are not set)
      "searchAnalyzer": "name_of_search_analyzer", (only if 'indexAnalyzer' is set and 'analyzer' is not set)
      "indexAnalyzer": "name_of_indexing_analyzer", (only if 'searchAnalyzer' is set and 'analyzer' is not set)
      "normalizer": "name_of_normalizer", (optional, applies only to filterable, facetable, or sortable Edm.String and Collection(Edm.String) fields.)
      "synonymMaps": [ "name_of_synonym_map" ] (optional, only one synonym map per field is currently supported),
      "fields" : [ ... ] (optional, a list of sub-fields if this is a field of type Edm.ComplexType or Collection(Edm.ComplexType). Must be null or empty for simple fields.)
    }
  "similarity": (optional) { },
  "suggesters": (optional) [ ... ],  
  "scoringProfiles": (optional) [ ... ],  
  "semantic": (optional) { },
  "normalizers":(optional) [ ... ],
  "analyzers":(optional) [ ... ],
  "charFilters":(optional) [ ... ],
  "tokenizers":(optional) [ ... ],
  "tokenFilters":(optional) [ ... ],
  "defaultScoringProfile": (optional) "Name of a custom scoring profile to use as the default",  
  "corsOptions": (optional) { },
  "encryptionKey":(optional) { }  
}  
```

 Request contains the following properties:  

|Property|Description|  
|--------------|-----------------|  
|name|Required. The name of the index. An index name must only contain lowercase letters, digits or dashes, cannot start or end with dashes and is limited to 128 characters.|  
|description|An optional description.|  
|[fields](#bkmk_indexAttrib)| A collection of fields for this index, where each field has a name, a [supported data type](../supported-data-types.md) that conforms to the Entity Data Model (EDM), and attributes that define allowable actions on that field. The fields collection must have one field of type `Edm.String` with "key" set to "true". This field represents the unique identifier, sometimes called the document ID, for each document stored with the index.  |
| similarity  | Optional. For services created before July 15, 2020, set this property to use the BM25 ranking algorithm. Valid values include `"#Microsoft.Azure.Search.ClassicSimilarity"` or `"#Microsoft.Azure.Search.BM25Similarity"`. For more information, see [Ranking algorithms in Azure Cognitive Search](/azure/search/index-ranking-similarity).|
| [suggesters](#suggesters) | Specifies a construct that stores prefixes for matching on partial queries like autocomplete and suggestions. |
| scoringProfiles | Optional. Used for custom search score ranking. You can make your custom profile the default by setting `defaultScoringProfile`, invoked whenever a custom profile is not explicitly specified on the query string. For more information, see [Add scoring profiles to a search index](/azure/search/index-add-scoring-profiles). |
| [semantic](#semantic) | Optional.  Defines the parameters of a search index that influence semantic search capabilities. A semantic configuration is required for semantic queries. For more information, see [Create a semantic query](/azure/search/semantic-how-to-query-request).|
| [normalizers](#normalizers) | Optional. Normalizes the lexicographical ordering of strings, producing case-insensitive sorting and filtering output. |
| analyzers, charFilters, tokenizers, tokenFilters | Optional. Specify these sections of the index if you are defining [custom analyzers](/azure/search/index-add-custom-analyzers). By default, these sections are null. |  
| defaultScoringProfile | Name of a custom scoring profile that overwrites the default scoring behaviors. |
| [corsOptions](#corsoptions) | Optional. Used for cross-origin queries to your index. | 
| [encryptionKey](#encryptionkey) | Optional. Used for additional encryption of the index, through [customer-managed encryption keys (CMK)](/azure/search/search-security-manage-encryption-keys) in Azure Key Vault. Available for billable search services created on or after 2019-01-01.|

## Response

For a successful create request, you should see status code "201 Created". By default, the response body will contain the JSON for the index definition that was created. However, if the Prefer request header is set to return=minimal, the response body will be empty, and the success status code will be "204 No Content" instead of "201 Created". This is true regardless of whether PUT or POST is used to create the index.

For a successful update request, you should see "204 No Content".  By default the response body will be empty. However, if the `Prefer` request header is set to `return=representation`, the response body will contain the JSON for the index definition that was updated. In this case, the success status code will be "200 OK".  

## Examples

**Example: An index schema with simple and complex fields**

The first example shows a complete index schema with simple and complex fields. At least one string field must have "key" set to true.

```json
{
  "name": "hotels",  
  "fields": [
    { "name": "HotelId", "type": "Edm.String", "key": true, "filterable": true },
    { "name": "HotelName", "type": "Edm.String", "searchable": true, "filterable": false, "sortable": true, "facetable": false },
    { "name": "Description", "type": "Edm.String", "searchable": true, "filterable": false, "sortable": false, "facetable": false, "analyzer": "en.microsoft" },
    { "name": "Description_fr", "type": "Edm.String", "searchable": true, "filterable": false, "sortable": false, "facetable": false, "analyzer": "fr.microsoft" },
    { "name": "Category", "type": "Edm.String", "searchable": true, "filterable": true, "sortable": true, "facetable": true },
    { "name": "Tags", "type": "Collection(Edm.String)", "searchable": true, "filterable": true, "sortable": false, "facetable": true, "analyzer": "tagsAnalyzer", "normalizer": "tagsNormalizer" },
    { "name": "ParkingIncluded", "type": "Edm.Boolean", "filterable": true, "sortable": true, "facetable": true },
    { "name": "LastRenovationDate", "type": "Edm.DateTimeOffset", "filterable": true, "sortable": true, "facetable": true },
    { "name": "Rating", "type": "Edm.Double", "filterable": true, "sortable": true, "facetable": true },
    { "name": "Address", "type": "Edm.ComplexType", 
      "fields": [
          { "name": "StreetAddress", "type": "Edm.String", "filterable": false, "sortable": false, "facetable": false, "searchable": true },
          { "name": "City", "type": "Edm.String", "searchable": true, "filterable": true, "sortable": true, "facetable": true, "normalizer": "lowercase" },
          { "name": "StateProvince", "type": "Edm.String", "searchable": true, "filterable": true, "sortable": true, "facetable": true },
          { "name": "PostalCode", "type": "Edm.String", "searchable": true, "filterable": true, "sortable": true, "facetable": true },
          { "name": "Country", "type": "Edm.String", "searchable": true, "filterable": true, "sortable": true, "facetable": true }
        ]
    },
    { "name": "Location", "type": "Edm.GeographyPoint", "filterable": true, "sortable": true },
    { "name": "Rooms", "type": "Collection(Edm.ComplexType)", 
      "fields": [
          { "name": "Description", "type": "Edm.String", "searchable": true, "filterable": false, "sortable": false, "facetable": false, "analyzer": "en.lucene" },
          { "name": "Description_fr", "type": "Edm.String", "searchable": true, "filterable": false, "sortable": false, "facetable": false, "analyzer": "fr.lucene" },
          { "name": "Type", "type": "Edm.String", "searchable": true },
          { "name": "BaseRate", "type": "Edm.Double", "filterable": true, "facetable": true },
          { "name": "BedOptions", "type": "Edm.String", "searchable": true },
          { "name": "SleepsCount", "type": "Edm.Int32", "filterable": true, "facetable": true },
          { "name": "SmokingAllowed", "type": "Edm.Boolean", "filterable": true, "facetable": true },
          { "name": "Tags", "type": "Collection(Edm.String)", "searchable": true, "filterable": true, "facetable": true, "analyzer": "tagsAnalyzer", "normalizer": "tagsNormalizer" }
        ]
    }
  ],
  "suggesters": [ ],
  "analyzers": [ ],
  "normalizers": [ ],
  "encryptionKey": [ ]
}  
```

**Example: Suggesters**

A [suggester](/azure/search/index-add-suggesters) definition should specify "searchable" and "retrievable" string fields (in the REST APIs, all simple fields are `"retrievable": true` by default). After a suggester is defined, you can reference it by name on query requests that use either the [Suggestions API](../suggestions.md) or [Autocomplete API](../autocomplete.md), depending on whether you want to return a match or the remainder of a query term.

```json
{
  "name": "hotels",  
  "fields": [
    { "name": "HotelId", "type": "Edm.String", "key": true, "filterable": true },
    { "name": "HotelName", "type": "Edm.String", "searchable": true, "filterable": false, "sortable": true, "facetable": false },
    { "name": "Description", "type": "Edm.String", "searchable": true, "filterable": false, "sortable": false, "facetable": false, "analyzer": "en.microsoft" },
    { "name": "Description_fr", "type": "Edm.String", "searchable": true, "filterable": false, "sortable": false, "facetable": false, "analyzer": "fr.microsoft" },
    { "name": "Category", "type": "Edm.String", "searchable": true, "filterable": true, "sortable": true, "facetable": true },
    { "name": "Tags", "type": "Collection(Edm.String)", "searchable": true, "filterable": true, "sortable": false, "facetable": true, "analyzer": "tagsAnalyzer", "normalizer": "tagsNormalizer" },
    { "name": "Rating", "type": "Edm.Double", "filterable": true, "sortable": true, "facetable": true },

  ],
  "suggesters": [
    {  
      "name": "sg",  
      "searchMode": "analyzingInfixMatching",  
      "sourceFields": ["HotelName", "Category", "Tags"]  
    } 
  ]
} 
```

**Example: Analyzers and normalizers**

[Analyzers](/azure/search/search-analyzers) and [normalizers](/azure/search/search-normalizers) are referenced on field definitions and can be either predefined or custom. If you're using custom analyzers or normalizers, you'll specify them in the index in the "analyzers" and "normalizers" sections. 

The following example illustrates custom analyzers and normalizers for "Tags". It also demonstrates a predefined normalizer (standard) and analyzer (en.microsoft) for "HotelName" and "Description", respectively.

```json
{
  "name": "hotels",  
  "fields": [
    { "name": "HotelId", "type": "Edm.String", "key": true, "filterable": true },
    { "name": "HotelName", "type": "Edm.String", "searchable": true, "filterable": false, "sortable": true, "facetable": false, "normalizer": standard  },
    { "name": "Description", "type": "Edm.String", "searchable": true, "filterable": false, "sortable": false, "facetable": false, "analyzer": "en.microsoft"},
    { "name": "Description_fr", "type": "Edm.String", "searchable": true, "filterable": false, "sortable": false, "facetable": false, "analyzer": "fr.microsoft" },
    { "name": "Category", "type": "Edm.String", "searchable": true, "filterable": true, "sortable": true, "facetable": true },
    { "name": "Tags", "type": "Collection(Edm.String)", "searchable": true, "filterable": true, "sortable": false, "facetable": true, "analyzer": "tagsAnalyzer", "normalizer": "tagsNormalizer" },
    { "name": "Rating", "type": "Edm.Double", "filterable": true, "sortable": true, "facetable": true },

  ],
  "analyzers": [
    {
      "@odata.type": "#Microsoft.Azure.Search.CustomAnalyzer",
      "name": "tagsAnalyzer",
      "charFilters": [ "html_strip" ],
      "tokenizer": "standard_v2"
    }
  ],
  "normalizers": [
    {
      "@odata.type": "#Microsoft.Azure.Search.CustomNormalizer",
      "name": "tagsNormalizer",
      "tokenFilters": [ "asciifolding", "lowercase" ]
    }
  ]
}  
```

**Example: Similarity for search relevance**

This property sets the ranking algorithm used to create a relevance score in search results of a full text search query. In services created *after* July 15, 2020, this property is ignored because the similarity algorithm is always BM25. For existing services created *before* July 15, 2020, you can opt in to BM25 by setting this construct as follows:

 ```json
  "similarity": {
      "@odata.type": "#Microsoft.Azure.Search.BM25Similarity"
  }
 ```

**Example: CORS Options**

 Client-side JavaScript cannot call any APIs by default since the browser will prevent all cross-origin requests. To allow cross-origin queries to your index, enable CORS ([Cross-origin resource sharing (Wikipedia)](https://en.wikipedia.org/wiki/Cross-origin_resource_sharing)) by setting the `corsOptions` attribute. For security reasons, only query APIs support CORS.

 ```json
{
    "name": "hotels",  
    "fields": [ omitted for brevity ],
    "suggesters": [ omitted for brevity ],
    "analyzers": [ omitted for brevity ],
    "corsOptions": (optional) {  
        "allowedOrigins": ["*"] | ["https://docs.microsoft.com:80", "https://azure.microsoft.com:80", ...],  
        "maxAgeInSeconds": (optional) max_age_in_seconds (non-negative integer)  
      }
}
```

**Example: Encryption keys with access credentials**

Encryption keys are customer-managed keys used for additional encryption. For more information, see [Encryption using customer-managed keys in Azure Key Vault](/azure/search/search-security-manage-encryption-keys).

```json
{
    "name": "hotels",  
    "fields": [ omitted for brevity ],
    "suggesters": [ omitted for brevity ],
    "analyzers": [ omitted for brevity ],
    "encryptionKey": (optional) { 
      "keyVaultKeyName": "Name of the Azure Key Vault key used for encryption",
      "keyVaultKeyVersion": "Version of the Azure Key Vault key",
      "keyVaultUri": "URI of Azure Key Vault, also referred to as DNS name, that provides the key. An example URI might be https://my-keyvault-name.vault.azure.net",
      "accessCredentials": (optional, only if not using managed system identity) {
        "applicationId": "AAD Application ID that was granted access permissions to your specified Azure Key Vault",
        "applicationSecret": "Authentication key of the specified AAD application)"}
      }
} 
```

**Example: Encryption keys with managed identity**

You can authenticate to Azure Key Vault using a system-assigned or user-assigned (preview) managed identity. In this case, omit access credentials, or set to null. The following example shows a user-assigned managed identity. To use a system-assigned managed identity, omit access credentials and identity. As long as the system identity of your search service has permissions in Azure Key Vault, the connection request should succeed.

```json
{
    "name": "hotels",  
    "fields": [ omitted for brevity ],
    "suggesters": [ omitted for brevity ],
    "analyzers": [ omitted for brevity ],
    "encryptionKey": (optional) { 
        "keyVaultKeyName": "Name of the Azure Key Vault key used for encryption",
        "keyVaultKeyVersion": "Version of the Azure Key Vault key",
        "keyVaultUri": "URI of Azure Key Vault, also referred to as DNS name, that provides the key. An example URI might be https://my-keyvault-name.vault.azure.net",
        "accessCredentials": null,
        "identity" : { 
            "@odata.type": "#Microsoft.Azure.Search.DataUserAssignedIdentity",
            "userAssignedIdentity" : "/subscriptions/[subscription ID]/resourceGroups/[resource group name]/providers/Microsoft.ManagedIdentity/userAssignedIdentities/[managed identity name]"
      }
} 
```

**Example: Scoring Profiles**

A scoring profile is a section of the schema that defines custom scoring behaviors that let you influence which documents appear higher in the search results. Scoring profiles are made up of field weights and functions. To use them, you specify a profile by name on the query string. For more information, see [Add scoring profiles to a search index &#40;Azure Cognitive Search REST API&#41;](/azure/search/index-add-scoring-profiles) for details.   

 ```json
{
    "name": "hotels",  
    "fields": [ omitted for brevity ],
    "suggesters": [ omitted for brevity ],
    "analyzers": [ omitted for brevity ],
    "scoringProfiles": [  
    {  
      "name": "name of scoring profile",  
      "text": (optional, only applies to searchable fields) {  
        "weights": {  
          "searchable_field_name": relative_weight_value (positive #'s),  
          ...  
        }  
      },  
      "functions": (optional) [  
        {  
          "type": "magnitude | freshness | distance | tag",  
          "boost": # (positive number used as multiplier for raw score != 1),  
          "fieldName": "...",  
          "interpolation": "constant | linear (default) | quadratic | logarithmic",  
          "magnitude": {  
            "boostingRangeStart": #,  
            "boostingRangeEnd": #,  
            "constantBoostBeyondRange": true | false (default)  
          },  
          "freshness": {  
            "boostingDuration": "..." (value representing timespan leading to now over which boosting occurs)  
          },  
          "distance": {  
            "referencePointParameter": "...", (parameter to be passed in queries to use as reference location)  
            "boostingDistance": # (the distance in kilometers from the reference location where the boosting range ends)  
          },  
          "tag": {  
            "tagsParameter": "..." (parameter to be passed in queries to specify a list of tags to compare against target fields)  
          }  
        }  
      ],  
      "functionAggregation": (optional, applies only when functions are specified)   
        "sum (default) | average | minimum | maximum | firstMatching"  
        }  
  ]
}
```

**Example: Semantic Configurations**

A semantic configuration is a part of an index definition that's used to configure which fields will be utilized by semantic search for ranking, captions, highlights, and answers. To use semantic search, you must specify the name of a semantic configuration at query time. For more information, see [Create a semantic query](/azure/search/semantic-how-to-query-request).

 ```json
{
    "name": "hotels",  
    "fields": [ omitted for brevity ],
    "suggesters": [ omitted for brevity ],
    "analyzers": [ omitted for brevity ],
    "semantic": {
      "configurations": [
        {
          "name": "my-semantic-config",
          "prioritizedFields": {
            "titleField": {
                  "fieldName": "hotelName"
                },
            "prioritizedContentFields": [
              {
                "fieldName": "description"
              },
              {
                "fieldName": "description_fr"
              }
            ],
            "prioritizedKeywordsFields": [
              {
                "fieldName": "tags"
              },
              {
                "fieldName": "category"
              }
            ]
          }
        }
      ]
    }
}
```

## Definitions

|Link|Description|
|--|--|
| [corsOptions](#corsoptions) | Lists the domains or origins that will be granted to your index. |
| [encryptionKey](#encryptionkey) | Configures a connection to Azure Key Vault for customer-managed encryption. |
| [fields](#bkmk_indexAttrib) | Sets definitions and attributes of a field in a search index. |
| [normalizers](#normalizers) | Configures a custom normalizer. Normalizes the lexicographical ordering of strings, producing case-insensitive sorting, faceting, and filtering output. |
| [semantic](#semantic) | Configures fields used by semantic search for ranking, captions, highlights, and answers.  |
| [suggesters](#suggesters) | Configures internal prefix storage for matching on partial queries like autocomplete and suggestions. |

<a name="corsoptions"> </a>

### corsOptions

Client-side JavaScript cannot call any APIs by default since the browser will prevent all cross-origin requests. To allow cross-origin queries to your index, enable CORS (Cross-Origin Resource Sharing) by setting the "corsOptions" attribute. For security reasons, only query APIs support CORS. 

|Attribute|Description|  
|---------------|-----------------|  
| allowedOrigins | Required. A comma-delimited list of origins that will be granted access to your index, where each origin is typically of the form protocol://\<fully-qualified-domain-name>:\<port> (although the \<port> is often omitted).  This means that any JavaScript code served from those origins will be allowed to query your index (assuming it provides a valid API key). If you want to allow access to all origins, specify `*` as a single item in the "allowedOrigins" array. This is not recommended for production, but might be useful for development or debugging. |
| maxAgeInSeconds | Optional. Browsers use this value to determine the duration (in seconds) to cache CORS preflight responses. This must be a non-negative integer. The larger this value is, the better performance will be, but the longer it will take for CORS policy changes to take effect. If it is not set, a default duration of 5 minutes will be used. |

<a name="encryptionKey"> </a>

### encryptionKey

Configures a connection to Azure Key Vault for supplemental [customer-managed encryption keys (CMK)](/azure/search/search-security-manage-encryption-keys). Available for billable search services created on or after 2019-01-01. 

A connection to the key vault must be authenticated. You can use either "accessCredentials" or a managed identity for this purpose. 

Managed identities can be system or user-assigned (preview). If the search service has both a system-assigned managed identity and a role assignment that grants read access to the key vault, you can omit both "identity" and "accessCredentials", and the request will authenticate using the managed identity. If the search service has user-assigned identity and role assignment, set the "identity" property to the resource ID of that identity.

|Attribute|Description|  
|---------------|-----------------|  
| keyVaultKeyName | Required. Name of the Azure Key Vault key used for encryption. |
| keyVaultKeyVersion | Required. Version of the Azure Key Vault key. |
| keyVaultUri  | Required. URI of Azure Key Vault, also referred to as DNS name, that provides the key. An example URI might be `https://my-keyvault-name.vault.azure.net` |
| accessCredentials | Optional. Omit this property if you are using a managed identity. Otherwise, the properties of "accessCredentials" include: </br>"applicationId" (an Azure Active Directory Application ID that has access permissions to your specified Azure Key Vault). </br>"applicationSecret" (the authentication key of the specified Azure AD application). |
| identity | Optional unless you are using a user-assigned managed identity for the search service connection to Azure Key Vault. The format is `"/subscriptions/[subscription ID]/resourceGroups/[resource group name]/providers/Microsoft.ManagedIdentity/userAssignedIdentities/[managed identity name]"`. |

 <a name="bkmk_indexAttrib"> </a>

### fields

Contains information about attributes set on a search field when creating an index.

|Attribute|Description|  
|---------------|-----------------|  
|name|Required. Sets the name of the field, which must be unique within the fields collection of the index or parent field.|  
|type|Required. Sets the data type for the field. Fields can be simple or complex. Simple fields are of primitive types, like `Edm.String` for text or `Edm.Int32` for integers. [Complex fields](/azure/search/search-howto-complex-data-types) can have sub-fields that are themselves either simple or complex. This allows you to model objects and arrays of objects, which in turn enables you to upload most JSON object structures to your index. See [Supported data types](../supported-data-types.md) for the complete list of supported types.|  
|key|Required. Set this attribute to true to designate that a field's values uniquely identify documents in the index. The maximum length of values in a key field is 1024 characters. Exactly one top-level field in each index must be chosen as the key field and it must be of type `Edm.String`. Default is `false` for simple fields and `null` for complex fields. </br></br>Key fields can be used to look up documents directly and update or delete specific documents. The values of key fields are handled in a case-sensitive manner when looking up or indexing documents. See [Lookup Document](../lookup-document.md) and [Add, Update or Delete Documents](../addupdate-or-delete-documents.md) for details.|  
|retrievable| Indicates whether the field can be returned in a search result. Set this attribute to `false` if you want to use a field (for example, margin) as a filter, sorting, or scoring mechanism but do not want the field to be visible to the end user. This attribute must be `true` for key fields, and it must be `null` for complex fields. This attribute can be changed on existing fields. Setting retrievable to `true` does not cause any increase in index storage requirements. Default is `true` for simple fields and `null` for complex fields.|  
|searchable| Indicates whether the field is full-text searchable and can be referenced in search queries. This means it will undergo [lexical analysis](/azure/search/search-analyzers) such as word-breaking during indexing. If you set a searchable field to a value like "Sunny day", internally it will be normalized and split into the individual tokens \"sunny\" and \"day\". This enables full-text searches for these terms. Fields of type `Edm.String` or `Collection(Edm.String)` are searchable by default. This attribute must be `false` for simple fields of other non-string data types, and it must be `null` for complex fields. </br></br>A searchable field consumes extra space in your index since Azure Cognitive Search will process the contents of those fields and organize them in auxiliary data structures for performant searching. If you want to save space in your index and you don't need a field to be included in searches, set searchable to `false`. See [How full-text search works in Azure Cognitive Search](/azure/search/search-lucene-query-architecture) for details. |  
|filterable| Indicates whether to enable the field to be referenced in `$filter` queries. Filterable differs from searchable in how strings are handled. Fields of type `Edm.String` or `Collection(Edm.String)` that are filterable do not undergo lexical analysis, so comparisons are for exact matches only. For example, if you set such a field `f` to "Sunny day", `$filter=f eq 'sunny'` will find no matches, but `$filter=f eq 'Sunny day'` will. This attribute must be `null` for complex fields. Default is `true` for simple fields and `null` for complex fields. To reduce index size, set this attribute to `false` on fields that you won't be filtering on.|  
|sortable| Indicates whether to enable the field to be referenced in `$orderby` expressions. By default Azure Cognitive Search sorts results by score, but in many experiences users will want to sort by fields in the documents. A simple field can be sortable only if it is single-valued (it has a single value in the scope of the parent document). </br></br>Simple collection fields cannot be sortable, since they are multi-valued. Simple sub-fields of complex collections are also multi-valued, and therefore cannot be sortable. This is true whether it's an immediate parent field, or an ancestor field, that's the complex collection. Complex fields cannot be sortable and the sortable attribute must be `null` for such fields. The default for sortable is `true` for single-valued simple fields, `false` for multi-valued simple fields, and `null` for complex fields.|  
|facetable| Indicates whether to enable the field to be referenced in facet queries. Typically used in a presentation of search results that includes hit count by category (for example, search for digital cameras and see hits by brand, by megapixels, by price, and so on). This attribute must be `null` for complex fields. Fields of type `Edm.GeographyPoint` or `Collection(Edm.GeographyPoint)` cannot be facetable. Default is `true` for all other simple fields. To reduce index size, set this attribute to `false` on fields that you won't be faceting on. |
|analyzer|Sets the lexical analyzer for tokenizing strings during indexing and query operations. Valid values for this property include [language analyzers](/azure/search/index-add-language-analyzers), [built-in analyzers](/azure/search/index-add-custom-analyzers#built-in-analyzers), and [custom analyzers](/azure/search/index-add-custom-analyzers). The default is `standard.lucene`. This attribute can only be used with searchable fields, and it can't be set together with either searchAnalyzer or indexAnalyzer. Once the analyzer is chosen and the field is created in the index, it cannot be changed for the field. Must be `null` for [complex fields](/azure/search/search-howto-complex-data-types). |  
|searchAnalyzer|Set this property in conjunction with indexAnalyzer to specify different lexical analyzers for indexing and queries. If you use this property, set analyzer to `null` and make sure indexAnalyzer is set to an allowed value. Valid values for this property include [built-in analyzers](/azure/search/index-add-custom-analyzers#built-in-analyzers) and [custom analyzers](/azure/search/index-add-custom-analyzers). This attribute can be used only with searchable fields. The search analyzer can be updated on an existing field since it is only used at query-time. Must be `null` for [complex fields](/azure/search/search-howto-complex-data-types).|
|indexAnalyzer|Set this property in conjunction with searchAnalyzer to specify different lexical analyzers for indexing and queries.  If you use this property, set analyzer to `null` and make sure searchAnalyzer is set to an allowed value. Valid values for this property include [built-in analyzers](/azure/search/index-add-custom-analyzers#built-in-analyzers) and [custom analyzers](/azure/search/index-add-custom-analyzers). This attribute can be used only with searchable fields. Once the index analyzer is chosen, it cannot be changed for the field. Must be `null` for [complex fields](/azure/search/search-howto-complex-data-types).|
|normalizer |Sets the normalizer for filtering, sorting, and faceting operations. It can be the name of a predefined normalizer or a custom normalizer defined within index. The default is `null`, which results in an exact match on verbatim, un-analyzed text. This attribute can be used only with `Edm.String` and `Collection(Edm.String)` fields that have at least one of filterable, sortable, or facetable set to true. A normalizer can only be set on the field when added to the index and cannot be changed later. Must be `null` for [complex fields](/azure/search/search-howto-complex-data-types). Valid values for a predefined normalizer include: </br></br>`standard`- Lowercases the text followed by asciifolding. </br>`lowercase`- Transforms characters to lowercase.  </br>`uppercase` - Transforms characters to uppercase. </br>`asciifolding` - Transforms characters that are not in the Basic Latin Unicode block to their ASCII equivalent, if one exists. For example, changing à to a.  </br>`elision`- Removes elision from beginning of the tokens.|
|synonymMaps|A list of the names of synonym maps to associate with this field. This attribute can be used only with searchable fields. Currently only one synonym map per field is supported. Assigning a synonym map to a field ensures that query terms targeting that field are expanded at query-time using the rules in the synonym map. This attribute can be changed on existing fields. Must be `null` or an empty collection for complex fields.|
|fields|A list of sub-fields if this is a field of type `Edm.ComplexType` or `Collection(Edm.ComplexType)`. Must be `null` or empty for simple fields. See [How to model complex data types in Azure Cognitive Search](/azure/search/search-howto-complex-data-types) for more information on how and when to use sub-fields.|

> [!NOTE]  
> Fields of type `Edm.String` that are filterable, sortable, or facetable can be at most 32 kilobytes in length. This is because values of such fields are treated as a single search term, and the maximum length of a term in Azure Cognitive Search is 32 kilobytes. If you need to store more text than this in a single string field, you will need to explicitly set filterable, sortable, and facetable to `false` in your index definition.
>
> Setting a field as searchable, filterable, sortable, or facetable has an impact on index size and query performance. Don't set those attributes on fields that are not meant to be referenced in query expressions.
>
> If a field is not set to be searchable, filterable, sortable, or facetable, the field can't be referenced in any query expression. This is useful for fields that are not used in queries, but are needed in search results.

<a name="normalizers"> </a>

### normalizers

Defines a [custom normalizer](/azure/search/search-normalizers) that has a user-defined combination of character filters and token filters. After defining a custom normalizer in the index, you can specify it by name on a [field definition](#fields).

|Attribute|Description|  
|---------------|-----------------|  
| name | Required. String field that specifies either a user-defined custom normalizer. |
| charFilters| Used in a custom normalizer. It can be one or more the [available character filters](/azure/search/index-add-custom-analyzers#character-filters) supported for use in a custom normalizer: </br>[mapping](https://lucene.apache.org/core/6_6_1/analyzers-common/org/apache/lucene/analysis/charfilter/MappingCharFilter.html)  </br>[pattern_replace](https://lucene.apache.org/core/6_6_1/analyzers-common/org/apache/lucene/analysis/pattern/PatternReplaceCharFilter.html) |
| tokenFilters | Used in a custom normalizer. It can be one or more of the [available token tilters](/azure/search/index-add-custom-analyzers#token-filters) supported for use in a custom normalizer: </br>[arabic_normalization](https://lucene.apache.org/core/6_6_1/analyzers-common/org/apache/lucene/analysis/ar/ArabicNormalizationFilter.html) </br>[asciifolding](https://lucene.apache.org/core/6_6_1/analyzers-common/org/apache/lucene/analysis/miscellaneous/ASCIIFoldingFilter.html) </br>[cjk_width](https://lucene.apache.org/core/6_6_1/analyzers-common/org/apache/lucene/analysis/cjk/CJKWidthFilter.html) </br>[elision](https://lucene.apache.org/core/6_6_1/analyzers-common/org/apache/lucene/analysis/util/ElisionFilter.html) </br>[german_normalization](https://lucene.apache.org/core/6_6_1/analyzers-common/org/apache/lucene/analysis/de/GermanNormalizationFilter.html) </br>[hindi_normalization](https://lucene.apache.org/core/6_6_1/analyzers-common/org/apache/lucene/analysis/hi/HindiNormalizationFilter.html) </br>[indic_normalization](https://lucene.apache.org/core/6_6_1/analyzers-common/org/apache/lucene/analysis/in/IndicNormalizationFilter.html) </br>[persian_normalization](https://lucene.apache.org/core/6_6_1/analyzers-common/org/apache/lucene/analysis/fa/PersianNormalizationFilter.html) </br>[scandinavian_normalization](https://lucene.apache.org/core/6_6_1/analyzers-common/org/apache/lucene/analysis/miscellaneous/ScandinavianNormalizationFilter.html) </br>[scandinavian_folding](https://lucene.apache.org/core/6_6_1/analyzers-common/org/apache/lucene/analysis/miscellaneous/ScandinavianFoldingFilter.html) </br>[sorani_normalization](https://lucene.apache.org/core/6_6_1/analyzers-common/org/apache/lucene/analysis/ckb/SoraniNormalizationFilter.html)  </br>[lowercase](https://lucene.apache.org/core/6_6_1/analyzers-common/org/apache/lucene/analysis/core/LowerCaseFilter.html) </br>[uppercase](https://lucene.apache.org/core/6_6_1/analyzers-common/org/apache/lucene/analysis/core/UpperCaseFilter.html)|

<a name="semantic"></a>

### semantic

A semantic configuration is a part of an index definition that's used to configure which fields will be utilized by semantic search for ranking, captions, highlights, and answers. Semantic configurations are made up of a title field, prioritized content fields, and prioritized keyword fields. At least one field needs to be specified between all three sub-properties (titleField, prioritizedKeywordsFields and prioritizedContentFields). Any field of type `Edm.String` or `Collection(Edm.String)` can be used as part of a semantic configuration.

To use semantic search, you must specify the name of a semantic configuration at query time. For more information, see [Create a semantic query](/azure/search/semantic-how-to-query-request).

 ```json
{
    "name": "hotels",  
    "fields": [ omitted for brevity ],
    "suggesters": [ omitted for brevity ],
    "analyzers": [ omitted for brevity ],
    "semantic": {
      "configurations": [
        {
          "name": "name of the semantic configuration",
          "prioritizedFields": {
            "titleField": {
                  "fieldName": "..."
                },
            "prioritizedContentFields": [
              {
                "fieldName": "..."
              },
              {
                "fieldName": "..."
              }
            ],
            "prioritizedKeywordsFields": [
              {
                "fieldName": "..."
              },
              {
                "fieldName": "..."
              }
            ]
          }
        }
      ]
    }
}
```

|Attribute|Description|  
|---------------|-----------------|  
|name|Required. The name of the semantic configuration.|  
|prioritizedFields|Required. Describes the title, content, and keyword fields to be used for semantic ranking, captions, highlights, and answers. At least one of the three sub-properties (titleField, prioritizedKeywordsFields and prioritizedContentFields) need to be set. | 
|prioritizedFields.titleField|Defines the title field to be used for semantic ranking, captions, highlights, and answers. If you don't have a title field in your index, leave this blank.| 
|prioritizedFields.prioritizedContentFields|Defines the content fields to be used for semantic ranking, captions, highlights, and answers. For the best result, the selected fields should contain text in natural language form. The order of the fields in the array represents their priority. Fields with lower priority may get truncated if the content is long.| 
|prioritizedFields.prioritizedKeywordsFields|Defines the keyword fields to be used for semantic ranking, captions, highlights, and answers. For the best result, the selected fields should contain a list of keywords. The order of the fields in the array represents their priority. Fields with lower priority may get truncated if the content is long.| 

<a name="suggesters"> </a>

### suggesters

Specifies a construct that stores prefixes for matching on partial queries like autocomplete and suggestions.

|Attribute|Description|  
|---------------|-----------------|  
|name| Required. The name of the suggester. |  
|sourceFields | Required. One or more string fields for which you are enabling autocomplete or suggested results.| 
|searchMode | Required, and always set to `analyzingInfixMatching`. It specifies that matching will occur on any term in the query string. |

## See also

+ [HTTP status codes](../http-status-codes.md)
+ [Add scoring profiles to a search index](/azure/search/index-add-scoring-profiles)
+ [Search Documents API](search-documents.md)
+ [Supported data types](../supported-data-types.md)
+ [Lexical analyzers](/azure/search/search-analyzers)
+ [Create an Azure Cognitive Search index in the portal](/azure/search/search-create-index-portal/)
+ [Create a semantic configuration](/azure/search/semantic-how-to-query-request)
