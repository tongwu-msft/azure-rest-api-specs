---
title: Update Skillset (REST api-version=2017-11-11-Preview) - Azure Search | Microsoft Docs
description: Modify an existing skillset. A skillset is a collection of cognitive skills that comprise an enrichment pipeline in Azure Search indexing.

ms.manager: cgronlun
author: luiscabrer
ms.author: luisca

services: search
ms.service: search
ms.devlang: rest-api
ms.workload: search
ms.topic: language-reference
ms.date: 06/21/2018
---
# Update Skillset (Azure Search Service REST API - Preview)

**Applies to:** api-version-2017-11-11-Preview

You can update an existing [skillset](create-skillset.md) using an HTTP PUT, specifying the name of the skillset to update on the request URI.

> [!NOTE]
> Skillsets are used in [cognitive search](https://docs.microsoft.com/azure/search/cognitive-search-concept-intro). Currently, this feature is in public preview and skillset execution is currently offered for free. Pricing for this capability will be announced at a later time.

```http  
PUT https://[servicename].search.windows.net/skillsets/[skillset name]?api-version=2017-11-11-Preview
api-key: [admin key]
Content-Type: application/json
```  

## Request  
 HTTPS is required for all service requests. The **Update Skillset** request can be constructed using a PUT method, with the skillset name as part of the URL. When the request is on a skillset that already exists, it is updated to the new definition. If the skillset doesn't exist, it is created. Notice that you can only PUT one skillset at a time.  

 The **api-version** is required. It is case-sensitive. The current preview version for cognitive search is `api-version=2017-11-11-Preview`. See [API versions in Azure Search](https://docs.microsoft.com/azure/search/search-api-versions) for details. 


### Request headers  

 The following table describes the required and optional request headers.  

|Request Header|Description|  
|--------------------|-----------------|  
|*Content-Type:*|Required. Set this to `application/json`|  
|*api-key:*|Required. The `api-key` is used to authenticate the request to your Search service. It is a string value, unique to your service. The **Create Skillset** request must include an `api-key` header set to your admin key (as opposed to a query key).|  

You also need the service name to construct the request URL. You can get both the service name and `api-key` from your service dashboard in the Azure portal. See [Create an Azure Search service in the portal](https://docs.microsoft.com/azure/search/search-create-service-portal) for page navigation help.  

### Request body syntax  

The body of the request contains the skillset definition, consisting of one or more fully specified skills, as well as optional name and description parameters.  

The syntax for structuring the request payload is as follows. A sample request is provided later in this article and also in [How to define a skillset](https://docs.microsoft.com/azure/search/cognitive-search-defining-skillset).  

```
{   
    "name" : "Required for POST, optional for PUT. Friendly name of the skillset",  
    "description" : "Optional. Anything you want, or null",  
    "Skills" : "Required. An array of skills. Each skill has an odata.type, name, input and output parameters",  
}  
```

### Request example
 The following example updates a skillset used for enriching a collection of financial documents.

```http
PUT https://[servicename].search.windows.net/skillsets/financedocenricher?api-version=2017-11-11-Preview
api-key: [admin key]
Content-Type: application/json
```

The body of request is a JSON document. This particular skillset uses two skills asynchronously, independently processing the substance of the `contents` as two different transformations. Alternatively, you can direct the output of one transformation to be the input of another. For more information, see [How to define a skillset](https://docs.microsoft.com/azure/search/cognitive-search-defining-skillset).

```json
{
  "name": "financedocenricher",
  "description": 
  "An updated version of a skillset used to extract sentiment from financial records, extract company names, and then find additional information about each company mentioned. This version changes the target names.",
  "skills":
  [
    {
      "@odata.type": "#Microsoft.Skills.Text.NamedEntityRecognitionSkill",
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
          "targetName": "companies"
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
          "targetName": "positivityscore"
        }
      ]
    },
  ]
}
```

## Response  

 For a successful request, you should see status code "201 Created".  

 By default, the response body will contain the JSON for the skillset definition that was created. However, if the Prefer request header is set to return=minimal, the response body will be empty, and the success status code will be "204 No Content" instead of "201 Created". This is true regardless of whether PUT or POST is used to create the skillset.   

## See also

+ [Cognitive search overview](https://docs.microsoft.com/azure/search/cognitive-search-concept-intro)
+ [Tutorial: Learn the cognitive search REST APIs](https://docs.microsoft.com/azure/search/cognitive-search-tutorial-blob)
+ [How to define a skillset](https://docs.microsoft.com/azure/search/cognitive-search-defining-skillset)
+ [How to map fields](https://docs.microsoft.com/azure/search/cognitive-search-output-field-mapping)
+ [How to define a custom interface](https://docs.microsoft.com/azure/search/cognitive-search-custom-skill-interface)
+ [Example: creating a custom skill](https://docs.microsoft.com/azure/search/cognitive-search-create-custom-skill-example)
+ [Predefined skills](https://docs.microsoft.com/azure/search/cognitive-search-predefined-skills)