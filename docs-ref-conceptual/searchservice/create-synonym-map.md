---
title: "Create Synonym Map (Azure Cognitive Search REST API)"
description: "A synonym map to expand or rewrite a search query can be created using REST API in Azure Cognitive Search."
ms.date: 02/11/2021

ms.service: cognitive-search
ms.topic: reference
ms.devlang: rest-api

author: bevloh
ms.author: beloh
---
# Create Synonym Map (Azure Cognitive Search REST API)

In Azure Cognitive Search, a synonym map contains a list of rules for expanding or rewriting a search query to equivalent terms. 

You can use either POST or PUT on the request. For either one, the JSON document in the request body provides the object definition.

```http
POST https://[service name].search.windows.net/synonymmaps?api-version=[api-version]      
  Content-Type: application/json  
  api-key: [admin key]  
```  

Alternatively, you can use PUT and specify the synonym map name on the URI. 

```http
PUT https://[service name].search.windows.net/synonymmaps/[synonymmap name]?api-version=[api-version]  
  Content-Type: application/json  
  api-key: [admin key]  
```  

 HTTPS is required for all service requests. If the synonym map doesn't exist, it is created. If it already exists, it is updated to the new definition.

 > [!NOTE]  
> The maximum number of synonym maps that you can create varies by pricing tier. For more information, see [Service limits](/azure/search/search-limits-quotas-capacity).  

## URI Parameters

| Parameter	  | Description  | 
|-------------|--------------|
| service name | Required. Set this to the unique, user-defined name of your search service. |
| synonym map name  | Required on the URI if using PUT. The name must be lower case, start with a letter or number, have no slashes or dots, and be less than 128 characters. After starting the name with a letter or number, the rest of the name can include any letter, number and dashes, as long as the dashes are not consecutive. |
| api-version | Required. The current stable version is `api-version=2020-06-30`. See [API versions](search-service-api-versions.md) for more versions.|

## Request Headers

 The following table describes the required and optional request headers.  

|Fields              |Description      |  
|--------------------|-----------------|  
|Content-Type|Required. Set this to `application/json`|  
|api-key|Required. The `api-key` is used to authenticate the request to your Search service. It is a string value, unique to your service. Create requests must include an `api-key` header set to your admin key (as opposed to a query key). You can [find the API key](/azure/search/search-security-api-keys#find-existing-keys) in your search service dashboard in the Azure portal.|  

## Request Body

 The body of the request contains a synonym map definition, which includes the format of the synonym map and the list of rules in the specified format.

The following JSON is a high-level representation of the main parts of the definition.

```json
{   
    "name" : (optional on PUT; required on POST) "Name of the synonym map",  
    "format" : (required) "Only Apache Solr format ('solr') is currently supported.",
    "synonyms" : (required) "Synonym rules separated by the new line ('\n') character.",
    "encryptionKey":(optional) { See below for details }
  } 
}  
```  

 Request contains the following properties:  

|Property|Description|  
|--------------|-----------------|  
|name|Required. The name of the synonym map. A synonym map name must only contain lowercase letters, digits or dashes, cannot start or end with dashes and is limited to 128 characters.|  
|format|Required. Only Apache Solr format (`solr`) is currently supported. |  
|synonyms|Required. Synonym rules separated by the new line ('\n') character.|
|encryptionKey| Optional. Used to encrypt a synonym map, with your own keys, managed in your Azure Key Vault. Available for billable search services created on or after 2019-01-01. </br></br> An `encryptionKey` section contains a user-defined `keyVaultKeyName` (required), a system-generated `keyVaultKeyVersion` (required), and a `keyVaultUri` providing the key (required, also referred to as DNS name). An example URI might be "https://my-keyvault-name.vault.azure.net". </br></br>Optionally, you can specify `accessCredentials` if you are not using a managed system identity. Properties of `accessCredentials` include `applicationId` (Azure Active Directory Application ID that was granted access permissions to your specified Azure Key Vault), and `applicationSecret` (authentication key of the specified Azure AD application). An example in the next section illustrates the syntax. |

## Response

For a successful request: 201 Created.  

## Examples

**Example: List of synonyms with equivalent and explicit mappings.**

An equivalent mapping rule lists equivalent terms or phrases separated with commas ("USA, United States, United States of America"). The rule expands the search to all equivalent terms or phrases. For example, a search document that contains `USA` will match on queries that contain the term `USA` or the phrases `"United States"`, or `"United States of America"`.

Explicit mapping is denoted by an arrow `=>` ("USA, U.S.A., U.S., United States, United States of America => USA"). When specified, a term sequence of a search query that matches the left-hand side of `=>` will be replaced with the alternatives on the right-hand side. Given the rule, the search queries `U.S.` or `"United States"` will all be rewritten to `USA`. Explicit mapping only applies in the direction specified and does not rewrite the query `USA` to `"United States"` in this case. Notice that "United States" is a quote-enclosed phrase query. If you want a match on the entire phrase, the query string must be enclosed in double quotation marks. Otherwise each term, "United" and "States", is evaluated separately.

```json
{   
  "name" : "synonymmap1",  
  "format" : "solr",  
  "synonyms" : "United States, United States of America, USA\n
  Washington, Wash. => WA"
}  
```  

**Example: Encryption keys**

Encryption keys are customer-managed keys used for additional encryption. For more information, see [Encryption using customer-managed keys in Azure Key Vault](/azure/search/search-security-manage-encryption-keys).

```json
{   
  "name" : "synonymmap1",  
  "format" : "solr",  
  "synonyms" : "United States, United States of America, USA\n
  Washington, Wash. => WA",
  "encryptionKey": (optional) { 
    "keyVaultKeyName": "Name of the Azure Key Vault key used for encryption",
    "keyVaultKeyVersion": "Version of the Azure Key Vault key",
    "keyVaultUri": "URI of Azure Key Vault, also referred to as DNS name, that provides the key. An example URI might be https://my-keyvault-name.vault.azure.net",
    "accessCredentials": (optional, only if not using managed system identity) {
      "applicationId": "Azure AD Application ID that was granted access permissions to your specified Azure Key Vault",
      "applicationSecret": "Authentication key of the specified Azure AD application)"
    }
}  
```

## See also  

+ [C# code sample](https://github.com/Azure-Samples/search-dotnet-getting-started/tree/master/DotNetHowToSynonyms)
+ [Synonym C# tutorial](/azure/search/search-synonyms-tutorial-sdk) to learn more about synonyms.
+ [Synonyms in Azure Cognitive Search](/azure/search/search-synonyms)
