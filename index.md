---
title: Azure REST API Reference | Microsoft Docs
description: Azure REST API Reference 
keywords: Azure REST, Azure REST API Reference
author: bryanla
manager: douge
ms.author: bryanla
ms.date: 03/22/2017
ms.topic: reference
ms.prod: azure
ms.technology: azure
ms.devlang: rest-api
ms.assetid: D35E3780-B2BC-4450-8EF6-2710A11F99A7
---

# Azure REST API Reference

Welcome to the Azure REST API Reference.

Representational State Transfer (REST) APIs are service endpoints that support sets of HTTP operations (methods), which provide create, retrieve, update, or delete access to the service's resources. This article presents:

* The basic components of a REST API request/response pair.
* How to register your client application with Azure Active Directory (Azure AD) to secure your REST requests.
* Overviews of creating and sending a REST request, and handling the response.

> [!NOTE] 
> Most Azure service REST APIs have a corresponding client SDK library, which handles much of the client code for you. See:  
> 
> [Azure .NET SDK][SDK-NET]  
> [Azure Java SDK][SDK-JAVA]  
> [Azure CLI 2.0 SDK][SDK-CLI]  

## Components of a REST API request/response

A REST API request/response pair can be separated into five components:

* The **request URI**, which consists of: `{URI-scheme} :// {URI-host} / {resource-path} ? {query-string}`. Although the request URI is included in the request message header, we call it out separately here because most languages or frameworks require you to pass it separately from the request message. 
    * URI scheme: Indicates the protocol used to transmit the request. For example, `http` or `https`.  
    * URI host: Specifies the domain name or IP address of the server where the REST service endpoint is hosted, such as `graph.microsoft.com`.  
    * Resource path: Specifies the resource or resource collection, which may include multiple segments used by the service in determining the selection of those resources. For example: `beta/applications/00003f25-7e1f-4278-9488-efc7bac53c4a/owners` could be used to query the list of owners of a specific application within the applications collection.
    * Query string (optional): Provides additional simple parameters, such as the API version or resource selection criteria.

