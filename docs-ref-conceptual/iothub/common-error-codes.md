---
title: "Common error codes"
ms.custom: ""
ms.date: 02/14/2020
ms.reviewer: ""
ms.service: "iot-hub"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
applies_to: 
  - "IoT"
ms.assetid: 3cee4886-033d-4b3a-a56f-cb6e07ef5a98
caps.latest.revision: 5
author: "jlian"
ms.author: "jlian"
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
# Common error codes

The following table lists error codes common to the IoT Hub APIs. HTTP status code being N/A means the error occurs only through AMQP or MQTT.

| Error code | Description | HTTP status code |  
|------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------|---------------------------|
| 400004 | The body of the request is not valid; for example, it cannot be parsed, or the object cannot be validated. | 400 Bad Format |
| 400027 | See [400027 ConnectionForcefullyClosedOnNewConnection](https://docs.microsoft.com/azure/iot-hub/iot-hub-troubleshoot-error-400027-connectionforcefullyclosedonnewconnection). | N/A |
| 401003 | The authorization token cannot be validated; for example, it is expired or does not apply to the request’s URI and/or method. To learn more, see [401003 IoTHubUnauthorized](https://docs.microsoft.com/azure/iot-hub/iot-hub-troubleshoot-error-401003-iothubunauthorized). | 401 Unauthorized |
| 403002 | See [403002 IoTHubQuotaExceeded](https://docs.microsoft.com/azure/iot-hub/iot-hub-troubleshoot-error-403002-iothubquotaexceeded). | 403 Forbidden |
| 403004 | See [403004 DeviceMaximumQueueDepthExceeded](https://docs.microsoft.com/azure/iot-hub/iot-hub-troubleshoot-error-403004-devicemaximumqueuedepthexceeded). | 403 Forbidden |
| 403006 | See [403006 DeviceMaximumActiveFileUploadLimitExceeded](https://docs.microsoft.com/azure/iot-hub/iot-hub-troubleshoot-error-403006-devicemaximumactivefileuploadlimitexceeded). | 403 Forbidden |
| 404104 | See [404001 DeviceNotFound](https://docs.microsoft.com/azure/iot-hub/iot-hub-troubleshoot-error-404001-devicenotfound). | 404 Not Found |
| 404103 | See [404103 DeviceNotOnline](https://docs.microsoft.com/azure/iot-hub/iot-hub-troubleshoot-error-404103-devicenotonline). | 404 Not Found |
| 404104 | See [404104 DeviceConnectionClosedRemotely](https://docs.microsoft.com/azure/iot-hub/iot-hub-troubleshoot-error-404104-deviceconnectionclosedremotely). | 404 Not Found |
| 409001 | See [409001 DeviceAlreadyExists](https://docs.microsoft.com/azure/iot-hub/iot-hub-troubleshoot-error-409001-devicealreadyexists). | 409 Conflict |
| 409002 | See [409002 LinkCreationConflict](https://docs.microsoft.com/azure/iot-hub/iot-hub-troubleshoot-error-409002-linkcreationconflict). | N/A |
| 412001 | The etag in the request does not match the etag of the existing resource, as per [RFC7232](https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=1&cad=rja&uact=8&ved=0CB8QFjAAahUKEwj799zo3N3HAhXMO4gKHSdKBTM&url=https%3A%2F%2Ftools.ietf.org%2Fhtml%2Frfc7232&usg=AFQjCNGs7xYLCVYw5XorAUXCdYNFqhgUNw&sig2=sxFg4W4iBNY4cnw2ZC1dAw). | 412 Precondition Failed |
| 412002 | See [412002 DeviceMessageLockLost](https://docs.microsoft.com/azure/iot-hub/iot-hub-troubleshoot-error-412002-devicemessagelocklost). | N/A |
| 429001 | See [429001 ThrottlingException](https://docs.microsoft.com/azure/iot-hub/iot-hub-troubleshoot-error-429001-throttlingexception). | 429 Too Many Requests |
| 500xxx | See [500xxx Internal errors](https://docs.microsoft.com/azure/iot-hub/iot-hub-troubleshoot-error-500xxx-internal-errors). | 500 Internal Server Error |
| 503003 | See [503003 PartitionNotFound](https://docs.microsoft.com/azure/iot-hub/iot-hub-troubleshoot-error-503003-partitionnotfound). | 503 Service Unavailable |
| 504101 | See [504101 GatewayTimeout](https://docs.microsoft.com/azure/iot-hub/iot-hub-troubleshoot-error-504101-gatewaytimeout). | 504 Gateway Timeout |
