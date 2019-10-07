---
title: "Add, Update or Delete Documents (Azure Cognitive Search REST API)"
description: Refresh content of an index by replacing, removing, or creating new documents.
ms.date: "05/02/2019"
ms.service: search
ms.topic: "language-reference"
author: "Brjohnstmsft"
ms.author: "brjohnst"
ms.manager: nitinme
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
# Add, Update or Delete Documents (Azure Cognitive Search REST API)
You can [upload, merge or delete documents](https://docs.microsoft.com/azure/search/search-what-is-data-import) from a specified index using HTTP POST. For large numbers of updates, batching of documents (up to 1000 documents per batch, or about 16 MB per batch) is recommended and will significantly improve indexing performance.  

```  
POST https://[service name].search.windows.net/indexes/[index name]/docs/index?api-version=[api-version]   
Content-Type: application/json   
api-key: [admin key]  
```  

> [!NOTE]  
>  For supported data sources, [indexers](https://docs.microsoft.com/azure/search/search-indexer-overview) offer a different way to add and update documents in Azure Cognitive Search on an ad-hoc or scheduled basis. See [Indexer operations &#40;Azure Cognitive Search REST API&#41;](indexer-operations.md) for details.  

## Request  
HTTPS is required for all service requests. You can upload, merge, merge-or-upload, or delete documents from a specified index using HTTP POST.  

```
POST /indexes/[index name]/docs/index?api-version=[api-version]  
```

The request URI includes, `[index name]`, specifying which index to post documents. You can only post documents to one index at a time.  

The `api-version` parameter is required. The current version is `api-version=2019-05-06`. See [API versions in Azure Cognitive Search](https://docs.microsoft.com/azure/search/search-api-versions) for a list of available versions.  

### Request Headers  
The following table describes the required and optional request headers.  

|Request Header|Description|  
|--------------------|-----------------|  
|*Content-Type:*|Required. Set this to `application/json`|  
|*api-key:*|Required. The `api-key` is used to authenticate the request to your Search service. It is a string value, unique to your service. The **Add Documents** request must include an `api-key` header set to your admin key (as opposed to a query key).|  

You will also need the service name to construct the request URL. You can get the service name and `api-key` from your service dashboard in the Azure portal. See [Create an Azure Cognitive Search service in the portal](https://azure.microsoft.com/documentation/articles/search-create-service-portal/) for page navigation help.  

### Request Body  
The body of the request contains one or more documents to be indexed. Documents are identified by a unique key. Each document is associated with an action: upload, merge, mergeOrUpload, or delete. Upload requests must include the document data as a set of key/value pairs.  

> [!NOTE]  
>  Document keys can only contain letters, numbers, dashes ("-"), underscores ("_"), and equal signs ("="). For more information, see [Naming rules &#40;Azure Cognitive Search&#41;](naming-rules.md).  

```  
{  
  "value": [  
    {  
      "@search.action": "upload (default) | merge | mergeOrUpload | delete",  
      "key_field_name": "unique_key_of_document", (key/value pair for key field from index schema)  
      "field_name": field_value (key/value pairs matching index schema)  
        ...  
    },  
    ...  
  ]  
}  
```  

#### Document Actions  
You can combine actions, such as an **upload** and a **delete**, in the same batch.  

- **upload**: An upload action is similar to an "upsert" where the document will be inserted if it is new and updated/replaced if it exists. All fields are replaced in the update case.  

- **merge**: Merge updates an existing document with the specified fields. If the document doesn't exist, the merge will fail. Any field you specify in a merge will replace the existing field in the document. This also applies to collections of primitive and complex types.
  - Primitive collection example: If the document contains a field "Tags" of type `Collection(Edm.String)` with value `["budget"]`, and you execute a merge with value `["economy", "pool"]` for "Tags", the final value of the "Tags" field will be `["economy", "pool"]`. It will not be `["budget", "economy", "pool"]`.
  - Complex collection example: If the document contains a complex collection field named "Rooms" with value `[{ "Type": "Budget Room", "BaseRate": 75.0 }]`, and you execute a merge with value `[{ "Type": "Standard Room" }, { "Type": "Budget Room", "BaseRate": 60.5 }]`, the final value of the "Rooms" field will be `[{ "Type": "Standard Room" }, { "Type": "Budget Room", "BaseRate": 60.5 }]`. It will not be either of the following, for example:
    - `[{ "Type": "Budget Room", "BaseRate": 75.0 }, { "Type": "Standard Room" }, { "Type": "Budget Room", "BaseRate": 60.5 }]` (append elements)
    - `[{ "Type": "Standard Room", "BaseRate": 75.0 }, { "Type": "Budget Room", "BaseRate": 60.5 }]` (merge elements in order, then append any extras)

- **mergeOrUpload**: This action behaves like **merge** if a document with the given key already exists in the index. If the document does not exist, it behaves like **upload** with a new document.  

- **delete**: Delete removes the specified document from the index. Any field you specify in a delete operation, other than the **key** field,  will be ignored. If you want to remove an individual field from a document, use **merge** instead and set the field explicitly to `null`.  

### Response  
Status code: 200 is returned for a successful response, meaning that all items have been stored durably and will start to be indexed. Indexing runs in the background and makes new documents available (that is, queryable and searchable) a few seconds after the indexing operation completed. The specific delay depends on the load on the service.

Successful indexing is indicated by the `status` property being set to true for all items, as well as the `statusCode` property being set to either 201 (for newly uploaded documents) or 200 (for merged or deleted documents):

```
{
  "value": [
    {
      "key": "unique_key_of_new_document",
      "status": true,
      "errorMessage": null,
      "statusCode": 201
    },
    {
      "key": "unique_key_of_merged_document",
      "status": true,
      "errorMessage": null,
      "statusCode": 200
    },
    {
      "key": "unique_key_of_deleted_document",
      "status": true,
      "errorMessage": null,
      "statusCode": 200
    }
  ]
}  
```

Status code: 207 is returned when at least one item was not successfully indexed. Items that have not been indexed have the `status` field set to false. The `errorMessage` and `statusCode` properties will indicate the reason for the indexing error:

```
{
  "value": [
    {
      "key": "unique_key_of_document_1",
      "status": false,
      "errorMessage": "The search service is too busy to process this document. Please try again later.",
      "statusCode": 503
    },
    {
      "key": "unique_key_of_document_2",
      "status": false,
      "errorMessage": "Document not found.",
      "statusCode": 404
    },
    {
      "key": "unique_key_of_document_3",
      "status": false,
      "errorMessage": "Index is temporarily unavailable because it was updated with the 'allowIndexDowntime' flag set to 'true'. Please try again later.",
      "statusCode": 422
    }
  ]
}  
```

The errorMessage property will indicate the reason for the indexing error if possible.  

The following table explains the various per-document [status codes](http-status-codes.md) that can be returned in the response. Some status codes indicate problems with the request itself, while others indicate temporary error conditions. The latter you should retry after a delay.

|Status code|Meaning|Retryable|Notes|
|-----------|-------|---------|-----| 
|200|Document was successfully modified or deleted.|n/a|Delete operations are [idempotent](https://en.wikipedia.org/wiki/Idempotence). That is, even if a document key does not exist in the index, attempting a delete operation with that key will result in a 200 status code.|
|201|Document was successfully created.|n/a||
|400|There was an error in the document that prevented it from being indexed.|No|The error message in the response will indicate what is wrong with the document.|
|404|The document could not be merged because the given key doesn't exist in the index.|No|This error does not occur for uploads since they create new documents, and it does not occur for deletes because they are [idempotent](https://en.wikipedia.org/wiki/Idempotence).|
|409|A version conflict was detected when attempting to index a document.|Yes|This can happen when you're trying to index the same document more than once concurrently.|
|422|The index is temporarily unavailable because it was updated with the 'allowIndexDowntime' flag set to 'true'.|Yes||
|503|Your search service is temporarily unavailable, possibly due to heavy load.|Yes|Your code should wait before retrying in this case or you risk prolonging the service unavailability.|

> [!NOTE]  
>  If your client code frequently encounters a 207 response, one possible reason is that the system is under load. You can confirm this by checking the `statusCode` property for 503. If this is the case, we recommend throttling indexing requests. Otherwise, if indexing traffic doesn't subside, the system could start rejecting all requests with 503 errors.  

Status code: 429 indicates that you have exceeded your quota on the number of documents per index. You must either create a new index or upgrade for higher capacity limits.  

## Example  

```  
{
  "value": [
    {          
      "@search.action": "upload",  
      "HotelId": "1",
      "HotelName": "Secret Point Motel",
      "Description": "The hotel is ideally located on the main commercial artery of the city in the heart of New York.",
      "Category": "Boutique",
      "Tags": [ "pool", "air conditioning", "concierge" ],
      "ParkingIncluded": false,
      "LastRenovationDate": "1970-01-18T00:00:00Z",
      "Rating": 3.60,
      "Address": {
        "StreetAddress": "677 5th Ave",
        "City": "New York",
        "StateProvince": "NY",
        "PostalCode": "10022",
        "Country": "USA"
      },
      "Location": {
        "type": "Point",
        "coordinates": [ -73.975403, 40.760586 ]
      },
      "Rooms": [
        {
          "Description": "Budget Room, 1 Queen Bed (Cityside)",
          "Description_fr": "Chambre Économique, 1 grand lit (côté ville)",
          "Type": "Budget Room",
          "BaseRate": 96.99,
          "BedOptions": "1 Queen Bed",
          "SleepsCount": 2,
          "SmokingAllowed": true,
          "Tags": [ "vcr/dvd" ]
        },
        {
          "Description": "Budget Room, 1 King Bed (Mountain View)",
          "Description_fr": "Chambre Économique, 1 très grand lit (Mountain View)",
          "Type": "Budget Room",
          "BaseRate": 80.99,
          "BedOptions": "1 King Bed",
          "SleepsCount": 2,
          "SmokingAllowed": true,
          "Tags": [ "vcr/dvd", "jacuzzi tub" ]
        }
      ]  
    },
    {  
      "@search.action": "upload",  
      "HotelId": "2",
      "HotelName": "Twin Dome Motel",
      "Description": "The hotel is situated in a  nineteenth century plaza, which has been expanded and renovated to the highest architectural standards to create a modern, functional and first-class hotel in which art and unique historical elements coexist with the most modern comforts.",
      "Description_fr": "L'hôtel est situé dans une place du XIXe siècle, qui a été agrandie et rénovée aux plus hautes normes architecturales pour créer un hôtel moderne, fonctionnel et de première classe dans lequel l'art et les éléments historiques uniques coexistent avec le confort le plus moderne.",
      "Category": "Boutique",
      "Tags": [ "pool", "free wifi", "concierge" ],
      "ParkingIncluded": false,
      "LastRenovationDate": "1979-02-18T00:00:00Z",
      "Rating": 3.60,
      "Address": {
        "StreetAddress": "140 University Town Center Dr",
        "City": "Sarasota",
        "StateProvince": "FL",
        "PostalCode": "34243",
        "Country": "USA"
      },
      "Location": {
        "type": "Point",
        "coordinates": [ -82.452843, 27.384417 ]
      },
      "Rooms": [
        {
          "Description": "Suite, 2 Double Beds (Mountain View)",
          "Description_fr": "Suite, 2 lits doubles (vue sur la montagne)",
          "Type": "Suite",
          "BaseRate": 250.99,
          "BedOptions": "2 Double Beds",
          "SleepsCount": 2,
          "SmokingAllowed": false,
          "Tags": [ "Room Tags" ]
        }
      ]
    }, 
    {  
      "@search.action": "merge",  
      "HotelId": "3",  
      "Rating": 2.39,  
      "Description": "Surprisingly expensive",  
      "LastRenovationDate": null  
    },  
    {  
      "@search.action": "delete",  
      "hotelId": "4"  
    }  
  ]  
}  
```  

> [!NOTE]
> When you upload `DateTimeOffset` values with time zone information to your index, Azure Cognitive Search normalizes these values to UTC. For example, `2019-01-13T14:03:00-08:00` will be stored as `2019-01-13T22:03:00Z`. If you need to store time zone information, you will need to add an extra column to your index.

## See also  
 [Azure Cognitive Search REST API](index.md)   
 [HTTP status codes &#40;Azure Cognitive Search&#41;](http-status-codes.md)   
 [API versions in Azure Cognitive Search](https://docs.microsoft.com/azure/search/search-api-versions)   
 [Azure Cognitive Search .NET SDK](https://docs.microsoft.com/dotnet/api/overview/azure/search?view=azure-dotnet)  