* HTTP **request message header** fields:
    * A required [HTTP method](http://www.w3.org/Protocols/rfc2616/rfc2616-sec9.html) (also known as an operation or verb), which tells the service what type of operation you are requesting. Azure REST APIs support GET, HEAD, PUT, POST, and PATCH methods.
    * Optional additional header fields, as required by the specified URI and HTTP method. For example, an Authorization header that provides a bearer token containing client authorization information for the request.

* Optional HTTP **request message body** fields, to support the URI and HTTP operation. For example, POST operations contain MIME-encoded objects that are passed as complex parameters. For POST or PUT operations, the MIME-encoding type for the body should be specified in the `Content-type` request header as well. Some services require you to use a specific MIME type, such as `application/json`.  

* HTTP **response message header** fields:
    * An [HTTP status code](http://www.w3.org/Protocols/HTTP/HTRESP.html), ranging from 2xx success codes to 4xx or 5xx error codes. Alternatively, a service-defined status code may be returned, as indicated in the API documentation. 
    * Optional additional header fields, as required to support the request's response, such as a `Content-type` response header.

* Optional HTTP **response message body** fields:
    * MIME-encoded response objects may be returned in the HTTP response body, such as a response from a GET method that is returning data. Typically, these objects are returned in a structured format as JSON or XML, as indicated by the `Content-type` response header. For example, when you request an access token from Azure AD, it will be returned in the response body as the `access_token` element, one of several name/value paired objects in a data collection. In this example, a response header of `Content-Type: application/json` is also included.

> [!NOTE] 
> The Create/Send/Process-Response pattern that's discussed here is synchronous and applies to all REST messages. However, some services may also support an asynchronous pattern, which requires additional processing of response headers to monitor or complete the asynchronous request. See [Track asynchronous Azure operations][ARM-Async-Ops] for more details.
> 

## Register your client application with Azure AD

Most Azure services (such as [Azure Resource Manager providers][ARM-Provider-Summary] and the classic Service Management APIs) require your client code to authenticate with valid credentials before you can call the service's API. Authentication is coordinated between the various actors by Azure AD, which provides your client with an [access token][AAD-Glossary-Access-Token] as proof of the authentication or authorization. The token is then sent to the Azure service in the HTTP Authorization header of all subsequent REST API requests. The token's [claims][AAD-Glossary-Claim] also provide information to the service, allowing it to validate the client and perform any required authorization.

If you are using a REST API that does not use integrated Azure AD authentication, or you've already registered your client, you can skip to the [Create the request](#create-the-request) section. 

### Prerequisites

Your [client application][AAD-Glossary-Client-Application] must make its identity configuration known to Azure AD before run time by registering it in an [Azure AD tenant][AAD-Glossary-Tenant]. Before you register your client with Azure AD, consider the following: 

* If you do not have an Azure AD tenant yet, see [How to get an Azure Active Directory tenant][AAD-Howto-Tenant]. 

* In accordance with the OAuth2 Authorization Framework, Azure AD supports two types of clients. Understanding each client can help you decide which is the most appropriate for your scenario:  
    * [web/confidential][AAD-Glossary-Web-Client] clients run on a web server and can access resources under their own identity (that is, service or daemon), or they can obtain delegated authorization to access resources under the identity of a signed-in user (that is, web app). Only a web client can securely maintain and present its own credentials during Azure AD authentication to acquire an access token.
    * [native/public][AAD-Glossary-Native-Client] clients are installed and run on a device and can access resources on behalf of a user only under delegated authorization, using the identity of the signed-in user to acquire an access token.

* The registration process creates two related objects in the Azure AD tenant where the application is registered: an application object and a service principal object. For more background on these components and how they are used at run time, see [Application and service principal objects in Azure Active Directory][AAD-Apps-And-Sps].

You are now ready to register your client application with Azure AD.

### Client registration
To register a client that will access an Azure Resource Manager REST API, see [Use portal to create Active Directory application and service principal that can access resources][ARM-Create-Sp-Portal]. The article (also available in PowerShell and CLI versions for automating registration) shows you how to:

* Register the client application with Azure AD.
* Set [permission requests][AAD-Glossary-Permissions] to allow the client to access the Azure Resource Manager API.
* Configure Azure Resource Manager Role-Based Access Control (RBAC) settings for authorizing the client.

For all other clients, refer to [Integrating applications with Azure Active Directory][AAD-Integrating-Apps]. The article shows you how to: 

* Register the client application with Azure AD, in the "Adding an application" section.
* Create a secret key (if you are registering a web client), in the "Updating an application" section.
* Add permission requests as required by the API, in the "Updating an application" section.

Now that you've completed registration of your client application, you can move to your client code, where you create the REST request and handle the response.

## Create the request
This section covers the first three of the five components that we discussed earlier. You first acquire the access token from Azure AD, which you use to assemble your request message header.

### Acquire an access token

After you have a valid client registration, you can acquire an access token for integrating with Azure AD in either of two ways:

* The Azure AD platform- and language-neutral OAuth2 service endpoints, which is what we use in this article. Like the instructions for the Azure REST API endpoints you are using, the instructions provided in this section make no assumptions about your client's platform, language, or script when using the Azure AD endpoints. The endpoints can send and receive HTTPS requests to and from Azure AD, and parse the response message.  
* The platform- and language-specific Azure AD Authentication Libraries (ADAL). The libraries provide asynchronous wrappers for the OAuth2 endpoint requests, and robust token-handling features such as caching and refresh token management. For more details, including reference documentation, library downloads, and sample code, see [Azure Active Directory Authentication Libraries][AAD-Auth-Libraries].

The two Azure AD endpoints that you useg to authenticate your client and acquire an access token are referred to as the OAuth2 `/authorize` and `/token` endpoints. How you use them depends on your application's registration and the type of [OAuth2 authorization grant flow][AAD-Glossary-Authorization-Grant] you need to support your application at run time. For the purposes of this article, we assume that your client will use one of the following authorization grant flows: authorization code or client credentials. To acquire the access token that you will use in the remaining sections, follow the instructions for the authorization grant flow that best matches your scenario.

#### Authorization code grant (interactive clients)

This grant can be used by both web and native clients, and it requires credentials from a signed-in user to delegate resource access to the client application. It uses the `/authorize` endpoint to obtain an authorization code (in response to user sign-in or consent), followed by the `/token` endpoint to exchange the authorization code for an access token.  

1. First, your client requests an authorization code from Azure AD. For details on the format of the HTTPS GET request to the `/authorize` endpoint, and example request/response messages, see [Request an authorization code][AAD-Oauth-Code-Authz]. The URI contains query-string parameters, including the following, which are specific to your client application:

    * `client_id`: Also known as an application ID, this is the GUID that was assigned to your client application when you registered in the preceding section.
    * `redirect_uri`: A URL-encoded version of one of the reply or redirect URIs that you specified when you registered your client application. The value you pass must match your registration value exactly.
    * `resource`: A URL-encoded identifier URI that's specified by the REST API you are calling. Web/REST APIs (also known as resource applications) can expose one or more application ID URIs in their configuration. For example:  

        * Azure Resource Manager provider (and classic Service Management) APIs use `https://management.core.windows.net/`.  
        * For all other resources, see the API documentation or the resource application's configuration in the Azure portal. For more details, see the [`identifierUris` property][AAD-Graph-Application] of the Azure AD application object.  

    The request to the `/authorize` endpoint first triggers a sign-in prompt to authenticate the user. The response you receive is delivered as a redirect (302) to the URI that you specified in `redirect_uri`. The response header message contains a `location` field, which contains the redirect URI followed by a `code` query parameter, which in turn contains the authorization code that you need for step 2. 

2. Next, your client redeems the authorization code for an access token. For details on the format of the HTTPS POST request to the `/token` endpoint, and example request/response messages, see [Use the authorization code to request an access token][AAD-Oauth-Code-Token]. This time, because this is a POST request, you package your application-specific parameters in the request body. In addition to some of the previously mentioned parameters (along with other new ones), you will pass:

    * `code`: This query parameter contains the authorization code that you obtained in step 1.
    * `client_secret`: This is the same secret or key value that you generated earlier, in [client registration](#client-registration). You need this parameter only if your client is configured as a web application. 

#### Client credentials grant (non-interactive clients)

This grant can be used only by web clients, allowing the application to access resources directly (no user delegation) and using the client's own credentials, which are provided at registration time. The grant is typically used by non-interactive clients (no UI) that run as a daemon or service, and it requires only the `/token` endpoint to acquire an access token.

The client/resource interactions for this grant are similar to step 2 of the authorization code grant. For details on the format of the HTTPS POST request to the `/token` endpoint, and example request/response messages, see the "Request an Access Token" section in [Service to service calls using client credentials][AAD-Oauth-Client-Creds].

### Assemble the request message
Most programming languages or frameworks and scripting environments make it easy to assemble and send a request message. They typically provide a web/HTTP class or API that abstracts the creation or formatting of the request, making it easier to write the client code (the HttpWebRequest class in the .NET Framework, for example). For brevity, and because most of the task is handled for you, this section covers only the important elements of the request.

#### Request URI
Because sensitive information is being transmitted and received, all secured REST requests require the HTTPS protocol for the URI scheme, which gives the request and response a secure channel. The information (that is, the Azure AD authorization code, access or bearer token, and sensitive request and response data) is encrypted by a lower transport layer, ensuring the privacy of the messages. 

The remainder of your service's request URI (that is, the host, resource path, and any required query-string parameters) are determined by its related REST API specification. For example, Azure Resource Manager provider APIs use `https://management.azure.com/`, and classic Azure Service Management APIs use `https://management.core.windows.net/`. Both APIs require an `api-version` query-string parameter.

#### Request header
The request URI is bundled in the request message header, along with any additional fields as determined by your service's REST API specification and the [HTTP specification](http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html). Your request might require the following common header fields:

* `Authorization`: Contains the OAuth2 bearer token to secure the request, as acquired earlier from Azure AD.
* `Content-Type`: Typically set to "application/json" (name/value pairs in JSON format), and specifies the MIME type of the request body.
* `Host`: The domain name or IP address of the server where the REST service endpoint is hosted.

#### Request body
As mentioned earlier, the request message body is optional, depending on the specific operation you're requesting and its parameter requirements. If it's required, the API specification for the service you are requesting also specifies the encoding and format. 

The request body is separated from the header by an empty line, and it should be formatted in accordance with the `Content-Type` header field. An example of an "application/json" formatted body would appear as follows: 

```
{
  "<name>": "<value>"
}
```

## Send the request
Now that you have the service's request URI and have created the related request message header and body, you are ready to send the request to the REST service endpoint. 

For example, you might send an HTTPS GET request method for an Azure Resource Manager provider by using request header fields that are similar to the following (note that the request body is empty):

```
GET /subscriptions?api-version=2014-04-01-preview HTTP/1.1
Authorization: Bearer <bearer-token>
Host: management.azure.com

<no body>
```

And you might send an HTTPS PUT request method for an Azure Resource Manager provider by using request header AND body fields that are similar to the following:

```
PUT /subscriptions/03f09293-ce69-483a-a092-d06ea46dfb8c/resourcegroups/ExampleResourceGroup?api-version=2016-02-01  HTTP/1.1
Authorization: Bearer <bearer-token>
Content-Length: 29
Content-Type: application/json
Host: management.azure.com

{
  "location": "West US"
}
```

After you make the request, the response message header and optional body are returned.

## Process the response message

The article concludes with the final two of the five components. 

To process the response, parse the response header and, optionally, the response body (depending on the request). In the HTTPS GET example provided in the preceding section, you used the /subscriptions endpoint to retrieve the list of subscriptions for a user. Assuming that the response was successful, you should receive response header fields similar to the following:

```
HTTP/1.1 200 OK
Content-Length: 303
Content-Type: application/json;
```

And you should receive a response body that contains a list of Azure subscriptions and their individual properties encoded in JSON format, similar to:
```
{
    "value":[
        {
        "id":"/subscriptions/04f09293-ce69-583a-a091-z06ea46dfb8c",
        "subscriptionId":"04f09293-ce69-583a-a091-z06ea46dfb8c",
        "displayName":"My Azure Subscription",
        "state":"Enabled",
        "subscriptionPolicies":{
            "locationPlacementId":"Public_2015-09-01",
            "quotaId":"MSDN_2014-05-01",
            "spendingLimit":"On"}
        }
    ]
}
```

For the HTTPS PUT example, you should receive a response header that confirms the success of the PUT operation to add the "ExampleResourceGroup", similar to the following:

```
HTTP/1.1 200 OK
Content-Length: 193
Content-Type: application/json;
```

And you should receive a response body that confirms the content of your newly added resource group encoded in JSON format, similar to:
```
{
    "id":"/subscriptions/03f09293-ce69-483a-a092-d06ea46dfb8c/resourceGroups/ExampleResourceGroup",
    "name":"ExampleResourceGroup",
    "location":"westus",
    "properties":
        {
        "provisioningState":"Succeeded"
        }
}
```

As with the request, most programming languages and frameworks make it easy to process the response message. They typically return this information to your application following the request, allowing you to process it in a typed or structured format. Mainly, you should be interested in confirming the HTTP status code in the response header and, if you're successful, parsing the response body according to the API specification (or the `Content-Type` and `Content-Length` response header fields).

That completes the process. After you have registered your Azure AD application and you have a componentized technique for acquiring an access token and creating and processing HTTP requests, it's fairly easy to replicate your code to take advantage of new REST APIs.

## Related content

For more information about application registration and the Azure AD programming model, including a comprehensive index of how-to and quick-start articles and sample code, see the [Azure AD developers guide][AAD-Dev-Guide].

For information about testing HTTP requests/responses, see:
* [Fiddler](http://www.telerik.com/fiddler). Fiddler is a free web debugging proxy that can intercept your REST requests, making it easy to diagnose the HTTP request and response messages.
* [JWT Decoder](http://jwt.calebb.net/) and [JWT.io](https://jwt.io/), which make it quick and easy to dump the claims in your bearer token so you can validate their contents.

Use the LiveFyre comments section that follows this article to provide feedback and help us refine and shape our content.

<!--Reference style links: DOCS -->

[AAD-Apps-And-Sps]: /active-directory/active-directory-application-objects
[AAD-Auth-Libraries]: /active-directory/active-directory-authentication-libraries
[AAD-Dev-Guide]: /active-directory/active-directory-developers-guide
[AAD-Glossary-Access-Token]: /active-directory/active-directory-dev-glossary#access-token
[AAD-Glossary-Authorization-Grant]: /active-directory/active-directory-dev-glossary#authorization-grant
[AAD-Glossary-Claim]: /active-directory/active-directory-dev-glossary#claim
[AAD-Glossary-Client-Application]: /active-directory/active-directory-dev-glossary#client-application
[AAD-Glossary-Permissions]: /active-directory/active-directory-dev-glossary#permissions
[AAD-Glossary-Tenant]: /active-directory/active-directory-dev-glossary#tenant
[AAD-Glossary-Native-Client]: /active-directory/active-directory-dev-glossary#native-client
[AAD-Glossary-Web-Client]: /active-directory/active-directory-dev-glossary#web-client
[AAD-Graph-Application]: https://msdn.microsoft.com/Library/Azure/Ad/Graph/api/entity-and-complex-type-reference#application-entity
[AAD-Howto-Tenant]: /active-directory/active-directory-howto-tenant
[AAD-Integrating-Apps]: /active-directory/active-directory-integrating-applications
[AAD-OAuth-Client-Creds]: /active-directory/active-directory-protocols-oauth-service-to-service#request-an-access-token
[AAD-Oauth-Code-Authz]: /active-directory/active-directory-protocols-oauth-code#request-an-authorization-code
[AAD-Oauth-Code-Token]: /active-directory/active-directory-protocols-oauth-code#use-the-authorization-code-to-request-an-access-token
[ARM-Create-Sp-Portal]: /azure/azure-resource-manager/resource-group-create-service-principal-portal
[ARM-Provider-Summary]: /azure/azure-resource-manager/resource-manager-supported-services
[ARM-Async-Ops]: /azure/azure-resource-manager/resource-manager-async-operations
[SDK-NET]: /dotnet/api/
[SDK-JAVA]: /java/api/
[SDK-CLI]: /cli/azure/
