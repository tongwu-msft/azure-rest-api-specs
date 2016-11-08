---
ms.assetid: 3eecf9e7-e2dc-4ada-9a8e-ca7513a54da9
ms.title: Azure Data Catalog
ms.service: data-catalog
author: steved0x
ms.author: sdanie
ms.manager: douge
---


# Azure Data Catalog

The Data Catalog REST API is a REST-based API that provides programmatic access to Data Catalog resources to register, annotate and search data assets programmatically. **Azure Data Catalog** is a cloud-based service that you can use to register and discover enterprise data assets. The service gives you capabilities that enable any user, from analysts to data scientists to developers, to register, discover, understand, and consume data assets.  
  
To perform operations on Data Catalog resources, you send HTTP requests with a supported method: GET, POST, PUT, or DELETE to an endpoint that targets a resource collection or a specific resource. A Data Catalog operation requires an Azure Active Directory (AAD) access token.  
  
The Data Catalog REST API has the following operations:  
  
-   Register data asset operations: [Register Data Asset](../AzureDataCatalogREST/Register-Data-Asset.md), [Delete Data Asset](https://msdn.microsoft.com/library/mt267568.aspx), and [Search Data Asset](https://msdn.microsoft.com/library/mt267569.aspx).  
-   Annotate data asset operations: [Annotate Data Asset](../AzureDataCatalogREST/Annotate-Data-Asset.md), [Update Annotation](../AzureDataCatalogREST/Update-Annotation.md), [Get Data Asset with Annotations](https://msdn.microsoft.com/library/mt267562.aspx), and [Delete Annotation](../AzureDataCatalogREST/Delete-Annotation.md).  
  
The Data Catalog has a Search query syntax:  
  
-   [Search data assets](../AzureDataCatalogREST/Data-Catalog-Search-syntax-reference.md)  
  
To learn the types of assets and annotations supported in **Data Catalog**, see   
  
## Search syntax reference  
**Azure Data Catalog** is a fully managed service hosted in Microsoft Azure that serves as a system of registration and system of discovery for enterprise data sources. **Azure Data Catalog** has capabilities that enable technical and non-technical users to discover, understand, and consume data sources.  
  
To learn more, see [Data Catalog Search syntax reference](./Data-Catalog-Search-syntax-reference.md).  
  

## REST Operation Groups

| Resource Groups                                            | Description                                                              |
|------------------------------------------------------------|--------------------------------------------------------------------------|
| [Data Catalog](./data-catalog-data-catalog.md)             | Provides operations for creating and managing data catalogs.             |
| [Data Asset](./data-catalog-data-asset.md)                 | Provides operations for working with data assets and annotations.        |
| [Custom Data Source](./data-catalog-custom-data-source.md) | Provides operations for registering and enumerating custom data sources. |
| [Glossary](./data-catalog-glossary.md)                     | Provides operations for managing glossary terms.                         |


## See Also

- [Azure Data Catalog documentation](https://azure.microsoft.com/documentation/services/data-catalog/)
- [Azure Data Catalog FAQ](https://azure.microsoft.com/documentation/articles/data-catalog-frequently-asked-questions/)
- [Azure Data Catalog developer concepts](https://azure.microsoft.com/documentation/articles/data-catalog-developer-concepts/). 
- [Get started creating a Data Catalog app](https://github.com/Azure-Samples/data-catalog-dotnet-get-started) - Shows you how to Register, Search, and Delete a data asset using the Data Catalog REST API.   

