---
ms.assetid: 4267b12c-2539-4d76-bc23-9f04c942554b
ms.title: Azure DocumentDB Resource Provider REST API Headers
ms.prod: azure
ms.service: documentdb
author: mimig1
ms.author: mimig
ms.manager: jhubbard

---

# Common headers for the Azure DocumentDB Resource Provider REST API

The following are the common request and response headers for the DocumentDB Resource Provider REST API.

## Request headers

|Header|Description|
|---|---|
|Content-Type|Set to application/json. This header is not sent in requests that don’t have any content, such as all GET calls.|
|Accept-Language|Specifies the preferred language for the response; all resource providers should use this header when generating error messages or client facing text.|
|x-ms-client-request-id|Optional. A caller-defined value that identifies the given request in the form of a GUID with no decoration such as curly braces (e.g. client-request-id: 9C4D50EE-2D56-4CD3-8152-34347DC9F2B0). If specified, this will be included in response information as a way to map the request. |
|x-ms-return-client-request-id|Optional. True or false, indicates whether a client-request-id should be provided.|
 
## Response headers

|Header|Description|
|---|---|
|Content-Type|Content-Type	Set to application/json. This header is not required in responses that don’t have any content.|
|Content-Location|The URI of the request.|
|Date|The date that the request was processed, in RFC 1123 format.|
|x-ms-request-id|A unique identifier for the current operation, service generated.|

## See Also

- [Azure DocumentDB](https://azure.microsoft.com/services/documentdb/)
- [Azure DocumentDB REST API](/rest/api/documentdb)
- [Azure DocumentDB Resource Provider REST API](/rest/api/documentdbresourceprovider)
