---
title: "IoT Hub Resource Provider REST"
ms.custom: ""
ms.date: "2016-03-03"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "iot-hub"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 1c5478ac-9a6e-4ec4-be0d-328123a6b61d
caps.latest.revision: 18
author: "dominicbetts"
ms.author: "dobett"
manager: "carmonm"
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
# IoT Hub Resource Provider REST
Use these APIs to manage IoT hubs through the IoT Hub Resource Provider. All task operations conform to the HTTP/1.1 protocol specification and each operation returns an x-ms-request-id header that can be used to obtain information about the request. You must make sure that requests made to these resources are secure. For more information, see [Authenticating Azure Resource Manager requests](https://msdn.microsoft.com/en-us/library/azure/Dn790557.aspx).  
  
## Common tasks  
  
-   [Create a new IoT Hub](../resourceprovider/create-a-new-iot-hub.md)  
  
-   [Update metadata on an existing IoT Hub](../resourceprovider/update-metadata-on-an-existing-iot-hub.md)  
  
-   [Retrieve metadata of an IoT Hub](../resourceprovider/retrieve-metadata-of-an-iot-hub.md)  
  
-   [Retrieve security metadata of an IoT Hub](../resourceprovider/retrieve-security-metadata-of-an-iot-hub.md)  
  
-   [List IoT hubs in a subscription](../resourceprovider/list-iot-hubs-in-a-subscription.md)  
  
-   [List IoT hubs in a resource group](../resourceprovider/list-iot-hubs-in-a-resource-group.md)  
  
-   [Delete an IoT Hub](../resourceprovider/delete-an-iot-hub.md)  
  
-   [Create a D2C Consumer Group](../resourceprovider/create-a-d2c-consumer-group.md)  
  
-   [Delete a D2C Consumer Group](../resourceprovider/delete-a-d2c-consumer-group.md)  
  
-   [List D2C Consumer Groups](../resourceprovider/list-d2c-consumer-groups.md)  
  
-   [Export device identities](../resourceprovider/export-device-identities2.md)  
  
## IoT hubs  
 Manage IoT hubs in your subscription.  
  
###  <a name="bk_common"></a> Common parameters and headers  
 The following information is common to all tasks related to IoT Hub:  
  
-   Replace {api-version} with “2016-02-03” in the URI.  
  
-   Replace {subscription-id} with your subscription identifier in the URI.  
  
-   Replace {resourceGroupName} with the resource group name that contains (or will contain) your IoT hub.  
  
-   Replace {IoTHubName} with the name of your IoT hub.  
  
-   Set the Content-Type header to application/json.  
  
-   Set the Authorization header to a JSON Web Token that you obtain from Azure Active Directory. For more information, see [Authenticating Azure Resource Manager requests](https://msdn.microsoft.com/en-us/library/azure/Dn790557.aspx).  
  
-   All PUT/PATCH operations require the following headers to be specified: `If-Match = [*|<etag from get>]`  
  
-   DELETE operations may include the following header: `If-Match = [*|<etag from get>]`  
  
 The behavior for ETags can be seen below:  
  
||||  
|-|-|-|  
|PUT|Resource does not exist|Resource exists|  
|If-Match = "" / absent|201 Created|200 OK|  
|If-Match = "*"|412 Precondition Failed|200 OK|  
|If-Match = "xyz"|412 Precondition Failed|200 OK / 412 Precondition Failed|  
|If-None-Match = "*"|201 Created|412 Precondition Failed|  
  
||||  
|-|-|-|  
|DELETE|Resource does not exist|Resource exists|  
|If-Match = "" / absent|204 No Content|200 OK|  
|If-Match = "*"|204 No Content|200 OK|  
|If-Match = "xyz"|204 No Content|200 OK / 412 Precondition Failed|  
  
 For asynchronous calls:  
  
-   PUT will respond with 201 Created with Azure-AsyncOperation header for any operations that are asynchronous.  All synchronous (updates) operations will return 200 OK.  
  
-   DELETE will return 202 Accepted with Location and Retry-After headers as well as Azure-AsyncOperation header for resources that exists.  
  
-   Location header contains URL for the operation result  
  
-   Retry-After header contains appropriate retry interval in seconds  
  
-   Azure-AsyncOperation header contains URL for the Async operation result status  
  
-   On completion, the GET to the operation result URL will generate exactly the same result as if the original operation had completed synchronously