---
title: "IoT Hub REST"
ms.custom: ""
ms.date: "2015-09-30"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "iot-hub"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
applies_to: 
  - "IoT"
ms.assetid: 8ff10ab6-c1a8-4da5-aac5-e4d24df02e5a
caps.latest.revision: 11
author: "dominicbetts"
ms.author: "dobett"
manager: "timlt"
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
# IoT Hub REST
The REST APIs for IoT Hub offer programmatic access to the device, messaging, and job services, as well as the resource provder, in IoT Hub.  You can access messaging services from within an IoT service running in Azure, or directly over the Internet from any application that can send an HTTPS request and receive an HTTPS response.  
  
-   [Device Identities](~/docs-ref-autogen/iothub/DeviceApi.json)  
  
-   [Device Twins](~/docs-ref-autogen/iothub/DeviceTwinApi.json)

-   [Device Messaging](~/docs-ref-autogen/iothub/HttpRuntime.json)  

-   [Jobs](~/docs-ref-autogen/iothub/JobApi.json)
  
-   [Resource Provider](~/docs-ref-autogen/iothub/IotHubResource.json)  
  
-   [Common error codes](common-error-codes.md)

## Device Identities
Use these APIs to manage device identities in the identity registry of an IoT hub. All task operations conform to the HTTP/1.1 protocol specification and each operation returns an `x-ms-request-id` header that can be used to obtain information about the request. You must make sure that requests made to these resources are secure. For more information, see [IoT Hub Developer Guide – Security](https://azure.microsoft.com/documentation/articles/iot-hub-devguide#security) for the specifics on how to create security tokens.

## Device Twins
Use this API to manage IoT Hub [device twins](https://docs.microsoft.com/azure/iot-hub/iot-hub-devguide-device-twins). You can retrieve and update device twin properties and invoke [direct methods](https://docs.microsoft.com/azure/iot-hub/iot-hub-devguide-direct-methods) on devices. All task operations conform to the HTTP/1.1 protocol specification. You must make sure that requests made to these resources are secure. For more information, see [IoT Hub Developer Guide - Security](https://docs.microsoft.com/azure/iot-hub/iot-hub-devguide-security) for specific information about how to create security tokens.

## Device Messaging
Use these APIs from a device to send device-to-cloud messages to an IoT hub, and receive cloud-to-device messages from an IoT hub. All task operations conform to the HTTP/1.1 protocol specification. You must make sure that requests made to these resources are secure. For more information, see [IoT Hub Developer Guide - Security](https://docs.microsoft.com/azure/iot-hub/iot-hub-devguide-security) for specific information about how to create security tokens.

## Resource Provider
Use these APIs to manage the deployment of your IoT Hub resources. For information about how to secure these requests, see [Azure REST API Reference](https://docs.microsoft.com/rest/api/).
  
## Common parameters and headers  
 The following information is common to all tasks related to IoT Hub:
  
-   Replace {api-version} with "2016-02-03" in the URI.
  
-   Replace {subscription-id} with your subscription identifier in the URI.
  
-   Replace {resourceGroupName} with the resource group name that contains (or will contain) your IoT hub.
  
-   Replace {IoTHubName} with the name of your IoT hub.
  
-   Set the Content-Type header to application/json.
  
-   Set the Authorization header to a SAS token created as specified in the *security tokens* section of [Using IoT Hub security tokens](https://docs.microsoft.com/azure/iot-hub/iot-hub-devguide-security).
  
-   The Etag header is returned in all requests scoped to a single device identity, as per [RFC7232](https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=1&cad=rja&uact=8&ved=0CB8QFjAAahUKEwj799zo3N3HAhXMO4gKHSdKBTM&url=https%3A%2F%2Ftools.ietf.org%2Fhtml%2Frfc7232&usg=AFQjCNGs7xYLCVYw5XorAUXCdYNFqhgUNw&sig2=sxFg4W4iBNY4cnw2ZC1dAw).

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
  
-   PUT responds with 201 Created with Azure-AsyncOperation header for any operations that are asynchronous.  All synchronous (updates) operations return 200 OK.  
  
-   DELETE returns 202 Accepted with Location and Retry-After headers as well as Azure-AsyncOperation header for resources that exists.  
  
-   Location header contains URL for the operation result  
  
-   Retry-After header contains appropriate retry interval in seconds  
  
-   Azure-AsyncOperation header contains URL for the Async operation result status  
  
-   On completion, the GET to the operation result URL generates exactly the same result as if the original operation had completed synchronously
