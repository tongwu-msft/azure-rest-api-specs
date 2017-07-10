---
title: "OData Batch Processing | Microsoft Docs"
ms.custom: ""
ms.date: "2017-02-01"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "batch"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 08c77514-13ae-4815-8031-7b71395f7847
caps.latest.revision: 9
author: "tamram"
ms.author: "tamram"
manager: "timlt"
---
# OData Batch Processing
  See Common parameters and headers for headers and parameters that are used by all requests.

|Method|Request URI|
|------------|-----------------|
|POST|`https://{account-name}.{region-id}.batch.azure.com/$batch?api-version={api-version}`|

 Replace {account\-name} with the name of the account.

 An OData Batch request payload is a multi\-part MIME message, it contains a Content\-Type header specifying a content type of "multipart/mixed" and a boundary specification as defined in RFC2046. The response also use MIME version 1.0 format defined in RFC2046.

 Batch service supports adding multiple tasks at once. Batch service supports a subset of the functionality defined by the OData specification. If a change set contains more than one request the request will be rejected with status code 400.

