---
title: Azure Communication Services Common Error Codes
description: Learn about the common codes you might find when using Communication Services REST APIs
author: ProbablePrime
ms.author: rifox
ms.manager: sstacey
ms.date: 03/12/2020
ms.topic: reference
ms.service: azure-communication-services
ms.devlang: rest-api
---
# Common Error Codes

## HTTP Status Codes

| Error code | Description                                                                                                                   | HTTP status code          |
| ---------- | ----------------------------------------------------------------------------------------------------------------------------- | ------------------------- |
| 400        | The request received could not be understood by the service.                                                                  |
| 401        | The authorization token cannot be validated; for example, it is expired or does not apply to the request’s URI and/or method. | 401 Unauthorized          |
| 403        | The provider credentials do not have sufficient privileges                                                                    | 403 Forbidden             |
| 404        | The resource or endpoint you're trying to access does not exist.                                                              | 404 Not Found             |
| 422        | The body of the request could not be validated.                                                                               | 422 Unprocessable Entity  |
| 429        | The number of requests exceeded the environment threshold. Please try again later.                                            | 429 Too Many Requests     |
| 500        | An internal error occurred.                                                                                                   | 500 Internal Server Error |
