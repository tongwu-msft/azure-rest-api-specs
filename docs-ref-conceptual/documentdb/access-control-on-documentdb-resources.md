---
title: "Access Control on DocumentDB Resources"
ms.custom: ""
ms.date: "2016-11-09"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "documentdb"
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
# Access Control on DocumentDB Resources
  Access to DocumentDB resources is governed by a master key token or a resource token. To access a resource, the selected token is included in the REST authorization header, as part of the authorization string.  
  
## Master key tokens  
 The master key token is the all access key token that allows individuals to have full control of DocumentDB resources in a particular account. The master key is created during the creation of an account. There are two sets of master keys, the primary key and the secondary key. The administrator of the account can then exercise key rotation using the secondary key. In addition, the account administrator can also regenerate the keys as needed. For instructions on regenerating and rolling keys, see [How to manage a DocumentDB account](http://azure.microsoft.com/documentation/articles/documentdb-manage-account/).  
  
## Resource tokens  
 Resource tokens are created when users in a database are set up with access permissions for precise access control on a resource, also known as a permission resource. A permission resource contains a hash resource token specifically constructed with the information regarding the resource path and access type a user has access to. The permission resource token is time bound and the validity period can be overridden. When a permission resource is acted upon on (POST, GET, PUT), a new resource token is generated. For information on permissions and resource tokens, see [Operations on DocumentDB Permissions](permissions.md).  
  
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
 The hash signature for the master key token consists of the following ordered properties: **Verb**, **ResourceType**, **ResourceLink** and **XmsDate**.  
  
 When constructing the hash signature for the master key token, keep the following in mind:  
  
1.  The **Verb** portion of the string is the HTTP verb, such as GET, POST or PUT  
  
2.  The **ResourceType** portion of the string identifies the type of resource that the request is for, Eg. "dbs", "colls", "docs"  
  
3.  The **ResourceLink** portion of the string is the identity property of the resource that the request is directed at.                          **ResourceLink** must maintain its case (i.e. must not be lower-cased) for the id of the resource. Eg. For a collection it will look like: "dbs/MyDatabase/colls/MyCollection"  
  
4.  **XmsDate** is the UTC date and time the message was sent (in "HTTP-date" format as defined by [RFC 7231 Date/Time Formats](http://tools.ietf.org/html/rfc7231#section-7.1.1.1)) e.g. `Tue, 01 Nov 1994 08:12:31 GMT`. This same date(in same format) also needs to be passed as **x-ms-date** header in the request.
  
5.  If **x-ms-date** is specified (recommended), you may ignore the **date** header for the signature calculation, regardless of whether it is specified in the actual request, and simply specify an empty line for the its value.  
  
6.  All new line characters (\n) shown are required within the signature string.  
  
 To encode the signature string for a request against DocumentDB, use the following format:  
  
|StringToSign =|1.  Verb.toLowerCase() + "\n" +<br />2.  ResourceType.toLowerCase() + "\n" +<br />3.  ResourceLink + "\n" +<br />4.  (XmsDate &#124;&#124; "").toLowerCase() + "\n" +<br />5.  (Date &#124;&#124; "").toLowerCase() + "\n";|  
|-|-|  
  
 Example [C#] method to generate a valid Authorization header:  
  
 For examples on how to use this method, and what values should be passed for each parameter for each type of operation please refer to   
      [Using REST from a .NET client](https://github.com/Azure/azure-documentdb-dotnet/tree/master/samples/rest-from-.net)  
  
```c#  
  
string GenerateAuthToken(string verb, string resourceType, string resourceLink, string xmsDate, string key, string keyType, string tokenVersion)  
{  
    var hmacSha256 = new System.Security.Cryptography.HMACSHA256 { Key = Convert.FromBase64String(key) };  
    
    verb = verb ?? "";  
    resourceType = resourceType ?? "";
    resourceLink = resourceLink ?? "";
  
    string payLoad = string.Format(System.Globalization.CultureInfo.InvariantCulture, "{0}\n{1}\n{2}\n{3}\n{4}\n",  
            verb.ToLowerInvariant(),  
            resourceType.ToLowerInvariant(),  
            resourceLink,  
            xmsDate.ToLowerInvariant(),  
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
  
function getAuthorizationTokenUsingMasterKey(verb, resourceType, resourceLink, xmsDate, masterKey) {  
    var key = new Buffer(masterKey, "base64");  
  
    var text = (verb || "").toLowerCase() + "\n" +   
               (resourceType || "").toLowerCase() + "\n" +   
               (resourceLink || "") + "\n" +   
               (xmsDate || "").toLowerCase() + "\n" +   
               "" + "\n";  
  
    var body = new Buffer(text, "utf8");  
    var signature = crypto.createHmac("sha256", key).update(body).digest("base64");  
  
    var MasterToken = "master";  
  
    var TokenVersion = "1.0";  
  
    return encodeURIComponent("type=" + MasterToken + "&ver=" + TokenVersion + "&sig=" + signature);  
}  
  
```  
  
##  <a name="constructresourcetoken"></a> Constructing the hash signature for a resource token  
 Resource tokens must be generated by an intermediate server. The server serves as the master-key guardian and generates time-constrained tokens for untrusted clients, such as web browsers.  
  
 This server performs the following steps:  
  
1.  Handles incoming client requests for new tokens.  
  
2.  Verifies client identity in an application-specific way.  
  
3.  If the client authenticates successfully, it uses the DocumentDB interfaces (SDK or REST) to generate a new time-limited token and returns it to the client.  
  
## See Also  
 [DocumentDB documentation](http://azure.microsoft.com/documentation/services/documentdb/)   
 [DocumentDB SDKs](https://azure.microsoft.com/documentation/articles/documentdb-sdk-dotnet/)   
 [REST from .NET Sample](https://github.com/Azure/azure-documentdb-dotnet/tree/master/samples/rest-from-.net)   
 [DocumentDB Resource URI Syntax for REST](documentdb-resource-uri-syntax-for-rest.md)   
 [Querying DocumentDB resources using the REST API](querying-documentdb-resources-using-the-rest-api.md)   
 [HTTP Status Codes for DocumentDB](http-status-codes-for-documentdb.md)  
  
  
