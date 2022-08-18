---
title: "Create Index (Azure Cognitive Search REST API)"
description: Define an index schema for fields and other constructs in an Azure Cognitive Search index.
ms.date: 03/05/2021

ms.service: cognitive-search
ms.topic: reference
ms.devlang: rest-api

author: bevloh
ms.author: beloh
---
# Create Index (Azure Cognitive Search REST API)

An [index](/azure/search/search-what-is-an-index) is the primary means of organizing and searching documents in Azure Cognitive Search, similar to how a table organizes records in a database. Each index has a collection of documents that all conform to the index schema (field names, data types, and attributes), but indexes also specify additional constructs (suggesters, scoring profiles, and CORS configuration) that define other search behaviors.  

You can use either POST or PUT on the request. For either one, the JSON document in the request body provides the object definition.

```http
POST https://[servicename].search.windows.net/indexes?api-version=[api-version]  
  Content-Type: application/json
  api-key: [admin key]  
```  

Alternatively, you can use PUT and specify the index name on the URI. 

```http
PUT https://[servicename].search.windows.net/indexes/[index name]?api-version=[api-version]
  Content-Type: application/json
  api-key: [admin key]
```  

HTTPS is required for all service requests. If the index doesn't exist, it is created. If it already exists, it is updated to the new definition.

Creating an index establishes the schema and metadata. Populating the index is a separate operation. For this step, you can use an indexer (see [Indexer operations](indexer-operations.md), available for supported data sources) or an [Add, Update or Delete Documents](addupdate-or-delete-documents.md). The inverted indexes are generated when the documents are posted.  

> [!NOTE]  
> The maximum number of indexes that you can create varies by pricing tier. For more information, see [Service limits](/azure/search/search-limits-quotas-capacity).  

## URI Parameters

