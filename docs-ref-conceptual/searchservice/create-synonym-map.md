---
title: "Create Synonym Map (Azure Search Service REST API) | Microsoft Docs"
description: "A synonym map to expand or rewrite a search query can be created using REST API in Azure Search."
services: "Azure Search"
ms.custom: ""
ms.date: "2017-03-13"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "search"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "language-reference"
applies_to:
  - "Azure"
ms.assetid: 1c9399cf-e3f6-466f-8a00-73ea27ca18f8
caps.latest.revision: 22
author: "mhko"
ms.author: "nateko"
manager: "jhubbard"
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
# Create Synonym Map (Azure Search Service REST API)
> [!NOTE]  
> Synonyms is a preview feature and is not intended to be used in production code. Preview features are subject to change and are exempt from the service level agreement (SLA).

  In Azure Search, a synonym map contains a list of rules for expanding or rewriting a search query to equivalent terms. You can create a new synonym map within an Azure Search service using an HTTP POST request.

```  
POST https://[service name].search.windows.net/synonymmaps?api-version=[api-version]      
Content-Type: application/json  
api-key: [admin key]  
```  

 Alternatively, you can use PUT and specify the synonym map name on the URI. If the synonym map does not exist, it will be created.  

```  
PUT https://[service name].search.windows.net/synonymmaps/[synonymmap name]?api-version=[api-version]  
Content-Type: application/json  
api-key: [admin key]  
```  

  The maximum number of synonym maps allowed varies by pricing tier. Each rule can have up to 20 expansions.

|SKU|Maximum number of synonym maps|Maximum number of rules in a synonym map|  
|--------------------|-----------------|-----------------|
|Free|3|5000|
|Basic|3|10000|
|S1|5|10000|  
|S2|10|10000|  
|S3|20|10000|  
|S3 HD|20|10000|

## Request  
 HTTPS is required for all service requests. The **Create Synonym Map** request can be constructed using either a POST or PUT method. When using POST, you must provide a synonym map name in the request body along with the synonym map definition. With PUT, the name is part of the URL. If the synonym map doesn't exist, it is created. If it already exists, it is updated to the new definition.  

 The synonym map name must be lower case, start with a letter or number, have no slashes or dots, and be less than 128 characters. After starting the synonym map name with a letter or number, the rest of the name can include any letter, number and dashes, as long as the dashes are not consecutive. See [Naming rules &#40;Azure Search&#41;](naming-rules.md) for details.  

 The **api-version** is required. The current preview version is `2016-09-01-Preview`. See [API versions in Azure Search](https://go.microsoft.com/fwlink/?linkid=834796) for details.  

### Request Headers
 The following list describes the required and optional request headers.  

|Request Header|Description|  
|--------------------|-----------------|  
|*Content-Type:*|Required. Set this to `application/json`|  
|*api-key:*|Required. The `api-key` is used to authenticate the request to your Search service. It is a string value, unique to your service. The **Create Synonym Map** request must include an `api-key` header set to your admin key (as opposed to a query key).|  

 You will also need the service name to construct the request URL. You can get both the service name and `api-key` from your service dashboard in the [Azure portal](https://portal.azure.com). See [Create an Azure Search service in the portal](http://azure.microsoft.com/documentation/articles/search-create-service-portal/) for page navigation help.  

### Request Body Syntax  
 The body of the request contains a synonym map definition, which includes the format of the synonym map and the list of rules in the specified format.

 The syntax of the request payload is as follows. A sample request is provided further on in this topic.  

```  
{   
    "name" : "Required for POST, optional for PUT. The name of the synonym map",  
    "format" : "Required. Only Apache Solr format ('solr') is currently supported.",
    "synonyms" : "Required. Synonym rules separated by the new line ('\n') character."
}  

```  

 Request contains the following properties:  

|Property|Description|  
|--------------|-----------------|  
|`name`|Required. The name of the synonym map. A synonym map name must only contain lowercase letters, digits or dashes, cannot start or end with dashes and is limited to 128 characters.|  
|`format`|Required. Only Apache Solr format ('solr') is currently supported. If you have an existing synonym dictionary in a different format and want to use it directly, please let us know on [UserVoice](https://feedback.azure.com/forums/263029-azure-search).|  
|`synonyms`|Required. Synonym rules separated by the new line ('\n') character.|

#### Apache Solr synonym format

  The Apache Solr format supports equivalent and explicit synonym mappings.

  1. An equivalent mapping rule lists equivalent terms or phrases separated with commas.
  ```
  USA, United States, United States of America
  ```
  The rule expands the search to all equivalent terms. For example, the search query "USA" will be expanded to "USA" OR "United States" OR "United States of America".

  2. Explicit mapping is denoted by an arrow "=>". When specified, a term sequence of a search query that matches the left hand side of "=>" will be replaced with the alternatives on the right hand side.
  ```
  Washington, Wash., WA => WA
  ```
  Given the rule, the search queries "Washington", "Wash." or "WA" will all be rewritten to "WA". Explicit mapping only applies in the direction specified and does not rewrite the query "WA" to "Washington" in this case.

### Request Body Examples  

```  
{   
    "name" : "synonymmap1",  
    "format" : "solr",  
    "synonyms" : "United States, United States of America, USA\n
    Washington, Wash. => WA"
}  

```  

## Response  
 For a successful request: 201 Created.  

## See Also  
 [Azure Search Service REST](index.md)   
 [HTTP status codes &#40;Azure Search&#41;](http-status-codes.md)   
 [Synonym map operations &#40;Azure Search Service REST API&#41;](synonym-map-operations.md)   
 [Naming rules &#40;Azure Search&#41;](naming-rules.md)   
