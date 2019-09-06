---
title: "Create Index (Azure Search Service REST API) | Microsoft Docs"
description: Define an index schema for fields and other constructs in an Azure Search index.
ms.date: "09/04/2019"
services: search
ms.service: search
ms.topic: "language-reference"
author: "Brjohnstmsft"
ms.author: "brjohnst"
ms.manager: cgronlun
translation.priority.mt:
  - "de-de"
  - "es-es"
  - "fr-fr"
  - "it-it"
  - "ja-jp"
  - "ko-kr"
  - "pt-br"
  - "ru-ru"
  - "zh-cn"
  - "zh-tw"
---
# Create Index (Azure Search Service REST API)
  An [index](https://docs.microsoft.com/azure/search/search-what-is-an-index) is the primary means of organizing and searching documents in Azure Search, similar to how a table organizes records in a database. Each index has a collection of documents that all conform to the index schema (field names, data types, and attributes), but indexes also specify additional constructs (suggesters, scoring profiles, and CORS configuration) that define other search behaviors.  

 You can create a new index within an Azure Search service using an HTTP POST or PUT request. The body of the request is a JSON schema that specifies the index and configuration information.  

```  
POST https://[servicename].search.windows.net/indexes?api-version=[api-version]  
Content-Type: application/json   
api-key: [admin key]  
```  

 Alternatively, you can use PUT and specify the index name on the URI. If the index does not exist, it will be created.  

```  
PUT https://[servicename].search.windows.net/indexes/[index name]?api-version=[api-version]  
```  

 Creating an index establishes the schema and metadata. Populating the index is a separate operation. For this step, you can use an indexer (see [Indexer operations &#40;Azure Search Service REST API&#41;](indexer-operations.md), available for supported data sources) or an [Add, Update or Delete Documents &#40;Azure Search Service REST API&#41;](addupdate-or-delete-documents.md). The inverted index is generated when the documents are posted.  

> [!NOTE]  
>  The maximum number of indexes that you can create varies by pricing tier. The free service allows up to 3 indexes. Standard service allows 50 indexes per Search service. See [Service limits for Azure Search](https://azure.microsoft.com/documentation/articles/search-limits-quotas-capacity/) for details.  

## Request  
 HTTPS is required for all service requests. The **Create Index** request can be constructed using either a POST or PUT method. When using POST, provide an index name in the request body along with the index schema definition. With PUT, the index name is part of the URL. If the index doesn't exist, it is created. If it already exists, it is updated to the new definition. Notice that you can only POST or PUT one index at a time.  

 The index name must be lower case, start with a letter or number, have no slashes or dots, and be less than 128 characters. After starting the index name with a letter or number, the rest of the name can include any letter, number and dashes, as long as the dashes are not consecutive.  

 The **api-version** parameter is required. The current version is `api-version=2019-05-06`. See [API versions in Azure Search](https://docs.microsoft.com/azure/search/search-api-versions) for a list of available versions. See [Language support &#40;Azure Search Service REST API&#41;](https://docs.microsoft.com/azure/search/index-add-language-analyzers) for details about language analyzers.  

### Request Headers  
 The following table describes the required and optional request headers.  

|Request Header|Description|  
|--------------------|-----------------|  
|*Content-Type:*|Required. Set this to `application/json`|  
|*api-key:*|Required. The `api-key` is used to authenticate the request to your Search service. It is a string value, unique to your service. The **Create Index** request must include an `api-key` header set to your admin key (as opposed to a query key).|  

 You will also need the service name to construct the request URL. You can get both the service name and `api-key` from your service dashboard in the Azure classic portal. See [Create an Azure Search service in the portal](https://azure.microsoft.com/documentation/articles/search-create-service-portal/) for page navigation help.  

### Request Body Syntax  
 The body of the request contains a schema definition, which includes the list of data fields within documents that will be fed into this index.  

 Note that for a POST request, you must specify the index name in the request body.  

 There can only be one **key** field in the index. It has to be a string field. This field represents the unique identifier for each document stored with the index.  

 The main parts of an index include the following:  

-   **name**  

-   **fields** that will be fed into this index, including name, data type, and attributes that define allowable actions on that field.  

-   **suggesters** used for type-ahead queries.  

-   **scoringProfiles** used for custom search score ranking. See [Add scoring profiles to a search index &#40;Azure Search Service REST API&#41;](https://docs.microsoft.com/azure/search/index-add-scoring-profiles).  

-   **analyzers**, **charFilters**, **tokenizers**, **tokenFilters** used to define how your documents/queries are broken into indexable/searchable tokens. See [Lexical analysis in Azure Search](https://docs.microsoft.com/azure/search/search-analyzers) for details.

-   **defaultScoringProfile** used to overwrite the default scoring behaviors.  

-   **corsOptions** to allow cross-origin queries against your index.  

-   **encryptionKey** used to encrypt index data at rest with your own keys, managed in your Azure Key Vault. To learn more, see [Azure Search encryption using customer-managed keys in Azure Key Vault](https://docs.microsoft.com/azure/search/search-security-manage-encryption-keys).

 The syntax for structuring the request payload is as follows. A sample request is provided further on in this topic.  

```json
{  
  "name": (optional on PUT; required on POST) "name_of_index",  
  "fields": [  
    {  
      "name": "name_of_field",  
      "type": "Edm.String | Edm.Int32 | Edm.Int64 | Edm.Double | Edm.Boolean | Edm.DateTimeOffset | Edm.GeographyPoint | Edm.ComplexType | Collection(Edm.String) | Collection(Edm.Int32) | Collection(Edm.Int64) | Collection(Edm.Double) | Collection(Edm.Boolean) | Collection(Edm.DateTimeOffset) | Collection(Edm.GeographyPoint) | Collection(Edm.ComplexType)",  
      "searchable": true (default where applicable) | false (only Edm.String and Collection(Edm.String) fields can be searchable),  
      "filterable": true (default) | false,  
      "sortable": true (default where applicable) | false (Collection(Edm.String) fields cannot be sortable),  
      "facetable": true (default where applicable) | false (Edm.GeographyPoint fields cannot be facetable),  
      "key": true | false (default, only Edm.String fields can be keys),  
      "retrievable": true (default) | false,  
      "analyzer": "name_of_analyzer_for_search_and_indexing", (only if 'searchAnalyzer' and 'indexAnalyzer' are not set)
      "searchAnalyzer": "name_of_search_analyzer", (only if 'indexAnalyzer' is set and 'analyzer' is not set)
      "indexAnalyzer": "name_of_indexing_analyzer", (only if 'searchAnalyzer' is set and 'analyzer' is not set)
      "synonymMaps": [ "name_of_synonym_map" ] (optional, only one synonym map per field is currently supported),
      "fields" : [ ... ] (optional, a list of sub-fields if this is a field of type Edm.ComplexType or Collection(Edm.ComplexType). Must be null or empty for simple fields.)
    }  
  ],  
  "suggesters": [  
    {  
      "name": "name of suggester",  
      "searchMode": "analyzingInfixMatching" (other modes may be added in the future),  
      "sourceFields": ["field1", "field2", ...]  
    }  
  ],  
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
  ],  
  "analyzers":(optional)[ ... ],
  "charFilters":(optional)[ ... ],
  "tokenizers":(optional)[ ... ],
  "tokenFilters":(optional)[ ... ],
  "defaultScoringProfile": (optional) "...",  
  "corsOptions": (optional) {  
    "allowedOrigins": ["*"] | ["origin_1", "origin_2", ...],  
    "maxAgeInSeconds": (optional) max_age_in_seconds (non-negative integer)  
  },
  "encryptionKey":(optional) {
    "keyVaultKeyName": "name_of_azure_key_vault_key", (the name of your Azure Key Vault key to be used to encrypt your index data at rest),
    "keyVaultKeyVersion": "version_of_azure_key_vault_key", (the version of your Azure Key Vault key to be used to encrypt your index data at rest),
    "keyVaultUri": "azure_key_vault_uri", (the URI of your Azure Key Vault, also referred to as DNS name, that contains the key to be used to encrypt your index data at rest. An example URI might be https://my-keyvault-name.vault.azure.net)
    "accessCredentials": (optional, only if not using managed system identity) {
      "applicationId": "azure_active_directory_application_id", (an AAD Application ID that was granted the required access permissions to your specified Azure Key Vault)
      "applicationSecret": "azure_active_directory_application_authentication_key" (the authentication key of the specified AAD application)
    }
  }  
}  
```  

###  <a name="bkmk_indexAttrib"></a> Index Attributes  
 The following attributes can be set when creating an index.  

|Attribute|Description|  
|---------------|-----------------|  
|**name**|Required. Sets the name of the field, which must be unique within the fields collection of the index or parent field.|  
|**type**|Required. Sets the data type for the field. Fields can be simple or complex. Simple fields are of primitive types, like `Edm.String` for text or `Edm.Int32` for integers. [Complex fields](https://docs.microsoft.com/azure/search/search-howto-complex-data-types) can have sub-fields that are themselves either simple or complex. This allows you to model objects and arrays of objects, which in turn enables you to upload most JSON object structures to your index. See [Supported data types &#40;Azure Search&#41;](supported-data-types.md) for the complete list of supported types.|  
|**key**|Required. Set this attribute to true to designate that a field's values uniquely identify documents in the index. The maximum length of values in a key field is 1024 characters. Exactly one top-level field in each index must be chosen as the key field and it must be of type `Edm.String`. Default is `false` for simple fields and `null` for complex fields. Key fields can be used to look up documents directly and update or delete specific documents. See [Lookup Document &#40;Azure Search Service REST API&#41;](lookup-document.md) and [Add, Update or Delete Documents &#40;Azure Search Service REST API&#41;](addupdate-or-delete-documents.md) for details.|  
|**retrievable**| Indicates whether the field can be returned in a search result. Set this attribute to `false` if you want to use a field (for example, margin) as a filter, sorting, or scoring mechanism but do not want the field to be visible to the end user. This attribute must be `true` for **key** fields, and it must be `null` for complex fields. This attribute can be changed on existing fields. Setting **retrievable** to `true` does not cause any increase in index storage requirements. Default is `true` for simple fields and `null` for complex fields.|  
|**searchable**| Indicates whether the field is full-text searchable and can be referenced in search queries. This means it will undergo [lexical analysis](https://docs.microsoft.com/azure/search/search-analyzers) such as word-breaking during indexing. If you set a searchable field to a value like "Sunny day", internally it will be normalized and split into the individual tokens \"sunny\" and \"day\". This enables full-text searches for these terms. Fields of type `Edm.String` or `Collection(Edm.String)` are **searchable** by default. This attribute must be `false` for simple fields of other non-string data types, and it must be `null` for complex fields. **Note**: searchable fields consume extra space in your index since Azure Search will process the contents of those fields and organize them in auxiliary data structures for performant searching. If you want to save space in your index and you don't need a field to be included in searches, set **searchable** to `false`. See [How full-text search works in Azure Search](https://docs.microsoft.com/azure/search/search-lucene-query-architecture) for details. |  
|**filterable**| Indicates whether to enable the field to be referenced in `$filter` queries. **filterable** differs from **searchable** in how strings are handled. Fields of type `Edm.String` or `Collection(Edm.String)` that are filterable do not undergo lexical analysis, so comparisons are for exact matches only. For example, if you set such a field `f` to "Sunny day", `$filter=f eq 'sunny'` will find no matches, but `$filter=f eq 'Sunny day'` will. This attribute must be `null` for complex fields. Default is `true` for simple fields and `null` for complex fields. To reduce index size, set this attribute to `false` on fields that you won't be filtering on.|  
|**sortable**| Indicates whether to enable the field to be referenced in `$orderby` expressions. By default Azure Search sorts results by score, but in many experiences users will want to sort by fields in the documents. A simple field can be **sortable** only if it is single-valued (it has a single value in the scope of the parent document). Simple collection fields cannot be **sortable**, since they are multi-valued. Simple sub-fields of complex collections are also multi-valued, and therefore cannot be **sortable**. This is true whether it's an immediate parent field, or an ancestor field, that's the complex collection. Complex fields cannot be **sortable** and the **sortable** attribute must be `null` for such fields. The default for **sortable** is `true` for single-valued simple fields, `false` for multi-valued simple fields, and `null` for complex fields.|  
|**facetable**| Indicates whether to enable the field to be referenced in facet queries. Typically used in a presentation of search results that includes hit count by category (for example, search for digital cameras and see hits by brand, by megapixels, by price, and so on). This attribute must be `null` for complex fields. Fields of type `Edm.GeographyPoint` or `Collection(Edm.GeographyPoint)` cannot be **facetable**. Default is `true` for all other simple fields. To reduce index size, set this attribute to `false` on fields that you won't be faceting on. 
|**analyzer**|The name of the lexical analyzer to use for the field. The default is `Standard Lucene`. For the allowed set of values, see [Analyzers API](https://docs.microsoft.com/azure/search/search-analyzers). This attribute can be used only with **searchable** fields, and it can't be set together with either **searchAnalyzer** or **indexAnalyzer**. Once the analyzer is chosen, it cannot be changed for the field. Must be `null` for [complex fields](https://docs.microsoft.com/azure/search/search-howto-complex-data-types). |  
|**searchAnalyzer**|Overrides the **analyzer** property if you want to use a different analyzer on queries. If you set this property, change **analyzer** to `null` and also set **indexAnalyzer** to an allowed value. For a list of allowed values, see [Analyzers API](https://docs.microsoft.com/azure/search/search-analyzers). This attribute can be used only with **searchable** fields. For complex fields, it must be `null`. Technically, you can set this property on an existing field without having to rebuild the index (since it is only used at query-time). However, given the dependency on **indexAnalyzer**, an index rebuild is effectively required.|
|**indexAnalyzer**|Overrides the **analyzer** property if you want to use a different analyzer during indexing. If you set this property, change **analyzer** to `null` and also set **searchAnalyzer** to an allowed value. For a list of allowed values, see [Analyzers API](https://docs.microsoft.com/azure/search/search-analyzers). This attribute can be used only with **searchable** simple fields. For complex fields, it must be `null`. Once the index analyzer is chosen, it cannot be changed for the field. |
|**synonymMaps**|A list of the names of synonym maps to associate with this field. This attribute can be used only with **searchable** fields. Currently only one synonym map per field is supported. Assigning a synonym map to a field ensures that query terms targeting that field are expanded at query-time using the rules in the synonym map. This attribute can be changed on existing fields. Must be `null` or an empty collection for complex fields.|
|**fields**|A list of sub-fields if this is a field of type `Edm.ComplexType` or `Collection(Edm.ComplexType)`. Must be `null` or empty for simple fields. See [How to model complex data types in Azure Search](https://docs.microsoft.com/azure/search/search-howto-complex-data-types) for more information on how and when to use sub-fields.|

> [!NOTE]  
 Fields of type `Edm.String` that are **filterable**, **sortable**, or **facetable** can be at most 32 kilobytes in length. This is because values of such fields are treated as a single search term, and the maximum length of a term in Azure Search is 32 kilobytes. If you need to store more text than this in a single string field, you will need to explicitly set **filterable**, **sortable**, and **facetable** to `false` in your index definition. 
 
 > Setting a field as **searchable**, **filterable**, **sortable**, or **facetable**  has an impact on index size and query performance. Don't set those attributes on fields that are not meant to be refrerenced in query expressions.

> If a field is not set to be **searchable**, **filterable**, **sortable**, or **facetable**, the field can't be referenced in any query expression. This is useful for fields that are not used in queries, but are needed in search results.

> [!NOTE]
Index schemas are subject to the following limits (the values vary between different Azure Search SKUs, see [Service limits for Azure Search](https://azure.microsoft.com/documentation/articles/search-limits-quotas-capacity/) for details.): 
>- Maximum number of simple fields per index
>- Maximum depth of sub-fields per index (a top-level field is at depth 1, a sub-field of a top-level field is at depth 2, and so on)
>- Maximum number of complex colllections per index
>- Maximum number of elements across all complex collections per document

###  <a name="bkmk_suggester"></a> Suggesters  
 A `suggester` is a section of the schema that defines which fields in an index are used to support **Suggestions** or **Autocomplete** queries to power search-as-you-type experiences. The [Suggestions API &#40;Azure Search Service REST API&#41;](suggestions.md) returns __documents__ that match partial query terms as opposed to the [Autocomplete API &#40;Azure Search Service REST API&#41;](autocomplete.md) which returns completed __terms__ based on partial query terms. A **suggester** that you define in the index determines which fields are used to provide the suggestions for either the **Autocomplete** or **Suggestions** APIs. See [Suggesters](https://docs.microsoft.com/azure/search/index-add-suggesters) for configuration details and examples.  

###  <a name="bkmk_scoringprof"></a> Scoring Profiles  
 A scoring profile is a section of the schema that defines custom scoring behaviors that let you influence which documents appear higher in the search results. Scoring profiles are made up of field weights and functions. To use them, you specify a profile by name on the query string.  

 A default scoring profile operates behind the scenes to compute a search score for every item in a result set. You can use the internal, unnamed scoring profile. Alternatively, set **defaultScoringProfile** to use a custom profile as the default, invoked whenever a custom profile is not specified on the query string.  

 See [Add scoring profiles to a search index &#40;Azure Search Service REST API&#41;](https://docs.microsoft.com/azure/search/index-add-scoring-profiles) for details.  

###  <a name="bkmk_cors"></a> CORS Options  
 Client-side JavaScript cannot call any APIs by default since the browser will prevent all cross-origin requests. To allow cross-origin queries to your index, enable CORS (Cross-Origin Resource Sharing) by setting the **corsOptions** attribute. Note that for security reasons, only query APIs support CORS. The following options can be set for CORS:  

|||  
|-|-|  
|**allowedOrigins** (required):|This is a list of origins that will be granted access to your index. This means that any JavaScript code served from those origins will be allowed to query your index (assuming it provides the correct `api-key`). Each origin is typically of the form protocol://\<fully-qualified-domain-name>:\<port> although the \<port> is often omitted. See [Cross-origin resource sharing (Wikipedia)](https://en.wikipedia.org/wiki/Cross-origin_resource_sharing) for more details.<br /><br /> If you want to allow access to all origins, include \* as a single item in the **allowedOrigins** array. Note that **this is not recommended practice for production search services**. However, it may be useful for development or debugging purposes.|  
|**maxAgeInSeconds** (optional):|Browsers use this value to determine the duration (in seconds) to cache CORS preflight responses. This must be a non-negative integer. The larger this value is, the better performance will be, but the longer it will take for CORS policy changes to take effect. If it is not set, a default duration of 5 minutes will be used.|  

###  <a name="bkmk_encryption"></a> Encryption Key  
While all Azure search indexes are encrypted by default using [service-managed keys](https://docs.microsoft.com/azure/security/azure-security-encryption-atrest#data-encryption-models), indexes could also be configured to be encrypted with your own keys, managed in your Azure Key Vault. To learn more, see [Azure Search encryption using customer-managed keys in Azure Key Vault](https://docs.microsoft.com/azure/search/search-security-manage-encryption-keys). 

> [!NOTE]
> Encryption with customer-managed keys is a **preview** feature that is not available for free services. For paid services, it is only available for search services created on or after 2019-01-01, using the latest preview api-version (api-version=2019-05-06-Preview).

<a name="CreateUpdateIndexExample"></a>
### Request Body Example  
  See [Service limits for Azure Search](https://azure.microsoft.com/documentation/articles/search-limits-quotas-capacity/) and [Naming rules &#40;Azure Search&#41;](naming-rules.md) for information about index limits and allowable characters.  

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

## Response  
 For a successful request, you should see status code "201 Created".  

 By default, the response body will contain the JSON for the index definition that was created. However, if the Prefer request header is set to return=minimal, the response body will be empty, and the success status code will be "204 No Content" instead of "201 Created". This is true regardless of whether PUT or POST is used to create the index.   

## See also  
 + [HTTP status codes &#40;Azure Search&#41;](http-status-codes.md)   
 + [Add scoring profiles to a search index &#40;Azure Search Service REST API&#41;](https://docs.microsoft.com/azure/search/index-add-scoring-profiles)   
 + [Search Documents &#40;Azure Search Service REST API&#41;](search-documents.md)   
 + [Azure Search Service REST](index.md)   
 + [Supported data types &#40;Azure Search&#41;](supported-data-types.md)   
 + [Update Index &#40;Azure Search Service REST API&#41;](update-index.md)   
 + [Index operations &#40;Azure Search Service REST API&#41;](index-operations.md)   
 + [Lexical analyzers](https://docs.microsoft.com/azure/search/search-analyzers)
 + [API versions in Azure Search](https://docs.microsoft.com/azure/search/search-api-versions)   
 + [Azure Search .NET SDK](https://docs.microsoft.com/dotnet/api/overview/azure/search?view=azure-dotnet)   
 + [Create an Azure Search index in the portal](https://azure.microsoft.com/documentation/articles/search-create-index-portal/)  
