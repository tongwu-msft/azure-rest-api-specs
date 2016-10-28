# Azure REST API Reference

Welcome to the Azure REST API Reference.

Representational State Transfer (REST) APIs are service endpoints that support sets of HTTP operations (methods), which provide create/retrieve/update/delete access to the service's resources. The sections below will walk you through the basics of [REST API request and response components](#components-of-a-rest-api-requestresponse), how to [register your client application](#register-your-client-application-with-azure-ad) before making REST requests, how to [create a REST request](#create-the-request), and how to [handle the REST response](#process-the-response).

## Components of a REST API request/response

A REST API request/response pair can be separated into 5 components:

1. The **URI**, which consists of the following: `{URI-scheme} :// {URI-host} / {resource-path} ? {query-string}`
    - URI scheme: indicates the protocol used to transmit the request. For example, `http` or `https`.  
    - URI host: the domain name or IP address of the server where the REST service endpoint is hosted, such as `graph.microsoft.com`  
    - Resource path: specifies the resource or resource collection, which may include multiple segments used by the service in determining the selection of those resources. For example: `beta/applications/00003f25-7e1f-4278-9488-efc7bac53c4a/owners` could be used to query the list of owners of a specific application within the applications collection.
    - Query string (optional): used to provide additional simple parameters, such as the API version, selection criteria, etc.
2. HTTP **request message header** fields
    - A required [HTTP method](http://www.w3.org/Protocols/rfc2616/rfc2616-sec9.html) (also known as an operation or verb). Azure REST APIs support GET, HEAD, PUT, POST, and PATCH methods.
    - Optional additional header fields as required by the specified URI and HTTP method. For example, an Authorization header that provides a bearer token containing client authorization information for the request.
3. Optional HTTP **request message body** fields, to support the URI and HTTP operation. For example, POST operations contain MIME-encoded objects passed as complex parameters. The MIME encoding type for the body should be provided in the `Content-type` request header as well, for POST/PUT operations. Note that some services require you to use a specific MIME type, such as `application/json`.  
4. HTTP **response message header** fields
    - An [HTTP status code](http://www.w3.org/Protocols/HTTP/HTRESP.html), ranging from 2xx success codes to 4xx/5xx error codes. Alternatively, a service-defined status code may be returned, as indicated in the API documentation. 
5. Optional HTTP **response message body** fields
    - MIME-encoded response objects may be returned in the HTTP response body, such as a response from a GET method that is returning data. Typically these will be returned in a structured format as JSON or XML, as indicated by the `Content-type` response header. For example, when requesting an access token from Azure Active Directory (Azure AD), it will be returned in the response body as the `access_token` element, one of several name/value paired objects in a data collection. In this example, a response header of `Content-Type: application/json` will also be included.

> For almost all Azure service REST APIs, there is a corresponding client SDK library which handles much of the client code for you. See:  
> [Azure .NET SDK](https://docs.microsoft.com/en-us/dotnet/api)  
> [Azure Java SDK](https://docs.microsoft.com/en-us/java/api)  
> [Azure CLI 2.0 SDK](https://docs.microsoft.com/en-us/cli/azure)  

## Register your client application with Azure AD

Many Azure services require your client code to authenticate with valid credentials before you can call the service API, which also allows the service to perform any required authorization. Azure Resource Manager REST APIs require client applications to authenticate with Azure AD, providing proof of the authentication/authorization by passing the resulting OAuth2 access token in the HTTP Authorization header of subsequent REST API requests. 

Before you begin writing your client's request code, follow the instructions below to first register your [client application](https://azure.microsoft.com/documentation/articles/active-directory-dev-glossary/#client-application) with Azure AD. If you are using a REST API that does not use integrated Azure AD authentication, or you've already registered a client application, you can skip to the [Create the request](#create-the-request) section. 

1. Azure AD and the OAuth2 Authorization Framework support 2 types of clients. Before you register your application, decide which is the most appropriate for your scenario:  
    - [web/confidential](https://azure.microsoft.com/documentation/articles/active-directory-dev-glossary/#web-client) clients can access resources under either their own identity (as a service/daemon), or obtain delegated authorization to access them under the identity of the signed-in user.  
    - [native/public](https://azure.microsoft.com/documentation/articles/active-directory-dev-glossary/#native-client) clients (installed on a device) can only access resources under the delegated authorization using the identity of the signed-in user. 
2. Next, register your client application with Azure AD, by following the steps in [Integrating applications with Azure Active Directory](https://azure.microsoft.com/en-us/documentation/articles/active-directory-integrating-applications).  
    - First, under the "Adding an application" section you will create the basic registration for the client. 
    - Then follow the steps under the "Updating an application" section, to
        - Gain an understanding of the Azure AD Consent Framework
        - Add any required [permission requests](https://azure.microsoft.com/documentation/articles/active-directory-dev-glossary/#permissions) to allow your client to access the API
        - Add a create a secret key if you are registering a web client. This is required in order for your client to authenticate with Azure AD, regardless of which authorization grant you will use at runtime (discussed below).
    - To use an Azure Resource Manager API, see [Use portal to create Active Directory application and service principal that can access resources](https://azure.microsoft.com/documentation/articles/resource-group-create-service-principal-portal/) for step-by-step registration instructions. This article will not only show you how to register the client application with Azure AD, it will also walk you through the steps required by Azure Resource Manager to properly configure it's Role Based Access Control (RBAC) settings for authorizing the client.


## Create the request
We will assume that you will be calling an Azure REST API, which means your client application must authenticate with Azure AD. 

Azure AD exposes service endpoints to facilitate application integration, and the 2 you will be interested in using are the /authorize and /token endpoints. How you use those endpoints will be dependent on your application's registration, and the type of [authorization grant flow](https://azure.microsoft.com/documentation/articles/active-directory-dev-glossary/#authorization-grant) required in order to support your application at runtime. For the purposes of this article, we will also assume that your client will be using one of the following authorization grant flows:

- authorization code grant, which can be used by both web and native clients, and uses an end-user's credentials for delegating resource access to the client application.  
- client credentials grant, which can only be used by web clients, and allows the client application to access resources directly using it's own credentials (provided at registration time). 

The first step is to add code to your client application to acquire an access token, which will prove your client application's authenticity and enable it to make subsequent REST API requests:  

1. See [X]() for instructions on adding the code required to authenticate with Azure AD and acquire an access token
2. Construct an HTTP Authorization header 

Now you are ready to call the REST API. As mentioned earlier, you will need to consider 3 of the 5 components required when making the request:
    -   

> [!NOTE] If you prefer to use client libraries to manage token acquisition instead of using the Azure AD REST endpoints. For more details, including reference documentation, library downloads, and sample code, please see [Azure Active Directory Authentication Libraries](https://azure.microsoft.com/documentation/articles/active-directory-authentication-libraries/).


## Process the response
In the example provided above, we used the /subscriptions endpoint to retrieve the list of subscriptions for our sample client application.

## Related content
- [Integrating applications with Azure Active Directory](https://azure.microsoft.com/documentation/articles/active-directory-integrating-applications/)
- For testing HTTP requests/responses, checkout [Fiddler](http://www.telerik.com/fiddler)

Token inspection

