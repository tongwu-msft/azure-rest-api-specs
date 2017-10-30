---
title: "Get Indexer Status (Azure Search Service REST API)"
ms.custom: ""
ms.date: "2016-12-08"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "search"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "language-reference"
applies_to:
  - "Azure"
ms.assetid: 630813ce-f125-47dc-967a-6d434b37b2ea
caps.latest.revision: 12
author: "Brjohnstmsft"
ms.author: "brjohnst"
manager: "jhubbard"
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
# Get Indexer Status (Azure Search Service REST API)
  The **Get Indexer Status** operation retrieves the current status and execution history of an indexer:  

```  
GET https://[service name].search.windows.net/indexers/[indexer name]/status?api-version=[api-version]  
    api-key: [admin key]  
```  

 The **api-version** is required. The current version is `2016-09-01`. See [API versions in Azure Search](https://go.microsoft.com/fwlink/?linkid=834796) for details.  

 The **api-key** must be an admin key (as opposed to a query key). Refer to the authentication section in [Azure Search Service REST](index.md) to learn more about keys. [Create an Azure Search service in the portal](http://azure.microsoft.com/documentation/articles/search-create-service-portal/) explains how to get the service URL and key properties used in the request.  

## Response  
 Status Code: 200 OK for a successful response. The response body contains information about overall indexer health status, the last indexer invocation, as well as the history of recent indexer invocations (if present).  

 A sample response body looks like this:  

```  
{  
        "status":"running",  
        "lastResult": {  
            "status":"success",  
            "errorMessage":null,  
            "startTime":"2014-11-26T03:37:18.853Z",  
            "endTime":"2014-11-26T03:37:19.012Z",  
            "errors":[],  
	    "warnings":[],
            "itemsProcessed":11,  
            "itemsFailed":0,  
            "initialTrackingState":null,  
            "finalTrackingState":null  
         },  
        "executionHistory":[
         {  
            "status":"success",  
            "errorMessage":null,  
            "startTime":"2014-11-26T03:37:18.853Z",  
            "endTime":"2014-11-26T03:37:19.012Z",  
            "errors":[], 
	    "warnings":[],
            "itemsProcessed":11,  
            "itemsFailed":0,  
            "initialTrackingState":null,  
            "finalTrackingState":null  
         },   
         {  
            "status":"transientFailure",  
            "errorMessage":null,  
            "startTime":"2014-11-26T03:28:10.125Z",  
            "endTime":"2014-11-26T03:28:12.007Z",  
            "errors":[
	     {
                 "key":  "",
                 "status":  false,
                 "errorMessage":  "Document key cannot be missing or empty.",
                 "statusCode":  400
             }],  
	    "warnings":[
	     {
                 "key":  "document id",
                 "message":  "A warning doesn't stop indexing, and is intended to inform you of certain interesting situations, like when a blob indexer truncates the amount of text extracted from a blob."
             }],
            "itemsProcessed":1,  
            "itemsFailed":1,  
            "initialTrackingState":null,  
            "finalTrackingState":null  
        }]  
```  

### Indexer status  
 Indexer status can be one of the following values:  

-   **running** indicates that the indexer is running normally. Note that some of the indexer executions may still be failing, so it's a good idea to check the **lastResult** property as well.  

-   **error** indicates that the indexer experienced an error that cannot be corrected without human intervention. For example, the data source credentials may have expired, or the schema of the data source or of the target index has changed in a breaking way.  

### Indexer execution result  
 An indexer execution result contains information about a single indexer execution. The latest result is surfaced as the **lastResult** property of the indexer status. Other recent results, if present, are returned as the **executionHistory** property of the indexer status.  

 Indexer execution result contains the following properties:  

-   **status**: The status of an execution. See [Indexer execution status](#bkmk_indexerstatus) below for details.  

-   **errorMessage**: Error message for a failed execution.  

-   **startTime**: The time in UTC when this execution started.  

-   **endTime**: The time in UTC when this execution has ended. This value is not set if the execution is still in progress.  

-   **errors**: A list of item-level errors, if any. See the sample response above for an example.  

-   **warnings**: A list of item-level warnings, if any. See the sample response above for an example. 

-   **itemsProcessed**: The number of data source items (for example, table rows) that the indexer attempted to index during this execution.  

-   **itemsFailed**: The number of items that failed during this execution. The error provides the ID of the item that failed.  

-   **initialTrackingState**: Always **null** for the first indexer execution, or if the data change tracking policy is not enabled on the data source used. If such a policy is enabled, in subsequent executions this value indicates the first (lowest) change tracking value processed by this execution.  

-   **finalTrackingState**: Always **null** if the data change tracking policy is not enabled on the data source used. Otherwise, indicates the latest (highest) change tracking value successfully processed by this execution.  

###  <a name="bkmk_indexerstatus"></a> Indexer execution status  
 Indexer execution status captures the status of a single indexer execution. It can have the following values:  

-   **success** indicates that the indexer execution has completed successfully.  

-   **inProgress** indicates that the indexer execution is in progress.  

-   **transientFailure** indicates that an indexer execution has failed. See **errorMessage** property for details. The failure may or may not require human intervention to fix it. For example, fixing a schema incompatibility between the data source and the target index requires user action, while a temporary data source downtime does not. Indexer invocations will continue per schedule, if one is defined.  

-   **persistentFailure** indicates that the indexer has failed in a way that requires human intervention . Scheduled indexer executions stop. After addressing the issue, use [Reset Indexer &#40;Azure Search Service REST API&#41;](reset-indexer.md) to restart the scheduled executions.  

-   **Reset** indicates that the indexer has been reset by a call to [Reset Indexer &#40;Azure Search Service REST API&#41;](reset-indexer.md).  

## See also  
 [Azure Search Service REST](index.md)   
 [HTTP status codes &#40;Azure Search&#41;](http-status-codes.md)   
 [Indexer operations &#40;Azure Search Service REST API&#41;](indexer-operations.md)   
 [Naming rules &#40;Azure Search&#41;](naming-rules.md)   
 [API versions in Azure Search](https://go.microsoft.com/fwlink/?linkid=834796)
