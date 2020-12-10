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

When making REST Calls to Azure Communication Services(ACS), authentication of some kind is usually required. Handling authentication, is usually handled by our SDKs but if you're making the requests manually using your own client or systems you will have to handle this yourself. Here you'll find some guidance and information on how to do this.

## Types of Authentication

ACS has two types of Authentication, they are used for slightly different purposes which are explained below:

- **Access Key authentication** for SMS and Administration operations. Access Key authentication is suitable for applications running in a trusted service environment.
- **User Access Token authentication** for Chat and Calling. User access tokens let your client applications authenticate directly against Azure Communication Services. These tokens are generated on a server-side token provisioning service that you create. They're then provided to client devices that use the token to initialize the Chat and Calling client libraries.

## Access Key Authentication

Access Key authentication is used when the operations you are carrying out are not related to an individual User but instead are related more to your overall application or service. These requests should be ran within a trusted service environment where its details are not exposed to end users. 

In this authentication method, requests are signed requests includes a client generated [hash-based message authentication code(HMAC)](https://en.wikipedia.org/wiki/HMAC) once this is calculated it is included within an `Authorization` header of each HTTP Request. Additionally, each request must be signed in a specific way.

Before getting started ensure you have:

- Your Azure Communication Services Access Key
- Your Azure Communication Service Endpoint
- The URL Path and HTTP Verb that you're calling
- A programming/development environment which is capable of generating HMACs, SHA256 hashes and Base64 Encoding and Decoding.

Once you have these items you can proceed with signing your request.

## Signing a HTTP Request

1. Specify the Coordinated Universal Time (UTC) timestamp for the request in either the `x-ms-date` header, or in the standard HTTP `Date` header. The service validates this to guard against certain security attacks, including replay attacks.
2. Hash the HTTP request body using the SHA256 algorithm then pass it, with the request, via the `x-ms-content-sha256` header.
3. Construct the string to be signed by concatenating the HTTP Verb (e.g. `GET` or `PUT`), HTTP request path, and values of the `Date`, `Host` and `x-ms-content-sha256` HTTP headers in the following format:

    ```pseudocode
    VERB + "\n"
    URLPathAndQuery + "\n"
    DateHeaderValue + ";" + HostHeaderValue + ";" + ContentHashHeaderValue
    ```

4. Generate an HMAC-256 signature of the UTF-8 encoded string that you created in the previous step. Next, encode your results as Base64. Note that you also need to Base64-decode your access key. Use the following format (shown as pseudo code):

    ```pseudocode
    Signature=Base64(HMAC-SHA256(UTF8(StringToSign), Base64.decode(<your_access_key>)))
    ```

5. Specify the Authorization header as follows:

    ```pseudocode
    Authorization="HMAC-SHA256 SignedHeaders=date;host;x-ms-content-sha256&Signature=<hmac-sha256-signature>"  
    ```

    Where `<hmac-sha256-signature>` is the HMAC computed in the previous step.

With all of the other details known and the headers set you can now specify the `Authorization` header, its format is as follows: `Authorization: "HMAC-SHA256 SignedHeaders=date;host;x-ms-content-sha256&Signature=<hmac-sha256-signature>"`


## User Access Token Authentication