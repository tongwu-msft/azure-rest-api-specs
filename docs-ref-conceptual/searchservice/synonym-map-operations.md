---
title: "Synonym Map Operations (Azure Cognitive Search REST API)"
description: "Synonym maps contain custom rules to expand or rewrite a search query in Azure Cognitive Search."
ms.date: "05/02/2019"

ms.service: cognitive-search
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
# Synonym Map Operations (Azure Cognitive Search REST API)

  In Azure Cognitive Search, developers can define custom rules to expand or rewrite a search query with equivalent terms. For example, in your application, the words "whirlpool", "jacuzzi" and "hot tub" may be equivalent and you want to have a rule that automatically expands the search when only one is searched for. The resource that contains the rules is called a synonym map. Synonym maps are service level resources and maintained independently from search indexes. Once a synonym map is uploaded, you can point any searchable field to the synonym map (one per field).

## Workflow  

  Setting up synonyms in your search application is a two-step process:

  1.	Add a synonym map to your search service. You can use the search service REST API to create and manage **synonym maps**. See the section below titled "Operations on synonym maps" for the supported operations and [Create Synonym Map](create-synonym-map.md) for the request body.

  2.	Configure a searchable field to use the synonym map in the index definition. A new field property **synonymMaps** specifies a synonym map to use for the field.

  For example, the index definition below configures the 'name' field to use the synonym map 'mysynonymmap'.
  ```http 
	POST https://[service name].search.windows.net/indexes?api-version=2019-05-06
	api-key: [admin key]

	{
	   "name":"myindex",
	   "fields":[
	      {
	         "name":"id",
	         "type":"Edm.String",
	         "key":true
	      },
	      {
	         "name":"name",
	         "type":"Edm.String",
	         "searchable":true,
	         "analyzer":"en.lucene",
	         "synonymMaps":[
	            "mysynonymmap"
	         ]
	      }
	   ]
	}
  ```

  You can update the **synonymMaps** properties of existing fields at any time.

## Operations on synonym maps  
 The REST API for **synonym maps** includes the operations shown in the following table.  

 [Create Synonym Map](create-synonym-map.md)  

```http   
POST https://[service name].search.windows.net/synonymmaps?api-version=[api-version]  
Content-Type: application/json  
api-key: [admin key]  
```  

```http   
PUT https://[service name].search.windows.net/synonymmaps/[synonymmap name]?api-version=[api-version]  
Content-Type: application/json  
api-key: [admin key]  
```  

 [Update Synonym Map](update-synonym-map.md)  

```http   
PUT https://[service name].search.windows.net/synonymmaps/[synonymmap name]?api-version=[api-version]  
Content-Type: application/json  
api-key: [admin key]  
```  

 [List Synonym Maps](list-synonym-maps.md)  

```http   
GET https://[service name].search.windows.net/synonymmaps?api-version=[api-version]  
api-key: [admin key]  
```  

 [Get Synonym Map](get-synonym-map.md)  

```http   
GET https://[service name].search.windows.net/synonymmaps/[synonymmap name]?api-version=[api-version]  
api-key: [admin key]  
```  

 [Delete Synonym Map](delete-synonym-map.md)  

```http   
DELETE https://[service name].search.windows.net/synonymmaps/[synonymmap name]?api-version=[api-version]  
api-key: [admin key]  
```  

## See also  
 [Azure Cognitive Search REST APIs](index.md)   
 [Language support &#40;Azure Cognitive Search REST API&#41;](https://docs.microsoft.com/azure/search/index-add-language-analyzers)
 [Custom Analyzers in Azure Cognitive Search &#40;Azure Cognitive Search REST API&#41;](https://docs.microsoft.com/azure/search/index-add-custom-analyzers)
