---
title: "Azure Search Service REST"
ms.custom: ""
ms.date: "2016-11-10"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "search"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "language-reference"
ms.assetid: b298ac63-7b92-48cd-afe2-828538c47ca9
caps.latest.revision: 57
author: "Brjohnstmsft"
ms.author: "brjohnst"
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
# Azure Search Service REST
  Azure Search is a cloud-based service that you can use to build custom search applications. Azure Search has the concepts of *search services* and *indexes*, where a search service contains one or more indexes. Your search service is uniquely identified by a fully-qualified domain name (for example: \`mysearchservice.search.windows.net`). An api-key is generated when the service is provisioned, and is used to authenticate requests to your Azure Search service.  

 There are three types of operations that can be executed against the Azure Search Service:  

-   [Index management operations](index-operations.md). Create, delete, update, or configure a search index.  

-   [Document operations](document-operations.md).  Add, update, or delete documents in the index, query the index, or look up specific documents by ID.  

-   [Indexer operations](indexer-operations.md). Automate aspects of an indexing operation by configuring a **data source** and an **indexer** that you can schedule or run on demand. This feature is supported for a limited number of data source types.  

 A separate API is provided for service administration. Examples of service administration operations include provisioning the service or altering capacity. For more information about this API, see [Azure Search Management REST](~/documentation/searchmanagement/index.md).  

 The APIs documented in this section provide access to operations on search data, such as index creation and population, document upload, and queries. When calling the API, keep the following points in mind:  

-   All APIs must be issued over HTTPS (on the default port 443).  

-   All API requests must include an **api-key** that was generated for the Search service you provisioned. Having a valid key establishes trust, on a per request basis,  between the application sending the request and the service that handles it.  

-   All API requests must include the **api-version** in the URI. Its value must be set to the version of the current service release, shown in the following example:  

     `GET https://[search service name].search.windows.net/indexes?api-version=2015-02-28`  

-   All API requests can optionally set the Accept HTTP header. If is not set, the default is assumed to be `application/json`.  

## Endpoint  
 The endpoint for service operations is the URL of the Azure Search service you provisioned: https://\<yourService>.search.windows.net.  

