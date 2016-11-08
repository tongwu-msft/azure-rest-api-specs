---
title: "Device Identities REST"
ms.custom: ""
ms.date: "2016-03-03"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "iot-hub"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
applies_to: 
  - "Event Hubs"
  - "IoT"
  - "Service Bus"
ms.assetid: e526a9b0-bb14-4e9c-9a7d-121c180c8c36
caps.latest.revision: 20
author: "dominicbetts"
ms.author: "sethm"
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
# Device Identities REST
Use these APIs to manage device identities in the identity registry of an IoT hub. All task operations conform to the HTTP/1.1 protocol specification and each operation returns an `x-ms-request-id` header that can be used to obtain information about the request. You must make sure that requests made to these resources are secure. For more information, see [IoT Hub Developer Guide – Security](https://azure.microsoft.com/documentation/articles/iot-hub-devguide#security) for the specifics on how to create security tokens.  
  
##  <a name="bk_common"></a> Common parameters and headers  
 The following information is common to all tasks related to IoT Hub:  
  
-   Replace {api-version} with “2016-02-03” in the URI.  
  
-   Replace {IoTHubName} with the name of your IoT hub.  
  
-   Set the Content-Type header to application/json.  
  
-   Set the Authorization header to a SAS token created as specified in the service section of [Using IoT Hub security tokens](https://azure.microsoft.com/documentation/articles/iot-hub-sas-tokens).  
  
-   The Etag header is returned in all requests scoped to a single device identity, as per [RFC7232](https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=1&cad=rja&uact=8&ved=0CB8QFjAAahUKEwj799zo3N3HAhXMO4gKHSdKBTM&url=https%3A%2F%2Ftools.ietf.org%2Fhtml%2Frfc7232&usg=AFQjCNGs7xYLCVYw5XorAUXCdYNFqhgUNw&sig2=sxFg4W4iBNY4cnw2ZC1dAw) .  
  
### Tasks  
 You can do the following with device identities:  
  
-   [Create a new device identity](create-a-new-device-identity.md)  
  
-   [Delete a device identity](delete-a-device-identity.md)  
  
-   [Retrieve a device identity](retrieve-a-device-identity.md)  
  
-   [List device identities](list-device-identities.md)  
  
-   [Update an existing device identity](update-an-existing-device-identity.md)  
  
-   [Retrieve device identities statistics](retrieve-device-identities-statistics.md)  
  
-   [Retrieve service statistics](retrieve-service-statistics.md)  
  
-   [Export device identities](export-device-identities1.md)  
  
-   [Import device identities](import-device-identities.md)  
  
-   [Import or update device identities](import-or-update-device-identities.md)  
  
-   [Retrieve import-export job](retrieve-import-export-job.md)  
  
-   [Cancel import/export job](cancel-import-export-job.md)  
  
-   [List import-export jobs](list-import-export-jobs.md)