| Parameter      | Description  | 
|-------------|--------------|
| service name | Required. Set this to the unique, user-defined name of your search service. |
| index name  | Required on the URI if using PUT. The name must be lower case, start with a letter or number, have no slashes or dots, and be fewer than 128 characters. After starting the name with a letter or number, the rest of the name can include any letter, number and dashes, as long as the dashes are not consecutive.  |
| api-version | Required. The current stable version is `api-version=2020-06-30`. See [API versions](search-service-api-versions.md) for more versions.|

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
      "synonymMaps": [ "name_of_synonym_map" ] (optional, only one synonym map per field is currently supported),
      "fields" : [ ... ] (optional, a list of sub-fields if this is a field of type Edm.ComplexType or Collection(Edm.ComplexType). Must be null or empty for simple fields.)
    }
  "similarity": (optional) { },
  "suggesters": (optional) [ ... ],  
  "scoringProfiles": (optional) [ ... ],  
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
|[fields](#bkmk_indexAttrib)| Required. A collection of fields hat will be fed into this index, including name, data type, and attributes that define allowable actions on that field. Data types conform to the Entity Data Model (EDM). For more information, see [Supported data types](supported-data-types.md). There must be one field in the collection that is specified as the **key** field. It has to be a string field. This field represents the unique identifier, sometimes called the document ID, for each document stored with the index. Document keys are case-sensitive. For example, a document with the key "abc" is considered distinct from a document with the key "ABC". |
| similarity  | Optional. For services created before July 15, 2020, set this property to use the BM25 ranking algorithm. Valid values include `"#Microsoft.Azure.Search.ClassicSimilarity"` or `"#Microsoft.Azure.Search.BM25Similarity"`. API versions that support this property include 2020-06-30 and 2019-05-06-Preview. For more information, see [Ranking algorithms in Azure Cognitive Search](/azure/search/index-ranking-similarity).|
| suggesters| Optional. Used for autocompleted queries or suggested search results, one per index. It is a data structure that stores prefixes for matching on partial queries like autocomplete and suggestions. Consists of a `name` and suggester-aware fields that provide content for autocompleted queries and suggested results. `searchMode` is required, and always set to `analyzingInfixMatching`. It specifies that matching will occur on any term in the query string. |
| scoringProfiles | Optional. Used for custom search score ranking. Set `defaultScoringProfile` to use a custom profile as the default, invoked whenever a custom profile is not specified on the query string. For more information about elements, see [Add scoring profiles to a search index](/azure/search/index-add-scoring-profiles) and the example in the next section. |
| analyzers, charFilters, tokenizers, tokenFilters| Optional. Specify these sections of the index if you are defining [custom analyzers](/azure/search/index-add-custom-analyzers). By default, these sections are null. |  
| defaultScoringProfile | Optional. Name of a custom scoring profile that overwrites the default scoring behaviors. |
| corsOptions| Optional.  Client-side JavaScript cannot call any APIs by default since the browser will prevent all cross-origin requests. To allow cross-origin queries to your index, enable CORS (Cross-Origin Resource Sharing) by setting the corsOptions attribute. For security reasons, only query APIs support CORS. The `corsOptions` section includes: </br></br>`allowedOrigins` (Required) A comma-delimited list of origins that will be granted access to your index, where each origin is typically of the form protocol://\<fully-qualified-domain-name>:\<port> (although the \<port> is often omitted).  This means that any JavaScript code served from those origins will be allowed to query your index (assuming it provides the correct `api-key`). If you want to allow access to all origins, specify `*` as a single item in the `allowedOrigins` array. This is not recommended for production, but might be useful for development or debugging. </br></br>`maxAgeInSeconds` (Optional) Browsers use this value to determine the duration (in seconds) to cache CORS preflight responses. This must be a non-negative integer. The larger this value is, the better performance will be, but the longer it will take for CORS policy changes to take effect. If it is not set, a default duration of 5 minutes will be used.| 
|encryptionKey| Optional. Used to encrypt a synonym map, with your own keys, managed in your Azure Key Vault. Available for billable search services created on or after 2019-01-01. </br></br> An `encryptionKey` section contains a user-defined `keyVaultKeyName` (required), a system-generated `keyVaultKeyVersion` (required), and a `keyVaultUri` providing the key (required, also referred to as DNS name). An example URI might be "https://my-keyvault-name.vault.azure.net". </br></br>Optionally, you can specify `accessCredentials` if you are not using a managed system identity. Properties of `accessCredentials` include `applicationId` (Azure Active Directory Application ID that was granted access permissions to your specified Azure Key Vault), and `applicationSecret` (authentication key of the specified Azure AD application). An example in the next section illustrates the syntax. |

###  <a name="bkmk_indexAttrib"> Field definitions </a>

The following attributes can be set on a field when creating an index.  

|Attribute|Description|  
|---------------|-----------------|  
|name|Required. Sets the name of the field, which must be unique within the fields collection of the index or parent field.|  
|type|Required. Sets the data type for the field. Fields can be simple or complex. Simple fields are of primitive types, like `Edm.String` for text or `Edm.Int32` for integers. [Complex fields](/azure/search/search-howto-complex-data-types) can have sub-fields that are themselves either simple or complex. This allows you to model objects and arrays of objects, which in turn enables you to upload most JSON object structures to your index. See [Supported data types &#40;Azure Cognitive Search&#41;](supported-data-types.md) for the complete list of supported types.|  
|key|Required. Set this attribute to true to designate that a field's values uniquely identify documents in the index. The maximum length of values in a key field is 1024 characters. Exactly one top-level field in each index must be chosen as the key field and it must be of type `Edm.String`. Default is `false` for simple fields and `null` for complex fields. </br></br>Key fields can be used to look up documents directly and update or delete specific documents. The values of key fields are handled in a case-sensitive manner when looking up or indexing documents. See [Lookup Document &#40;Azure Cognitive Search REST API&#41;](lookup-document.md) and [Add, Update or Delete Documents &#40;Azure Cognitive Search REST API&#41;](addupdate-or-delete-documents.md) for details.|  
|retrievable| Indicates whether the field can be returned in a search result. Set this attribute to `false` if you want to use a field (for example, margin) as a filter, sorting, or scoring mechanism but do not want the field to be visible to the end user. This attribute must be `true` for key fields, and it must be `null` for complex fields. This attribute can be changed on existing fields. Setting retrievable to `true` does not cause any increase in index storage requirements. Default is `true` for simple fields and `null` for complex fields.|  
|searchable| Indicates whether the field is full-text searchable and can be referenced in search queries. This means it will undergo [lexical analysis](/azure/search/search-analyzers) such as word-breaking during indexing. If you set a searchable field to a value like "Sunny day", internally it will be normalized and split into the individual tokens \"sunny\" and \"day\". This enables full-text searches for these terms. Fields of type `Edm.String` or `Collection(Edm.String)` are searchable by default. This attribute must be `false` for simple fields of other non-string data types, and it must be `null` for complex fields. </br></br>A searchable field consumes extra space in your index since Azure Cognitive Search will process the contents of those fields and organize them in auxiliary data structures for performant searching. If you want to save space in your index and you don't need a field to be included in searches, set searchable to `false`. See [How full-text search works in Azure Cognitive Search](/azure/search/search-lucene-query-architecture) for details. |  
|filterable| Indicates whether to enable the field to be referenced in `$filter` queries. Filterable differs from searchable in how strings are handled. Fields of type `Edm.String` or `Collection(Edm.String)` that are filterable do not undergo lexical analysis, so comparisons are for exact matches only. For example, if you set such a field `f` to "Sunny day", `$filter=f eq 'sunny'` will find no matches, but `$filter=f eq 'Sunny day'` will. This attribute must be `null` for complex fields. Default is `true` for simple fields and `null` for complex fields. To reduce index size, set this attribute to `false` on fields that you won't be filtering on.|  
|sortable| Indicates whether to enable the field to be referenced in `$orderby` expressions. By default Azure Cognitive Search sorts results by score, but in many experiences users will want to sort by fields in the documents. A simple field can be sortable only if it is single-valued (it has a single value in the scope of the parent document). </br></br>Simple collection fields cannot be sortable, since they are multi-valued. Simple sub-fields of complex collections are also multi-valued, and therefore cannot be sortable. This is true whether it's an immediate parent field, or an ancestor field, that's the complex collection. Complex fields cannot be sortable and the sortable attribute must be `null` for such fields. The default for sortable is `true` for single-valued simple fields, `false` for multi-valued simple fields, and `null` for complex fields.|  
|facetable| Indicates whether to enable the field to be referenced in facet queries. Typically used in a presentation of search results that includes hit count by category (for example, search for digital cameras and see hits by brand, by megapixels, by price, and so on). This attribute must be `null` for complex fields. Fields of type `Edm.GeographyPoint` or `Collection(Edm.GeographyPoint)` cannot be facetable. Default is `true` for all other simple fields. To reduce index size, set this attribute to `false` on fields that you won't be faceting on. |
|analyzer|Sets the lexical analyzer for tokenizing strings during indexing and query operations. Valid values for this property include [language analyzers](/azure/search/index-add-language-analyzers), [built-in analyzers](/azure/search/index-add-custom-analyzers#built-in-analyzers), and [custom analyzers](/azure/search/index-add-custom-analyzers). The default is `standard.lucene`. This attribute can only be used with searchable string fields, and it can't be set together with either searchAnalyzer or indexAnalyzer. Once the analyzer is chosen and the field is created in the index, it cannot be changed for the field. Must be `null` for [complex fields](/azure/search/search-howto-complex-data-types). |  
|searchAnalyzer|Set this property in conjunction with indexAnalyzer to specify different lexical analyzers for indexing and queries. If you use this property, set analyzer to `null` and make sure indexAnalyzer is set to an allowed value. Valid values for this property include [built-in analyzers](/azure/search/index-add-custom-analyzers#built-in-analyzers) and [custom analyzers](/azure/search/index-add-custom-analyzers). This attribute can be used only with searchable fields. The search analyzer can be updated on an existing field since it is only used at query-time. Must be `null` for [complex fields](/azure/search/search-howto-complex-data-types).|
|indexAnalyzer|Set this property in conjunction with searchAnalyzer to specify different lexical analyzers for indexing and queries.  If you use this property, set analyzer to `null` and make sure searchAnalyzer is set to an allowed value. Valid values for this property include [built-in analyzers](/azure/search/index-add-custom-analyzers#built-in-analyzers) and [custom analyzers](/azure/search/index-add-custom-analyzers). This attribute can be used only with searchable fields. Once the index analyzer is chosen, it cannot be changed for the field. Must be `null` for [complex fields](/azure/search/search-howto-complex-data-types).|
|synonymMaps|A list of the names of synonym maps to associate with this field. This attribute can be used only with searchable fields. Currently only one synonym map per field is supported. Assigning a synonym map to a field ensures that query terms targeting that field are expanded at query-time using the rules in the synonym map. This attribute can be changed on existing fields. Must be `null` or an empty collection for complex fields.|
|fields|A list of sub-fields if this is a field of type `Edm.ComplexType` or `Collection(Edm.ComplexType)`. Must be `null` or empty for simple fields. See [How to model complex data types in Azure Cognitive Search](/azure/search/search-howto-complex-data-types) for more information on how and when to use sub-fields.|

> [!NOTE]  
> Fields of type `Edm.String` that are filterable, sortable, or facetable can be at most 32 kilobytes in length. This is because values of such fields are treated as a single search term, and the maximum length of a term in Azure Cognitive Search is 32 kilobytes. If you need to store more text than this in a single string field, you will need to explicitly set filterable, sortable, and facetable to `false` in your index definition.
>
> Setting a field as searchable, filterable, sortable, or facetable has an impact on index size and query performance. Don't set those attributes on fields that are not meant to be referenced in query expressions.
>
> If a field is not set to be searchable, filterable, sortable, or facetable, the field can't be referenced in any query expression. This is useful for fields that are not used in queries, but are needed in search results.

> [!NOTE]
> The maximum number of indexes you can create varies by pricing tier. For more information, see [Service limits](/azure/search/search-limits-quotas-capacity/).

## Response

 For a successful request, you should see status code "201 Created".  

 By default, the response body will contain the JSON for the index definition that was created. However, if the Prefer request header is set to return=minimal, the response body will be empty, and the success status code will be "204 No Content" instead of "201 Created". This is true regardless of whether PUT or POST is used to create the index.

## Examples

**Example: An index schema**

```json
{
  "name": "hotels",  
  "fields": [
    { "name": "HotelId", "type": "Edm.String", "key": true, "filterable": true },
    { "name": "HotelName", "type": "Edm.String", "searchable": true, "filterable": false, "sortable": true, "facetable": false },
    { "name": "Description", "type": "Edm.String", "searchable": true, "filterable": false, "sortable": false, "facetable": false, "analyzer": "en.microsoft" },
    { "name": "Description_fr", "type": "Edm.String", "searchable": true, "filterable": false, "sortable": false, "facetable": false, "analyzer": "fr.microsoft" },
    { "name": "Category", "type": "Edm.String", "searchable": true, "filterable": true, "sortable": true, "facetable": true },
    { "name": "Tags", "type": "Collection(Edm.String)", "searchable": true, "filterable": true, "sortable": false, "facetable": true, "analyzer": "tagsAnalyzer" },
    { "name": "ParkingIncluded", "type": "Edm.Boolean", "filterable": true, "sortable": true, "facetable": true },
    { "name": "LastRenovationDate", "type": "Edm.DateTimeOffset", "filterable": true, "sortable": true, "facetable": true },
    { "name": "Rating", "type": "Edm.Double", "filterable": true, "sortable": true, "facetable": true },
    { "name": "Address", "type": "Edm.ComplexType", 
      "fields": [
          { "name": "StreetAddress", "type": "Edm.String", "filterable": false, "sortable": false, "facetable": false, "searchable": true },
          { "name": "City", "type": "Edm.String", "searchable": true, "filterable": true, "sortable": true, "facetable": true },
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
          { "name": "Tags", "type": "Collection(Edm.String)", "searchable": true, "filterable": true, "facetable": true, "analyzer": "tagsAnalyzer" }
        ]
    }
  ],
  "suggesters": [
      { "name": "sg", "searchMode": "analyzingInfixMatching", "sourceFields": ["HotelName"] }
  ],
  "analyzers": [
    {
      "@odata.type": "#Microsoft.Azure.Search.CustomAnalyzer",
      "name": "tagsAnalyzer",
      "charFilters": [ "html_strip" ],
      "tokenizer": "standard_v2"
    }
  ]
}  
```

**Example: Suggesters**
 
 ```json
  "suggesters": [  
    {  
      "name": "name of suggester",  
      "searchMode": "analyzingInfixMatching",  
      "sourceFields": ["field1", "field2", ...]  
    }  
  ]
 ```

 A **suggester** is referenced by name on query requests that include either the [Suggestions API](suggestions.md) or [Autocomplete API](autocomplete.md), depending on whether you want to return a match or the remainder of a query term. For more information about creating and using a suggester, see [Create a suggester](/azure/search/index-add-suggesters).  

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
    "fields": [ omitted for brevity],
    "suggesters": [ omitted for brevity  ],
    "analyzers": [ omitted for brevity ],
    "corsOptions": (optional) {  
        "allowedOrigins": ["*"] | ["https://docs.microsoft.com:80", "https://azure.microsoft.com:80", ...],  
        "maxAgeInSeconds": (optional) max_age_in_seconds (non-negative integer)  
      }
}
```

**Example: Encryption keys**

Encryption keys are customer-managed keys used for additional encryption. For more information, see [Encryption using customer-managed keys in Azure Key Vault](/azure/search/search-security-manage-encryption-keys).

```json
{
    "name": "hotels",  
    "fields": [ omitted for brevity],
    "suggesters": [ omitted for brevity  ],
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

**Example: Scoring Profiles**

A scoring profile is a section of the schema that defines custom scoring behaviors that let you influence which documents appear higher in the search results. Scoring profiles are made up of field weights and functions. To use them, you specify a profile by name on the query string. For more information, see [Add scoring profiles to a search index](/azure/search/index-add-scoring-profiles) for details.   

 ```json
{
    "name": "hotels",  
    "fields": [ omitted for brevity],
    "suggesters": [ omitted for brevity  ],
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

## See also

+ [HTTP status codes](http-status-codes.md)
+ [Add scoring profiles to a search index](/azure/search/index-add-scoring-profiles)
+ [Search Documents API](search-documents.md)
+ [Supported data types](supported-data-types.md)
+ [Lexical analyzers](/azure/search/search-analyzers)
