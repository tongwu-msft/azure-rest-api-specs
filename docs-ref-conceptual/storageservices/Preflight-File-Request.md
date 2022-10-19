---
title: Preflight File Request (FileREST API) - Azure Files
description: The Preflight File Request operation queries the Cross-Origin Resource Sharing (CORS) rules for Azure Files before sending the request.
author: wmgries

ms.date: 06/05/2021
ms.service: storage
ms.topic: reference
ms.author: wgries
---

# Preflight File Request
The `Preflight File Request` operation queries the Cross-Origin Resource Sharing (CORS) rules for Azure Files before sending the request. 

A web browser or another user agent sends a preflight request that includes the origin domain, method, and headers for the request that the agent wants to make. If CORS is enabled for Azure Files, then Azure Files evaluates the preflight request against the CORS rules that the account owner has configured via [Set File Service Properties](Set-File-Service-Properties.md). Azure Files then accepts or rejects the request.  
  
For more information about CORS and the preflight request, see [the CORS specification](https://www.w3.org/TR/cors/) and [CORS support for Azure Storage](Cross-Origin-Resource-Sharing--CORS--Support-for-the-Azure-Storage-Services.md).

## Protocol availability

| Enabled file share protocol | Available |
|-|:-:|
| SMB | ![Yes](./media/yes-icon.png) |
| NFS | ![Yes](./media/yes-icon.png) |
  
## Request
You can specify `Preflight File Request` as follows. Replace `<account-name>` with the name of your storage account. Replace `<file-resource>` with the share, directory, or file resource that will be the target of the request.  
  
|HTTP verb|Request URI|HTTP version|  
|---------------|-----------------|------------------|  
|`OPTIONS`|`http://<account-name>.file.core.windows.net/<file-resource>`<br /><br /> `http://<account-name>.file.core.windows.net/<file-resource>?restype=share`<br /><br /> `http://<account-name>.file.core.windows.net/<file-resource>?restype=directory`|HTTP/1.1|  
  
The URI must always include the forward slash (/) to separate the host name from the path and query portions of the URI. In the case of this operation, the path portion of the URI can be empty, or it can point to any Azure Files resource. If the Azure Files resource is a share or a directory, the `restype` query parameter is required. 

The resource might or might not exist at the time that the preflight request is made. The preflight request is evaluated at the service level against the service's CORS rules, so the presence or absence of the resource name does not affect the success or failure of the operation.  
  
### URI parameters
None.
  
### Request headers
The following table describes required and optional request headers:  
  
|Request header|Description|  
|--------------------|-----------------|  
|`Origin`|Required. Specifies the origin from which the request will be issued. The origin is checked against the service's CORS rules to determine the success or failure of the preflight request.|  
|`Access-Control-Request-Method`|Required. Specifies the method (or HTTP verb) for the request. The method is checked against the service's CORS rules to determine the failure or success of the preflight request.|  
|`Access-Control-Request-Headers`|Optional. Specifies the request headers that will be sent. If it's not present, the service assumes that the request doesn't include headers.|  
  
### Request body
None.
  
## Response
The response includes an HTTP status code and a set of response headers.  
  
### Status code
A successful operation returns status code 200 (OK).  
  
### Response headers
The response for this operation includes the following headers. The response might also include additional standard HTTP headers. All standard headers conform to the [HTTP/1.1 protocol specification](https://go.microsoft.com/fwlink/?linkid=150478).  
  
For details about preflight request headers, see [the CORS specification](https://www.w3.org/TR/cors/).  
  
|Response header|Description|  
|---------------------|-----------------|  
|`Access-Control-Allow-Origin`|Indicates the allowed origin, which matches the origin header in the request if the preflight request succeeds.|  
|`Access-Control-Allow-Methods`|If the preflight request succeeds, this header is set to the value or values specified for the request header `Access-Control-Request-Method`.|  
|`Access-Control-Allow-Headers`|If the preflight request succeeds, this header is set to the value or values specified for the request header `Access-Control-Request-Headers`.|  
|`Access-Control-Max-Age`|Specifies the length of time that the user agent is allowed to cache the preflight request for future requests.|  
|`Access-Control-Allow-Credentials`|Indicates whether the request can be made through credentials. This header is always set to `true`.|  
  
### Response body
None.
  
## Authorization
The `Preflight File Request` operation always executes anonymously. It does not require authorization, and it ignores credentials if they're provided.

> [!NOTE]
> If you have enabled Azure Storage analytics and are logging metrics, a call to the `Preflight File Request` operation is logged as `AnonymousSuccess`. For this reason, if you view metrics in the Azure portal, you'll see `AnonymousSuccess` logged for `Preflight File Request`. This metric does not indicate that your private data has been compromised, but only that the `Preflight File Request` operation succeeded with a status code of 200 (OK). 

## Sample request and response
The following example sends a preflight request for the origin `www.contoso.com`. The request method is set to `PUT`, and the request headers are set to `content-type` and `accept`.  
  
```
OPTIONS http://myaccount.file.core.windows.net/myshare/myfile  
HTTP/1.1  
Accept: */*  
Origin: www.contoso.com  
Access-Control-Request-Method: PUT  
Access-Control-Request-Headers: content-type, accept  
Accept-Encoding: gzip, deflate  
User-Agent: Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.2; WOW64; Trident/6.0)  
Content-Length: 0    
```  
  
The response indicates that CORS is enabled for the service, and that a CORS rule matches the preflight request:  

```
HTTP/1.1 200 OK  
Connection: Keep-Alive  
Content-Length: 0  
Content-Type: text/html; charset=UTF-8  
Access-Control-Allow-Origin: *  
Access-Control-Max-Age: 60  
Access-Control-Allow-Methods: PUT  
Access-Control-Allow-Headers: accept,content-type
```

## Remarks
If CORS is enabled for the service and a CORS rule matches the preflight request, the service responds to the preflight request with status code 200 (OK). The response includes the required `Access-Control` headers. In this case, the request is billed.  
  
If CORS is not enabled or no CORS rule matches the preflight request, the service responds with status code 403 (Forbidden). In this case, the request is not billed.  
  
If the `OPTIONS` request is malformed, the service responds with status code 400 (Bad Request) and the request is not billed. An example of a malformed request is one that doesn't contain the required `Origin` and `Access-Control-Request-Method` headers.  

The preflight request is a mechanism to query the CORS capability of a storage service that's associated with a certain storage account. The preflight request is not targeted to a specific resource.