## Versions  
 `api-version=2015-02-28` is the general release version. This version operates under an Azure service level agreement (SLA).  

 Preview versions of the REST API are used to collect community feedback on new features before  adding them to the general release. See [API versions in Azure Search](https://go.microsoft.com/fwlink/?linkid=834796) for details.  

## Authentication and Authorization  
 Every HTTP request to your search service is authenticated based on two pieces of information: a Search service URL and an **api-key** that provides proof  the request is from a valid source. There are  two types of **api-keys** for different levels of operation.  

|Key|Description|Limits|  
|---------|-----------------|------------|  
|Admin|Admin keys grant full rights to all operations, including the ability to manage the service, create and delete **indexes**, **indexers**, and **data sources**.<br /><br /> Two admin **api-keys**, referred to as *primary* and *secondary* keys in the portal,  are generated when the service is created and can be individually regenerated on demand. Having two keys allows you to roll over one key while using the second key for continued access to the service.<br /><br /> Admin keys are only specified in HTTP request headers. You cannot place an admin **api-key** in a URL.|Maximum of 2 per service|  
|Query|Query keys grant read-only access to indexes and documents, and are typically distributed to client applications that issue search requests.<br /><br /> Query keys are created on demand. You can create them manually in the portal or programmatically via the [Management REST API](~/documentation/searchmanagement/index.md).<br /><br /> Query keys can be specified  in an HTTP request header for search, suggestion, or lookup operation. Alternatively, you can pass a query key  as a parameter on a URL. Depending on how your client application formulates the request, it might be easier to pass the key as a query parameter:<br /><br /> `GET /indexes/hotels/docs?search=*&$orderby=lastRenovationDate desc&api-version=2015-02-28&api-key=A8DA81E03F809FE166ADDB183E9ED84D`|50 per service|  

 Visually, there is no distinction between an admin key or query key. Both keys are strings composed of 32 randomly-generated alpha-numeric characters. If you lose track of what type of key is specified in your application, you can [check the key values in the portal](https://portal.azure.com) or use the [REST API](~/documentation/searchmanagement/index.md) to return the value and key type.  

> [!NOTE]  
>  It is considered a poor security practice to pass sensitive data such as an `api-key` in the request URI. For this reason, Azure Search will only accept a query key as an `api-key` in the query string, and you should avoid doing so unless the contents of your index should be publicly available. As a general rule, we recommend passing your `api-key` as a request header.  

 **Authorization in Azure Search**  

 Authorization is available for administrative operations via the role-based access controls (RBAC) provided in the Azure Preview Portal. RBAC roles are used to set levels of access for service administration in a way that is consistent across all services. For example, viewing sensitive data, such as the admin key, is restricted to the Owner and Contributor roles, whereas viewing service status is available to members of any role.  

 For its own search-centric operations, Azure Search does not provide an authorization model. You cannot define or assign roles that filter search results based on user identity, nor can you vary the level of permissions on search operations beyond what's provided via the admin and query **api-keys**.  

## Azure Search Operations  
 Azure Search service API supports two URL syntaxes for API operations: [Simple query syntax in Azure Search](simple-query-syntax-in-azure-search.md) and OData syntax (see [Support for OData &#40;Azure Search&#41;](support-for-odata.md) for details). The following list shows the simple syntax  

-   [Create Index &#40;Azure Search Service REST API&#41;](create-index.md)  

    ```  
    POST /indexes?api-version=2015-02-28  
    ```  

-   [Update Index &#40;Azure Search Service REST API&#41;](update-index.md)  

    ```  
    PUT /indexes/[index name]?api-version=2015-02-28  
    ```  

-   [Get Index &#40;Azure Search Service REST API&#41;](get-index.md)  

    ```  
    GET /indexes/[index name]?api-version=2015-02-28  
    ```  

-   [List Indexes &#40;Azure Search Service REST API&#41;](list-indexes.md)  

    ```  
    GET /indexes?api-version=2015-02-28  
    ```  

-   [Get Index Statistics &#40;Azure Search Service REST API&#41;](get-index-statistics.md)  

    ```  
    GET /indexes/[index name]/stats?api-version=2015-02-28  
    ```  

-   [Delete Index &#40;Azure Search Service REST API&#41;](delete-index.md)  

    ```  
    DELETE /indexes/[index name]?api-version=2015-02-28  
    ```  

-   [Add, Update or Delete Documents &#40;Azure Search Service REST API&#41;](addupdate-or-delete-documents.md)  

    ```  
    POST /indexes/[index name]/docs/index?api-version=2015-02-28  
    ```  

-   [Search Documents &#40;Azure Search Service REST API&#41;](search-documents.md)  

    ```  
    GET /indexes/[index name]/docs?[query parameters]  
    ```  

    ```  
    POST /indexes/[index name]/docs/search?api-version=2015-02-28  
    ```  

-   [Lookup Document &#40;Azure Search Service REST API&#41;](lookup-document.md)  

    ```  
    GET /indexes/[index name]/docs/[key]?[query parameters]  
    ```  

-   [Count Documents &#40;Azure Search Service REST API&#41;](count-documents.md)  

    ```  
    GET /indexes/[index name]/docs/$count?api-version=2015-02-28  
    ```  

-   [Suggestions &#40;Azure Search Service REST API&#41;](suggestions.md)  

    ```  
    GET /indexes/[index name]/docs/suggest?[query parameters]  
    ```  

    ```  
    POST /indexes/[index name]/docs/suggest?api-version=2015-02-28  
    ```  


 To create the service, see [Create an Azure Search service](http://azure.microsoft.com/documentation/articles/search-create-service-portal/). followed by [How to build a .NET application with Azure Search](http://azure.microsoft.com/documentation/articles/search-howto-dotnet-sdk/).  

## See Also  
 [Azure Search: tutorials, video demos, and samples](http://azure.microsoft.com/documentation/articles/search-video-demo-tutorial-list/)     
 [Supported data types &#40;Azure Search&#41;](supported-data-types.md)   
 [Create an Azure Search service](http://azure.microsoft.com/documentation/articles/search-create-service-portal/)   
 [Pricing Details](http://go.microsoft.com/fwlink/?LinkId=509792)   
 [Manage your search service on Microsoft Azure](http://go.microsoft.com/fwlink/?LinkId=509793)   
 [Naming rules &#40;Azure Search&#41;](naming-rules.md)   
 [Common HTTP request and response headers used in Azure Search](common-http-request-and-response-headers-used-in-azure-search.md)   
 [Azure Search Management REST](~/documentation/searchmanagement/index.md)
 [Azure Search .NET SDK](https://msdn.microsoft.com/library/azure/dn951165.aspx)  
