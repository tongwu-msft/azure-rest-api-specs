---
title: Azure REST API Reference | Microsoft Docs
description: Azure REST API Reference 
keywords: Azure REST, Azure REST API Reference
author: bryanla
manager: douge
ms.author: bryanla
ms.date: 11/30/2016
ms.topic: reference
ms.prod: azure
ms.technology: azure
ms.devlang: rest-api
ms.assetid: D35E3780-B2BC-4450-8EF6-2710A11F99A7
---

# Azure REST API Reference

Welcome to the Azure REST API Reference.

Representational State Transfer (REST) APIs are service endpoints that support sets of HTTP operations (methods), which provide create/retrieve/update/delete access to the service's resources. The sections below will walk you through:

- The basic components of a REST API request/response pair
- How to register your client application with Azure Active Directory (Azure AD) to secure your REST requests
- Overviews of creating and sending a REST request, and handling the response

> [!NOTE] 
> Most Azure service REST APIs have a corresponding client SDK library, which handles much of the client code for you. See:  
> 
> [Azure .NET SDK][SDK-NET]  
> [Azure Java SDK][SDK-JAVA]  
> [Azure CLI 2.0 SDK][SDK-CLI]  

## Components of a REST API request/response

A REST API request/response pair can be separated into 5 components:

1. The **request URI**, which consists of: `{URI-scheme} :// {URI-host} / {resource-path} ? {query-string}`. Note that we are calling this out separately here, as most languages/frameworks require you to pass this separately from the request message, but it's actually included in the request message header. 
    - URI scheme: indicates the protocol used to transmit the request. For example, `http` or `https`.  
    - URI host: the domain name or IP address of the server where the REST service endpoint is hosted, such as `graph.microsoft.com`  
    - Resource path: specifies the resource or resource collection, which may include multiple segments used by the service in determining the selection of those resources. For example: `beta/applications/00003f25-7e1f-4278-9488-efc7bac53c4a/owners` could be used to query the list of owners of a specific application within the applications collection.
    - Query string (optional): used to provide additional simple parameters, such as the API version, resource selection criteria, etc.
