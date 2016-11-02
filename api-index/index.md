---
title: Azure REST API Reference 
description: Azure REST API Reference 
keywords: Azure REST, Azure REST API Reference
author: bryanla
manager: douge
ms.date: 11/15/2016
ms.topic: reference
ms.prod: azure
ms.technology: azure
ms.devlang: rest-api
ms.assetid: D35E3780-B2BC-4450-8EF6-2710A11F99A7
---

# Azure REST API Reference

Welcome to the Azure REST API Reference.

Representational State Transfer (REST) APIs are service endpoints that support sets of HTTP operations (methods), which provide create/retrieve/update/delete access to the service's resources. The sections below will first walk you through the basics of [REST API request and response components](#components-of-a-rest-api-requestresponse), then provide detailed stops on how to:

- [Register your client application with Azure Active Directory (Azure AD)](#register-your-client-application-with-azure-ad) to secure your REST requests
- [Create a REST request](#create-the-request)
- [Handle the REST response](#process-the-response).

> [!NOTE] For almost all Azure service REST APIs, there is a corresponding client SDK library which handles much of the client code for you. See:  
> 
> [Azure .NET SDK](https://docs.microsoft.com/dotnet/api)  
> [Azure Java SDK](https://docs.microsoft.com/java/api)  
> [Azure CLI 2.0 SDK](https://docs.microsoft.com/cli/azure)  

## Components of a REST API request/response

A REST API request/response pair can be separated into 5 components:

1. The **request URI**, which consists of: `{URI-scheme} :// {URI-host} / {resource-path} ? {query-string}`
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

Most Azure services (such as [Azure Resource Manager providers](https://azure.microsoft.com/documentation/articles/resource-manager-supported-services/) and the classic Service Management APIs) require your client code to authenticate with valid credentials before you can call the service's API. Authentication is coordinated between the various actors by Azure AD, which provides your client with an [access token](https://azure.microsoft.com/documentation/articles/active-directory-dev-glossary/#access-token) as proof of the authentication/authorization. The token is then sent to the Azure service in the HTTP Authorization header of all subsequent REST API requests. The token's [claims](https://azure.microsoft.com/documentation/articles/active-directory-dev-glossary/#claim) also provide information to the service, allowing it to validate the client and perform any required authorization.

If you are using a REST API that does not use integrated Azure AD authentication, or you've already registered your client, you can skip to the [Create the request](#create-the-request) section. 

### Prerequisites

[Client applications](https://azure.microsoft.com/documentation/articles/active-directory-dev-glossary/#client-application) must make their configuration known to Azure AD before run-time, via Azure AD's application registry. In order to register your client, you must first obtain access to an Azure AD [tenant](https://azure.microsoft.com/documentation/articles/active-directory-dev-glossary/#tenant). If you do not have an Azure AD tenant yet, please see [How to get an Azure Active Directory tenant](https://azure.microsoft.com/documentation/articles/active-directory-howto-tenant/) before continuing. 

After you have access to an Azure AD tenant, consider the following important concepts before you register your client:

- Per the OAuth2 Authorization Framework, Azure AD supports 2 types of clients. Understanding each will help you decide which is the most appropriate for your scenario:  
    - [web/confidential](https://azure.microsoft.com/documentation/articles/active-directory-dev-glossary/#web-client) clients (run on a web server) can access resources under either their own identity (service/daemon), or obtain delegated authorization to access resources under the identity of the signed-in user (web app UI). Only a web client has the ability to securely maintain and present it's own credentials during Azure AD authentication to acquire an access token.  
    - [native/public](https://azure.microsoft.com/documentation/articles/active-directory-dev-glossary/#native-client) clients (installed/run on a device) can only access resources under delegated authorization, using the identity of the signed-in user to acquire an access token on behalf of the user.
- The registration process will create 2 related objects in the Azure AD tenant where the application is registered: an application object and a service principal object. For more background on these components and how they are used at run-time, please review [Application and service principal objects in Azure Active Directory](https://azure.microsoft.com/documentation/articles/active-directory-application-objects/) before continuing.

Now we are ready to register your client application with Azure AD.

### Client registration
To register a client that will access an Azure Resource Manager REST API, see [Use portal to create Active Directory application and service principal that can access resources](https://azure.microsoft.com/documentation/articles/resource-group-create-service-principal-portal/) for step-by-step registration instructions. This article (also available in PowerShell and CLI versions for automating registration) will show you how to:

- register the client application with Azure AD
- set [permission requests](https://azure.microsoft.com/documentation/articles/active-directory-dev-glossary/#permissions) to allow the client to access the Azure Resource Manager API
- configure Azure Resource Manager's Role Based Access Control (RBAC) settings for authorizing the client

For all other clients, refer to [Integrating applications with Azure Active Directory](https://azure.microsoft.com/documentation/articles/active-directory-integrating-applications). This article will show you how to: 

- register the client application with Azure AD, in the "Adding an application" section
- create a secret key (if you are registering a web client), in the "Updating an application" section
- add permission requests as required by the API

Now that you've completed registration of your client application, we can move to your client's code, where we will add code to create the REST request and handle the response.

## Create the request
This section covers the first 3 of the 5 components we discussed earlier. First we need to acquire the access token from Azure AD, which we will use in our request message header.

#### Acquire an access token

Once you have a valid client registration, there are essentially 2 ways of integrating with Azure AD to acquire an access token:

- Using Azure AD's platform/language-neutral OAuth2 service endpoints, which is the focus of this section  
- Using the platform/language-specific Azure AD Authentication Libraries (ADAL). The libraries provide asynchronous wrappers for the OAuth2 endpoint requests, and more robust token handling features such as caching and refresh token management. For more details, including reference documentation, library downloads, and sample code, please see [Azure Active Directory Authentication Libraries](https://azure.microsoft.com/documentation/articles/active-directory-authentication-libraries/).

As such, the instructions provided in this section make no assumptions about your client's platform or language/script, only that it has the ability to send/receive HTTPS requests to/from Azure AD and parse the response message content. The 2 Azure AD endpoints you will be interested in using are the /authorize and /token endpoints. How you use those endpoints will be dependent on your application's registration, and the type of [authorization grant flow](https://azure.microsoft.com/documentation/articles/active-directory-dev-glossary/#authorization-grant) you use to support your application at runtime.  

For the purposes of this article, we will assume that your client will be using one of the following authorization grant flows. Follow the instructions for each to acquire the access token you will use in the remaining sections:

 - **Authorization code grant**: can be used by both web and native clients, and requires credentials from a signed-in end-user in order to delegate resource access to the client application. This grant uses the /authorize endpoint to obtain an authorization code (in response to user sign-in/consent), and the /token endpoint to exchange the authorization code for an access token.  

    1. First your client will need to request an authorization code from Azure AD. See [Request an authorization code](https://azure.microsoft.com/documentation/articles/active-directory-protocols-oauth-code/#request-an-authorization-code) for details on the HTTPS request URI and request/response messages. Note that the URI you'll need for the `resource` parameter is specified by the service/resource. Resources can expose one or more URI, in the [`identifierUris` property of their application object](https://msdn.microsoft.com/Library/Azure/Ad/Graph/api/entity-and-complex-type-reference#application-entity). For example:  

        - Azure Resource Manager providers use `https://management.azure.com/`  
        - Classic Azure Service Management APIs use `https://management.core.windows.net/`  

    2. Next, your client will need to redeem the authorization code received in step #1, for an access token.

 - **Client credentials grant**: can only be used by web clients, and allows the client application to access resources directly (no user delegation) using its own credentials (provided at registration time). This grant is typically used by headless (no UI) clients running as a daemon/service, and uses only Azure AD's /token endpoint to acquire an access token. 
        - First https://azure.microsoft.com/en-us/documentation/articles/active-directory-protocols-oauth-service-to-service/  

Once your application successfully acquires the access token, it should look similar to the following:

If you are debugging your application, here are a couple of useful tools for inspecting the token and its claims 

#### Request URI
Your request URI will be determined by the REST API spec. Here's an example of

#### Request message header
Your request message head fields will also be determined by the REST API spec, but 

- Set the Content-Type header to application/json

#### Request message body
Finally, as mentioned earlier, the request message body is optional, depending on the specific operation you're requesting and its parameter requirements.

#### Make the request
You are now ready to send the request to the REST service endpoint. After you make the request, a the response message header and optional body will be returned.

## Process the response
Now we'll finish with the last 2 of the 5 components, and build out your client code to handle the response message.

In the example provided above, we used the /subscriptions endpoint to retrieve the list of subscriptions for our sample client application.

## Related content
- [Integrating applications with Azure Active Directory](https://azure.microsoft.com/documentation/articles/active-directory-integrating-applications/)
- For testing HTTP requests/responses, checkout [Fiddler](http://www.telerik.com/fiddler)

Token inspection

