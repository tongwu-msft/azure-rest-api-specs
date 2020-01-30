---
title: "Create Synonym Map (Azure Cognitive Search REST API)"
description: "A synonym map to expand or rewrite a search query can be created using REST API in Azure Cognitive Search."
ms.date: 01/30/2020
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
# Create Synonym Map (Azure Cognitive Search REST API)

In Azure Cognitive Search, a synonym map contains a list of rules for expanding or rewriting a search query to equivalent terms. You can create a new synonym map within an Azure Cognitive Search service using an HTTP POST request. Refer to this [.NET code sample](https://github.com/Azure-Samples/search-dotnet-getting-started/tree/master/DotNetHowToSynonyms) and [tutorial](https://docs.microsoft.com/azure/search/search-synonyms-tutorial-sdk) to learn more about synonyms.

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

 HTTPS is required for all service requests. If the synonym map doesn't exist, it is created. If it already exists, it is updated to the new definition  .

 > [!NOTE]  
>  The maximum number of synonym maps that you can create varies by pricing tier. For more information, see [Service limits for Azure Cognitive Search](https://azure.microsoft.com/documentation/articles/search-limits-quotas-capacity/).  

## URI Parameters

| Parameter	  | Description  | 
|-------------|--------------|
| servicename | Required. Set this to the unique, user-defined name of your search service. |
| synonymmap name  | Required on the URI if using PUT. The name must be lower case, start with a letter or number, have no slashes or dots, and be less than 128 characters. After starting the name with a letter or number, the rest of the name can include any letter, number and dashes, as long as the dashes are not consecutive. |
| api-version | Required. The current version is `api-version=2019-05-06`. See [API versions in Azure Cognitive Search](https://docs.microsoft.com/azure/search/search-api-versions) for a list of available versions.|

## Request Header 
 The following table describes the required and optional request headers.  

|Request Header|Description|  
|--------------------|-----------------|  
|*Content-Type:*|Required. Set this to `application/json`|  
|*api-key:*|Required. The `api-key` is used to authenticate the request to your Search service. It is a string value, unique to your service. Create requests must include an `api-key` header set to your admin key (as opposed to a query key).|  

You can get the `api-key` from your service dashboard in the Azure portal. For more information, see [Find existing keys](https://docs.microsoft.com/azure/search/search-security-api-keys#find-existing-keys).   

### Request Body
 The body of the request contains a synonym map definition, which includes the format of the synonym map and the list of rules in the specified format.

The following JSON is a high-level representation of the main parts of the definition.

```json
{   
    "name" : "Required for POST, optional for PUT. The name of the synonym map",  
    "format" : "Required. Only Apache Solr format ('solr') is currently supported.",
    "synonyms" : "Required. Synonym rules separated by the new line ('\n') character.",
    "encryptionKey":(optional) {
      "keyVaultKeyName": "name_of_azure_key_vault_key", (the name of your Azure Key Vault key to be used to encrypt your index data at rest),
      "keyVaultKeyVersion": "version_of_azure_key_vault_key", (the version of your Azure Key Vault key to be used to encrypt your index data at rest),
      "keyVaultUri": "azure_key_vault_uri", (the URI of your Azure Key Vault, also referred to as DNS name, that contains the key to be used to encrypt your index data at rest. An example URI might be https://my-keyvault-name.vault.azure.net)
      "accessCredentials": (optional, only if not using managed system identity) {
        "applicationId": "azure_active_directory_application_id", (an AAD Application ID that was granted the required access permissions to your specified Azure Key Vault)
        "applicationSecret": "azure_active_directory_application_authentication_key" (the authentication key of the specified AAD application)
    }
  } 
}  
```  

 Request contains the following properties:  

|Property|Description|  
|--------------|-----------------|  
|`name`|Required. The name of the synonym map. A synonym map name must only contain lowercase letters, digits or dashes, cannot start or end with dashes and is limited to 128 characters.|  
|`format`|Required. Only Apache Solr format ('solr') is currently supported. If you have an existing synonym dictionary in a different format and want to use it directly, vote for it on [UserVoice](https://feedback.azure.com/forums/263029-azure-search).|  
|`synonyms`|Required. Synonym rules separated by the new line ('\n') character.|
|`encryptionKey`|Optional. While all Azure Cognitive Search synonym maps are encrypted by default using [service-managed keys](https://docs.microsoft.com/azure/security/azure-security-encryption-atrest#data-encryption-models), synonym maps could also be configured to be encrypted with your own keys, managed in your Azure Key Vault. To learn more, see [Azure Cognitive Search encryption using customer-managed keys in Azure Key Vault](https://docs.microsoft.com/azure/search/search-security-manage-encryption-keys).|

> [!NOTE]
> Encryption with customer-managed keys is not available for free services.

#### Apache Solr synonym format

  The Apache Solr format supports equivalent and explicit synonym mappings.

  1. An equivalent mapping rule lists equivalent terms or phrases separated with commas.

     ```
     USA, United States, United States of America
     ```
  
     The rule expands the search to all equivalent terms. For example, the search query "USA" will be expanded to "USA" OR "United States" OR "United States of America".

  2. Explicit mapping is denoted by an arrow "=>". When specified, a term sequence of a search query that matches the left-hand side of "=>" will be replaced with the alternatives on the right-hand side.
  
     ```
     Washington, Wash., WA => WA
     ```

     Given the rule, the search queries "Washington", "Wash." or "WA" will all be rewritten to "WA". Explicit mapping only applies in the direction specified and does not rewrite the query "WA" to "Washington" in this case.


## Response  
 For a successful request: 201 Created.  

 ## <a name="example-request"> Examples  </a>

```json
{   
    "name" : "synonymmap1",  
    "format" : "solr",  
    "synonyms" : "United States, United States of America, USA\n
    Washington, Wash. => WA"
}  
```  

## See also  

+ [Azure Cognitive Search REST APIs](index.md)   
+ [HTTP status codes &#40;Azure Cognitive Search&#41;](http-status-codes.md)   
+ [Synonym map operations &#40;Azure Cognitive Search REST API&#41;](synonym-map-operations.md)   
+ [Naming rules &#40;Azure Cognitive Search&#41;](naming-rules.md)   
