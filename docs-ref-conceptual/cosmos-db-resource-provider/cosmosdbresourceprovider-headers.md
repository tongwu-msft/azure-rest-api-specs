---
ms.assetid: 4267b12c-2539-4d76-bc23-9f04c942554b
ms.title: "Azure Cosmos DB: Resource Provider REST Headers for SQL API"
ms.date: "02/05/2018"
ms.prod: azure
ms.service: cosmos-db
author: mimig1
ms.author: mimig
ms.manager: jhubbard

---

# Azure Cosmos DB: Common headers for the REST Resource Provider

The following are the common request and response headers for the Resource Provider REST API.

## Request headers

|Header|Description|
|---|---|
|Content-Type|Set to application/json. This header is not sent in requests that don’t have any content, such as all GET calls.|
|Accept-Language|Specifies the preferred language for the response; all resource providers should use this header when generating error messages or client facing text.|
|x-ms-client-request-id|Optional. A caller-defined value that identifies the given request in the form of a GUID with no decoration such as curly braces (for example, client-request-id: 9C4D50EE-2D56-4CD3-8152-34347DC9F2B0). If specified, it is included in response information as a way to map the request. |
|x-ms-return-client-request-id|Optional. True or false, indicates whether a client-request-id should be provided.|
 
## Response headers

|Header|Description|
|---|---|
|Content-Type|Content-Type	Set to application/json. This header is not required in responses that don’t have any content.|
|Content-Location|The URI of the request.|
|Date|The date that the request was processed, in RFC 1123 format.|
|x-ms-request-id|A unique identifier for the current operation, service generated.|

## See Also

- [Azure Cosmos DB](https://azure.microsoft.com/services/cosmos-db/)
- [Azure Cosmos DB REST API](/rest/api/cosmos-db)
- [Azure Cosmos DB: REST Resource Provider for the SQL API](/rest/api/cosmos-db-resource-provider)
