---
title: "Add, Update or Delete Documents (Azure Cognitive Search REST API)"
description: Refresh content of an index by replacing, removing, or creating new documents.
ms.date: 03/05/2021

ms.service: cognitive-search
ms.topic: reference
ms.devlang: rest-api

author: bevloh
ms.author: beloh

---
# Add, Update or Delete Documents (Azure Cognitive Search REST API)

You can [import search documents](/azure/search/search-what-is-data-import) into a specified index using HTTP POST. For large numbers of updates, batching of documents (up to 1000 documents per batch, or about 16 MB per batch) is recommended and will significantly improve indexing performance.  

```http  
POST https://[service name].search.windows.net/indexes/[index name]/docs/index?api-version=[api-version]   
  Content-Type: application/json   
  api-key: [admin key]  
```  

For supported Azure data sources, [indexers](/azure/search/search-indexer-overview) offer a simpler alternative for adding and updating documents. For more information, see [Indexer operations](indexer-operations.md).  

## URI Parameters

| Parameter	  | Description  | 
|-------------|--------------|
| service name | Required. Set this to the unique, user-defined name of your search service. |
| index name  | Required on the URI, specifying which index to post documents. You can only post documents to one index at a time.  |
| api-version | Required. The current stable version is `api-version=2020-06-30`. See [API versions](search-service-api-versions.md) for more versions. |

## Request Headers

The following table describes the required and optional request headers.  

|Fields              |Description      |  
|--------------------|-----------------|  
|Content-Type|Required. Set this to `application/json`|  
|api-key|Required. A unique, system-generated string that authenticates the request to your search service. Uploading documents requires an admin API key. You can get keys from the Azure portal. For more information, see [Find existing keys](/azure/search/search-security-api-keys#find-existing-keys).| 

## Request Body

The body of the request contains one or more documents to be indexed. Documents are identified by a unique case-sensitive key. Each document is associated with an action: "upload", "delete", "merge", or "mergeOrUpload". Upload requests must include the document data as a set of key/value pairs.  

```json
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

| Property | Description |
|----------|-------------|
| @search.action | Required. Valid values are "upload", "delete", "merge", or "mergeOrUpload". Defaults to "upload". You can combine actions, one per document, in the same batch. </br></br>"upload": An upload action is similar to an 'upsert' where the document will be inserted if it is new and updated/replaced if it exists. All fields are replaced in the update case.  </br></br>"delete": Delete removes the specified document from the index. Any field you specify in a delete operation, other than the key field,  will be ignored. If you want to remove an individual field from a document, use `merge` instead and set the field explicitly to `null`. </br></br>"mergeOrUpload": This action behaves like merge if a document with the given key already exists in the index. If the document does not exist, it behaves like upload with a new document. </br></br>"merge": Merge updates an existing document with the specified fields. If the document doesn't exist, the merge will fail. Any field you specify in a merge will replace the existing field in the document. This also applies to collections of primitive and complex types. </br></br>In primitive collections, if the document contains a Tags field of type Collection(Edm.String) with a value of ["budget"], and you execute a merge with a value of ["economy", "pool"] for Tag, the final value of the Tags field will be ["economy", "pool"]. It will not be ["budget", "economy", "pool"]. </br></br>In complex collections, if the document contains a complex collection field named Rooms with a value of [{ "Type": "Budget Room", "BaseRate": 75.0 }], and you execute a merge with a value of [{ "Type": "Standard Room" }, { "Type": "Budget Room", "BaseRate": 60.5 }], the final value of the Rooms field will be [{ "Type": "Standard Room" }, { "Type": "Budget Room", "BaseRate": 60.5 }]. It will not be either of the following:</br>[{ "Type": "Budget Room", "BaseRate": 75.0 }, { "Type": "Standard Room" }, { "Type": "Budget Room", "BaseRate": 60.5 }] (append elements)</br>[{ "Type": "Standard Room", "BaseRate": 75.0 }, { "Type": "Budget Room", "BaseRate": 60.5 }] (merge elements in order, then append any extras) |
| key_field_name | Required. A field definition in the index that serves as the document key and contains only unique values. Document keys can only contain letters, numbers, dashes (`"-"`), underscores (`"_"`), and equal signs (`"="`) and are case-sensitive. For more information, see [Naming rules](naming-rules.md).  |
| field_name | Required. Name-value pairs, where the name of the field corresponds to a field name in the index definition. The value is user-defined but must be valid for the field type. |

## Response

Status code: 200 is returned for a successful response, meaning that all items have been stored durably and will start to be indexed. Indexing runs in the background and makes new documents available (that is, queryable and searchable) a few seconds after the indexing operation completed. The specific delay depends on the load on the service.

Successful indexing is indicated by the status property being set to true for all items, as well as the statusCode property being set to either 201 (for newly uploaded documents) or 200 (for merged or deleted documents):

```json
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

Status code: 207 is returned when at least one item was not successfully indexed. Items that have not been indexed have the status field set to false. The errorMessage and statusCode properties will indicate the reason for the indexing error:

```json
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
> If your client code frequently encounters a 207 response, one possible reason is that the system is under load. You can confirm this by checking the `statusCode` property for 503. If this is the case, we recommend throttling indexing requests. Otherwise, if indexing traffic doesn't subside, the system could start rejecting all requests with 503 errors.  

Status code: 429 indicates that you have exceeded your quota on the number of documents per index. You must either create a new index or upgrade for higher capacity limits.  

## Examples

**Example: Upload two fully-defined documents**

```json
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
> When you upload `DateTimeOffset` values with time zone information to your index, Azure Cognitive Search normalizes these values to UTC. For example, 2019-01-13T14:03:00-08:00 will be stored as 2019-01-13T22:03:00Z. If you need to store time zone information, you will need to add an extra column to your index.

## See also

+ [Azure Cognitive Search REST API](index.md)
+ [HTTP status codes &#40;Azure Cognitive Search&#41;](http-status-codes.md)
