---
title: "HTTP Status Codes for Azure Cosmos DB"
description: HTTP status and sub-status codes when using Azure Cosmos DB with REST API.
ms.date: "10/16/2020"
ms.service: "cosmos-db"
ms.topic: "reference"
ms.assetid: 7104e4ef-fa51-4194-93f0-bb5f53fe9d61
caps.latest.revision: 21
author: "SnehaGunda"
ms.author: "sngun"
manager: "kfile"
translation.priority.mt: 
  - "de-de"
  - "es-es"
  - "fr-fr"
  - "it-it"
  - "ja-jp"
  - "ko-kr"
  - "pt-br"
  - "ru-ru"
  - "zh-cn"
  - "zh-tw"
 
---

# HTTP Status Codes for Azure Cosmos DB

This article provides the HTTP status codes returned by the REST operations.  
  
|**Code**|**Description**|  
|-|-|  
|**200 OK**|One of the following REST operations were successful:<br /><br /> -   `GET` on a resource.<br />-   `PUT` on a resource.<br />-   `POST` on a resource.<br />-   `POST` on a stored procedure resource to execute the stored procedure.|  
|**201 Created**|A POST operation to create a resource is successful.|  
|**204 No content**|The DELETE operation is successful.|  
|**400 Bad request**|The JSON, SQL, or JavaScript in the request body is invalid.<br /><br /> In addition, a 400 can also be returned when the required properties of a resource are not present or set in the body of the POST or PUT on the resource.<br /><br /> 400 is also returned when the consistent level for a GET operation is overridden by a stronger consistency from the one set for the account.<br /><br /> 400 is also returned when a request that requires an x-ms-documentdb-partitionkey does not include it.|  
|**401 Unauthorized**| 401 is returned when the `Authorization` header is invalid for the requested resource.|  
|**403 Forbidden**|The authorization token expired.<br /><br /> 403 code is also returned during a `POST` operation to create a resource when the resource quota has been reached. An example of this scenario is when you try to add documents to a collection that has reached its provisioned storage.<br /><br /> 403 can also be returned when a stored procedure, trigger, or UDF has been flagged for high resource usage and blocked from execution.<br /><br /> 403 forbidden error is returned when the firewall rules configured on your Azure Cosmos DB account block your request. Any requests originating from machines outside the allowed list will receive a 403 response. <br /><br /> 403.3 – This status code is returned for write requests during the manual failover operation. This status code is used as a redirection code by drivers to forward the write requests to a new write region. Direct REST client must perform GET on DatabaseAccount to identify the current write region and forward the write request to that endpoint.|  
|**404 Not found**|The operation is attempting to act on a resource that no longer exists. For example, the resource may have already been deleted.|  
|**408 Request timeout**|The operation did not complete within the allotted amount of time. This code is returned when a stored procedure, trigger, or UDF (within a query) does not complete execution within the maximum execution time.|  
|**409 Conflict**|The ID provided for a resource on a `PUT` or `POST` operation has been taken by an existing resource. Use another ID for the resource to resolve this issue. For partitioned collections, ID must be unique within all documents with the same partition key value.|  
|**412 Precondition failure**|The operation specified an eTag that is different from the version available at the server, that is, an optimistic concurrency error. Retry the request after reading the latest version of the resource and updating the eTag on the request.|  
|**413 Entity too large**|The document size in the request exceeded the allowable document size for a request. The max allowable document size is 2 MB.|  
|**423 Locked**|The throughput scale operation cannot be performed because there is another scale operation in progress.|
|**424 Failed dependency**|When a document operation fails within the transactional scope of a TransactionalBatch operation, all other operations within the batch are considered failed dependencies. This status code indicates that the current operation was considered failed because of another failure within the same transactional scope.|  
|**429 Too many requests**|The collection has exceeded the provisioned throughput limit. Retry the request after the server specified retry after duration. For more information, see [request units](https://docs.microsoft.com/azure/cosmos-db/request-units).|  
|**449 Retry With**|The operation encountered a transient error. This code only occurs on write operations. It is safe to retry the operation.|  
|**500 Internal Server Error**|The operation failed due to an unexpected service error. Contact support. See [Filing an Azure support issue](https://portal.azure.com/?#blade/Microsoft_Azure_Support/HelpAndSupportBlade).|  
|**503 Service Unavailable**|The operation could not be completed because the service was unavailable. This situation could happen due to network connectivity or service availability issues. It is safe to retry the operation. If the issue persists, contact support.|  

## HTTP substatus codes

When using Customer-Managed Keys (CMK) in Azure Cosmos DB, if there are any errors, Azure Cosmos DB returns the error details along with an HTTP substatus code in the response. You can use this substatus code to debug the root cause of the issue. Currently Azure Cosmos DB supports the following substatus codes:

### Substatus codes for server-side issues

The following substatus codes are supported by Azure Cosmos DB for server-side issues:

|**Substatus code**|**Description**|  
|-|-|
| **4000 (Failed to get/access the Azure AD token)** | This error occurs if Azure Cosmos DB can’t get the Azure Active Directory (Azure AD) access token. This token is required for Azure Cosmos DB to access the Key Vault. The error could occur due to a networking issue or a data center issue and it’s not something the user can take an action. Create a [support request](https://portal.azure.com/#blade/Microsoft_Azure_Support/HelpAndSupportBlade/newsupportrequest) to reach the Azure Cosmos DB team to resolve the issue.|
| **4001 (Azure AD service is unavailable)** | This error occurs if the Azure AD service is down or has issues. You can check the [Azure outage dashboard](https://status.azure.com/status) to verify if there is any existing outage. These outages are typically resolved within a couple of hours. It’s best for you can contact the Azure AD team and let them know the issue you are seeing. If the Azure AD team finds that there is no issue, then create a [support request](https://portal.azure.com/#blade/Microsoft_Azure_Support/HelpAndSupportBlade/newsupportrequest) to reach the Azure Cosmos DB team for resolution.|
|**4004 (Key Vault service is unavailable)** | This error occurs if Azure Cosmos DB tries to access the Key Vault, but the service is not available. This could be due to a networking issue to reach Key Vault or the service itself may be down. You can check the [Azure outage dashboard](https://status.azure.com/status) to verify if there is any existing outage. These outages are typically resolved within a couple of hours. It’s best for you can contact the Key Vault team and let them know the issue you are seeing. If the Key Vault team finds that there is no issue, then create a [support request](https://portal.azure.com/#blade/Microsoft_Azure_Support/HelpAndSupportBlade/newsupportrequest) to reach the Azure Cosmos DB team for resolution. |
| **4007 (Internal server error)** | This is an internal server error and it occurs if the input bytes are not in the base64 format.|
| **4008 (Key Vault internal service errors)** | This error occurs if Azure Cosmos DB is unable to access the Key Vault. It could be due to a networking issue or if the Key Vault service itself is down. You can check the [Azure outage dashboard](https://status.azure.com/status) to verify if there is any existing outage. These outages are typically resolved within a couple of hours. It’s best for you can contact the Key Vault team and let them know the issue you are seeing. If the Key Vault team finds that there is no issue, then reach out to the Azure Cosmos DB team for resolution. |
|**1013 (Collection create operation is in progress)** | If you encounter timeout exception when creating a collection, do a read operation to validate if the collection was created successfully. The read operation throws an exception until the collection create operation is successful. If the read operation throws an exception with status code of 404, and sub status code of 1013, it means that the collection create operation is still in progress. Retry the read operation until you get 200 or 201 status codes, these codes let you know that the collection has been successfully created. |

### Substatus codes for end-user issues

The following substatus codes are supported by Azure Cosmos DB for issues caused by the end user:

|**Substatus code**|**Description**|  
|-|-|
| **4002 (Key Vault doesn’t grant permission to the Azure AD, or the key is disabled)** | This issue occurs if you have removed the Azure Cosmos DB identity from the Key Vault access policies or if you have disabled the key. This issue is typically caused by the end user. If this error occurs, make sure that the Azure Cosmos DB has access to the Key Vault and the key is enabled. |
| **4003 (Key is not found)** | This issue occurs if the key is deleted from the Key Vault. This issue is typically caused by the end user. One of the prerequisites to use Azure Cosmos DB with customer-managed keys is that the Key Vault has soft delete and purge protection enabled. This means you can recover the deleted key and restore access to Azure Cosmos DB. |
| **4005 (Unable to wrap or unwrap the key)** | This error occurs if the Key Vault is unable to wrap or unwrap the key. This issue is typically caused by the end user. One of the possible causes for this error is that the Key Vault failed to decode the encrypted blob by using the latest key because you have rotated the key. To resolve this error, enable any recently disabled keys and it will be resolved in about an hour. If the issue is not resolved after more than 2 hours, pass the issue to Azure Cosmos DB. |
| **4006 (Key URL is invalid)** | This error occurs during provisioning if you have included the key version in the Key Vault URL. This error is often caused by the end user. To resolve this error, remove the version and try again. For example, if you have used the URL in the format `https://<KeyVaultName>.vault.azure.net/keys/<KeyName>/<KeyVersion>`, update it to ` https://<KeyVaultName>.vault.azure.net/keys/<KeyName>/` |
| **4009 (Key Vault DNS name can't be resolved)** | This error occurs if the Key Vault DNS name couldn’t be resolved, because you have used the incorrect Key Vault name. This error is caused by the end user. To resolve it, correct the Key Vault name and try again. |

**See also**

* [Azure Cosmos DB](https://docs.microsoft.com/azure/cosmos-db/introduction) 
* [Azure Cosmos DB SQL API](https://docs.microsoft.com/azure/cosmos-db/sql-api-introduction)   
* [Azure Cosmos DB SQL API SDKs](/azure/cosmos-db/sql-api-sdk-dotnet)    
* [REST from .NET Sample](https://github.com/Azure/azure-documentdb-dotnet/tree/master/samples/rest-from-.net)  
