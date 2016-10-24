# Azure REST API Reference

Welcome to the Azure REST API Reference.

Representational State Transfer (REST) APIs are sets of HTTP operations (methods) that can be performed on resources for REST service endpoints. 

The components of a REST API call are:
    - An HTTP operation. Azure REST APIs support GET, PUT, POST, PATCH, and HEAD.
    - A URI scheme, which indicates the protocol used to transmit the call. For example, "http" and "https".
    - A URI host, which is domain name or IP address of the server where the service endpoint is hosted.
    - A path, which specifies the resource or resource collection, as well as parameters used to determine the selection of those resources.
    - An optional query string, used to provide additional simple parameters.
    - An optional payload ("body") of the HTTP message for POST operations, which contains MIME-encoded objects passed as complex parameters. The MIME encoding type for the body must be supplied as well. Note that some services require you to use a specific MIME type, such as "application/json".

REST API calls minimally return an HTTP status code from the 200 code list upon success; otherwise, they return a different code (as indicated in the documentation). They can also return MIME-encoded response objects in the HTTP response body.

> For almost all Azure service REST APIs, there is a corresponding client SDK call which handles much of the client code for you. See:
> [Azure .NET SDK]()
> [Azure Java SDK]()
> [Azure CLI 2.0 SDK]()

## Authenticate with your Azure account

Many Azure services require your code to authenticate with valid Azure credentials before you can call one of their service APIs. For APIs that support Azure Resource Manager (ARM),
you should get the Azure [Active Directory Authentication Library (ADAL) NuGet package](https://www.nuget.org/packages/Microsoft.IdentityModel.Clients.ActiveDirectory).

For more details, read [Authorize access to web applications using OAuth 2.0 and Azure Active Directory](https://azure.microsoft.com/en-us/documentation/articles/active-directory-protocols-oauth-code/).


