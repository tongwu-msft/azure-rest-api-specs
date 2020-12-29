---
title: Azure IoT Central REST API throttling
description: Learn about throttling limits in the IoT Central REST API. 
services: iot-central
ms.service: iot-central
ms.topic: reference
author: viviali
ms.author: viviali
ms.date: 12/29/2020
---

# Throttling

IoT Central throttles API requests on a per application basis. This means that once the throttling limit has been exceeded for an application, subsequent API requests will not succeed and responses will contain the 429 response code. Throttling is in place to help the performance of the application so that it is accessible to end-users and programmatic clients.  

The IoT Central API uses rate-limit throttling, which means it allows a certain number of requests for an application in defined timespan before throttling.

For every API operation, these are the limits:

- **Throttling limit**: 10 requests per second per application
- **Throttled response**: 429 Too Many Requests

When your client receives a 429 response code, it should try to back off and send fewer requests concurrently. You should also try to identify other clients who may be making API requests at the same time which may contribute to the throttling limit.

## Next steps

Have a suggestion about throttling? Post it on UserVoice
* [Azure IoT Central UserVoice page](https://feedback.azure.com/forums/911455-azure-iot-central)

See other common error codes
* [Common Error Codes](common-error-codes.md)
