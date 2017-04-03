---
title: "Specifying Conditional Headers | Microsoft Docs"
ms.custom: ""
ms.date: "2017-02-01"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "batch"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: b4eaa7c1-6397-4d45-81c4-ae8c27aa2071
caps.latest.revision: 18
author: "tamram"
ms.author: "tamram"
manager: "timlt"
---

# Specifying conditional headers

The Batch service follows the [HTTP/1.1 protocol specification](https://tools.ietf.org/html/rfc7232) for conditional headers, and uses the below rules to process requests specifying conditional headers:

* If a request specifies both the `If-None-Match` and `If-Modified-Since` headers, the request is evaluated based on the criteria specified in `If-None-Match`.
* If a request specifies both the `If-Match` and `If-Unmodified-Since` headers, the request is evaluated based on the criteria specified in `If-Match`.
* With the exception of the two combinations of conditional headers listed above, a request may specify only a single conditional header. Specifying more than one conditional header results in status code 400 (Bad Request).

To see which conditional headers are supported by an operation, see the documentation for that operation (for example, [Job Enable](~/docs-ref-autogen/batchservice/job.json#Job_Enable)). Not all operations support all headers.

## HTTP Response Codes for Operations Supporting Conditional Headers

Batch service returns an HTTP response code in accordance with the HTTP/1.1 protocol specification (RFC 2616).

### Read Operations

The following table indicates the response codes returned for an unmet condition for each conditional header when the operation is a read operation. Read operations use the verbs GET or HEAD.

|Conditional header|Response code if condition has not been met|
|------------------------|-------------------------------------------------|
|`If-Match`|Precondition Failed (412)|
|`If-None-Match`|Not Modified (304)|
|`If-Modified-Since`|Not Modified (304)|
|`If-Unmodified-Since`|Precondition Failed (412)|

### Write Operations
 The following table indicates the response codes returned for an unmet condition for each conditional header when the operation is a write operation. Write operations use the verbs POST, PUT, PATCH or DELETE.

|Conditional header|Response code if condition has not been met|
|------------------------|-------------------------------------------------|
|`If-Match`|Precondition Failed (412)|
|`If-None-Match`|Precondition Failed (412)|
|`If-Modified-Since`|Precondition Failed (412)|
|`If-Unmodified-Since`|Precondition Failed (412)|  
  