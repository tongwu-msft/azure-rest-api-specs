---
title: "Security Trimming with Azure Search"
description: Implement security trimming using Azure Search filter.
ms.custom: ""
ms.date: "2017-07-08"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "search"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "language-reference"
applies_to:
  - "Azure"
ms.assetid: 20217801-f1f7-49e2-badf-0ac356bf8975
caps.latest.revision: 26
author: "Revitalbarletz"
ms.author: "revitalb"
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

This article will walk you through the process of trimming documents for security purposes when search request is being issued. 

Use the built-in index designer in Azure portal to prototype or create a [search index](search-what-is-an-index.md) to run on your Azure Search service. 

## Prerequisites

This article assumes an [Azure subscription](https://azure.microsoft.com/pricing/free-trial/?WT.mc_id=A261C142F) and [Azure Search service](search-create-service-portal.md).  

## Find your search service

1. Sign in to the Azure portal page and review the [search services for your subscription](https://portal.azure.com/#blade/HubsExtension/BrowseResourceBlade/resourceType/Microsoft.Search%2FsearchServices)
2. Select your Azure Search service.

## Name the index

1. Click the **Add index** button in the command bar at the top of the page.
2. Name your Azure Search index. 
   * Start with a letter.
   * Use only lowercase letters, digits, or dashes ("-").
   * Limit the name to 60 characters.

  The index name becomes part of the endpoint URL used on connections to the index and for sending HTTP requests in the Azure Search REST API.

## Define the fields of your index

Index composition includes a *Fields collection* that defines the searchable data in your index. More specifically, it specifies the structure of documents that you upload separately. The Fields collection includes required and optional fields, named and typed, with index attributes to determine how the field can be used.

1. In the **Add Index** blade, click **Fields >** to slide open the field definition blade. 
2. Accept the generated *key* field of type Edm.String. By default, the field is named *id* but you can rename it as long as the string satisfies [naming rules](https://docs.microsoft.com/rest/api/searchservice/Naming-rules). A key field is mandatory for every Azure Search index and it must be a string.
3. Add fields to fully specify the documents you will upload. If documents consist of an *id*, *movie_name*, *movie_type*, *duration*, create a corresponding field for each one in the index.
4. Let's assume that the access to specific movies is limited, therefore we would like to restrict access by specifing the list of principal ids that are allowed to retrieve the movie as part of its search result.   
   For this purpose, add *principal_ids* field as a `Collection(Edm.String)`. Set the following attributes: 
   **Filterable** so that search results will be trimmed based on the access the user has. For example, if you set the *principal ids* field to "123, 456" for document with *movie name* "Karate Kid", only users with id equal to wither "123" or "456" will be retrieving the movie when issuing a search request.
   Make sure this field is not **Retrievable** so that it will not be returned as part of the search request.
5. When finished, click **OK** to save and create the index.

## Pushing data into your index using the REST API

In order to push documents into your index using the REST API, you will issue an HTTP POST request to your index's URL endpoint. The body of the HTTP request body is a JSON object containing the documents to be added, modified or deleted.
1. Click on the "Keys" icon, for the purposes of importing data into an index, you can use either your primary or secondary admin key.
2. In the URL, you will need to provide your service name, index name ("movies" in this case), as well as the proper API version (the current API version is `2016-09-01` at the time of publishing this document). You will need to define the `Content-Type` and `api-key` request headers. For the latter, use one of your service's admin keys.
   POST https://[search service].search.windows.net/indexes/movies/docs/index?api-version=2016-09-01
   Content-Type: application/json
   api-key: [admin key]
3. In the request body, you will specify the content of your documents.
```JSON
{
    "value": [
        {
            "@search.action": "upload",
            "id": "1",
            "movie_name": "Karate Kid 1",
            "movie_type": "Family",
            "duration": 126,
            "principal_ids": ["123", "456", "789"]
        },
        {
            "@search.action": "upload",
            "id": "2",
            "movie_name": "Karate Kid Part 2",
            "movie_type": "Family",
            "duration": 126,
            "principal_ids": ["123", "456", "789"]
        },
        {
            "@search.action": "upload",
            "id": "3",
            "movie_name": "The Karate Kid",
            "movie_type": "Drama",
            "duration": 140,
            "principal_ids": ["246", "369"]
        }
    ]
}
```
   If you need to update an existing document with the list of principals, use:
```JSON
{
    "value": [
        {
            "@search.action": "mergeOrUpload",
            "Id": "3",
            "principal_ids": ["123", "456", "789"]
        }
    ]
}
```

## Trimming documents based on user access.

   In order to trim documents based on principal_ids access, you shoud issue a search query with a `search.in(principal_ids, 'group_id1, group_id2,...')` filter, where 'group_id1, group_id2,...' are the groups that the search request issuer is part of.
   The `search.in` function will return all the documents that their principal_ids contain one of the following group_ids value.

### Retrieving groups ids

    If you manage groups membership in your organization, you can skip to Building the search request section.
    If you use [AAD](https://azure.microsoft.com/en-us/services/active-directory/), follow the next steps:
1.  Create a converged app in your tenant and register the app in your [Apps web page](https://apps.dev.microsoft.com)
2.  Go to Microsoft Graph Permissions section and add both 'User.Read' and 'Group.Read.All'
3.  Generate an MS token
> [!NOTE] 
>  You can use the following [Sample](https://github.com/Azure-Samples/active-directory-dotnet-desktop-msgraph-v2/blob/master/active-directory-wpf-nodejs-webapi-v2/MainWindow.xaml.cs) to generate tokens
>  Make sure the following properties exist in your token:
> 	"scp": "Group.Read.All User.Read"
>	"aud": "https://graph.microsoft.com"
4. Issue the [groups](https://developer.microsoft.com/en-us/graph/docs/api-reference/v1.0/api/group_list) request:
   GET https://graph.microsoft.com/v1.0/groups
   Content-type: application/json
   Authorization: Bearer MStoken
5. In the response body you will recieve the groups list:
```JSON
{
  "value": [
    {
      "id": "group_id",
      "description": "description-value",
      "displayName": "group_name",
      "groupTypes": [
        "groupTypes-value"
      ],
      "mail": "mail-value",
      "mailEnabled": true,
      "mailNickname": "mailNickname-value",
      "onPremisesLastSyncDateTime": "onPremisesLastSyncDateTime-value",
      "onPremisesSecurityIdentifier": "onPremisesSecurityIdentifier-value",
      "onPremisesSyncEnabled": true,
      "proxyAddresses": [
        "proxyAddresses-value"
      ],
      "securityEnabled": true,
      "visibility": "visibility-value"
    }
  ]
}``` 
   
### Composing the search request

    For full details on search documents in Azure Search you can read [Search Documents](search-documents.md).
    Note that this sample shows how to search documents using POST request, assuming the numer of groups ids is large.

    POST https://[service name].search.windows.net/indexes/[index name]/docs/search?api-version=[api-version]  
    Content-Type: application/json  
    api-key: [admin or query key]

```JSON
{
   "filter":"search.in(principal_ids, '123,456,789')" 
}``` 