---
title: Azure Communication Services Authentication
description: Learn how to authenticate your requests against Communication Services REST APIs
author: ProbablePrime
ms.author: rifox
ms.manager: sstacey
ms.date: 03/12/2020
ms.topic: reference
ms.service: azure-communication-services
ms.devlang: rest-api
---
# Authentication

When making REST Calls, several steps are required to authenticate properly. Our SDKs handle this process for you, but making requests manually means you'll need to handle it yourself.

## Types of Authentication

Azure Communication Services has three types of Authentication, they're used for slightly different purposes:

- **Access Key authentication** for SMS, Identity, and access token operations. Access Key authentication is suitable for applications running in a trusted service environment.
- **Azure Managed Identity authentication** Similar to Access Key Authentication, this is suitable for SMS, Identity, and access token operations in a trusted service environment.
- **User Access Token authentication** for Chat and Calling. User access tokens let your client applications authenticate directly against Azure Communication Services. These tokens are generated on a server-side token provisioning service that you create. They're then provided to client devices that use the token to initialize the Chat and Calling client libraries.

## Access Key Authentication

Access Key authentication is used when requests aren't made by your end-user application. Run these requests within trusted service environment.

In this authentication method, requests are signed using a client generated [hash-based message authentication code(HMAC)](https://en.wikipedia.org/wiki/HMAC).

Before getting started, ensure you have:

- Your Azure Communication Services Access Key
- Your Azure Communication Service Endpoint
- The URL Path and HTTP Verb that you're calling
- A development environment, which can generate HMACs, SHA256 hashes, and Base64 operations.

Once you have these items, you can continue with signing your request.

### Signing an HTTP Request

1. Specify the Coordinated Universal Time (UTC) timestamp for the request in either the `x-ms-date` header, or in the standard HTTP `Date` header. The service validates this timestamp to guard against certain security attacks, including replay attacks.

1. Hash the HTTP request body using the SHA256 algorithm then pass it, with the request, via the `x-ms-content-sha256` header.

1. Construct the string to be signed by concatenating the HTTP Verb (for example, `GET` or `PUT`), HTTP request path, and values of the `Date`, `Host` and, `x-ms-content-sha256` HTTP headers in the following format:

   ```pseudocode
   VERB + "\n"
   URLPathAndQuery + "\n"
   DateHeaderValue + ";" + HostHeaderValue + ";" + ContentHashHeaderValue
   ```

1. Generate an HMAC-256 signature of the UTF-8 encoded string that you created in the previous step. Next, encode your results as Base64. You also need to Base64-decode your access key. Use the following format (shown as pseudo code):

   ```pseudocode
   Signature=Base64(HMAC-SHA256(UTF8(StringToSign), Base64.decode(<your_access_key>)))
   ```

1. Specify the Authorization header as follows:

   ```pseudocode
   Authorization="HMAC-SHA256 SignedHeaders=date;host;x-ms-content-sha256&Signature=<hmac-sha256-signature>"  
   ```

    Where `<hmac-sha256-signature>` is the HMAC computed in the previous step.

With all of the other details known and the headers set you can now specify the `Authorization` header its format is as follows: `Authorization: "HMAC-SHA256 SignedHeaders=date;host;x-ms-content-sha256&Signature=<hmac-sha256-signature>"`

## Azure Managed Identity Authentication

Azure Managed Identity can be used when requests aren't made by your end-user application. Run these requests within a trusted service environment.

Before getting started, ensure you have:

- Your Azure Managed Identity
- The URL Path and HTTP Verb that you're calling

For how to create Azure Managed Identity, see - [Create an Azure Active Directory managed identity application from the Azure CLI](https://docs.microsoft.com/azure/communication-services/quickstarts/managed-identity-from-cli.md).

Once you have Azure Managed Identity created, you can use one of its secrets for authentication to access Communication Services for creating users, issuing user access tokens, or sending SMS messages.

### Using managed identity credential in a request

Once you have the id and a secret of a managed identity, you can use them in your requests to Azure Communication Services' REST API by supplying them in the 'Authorization' header.

```pseudocode
authorizationHeaderValue = convertToBase64String(<managed identity Id> + ":" + <secret of the managed identity>)
Authorization="BASIC <authorizationHeaderValue>"
```

## User Access Token Authentication

User access tokens let your client applications authenticate directly against Azure Communication Services as a particular user or identity.

### Generating / Obtaining a User Access Tokens

User Access Tokens are generated by you within a trusted environment. Generating them using our Administration SDK is the easiest way. For more information, see [creating and managing user access tokens](https://docs.microsoft.com/azure/communication-services/quickstarts/access-tokens).

### Using a User Access Token in a request

Once you have a suitable User Access Token, you can include it in your requests to Azure Communication Services' REST API by supplying it within the `Authorization` header.

## See Also

For additional information on Azure Communication Services authentication, you can also review:

- [Sign an HTTP request](https://docs.microsoft.com/azure/communication-services/tutorials/hmac-header-tutorial)
- [Conceptual Authentication documentation](https://docs.microsoft.com/azure/communication-services/concepts/authentication) - Provides information on how to use our SDKs to authenticate against our REST APIs
- [Building a User Access Token Service](https://docs.microsoft.com/azure/communication-services/tutorials/trusted-service-tutorial) - An Azure Communication Services tutorial, which shows you how to create a trusted authentication service to generate User Access Tokens with Azure Functions.
