---
title: "Azure Search Service REST | Microsoft Docs"
description: REST API reference for Azure Search, used for non-managed code such as Java, JavaScript, node.js, Python, and any programming language compatible with REST.
ms.date: "04/20/2018"
services: search
ms.service: search
ms.topic: overview
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
service_description: To be added
---
# Azure Search Service REST

Azure Search is a fully managed cloud search service that provides a rich search experience to custom applications. One way to add search capability is through a REST API, with operations that create and manage indexes, load data, implement search features, execute queries, and handle results.

## Generally available and preview versions

**2017-11-11** is the most current generally available release of the Azure Search Service REST API. This version operates under an Azure service level agreement (SLA).  New features in this API version include:

  - [Synonyms](https://docs.microsoft.com/azure/search/search-synonyms). The new synonyms feature allows you to define equivalent terms and expand the scope of the query.
  - [Support for efficiently indexing text blobs](https://docs.microsoft.com/azure/search/search-howto-indexing-azure-blob-storage#IndexingPlainText). The new `text` parsing mode for Azure Blob indexers significantly improves indexing performance.
  - [Service Statistics API](get-service-statistics.md). View the current usage and limits of resources in Azure Search with this new API.

For details on how to upgrade from a previous GA version, see [Upgrading to the latest Azure Search Service REST API version](https://docs.microsoft.com/azure/search/search-api-migration).

**2017-11-11-Preview** is the most current preview version. Preview features include:

  -  [cognitive search](https://docs.microsoft.com/azure/search/cognitive-search-concept-intro) with new and updated REST APIs for enriching the indexing pipeline. [Create Skillset](create-skillset.md) specifies a collection of [predefined skills](https://docs.microsoft.com/azure/search/cognitive-search-predefined-skills) and [custom skills](https://docs.microsoft.com/azure/search/cognitive-search-create-custom-skill-example) that add natural language and image processing steps to indexing. [Create Indexer](create-indexer.md) called with `api-version=2017-11-11-Preview` adds a **skillSetName** element and **outputFieldMappings** for chaining inputs and outputs created through a skillset.

For the full list of preview features, see [Preview APIs](https://docs.microsoft.com/azure/search/search-api-preview).

## Key concepts

  Azure Search has the concepts of *search services* and *indexes* and *documents*, where a search service contains one or more indexes that provides persistent storage of searchable data, and data is loaded in the form of JSON documents. Data is typically pushed to an index from an external data source, but if you use an *indexer*, it's possible to crawl a data source to extract and load data into an index.  

 There are three types of operations that can be executed against the service:  

-   [Index management operations](index-operations.md). Create, delete, update, or configure a search index.  

-   [Document operations](document-operations.md). Add, update, or delete documents in the index, query the index, or look up specific documents by ID.  

-   [Indexer operations](indexer-operations.md). Automate aspects of an indexing operation by configuring a **data source** and an **indexer** that you can schedule or run on demand. This feature is supported for a limited number of data source types.  

 A separate REST API is provided for service administration, including provisioning the service or altering capacity. For more information, see [Azure Search Management REST](~/docs-ref-conceptual/searchmanagement/index.md).  

## Calling the APIs

 The APIs documented in this section provide access to operations on search data, such as index creation and population, document upload, and queries. When calling APIs, keep the following points in mind:  

-   All APIs must be issued over HTTPS (on the default port 443).  

-   Your search service is uniquely identified by a fully-qualified domain name (for example: \`mysearchservice.search.windows.net`).  

-   All API requests must include an **api-key** that was generated for the Search service you provisioned. Having a valid key establishes trust, on a per request basis, between the application sending the request and the service that handles it.

-   All API requests must include the **api-version** in the URI. Its value must be set to the version of the current service release, shown in the following example:  

     `GET https://[search service name].search.windows.net/indexes?api-version=2017-11-11`  

-   All API requests can optionally set the Accept HTTP header. If the header is not set, the default is assumed to be `application/json`.  

## Endpoint  
 The endpoint for service operations is the URL of the Azure Search service you provisioned: https://\<yourService>.search.windows.net.  

## Authentication and Authorization  
 Every HTTP request to your search service is authenticated based on two pieces of information: a Search service URL and an **api-key** that provides proof the request is from a trusted entity. There are  two types of **api-keys** for different levels of operation.  

|Key|Description|Limits|  
|---------|-----------------|------------|  
|Admin|Admin keys grant full rights to all operations, including the ability to manage the service, create and delete **indexes**, **indexers**, and **data sources**.<br /><br /> Two admin **api-keys**, referred to as *primary* and *secondary* keys in the portal, are generated when the service is created and can be individually regenerated on demand. Having two keys allows you to roll over one key while using the second key for continued access to the service.<br /><br /> Admin keys are only specified in HTTP request headers. You cannot place an admin **api-key** in a URL.|Maximum of 2 per service|  
|Query|Query keys grant read-only access to indexes and documents, and are typically distributed to client applications that issue search requests.<br /><br /> Query keys are created on demand. You can create them manually in the portal or programmatically via the [Management REST API](~/docs-ref-conceptual/searchmanagement/index.md).<br /><br /> Query keys can be specified  in an HTTP request header for search, suggestion, or lookup operation. Alternatively, you can pass a query key  as a parameter on a URL. Depending on how your client application formulates the request, it might be easier to pass the key as a query parameter:<br /><br /> `GET /indexes/hotels/docs?search=*&$orderby=lastRenovationDate desc&api-version=2017-11-11&api-key=[query key]`|50 per service|  

 Visually, there is no distinction between an admin key or query key. Both keys are strings composed of 32 randomly-generated alpha-numeric characters. If you lose track of what type of key is specified in your application, you can [check the key values in the portal](https://portal.azure.com) or use the [REST API](~/docs-ref-conceptual/searchmanagement/index.md) to return the value and key type.  

> [!NOTE]  
>  It is considered a poor security practice to pass sensitive data such as an `api-key` in the request URI. For this reason, Azure Search will only accept a query key as an `api-key` in the query string, and you should avoid doing so unless the contents of your index should be publicly available. As a general rule, we recommend passing your `api-key` as a request header.  

 **Authorization in Azure Search**  

 Authorization is available for administrative operations via the role-based access controls (RBAC) provided in the Azure portal. RBAC roles are used to set levels of access for service administration in a way that is consistent across all services. For example, viewing sensitive data, such as the admin key, is restricted to the Owner and Contributor roles, whereas viewing service status is available to members of any role.  

 For its own search-centric operations, Azure Search does not provide an authorization model. However, if you have the ability to load an index with document and user associations, you can filter search results based on user identity. For more information, see [Security filters for trimming results in Azure Search](https://docs.microsoft.com/azure/search/search-security-trimming-for-azure-search).

## Azure Search Operations  
 Azure Search service API supports two URL syntaxes for API operations: [Simple query syntax in Azure Search](simple-query-syntax-in-azure-search.md) and OData syntax (see [Support for OData &#40;Azure Search&#41;](support-for-odata.md) for details). The following list shows the simple syntax  

-   [Create Index &#40;Azure Search Service REST API&#41;](create-index.md)  

    ```  
    POST /indexes?api-version=2017-11-11  
    ```  

-   [Update Index &#40;Azure Search Service REST API&#41;](update-index.md)  

    ```  
    PUT /indexes/[index name]?api-version=2017-11-11  
    ```  

-   [Get Index &#40;Azure Search Service REST API&#41;](get-index.md)  

    ```  
    GET /indexes/[index name]?api-version=2017-11-11  
    ```  

-   [List Indexes &#40;Azure Search Service REST API&#41;](list-indexes.md)  

    ```  
    GET /indexes?api-version=2017-11-11  
    ```  

-   [Get Index Statistics &#40;Azure Search Service REST API&#41;](get-index-statistics.md)  

    ```  
    GET /indexes/[index name]/stats?api-version=2017-11-11  
    ```  
-  [Test Analyzer](test-analyzer.md)

    ```
    POST /indexes/[index name]/analyze?api-version=2017-11-11
    ```  

-   [Delete Index &#40;Azure Search Service REST API&#41;](delete-index.md)  

    ```  
    DELETE /indexes/[index name]?api-version=2017-11-11  
    ```  

-   [Add, Update or Delete Documents &#40;Azure Search Service REST API&#41;](addupdate-or-delete-documents.md)  

    ```  
    POST /indexes/[index name]/docs/index?api-version=2017-11-11  
    ```  

-   [Search Documents &#40;Azure Search Service REST API&#41;](search-documents.md)  

    ```  
    GET /indexes/[index name]/docs?[query parameters]  
    ```  

    ```  
    POST /indexes/[index name]/docs/search?api-version=2017-11-11  
    ```  

-   [Lookup Document &#40;Azure Search Service REST API&#41;](lookup-document.md)  

    ```  
    GET /indexes/[index name]/docs/[key]?[query parameters]  
    ```  

-   [Count Documents &#40;Azure Search Service REST API&#41;](count-documents.md)  

    ```  
    GET /indexes/[index name]/docs/$count?api-version=2017-11-11  
    ```  

-   [Suggestions &#40;Azure Search Service REST API&#41;](suggestions.md)  

    ```  
    GET /indexes/[index name]/docs/suggest?[query parameters]  
    ```  

    ```  
    POST /indexes/[index name]/docs/suggest?api-version=2017-11-11  
    ```  


 To create the service, see [Create an Azure Search service](https://docs.microsoft.com/azure/search/search-create-service-portal). followed by [How to build a .NET application with Azure Search](https://docs.microsoft.com/azure/search/search-howto-dotnet-sdk).  

## See also  
 [Azure Search: tutorials, video demos, and samples](https://docs.microsoft.com/azure/search/search-video-demo-tutorial-list)     
 [Supported data types &#40;Azure Search&#41;](supported-data-types.md)   
 [Create an Azure Search service](https://docs.microsoft.com/azure/search/search-create-service-portal)   
 [Pricing Details](http://https://docs.microsoft.com/azure/search/search-api-versions.com/fwlink/?LinkId=509792)   
 [Manage your search service on Microsoft Azure](http://https://docs.microsoft.com/azure/search/search-api-versions.com/fwlink/?LinkId=509793)   
 [Naming rules &#40;Azure Search&#41;](naming-rules.md)   
 [Common HTTP request and response headers used in Azure Search](common-http-request-and-response-headers-used-in-azure-search.md)   
 [Azure Search Management REST](~/docs-ref-conceptual/searchmanagement/index.md)
 [Azure Search .NET SDK](https://docs.microsoft.com/dotnet/api/overview/azure/search?view=azure-dotnet)  
