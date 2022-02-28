---
title: "Create or Update Alias (Azure Cognitive Search REST API)"
description: Create an alias to define a secondary name that can be used to refer to an index for querying, indexing, and other operations.
ms.date: 03/01/2022

ms.service: cognitive-search
ms.topic: language-reference
ms.devlang: rest-api

author: dereklegenzoff
ms.author: delegenz
ms.manager: nitinme
---
# Create or Update Alias (Azure Cognitive Search REST API)

**API Version: 2021-04-30-Preview**

> [!Important]
> The entire API is a preview feature.

In Azure Cognitive Search, an alias is a secondary name that can be used to refer to an index for querying, indexing, and other operations. 

You can use either POST or PUT on a create request. For either one, the JSON document in the request body provides the object definition.

```http
POST https://[service name].search.windows.net/aliases?api-version=[api-version]      
  Content-Type: application/json  
  api-key: [admin key]  
```  

For update requests, use PUT and specify the alias name on the URI. 

```http
PUT https://[service name].search.windows.net/aliases/[alias name]?api-version=[api-version]  
  Content-Type: application/json  
  api-key: [admin key]  
```  

 HTTPS is required for all service requests. In the case of PUT, if the alias doesn't exist, it is created. If it already exists, it is updated to the new definition.

 > [!NOTE]  
> The maximum number of aliases that you can create varies by pricing tier. For more information, see [Service limits](/azure/search/search-limits-quotas-capacity).  

## URI Parameters

| Parameter	  | Description  | 
|-------------|--------------|
| service name | Required. Set this to the unique, user-defined name of your search service. |
| alias name  | Required on the URI if using PUT. The name must be lower case, start with a letter or number, have no slashes or dots, and be less than 128 characters. After starting the name with a letter or number, the rest of the name can include any letter, number and dashes, as long as the dashes are not consecutive. |
| api-version | Required. The current version is `api-version=2021-04-30-Preview`. See [API versions](../search-service-api-versions.md) for more versions.|

## Request Headers

 The following table describes the required and optional request headers.  

|Fields              |Description      |  
|--------------------|-----------------|  
|Content-Type|Required. Set this to `application/json`|  
|api-key|Required. The `api-key` is used to authenticate the request to your Search service. It is a string value, unique to your service. Create requests must include an `api-key` header set to your admin key (as opposed to a query key). You can [find the API key](/azure/search/search-security-api-keys#find-existing-keys) in your search service dashboard in the Azure portal.|  

## Request Body

The body of the request contains an alias definition, which includes the name of an alias and an array with the name of a single index.

The following JSON is a high-level representation of the main parts of the definition.

```json
{   
    "name" : (optional on PUT; required on POST) "The name of the alias",  
    "indexes" : (required) ["The name of the index the alias is mapped to"],
  } 
}  
```  

 Request contains the following properties:  

|Property|Description|  
|--------------|-----------------|  
|name|Required. The name of the alias. An alias name must only contain lowercase letters, digits or dashes, cannot start or end with dashes and is limited to 128 characters.|  
|indexes|Required. The name of the index the alias is mapped to. Only a single index name can be included in the array.|

## Response

For a successful request: 201 Created.  

## Examples

**Example: An index alias**

```json
{   
  "name" : "my-alias",  
  "indexes" : ["my-index"]
}  
```  

## See also  

+ [Aliases]()