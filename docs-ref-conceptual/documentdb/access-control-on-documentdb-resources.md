---
title: "Access Control on Azure Cosmos DB Resources"
ms.custom: ""
ms.date: "2017-04-26"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "cosmosdb"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: c3c3324c-9a3f-4cad-8a74-bd73d8b4e40b
caps.latest.revision: 40
author: "mimig1"
ms.author: "mimig"
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
# Access control in the DocumentDB API
Azure Cosmos DB is a globally distributed multi-model database with support for multiple APIs. This article covers the DocumentDB API for Azure Cosmos DB. Access to resources in the DocumentDB API is governed by a master key token or a resource token. To access a resource, the selected token is included in the REST authorization header, as part of the authorization string.  
  
## Master key tokens  
The master key token is the all access key token that allows users to have full control of Cosmos DB resources in a particular account. The master key is created during the creation of an account. There are two sets of master keys, the primary key and the secondary key. The administrator of the account can then exercise key rotation using the secondary key. In addition, the account administrator can also regenerate the keys as needed. For instructions on regenerating and rolling keys, see [How to manage an Azure Cosmos DB account](https://docs.microsoft.com/azure/documentdb/documentdb-manage-account/).  
  
## Resource tokens  
Resource tokens are created when users in a database are set up with access permissions for precise access control on a resource, also known as a permission resource. A permission resource contains a hash resource token specifically constructed with the information regarding the resource path and access type a user has access to. The permission resource token is time bound and the validity period can be overridden. When a permission resource is acted upon on (POST, GET, PUT), a new resource token is generated. For information on permissions and resource tokens, see [Operations on Cosmos DB Permissions](permissions.md).  
  
## Authorization header  
All REST operations, whether you're using a master key token or resource token, must include the authorization header with the authorization string in order to interact with a resource. The authorization string has the following format:  
  
```  
type={typeoftoken}&ver={tokenversion}&sig={hashsignature}  
```  
  
An example authorization string looks like this:  
  
```  
type=master&ver=1.0&sig=5mDuQBYA0kb70WDJoTUzSBMTG3owkC0/cEN4fqa18/s=  
  
```  
  
The parts enclosed in brackets are as follows:  
  
-   {typeoftoken} denotes the type of token: master or resource.  
  
-   {tokenversion} denotes the version of the token, currently 1.0.  
  
-   {hashsignature} denotes the hashed token signature.  
  
 The authorization string should be encoded before adding it to the REST request to ensure that it contains no invalid characters.  
  
##  <a name="constructkeytoken"></a> Constructing the hashed token signature for a master token  
The hash signature for the master key token can be constructed from the following parameters: **Verb**, **ResourceType**, **ResourceLink** and **Date**.  
  
 When constructing the hash signature for the master key token, keep the following in mind:  
  
1.  The **Verb** portion of the string is the HTTP verb, such as GET, POST or PUT. 
  
2.  The **ResourceType** portion of the string identifies the type of resource that the request is for, Eg. "dbs", "colls", "docs".
  
3.  The **ResourceLink** portion of the string is the identity property of the resource that the request is directed at.           **ResourceLink** must maintain its case for the id of the resource. Example, for a collection it will look like: "dbs/MyDatabase/colls/MyCollection".
  
4.  The **Date** portion of the string is the UTC date and time the message was sent (in "HTTP-date" format as defined by [RFC 7231 Date/Time Formats](http://tools.ietf.org/html/rfc7231#section-7.1.1.1)) e.g. `Tue, 01 Nov 1994 08:12:31 GMT`. In C#, this can be obtained by using the "R" format specifier on the DateTime.UtcNow value. This same date(in same format) also needs to be passed as **x-ms-date** header in the request.
    
5.  All new line characters (\n) shown are required within the signature string including the last empty string("").
  
 To encode the signature string for a request against Cosmos DB, use the following format:  
  
StringToSign = Verb.toLowerCase() + "\n" + ResourceType.toLowerCase() + "\n" + ResourceLink + "\n" + Date.toLowerCase() + "\n" + "" + "\n";  
  
 Example [C#] method to generate a valid Authorization header:  
  
 For examples on how to use this method, and what values should be passed for each parameter for each type of operation please refer to   
      [Using REST from a .NET client](https://github.com/Azure/azure-documentdb-dotnet/tree/master/samples/rest-from-.net)  
  
```c#  
  
string GenerateAuthToken(string verb, string resourceType, string resourceLink, string date, string key, string keyType, string tokenVersion)  
{  
    var hmacSha256 = new System.Security.Cryptography.HMACSHA256 { Key = Convert.FromBase64String(key) };  
    
    verb = verb ?? "";  
    resourceType = resourceType ?? "";
    resourceLink = resourceLink ?? "";
  
    string payLoad = string.Format(System.Globalization.CultureInfo.InvariantCulture, "{0}\n{1}\n{2}\n{3}\n{4}\n",  
            verb.ToLowerInvariant(),  
            resourceType.ToLowerInvariant(),  
            resourceLink,  
            date.ToLowerInvariant(),  
            ""  
    );  
  
    byte[] hashPayLoad = hmacSha256.ComputeHash(System.Text.Encoding.UTF8.GetBytes(payLoad));  
    string signature = Convert.ToBase64String(hashPayLoad);  
  
    return System.Web.HttpUtility.UrlEncode(String.Format(System.Globalization.CultureInfo.InvariantCulture, "type={0}&ver={1}&sig={2}",  
        keyType,  
        tokenVersion,  
        signature));  
}  
  
```  
  
 Example [Node.js]:  
  
```jscript  
  
var crypto = require("crypto");  
  
function getAuthorizationTokenUsingMasterKey(verb, resourceType, resourceLink, date, masterKey) {  
    var key = new Buffer(masterKey, "base64");  
  
    var text = (verb || "").toLowerCase() + "\n" +   
               (resourceType || "").toLowerCase() + "\n" +   
               (resourceLink || "") + "\n" +   
               date.toLowerCase() + "\n" +   
               "" + "\n";  
  
    var body = new Buffer(text, "utf8");  
    var signature = crypto.createHmac("sha256", key).update(body).digest("base64");  
  
    var MasterToken = "master";  
  
    var TokenVersion = "1.0";  
  
    return encodeURIComponent("type=" + MasterToken + "&ver=" + TokenVersion + "&sig=" + signature);  
}  
  
```  

Example Encoding:

| Argument | Value |
| - | - |
| Verb | GET |
| Resource Type | "dbs" |
| Resource Link | "dbs/ToDoList" |
| Date | Thu, 27 Apr 2017 00:51:12 GMT |
| Key | dsZQi3KtZmCv1ljt3VNWNm7sQUF1y5rJfC6kv5JiwvW0EndXdDku/dkKBp8/ufDToSxLzR4y+O/0H/t4bQtVNw== |
| Key Type | master |
| Token Version | 1.0 |
| Output Authorization String | type%3dmaster%26ver%3d1.0%26sig%3dc09PEVJrgp2uQRkr934kFbTqhByc7TVr3OHyqlu%2bc%2bc%3d |
  
##  <a name="constructresourcetoken"></a> Constructing the hash signature for a resource token  
 Resource tokens must be generated by an intermediate server. The server serves as the master-key guardian and generates time-constrained tokens for untrusted clients, such as web browsers.  
  
 This server performs the following steps:  
  
1.  Handles incoming client requests for new tokens.  
  
2.  Verifies client identity in an application-specific way.  
  
3.  If the client authenticates successfully, it uses the Cosmos DB interfaces (SDK or REST) to generate a new time-limited token and returns it to the client.  
  
## See Also  
* [Azure Cosmos DB](https://docs.microsoft.com/azure/cosmos-db/introduction) 
* [Azure Cosmos DB: DocumentDB API](https://docs.microsoft.com/azure/documentdb/documentdb-introduction)   
* [Azure Cosmos DB Reference Documentation](https://go.microsoft.com/fwlink/?linkid=834805)   
* [Cosmos DB SDKs](https://azure.microsoft.com/documentation/articles/documentdb-sdk-dotnet/)   
* [REST from .NET Sample](https://github.com/Azure/azure-documentdb-dotnet/tree/master/samples/rest-from-.net) 
  
  
