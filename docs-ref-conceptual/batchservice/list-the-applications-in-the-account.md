---
title: "List the applications in the account | Microsoft Docs"
ms.custom: ""
ms.date: "2017-02-01"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "batch"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 7f012ed0-7452-4a7c-84da-914602469d89
caps.latest.revision: 5
author: "tamram"
ms.author: "tamram"
manager: "timlt"
---
# List the applications in the account
  Lists all of the applications available in the specified account.

## Request
 See Common Parameters and Headers for headers and parameters that are used by all requests related to applications.

|Method|Request URI|
|------------|-----------------|
|GET|`https://{account-name}.{region}.batch.core.windows.net/applications?$skiptoken={skiptoken}&maxresults={result-number}&api-version={api-version}`|

## Response
 Status code: 200.  For more information, see Status and Error Codes.

 The following example shows a sample list of application summaries:

```
{
  "value": [ {
    "id":"litware",
    "displayName":"Litware Analytics",
    "versions": [
      "10.7",
      "10.8",
      "11.0.beta"
    ]
  },
  {
    "id":"contoso",
    "displayName":"Contoso Transcoding Tools",
    "versions": [
      "6.8.9"
    ]
  } ]
}
```

|Element name|Type|Notes|
|------------------|----------|-----------|
|id|String|The id of the application|
|displayName|String|The display name of the application.|
|versions|Collection|A list of available versions of the application. Each entry is a string.|

### Remarks
 This operation returns only applications and versions that are available for use on compute nodes; that is, that can be used in an application package reference.  For administrator information about applications and versions that are not yet available to compute nodes, use the Azure portal or the Azure Resource Manager API.