2. HTTP **request message header** fields
    - A required [HTTP method](http://www.w3.org/Protocols/rfc2616/rfc2616-sec9.html) (also known as an operation or verb), which tell the service what type of operation you are requesting. Azure REST APIs support GET, HEAD, PUT, POST, and PATCH methods.
    - Optional additional header fields as required by the specified URI and HTTP method. For example, an Authorization header that provides a bearer token containing client authorization information for the request.
3. Optional HTTP **request message body** fields, to support the URI and HTTP operation. For example, POST operations contain MIME-encoded objects passed as complex parameters. The MIME encoding type for the body should be specified in the `Content-type` request header as well, for POST/PUT operations. Note that some services require you to use a specific MIME type, such as `application/json`.  
4. HTTP **response message header** fields
    - An [HTTP status code](http://www.w3.org/Protocols/HTTP/HTRESP.html), ranging from 2xx success codes to 4xx/5xx error codes. Alternatively, a service-defined status code may be returned, as indicated in the API documentation. 
    - Optional additional header fields as required to support the request's response, such as a `Content-type` response header.
5. Optional HTTP **response message body** fields
    - MIME-encoded response objects may be returned in the HTTP response body, such as a response from a GET method that is returning data. Typically these will be returned in a structured format as JSON or XML, as indicated by the `Content-type` response header. For example, when requesting an access token from Azure AD, it will be returned in the response body as the `access_token` element, one of several name/value paired objects in a data collection. In this example, a response header of `Content-Type: application/json` will also be included.

## Register your client application with Azure AD

Most Azure services (such as [Azure Resource Manager providers][ARM-Provider-Summary] and the classic Service Management APIs) require your client code to authenticate with valid credentials before you can call the service's API. Authentication is coordinated between the various actors by Azure AD, which provides your client with an [access token][AAD-Glossary-Access-Token] as proof of the authentication/authorization. The token is then sent to the Azure service in the HTTP Authorization header of all subsequent REST API requests. The token's [claims][AAD-Glossary-Claim] also provide information to the service, allowing it to validate the client and perform any required authorization.

If you are using a REST API that does not use integrated Azure AD authentication, or you've already registered your client, you can skip to the [Create the request](#create-the-request) section. 

### Prerequisites

Your [client application][AAD-Glossary-Client-Application] must make it's identity configuration known to Azure AD before run-time, by registering it in an [Azure AD tenant][AAD-Glossary-Tenant]. Below is a list of items to consider before registering your client with Azure AD: 

- If you do not have an Azure AD tenant yet, please see [How to get an Azure Active Directory tenant][AAD-Howto-Tenant]. 
- Per the OAuth2 Authorization Framework, Azure AD supports 2 types of clients. Understanding each will help you decide which is the most appropriate for your scenario:  
    - [web/confidential][AAD-Glossary-Web-Client] clients (runs on a web server) can access resources under either their own identity (ie: service/daemon), or obtain delegated authorization to access resources under the identity of the signed-in user (ie: web app). Only a web client has the ability to securely maintain and present it's own credentials during Azure AD authentication to acquire an access token.
    - [native/public][AAD-Glossary-Native-Client] clients (installed/runs on a device) can only access resources under delegated authorization, using the identity of the signed-in user to acquire an access token on behalf of the user.
- The registration process will create 2 related objects in the Azure AD tenant where the application is registered: an application object and a service principal object. For more background on these components and how they are used at run-time, please review [Application and service principal objects in Azure Active Directory][AAD-Apps-And-Sps].

Now we are ready to register your client application with Azure AD.

### Client registration
To register a client that will access an Azure Resource Manager REST API, see [Use portal to create Active Directory application and service principal that can access resources][ARM-Create-Sp-Portal] for step-by-step registration instructions. This article (also available in PowerShell and CLI versions for automating registration) will show you how to:

- register the client application with Azure AD
- set [permission requests][AAD-Glossary-Permissions] to allow the client to access the Azure Resource Manager API
- configure Azure Resource Manager's Role Based Access Control (RBAC) settings for authorizing the client

For all other clients, refer to [Integrating applications with Azure Active Directory][AAD-Integrating-Apps]. This article will show you how to: 

- register the client application with Azure AD, in the "Adding an application" section
- create a secret key (if you are registering a web client), in the "Updating an application" section
- add permission requests as required by the API, in the "Updating an application" section

Now that you've completed registration of your client application, we can move to your client code, where you will create the REST request and handle the response.

## Create the request
This section covers the first 3 of the 5 components we discussed earlier. First we need to acquire the access token from Azure AD, which we will use in assembling our request message header.

### Acquire an access token

Once you have a valid client registration, there are essentially 2 ways of integrating with Azure AD to acquire an access token:

- Azure AD's platform/language-neutral OAuth2 service endpoints, which is what we will use. Just like the Azure REST API endpoints you are using, the instructions provided in this section make no assumptions about your client's platform or language/script when using the Azure AD endpoints; only that it can send/receive HTTPS requests to/from Azure AD, and parse the response message.  
- The platform/language-specific Azure AD Authentication Libraries (ADAL). The libraries provide asynchronous wrappers for the OAuth2 endpoint requests, and robust token handling features such as caching and refresh token management. For more details, including reference documentation, library downloads, and sample code, please see [Azure Active Directory Authentication Libraries][AAD-Auth-Libraries].

The 2 Azure AD endpoints you will be using to authenticate your client and acquire an access token are referred to as the OAuth2 `/authorize` and `/token` endpoints. How you use them will be dependent on your application's registration, and the type of [OAuth2 authorization grant flow][AAD-Glossary-Authorization-Grant] you need in order to support your application at run-time. For the purposes of this article, we will assume that your client will be using one of the following authorization grant flows: authorization code or client credentials. Follow the instructions for the one that best matches your scenario, to acquire the access token you will use in the remaining sections.

#### Authorization code grant (interactive clients)

This grant can be used by both web and native clients, and requires credentials from a signed-in user in order to delegate resource access to the client application. It uses the `/authorize` endpoint to obtain an authorization code (in response to user sign-in/consent), followed by the `/token` endpoint to exchange the authorization code for an access token.  

1. First your client will need to request an authorization code from Azure AD. See [Request an authorization code][AAD-Oauth-Code-Authz] for details on the format of the HTTPS GET request to the `/authorize` endpoint, and example request/response messages. The URI will contain query string parameters, including the following that are specific to your client application:

    - `client_id` - also known as an application ID, this is the GUID assigned to your client application when you registered in the section above
    - `redirect_uri` - a URL-encoded version of [one of] the reply/redirect URIs specified during registration of your client application. Note that the value you pass must match exactly to your registration!
    - `resource` - a URL-encoded identifier URI specified by the REST API you are calling. Web/REST APIs (also known as resource applications) can expose one or more application ID URIs in their configuration. For example:  

        - Azure Resource Manager provider (and classic Service Management) APIs use `https://management.core.windows.net/`  
        - For any other resources, see the API documentation or the resource application's configuration in the Azure portal. See also the [`identifierUris` property][AAD-Graph-Application] of the Azure AD application object for more details.  

    The request to the `/authorize` endpoint will first trigger a sign-in prompt to authenticate the end-user. The response you get back will be delivered as a redirect (302) to the URI you specified in `redirect_uri`. The response header message will contain a `location` field, which contains the redirect URI followed by a `code` query parameter, containing the authorization code you will need for step #2. 

2. Next, your client will need to redeem the authorization code for an access token. See [Use the authorization code to request an access token][AAD-Oauth-Code-Token] for details on the format of the HTTPS POST request to the `/token` endpoint, and example request/response messages. Because this is a POST request, this time you will package your application-specific parameters in the request body. In addition to some of the ones mentioned above (along with other new ones), you will pass :

    - `code` - this is the query parameter that will contain the authorization code you obtained in step #1.
    - `client_secret` - you will only need this parameter if your client is configured as a web application. This is the same secret/key value you generated earlier, in [client registration](#client-registration).

#### Client credentials grant (non-interactive clients)

This grant can only be used by web clients, allowing the application to access resources directly (no user delegation) using the client's own credentials, which are provided at registration time. It's typically used by non-interactive clients (no UI) running as a daemon/service, and requires only the `/token` endpoint to acquire an access token.

The client/resource interactions for this grant are very similar to step #2 of the authorization code grant. Please see the "Request an Access Token" section in [Service to service calls using client credentials][AAD-Oauth-Client-Creds] for details on the format of the HTTPS POST request to the `/token` endpoint, and example request/response messages.

### Assemble the request message
Note that most programming languages/frameworks and scripting environments make it easy to assemble and send the request message. They typically provide a web/HTTP class or API that abstracts the creation/formatting of the request, making it easier to write the client code (ie: the HttpWebRequest class in the .NET Framework, for example). For brevity, we will only cover the important elements of the request, given that most of this will be handled for you.

#### Request URI
All secured REST requests require the HTTPS protocol for the URI scheme, providing the request and response with a secure channel, due to the fact that sensitive information is transmitted/received. This information (ie: the Azure AD authorization code, access/bearer token, sensitive request/response data) gets encrypted by a lower transport layer, ensuring the privacy of the messages. 

The remainder of your service's request URI (the host, resource path, and any required query string parameters) will be determined by it's related REST API specification. For example, Azure Resource Manager provider APIs use `https://management.azure.com/`, classic Azure Service Management APIs use `https://management.core.windows.net/`, both require an `api-version` query string parameter, etc.

#### Request header
The request URI will be bundled in the request message header, along with any additional fields as determined by your service's REST API specification and the [HTTP specification](http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html). Here are some common header fields you might need in your request:

- `Authorization`: contains the OAuth2 bearer token to secure the request, as acquired earlier from Azure AD
- `Content-Type`: typically set to "application/json" (name/value pairs in JSON format), and specifies the MIME type of the request body.
- `Host`: this is the domain name or IP address of the server where the REST service endpoint is hosted

#### Request body
As mentioned earlier, the request message body is optional, depending on the specific operation you're requesting and its parameter requirements. If it's required, the API specification for the service you are requesting will also specify the encoding and format. 

The request body is separated from the header by an empty line, should be formatted per the `Content-Type` header field. An example of an "application/json" formatted body would appear as follows: 

```
{
  "<name>": "<value>"
}
```

## Send the request
Now that you have the service's request URI and have created the related request message header/body, you are ready to send the request to the REST service endpoint. 

For example, an HTTPS GET request method for an Azure Resource Manager provider might be sent using request header fields similar to the following, but notice the request body is empty:

```
GET /subscriptions?api-version=2014-04-01-preview HTTP/1.1
Authorization: Bearer <bearer-token>
Host: management.azure.com

<no body>
```

And an HTTPS PUT request method for an Azure Resource Manager provider might be sent using request header AND body fields similar to the following:

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

After you make the request, the response message header and optional body will be returned.

## Process the response message

Now we'll finish with the last 2 of the 5 components. 

To process the response, you will need to parse the response header and optionally the response body (depending on the request). In the HTTPS GET example provided above, we used the /subscriptions endpoint to retrieve the list of subscriptions for a user. Assuming the response was successful, we should receive response header fields similar to the following:

```
HTTP/1.1 200 OK
Content-Length: 303
Content-Type: application/json;
```

and a response body, containing the list of Azure subscriptions and their individual properties encoded in JSON format, similar to:
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

Similarly, for the HTTPS PUT example, we should receive a response header similar to the following, confirming that our PUT operation to add the "ExampleResourceGroup" was successful :

```
HTTP/1.1 200 OK
Content-Length: 193
Content-Type: application/json;
```

and a response body, confirming the content of our newly added resource group encoded in JSON format, similar to:
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

As with the request, most programming languages/frameworks make it easy to process the response message. They typically return this information to your application following the request, allowing you to process it in a typed/structured format. Mainly, you will be interested in confirming the HTTP status code in the response header, and if succsessful, parsing the response body according to the API specification (or the `Content-Type` and `Content-Length` response header fields).

That's it! Once you have your Azure AD application registered, and a componentized technique for acquiring an access token and creating and processing HTTP requests, it's fairly easy to replicate your code to take advantage of new REST APIs.

## Related content

- See the [Azure AD Developers Guide][AAD-Dev-Guide] for more information on application registration and the the Azure AD programming model, including a comprehensive index of HowTo and QuickStart articles, and sample code.
- For testing HTTP requests/responses, check out
    - [Fiddler](http://www.telerik.com/fiddler). Fiddler is a free web debugging proxy that can intercept your REST requests, making it easy to diagnose the HTTP request and response messages.
    - [JWT Decoder](http://jwt.calebb.net/) and [JWT.io](https://jwt.io/), which make it quick and easy to dump the claims in your bearer token so you can validate their contents.

Please use the LiveFyre comments section that follows this article to provide feedback and help us refine and shape our content.

<!--Reference style links: DOCS -->

[AAD-Apps-And-Sps]: ../../Azure/active-directory/active-directory-application-objects
[AAD-Auth-Libraries]: ../../Azure/active-directory/active-directory-authentication-libraries
[AAD-Dev-Guide]: ../../Azure/active-directory/active-directory-developers-guide
[AAD-Glossary-Access-Token]: ../../Azure/active-directory/active-directory-dev-glossary.md#access-token
[AAD-Glossary-Authorization-Grant]: ../../Azure/active-directory/active-directory-dev-glossary.md#authorization-grant
[AAD-Glossary-Claim]: ../../Azure/active-directory/active-directory-dev-glossary.md#claim
[AAD-Glossary-Client-Application]: ../../Azure/active-directory/active-directory-dev-glossary.md#client-application
[AAD-Glossary-Permissions]: ../../Azure/active-directory/active-directory-dev-glossary.md#permissions
[AAD-Glossary-Tenant]: ../../Azure/active-directory/active-directory-dev-glossary.md#tenant
[AAD-Glossary-Native-Client]: ../../Azure/active-directory/active-directory-dev-glossary.md#native-client
[AAD-Glossary-Web-Client]: ../../Azure/active-directory/active-directory-dev-glossary.md#web-client
[AAD-Graph-Application]: https://msdn.microsoft.com/Library/Azure/Ad/Graph/api/entity-and-complex-type-reference#application-entity
[AAD-Howto-Tenant]: ../../Azure/active-directory/active-directory-howto-tenant
[AAD-Integrating-Apps]: ../../Azure/active-directory/active-directory-integrating-applications
[AAD-OAuth-Client-Creds]: ../../Azure/active-directory/active-directory-protocols-oauth-service-to-service.md#request-an-access-token
[AAD-Oauth-Code-Authz]: ../../Azure/active-directory/active-directory-protocols-oauth-code.md#request-an-authorization-code
[AAD-Oauth-Code-Token]: ../../Azure/active-directory/active-directory-protocols-oauth-code.md#use-the-authorization-code-to-request-an-access-token
[ARM-Create-Sp-Portal]: ../../Azure/resource-group-create-service-principal-portal
[ARM-Provider-Summary]: ../../Azure/resource-manager-supported-services
[SDK-NET]: ../../dotnet/api/
[SDK-JAVA]: ../../java/api/
[SDK-CLI]: ..../cli/azure/
