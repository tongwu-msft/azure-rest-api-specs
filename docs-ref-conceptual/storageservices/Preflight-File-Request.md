---
title: Preflight File Request (FileREST API) - Azure Files
description: The Preflight File Request operation queries the Cross-Origin Resource Sharing (CORS) rules for Azure Files prior to sending the actual request. A web browser or another user agent sends a preflight request that includes the origin domain, method, and headers for the actual request that the agent wishes to make.
author: wmgries

ms.date: 06/05/2021
ms.service: storage
ms.topic: reference
ms.author: wgries
---

# Preflight File Request
The `Preflight File Request` operation queries the Cross-Origin Resource Sharing (CORS) rules for Azure Files prior to sending the actual request. A web browser or another user agent sends a preflight request that includes the origin domain, method, and headers for the actual request that the agent wishes to make. If CORS is enabled for Azure Files, then Azure Files evaluates the preflight request against the CORS rules that the account owner has configured via [Set File Service Properties](Set-File-Service-Properties.md), and accepts or rejects the request.  
  
For more information about CORS and the preflight request, see [the CORS specification](https://www.w3.org/TR/cors/) and [Cross-Origin Resource Sharing (CORS) support for Azure Storage](Cross-Origin-Resource-Sharing--CORS--Support-for-the-Azure-Storage-Services.md).

## Protocol availability

| Enabled file share protocol | Available |
|-|:-:|
| SMB | ![Yes](./media/yes-icon.png) |
| NFS | ![Yes](./media/yes-icon.png) |
  
## Request
The `Preflight File Request` may be specified as follows. Replace `<account-name>` with the name of your storage account. Replace `<file-resource>` with the share, directory, or file resource that is to be the target of the actual request:  
  
|HTTP Verb|Request URI|HTTP version|  
|---------------|-----------------|------------------|  
|OPTIONS|`http://<account-name>.file.core.windows.net/<file-resource>`<br /><br /> `http://<account-name>.file.core.windows.net/<file-resource>?restype=share`<br /><br /> `http://<account-name>.file.core.windows.net/<file-resource>?restype=directory`|HTTP/1.1|  
  
Note that the URI must always include the forward slash (/) to separate the host name from the path and query portions of the URI. In the case of this operation, the path portion of the URI can be empty, or can point to any File service resource. If the File service resource is a share or a directory, the restype query parameter is required. The resource may or may not exist at the time the preflight request is made; the preflight request is evaluated at the service level against the service's CORS rules, so the presence or absence of the resource name does not affect the success or failure of the operation.  
  
### URI parameters
None.
  
### Request headers
The following table describes required and optional request headers.  
  
|Request header|Description|  
|--------------------|-----------------|  
|`Origin`|Required. Specifies the origin from which the actual request will be issued. The origin is checked against the service's CORS rules to determine the success or failure of the preflight request.|  
|`Access-Control-Request-Method`|Required. Specifies the method (or HTTP verb) for the actual request. The method is checked against the service's CORS rules to determine the failure or success of the preflight request.|  
|`Access-Control-Request-Headers`|Optional. Specifies the headers for the actual request headers that will be sent, then the service assumes no headers are sent with the actual request.|  
  
### Request body
None.
  
## Response
The response includes an HTTP status code and a set of response headers.  
  
### Status code
A successful operation returns status code 200 (OK).  
  
### Response headers
The response for this operation includes the following headers. The response may also include additional standard HTTP headers. All standard headers conform to the [HTTP/1.1 protocol specification](https://go.microsoft.com/fwlink/?linkid=150478).  
  
See [the CORS specification](https://www.w3.org/TR/cors/) for details about preflight request headers.  
  
|Response header|Description|  
|---------------------|-----------------|  
|`Access-Control-Allow-Origin`|The allowed origin, which matches the origin header in the request if the preflight request succeeded.|  
|`Access-Control-Allow-Methods`|If the preflight requests succeeds, this header is set to the value or values specified for the request header Access-Control-Request-Method.|  
|`Access-Control-Allow-Headers`|If the preflight request succeeds, this header is set to the value or values specified for the request header Access-Control-Request-Headers.|  
|`Access-Control-Max-Age`|Specifies the length of time the user agent is allowed to cache the preflight request for future requests.|  
|`Access-Control-Allow-Credentials`|Indicates whether the actual request can be made using credentials. This header is always set to **true**.|  
  
### Response body
None.
  
## Authorization
The `Preflight File Request` operation always executes anonymously. It does not require authorization, and ignores credentials if they are provided.

> [!NOTE]
> If you have enabled Azure Storage analytics and are logging metrics, note that a call to the `Preflight File Request` operation is logged as **AnonymousSuccess**. For this reason, if you view metrics in the Azure portal, you will see **AnonymousSuccess** logged for `Preflight File Request`. This metric does not indicate that your private data has been compromised, but only that the `Preflight File Request` operation succeeded with a status code of 200 (OK). 

## Sample request and response
The following example sends a preflight request for the origin www.contoso.com, with the request method set to **PUT** and the request headers set to content-type and accept.  
  
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
  
The response indicates that CORS is enabled for the service, and that a CORS rule matches the preflight request.  

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
If CORS is enabled for the service and there is a CORS rule that matches the preflight request, the service responds to the preflight request with status code 200 (**OK**). The response includes the required `Access-Control` headers. In this case, the request will be billed.  
  
If CORS is not enabled or no CORS rule matches the preflight request, the service responds with status code 403 (**Forbidden**). In this case, the request will not be billed.  
  
If the OPTIONS request is malformed, the service responds with status code 400 (**Bad Request**) and the request is not billed. An example of a malformed request is one that doesn't contain the required `Origin` and `Access-Control-Request-Method` headers.  

Note that the preflight request is a mechanism to query the CORS capability of a storage service associated with a certain storage account. The preflight request is not targeted to a specific resource.