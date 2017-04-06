---
title: "List supported node agent SKUs | Microsoft Docs"
ms.custom: ""
ms.date: "2017-02-01"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "batch"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 45faee41-76f7-4a82-bb3a-38280796e0ff
caps.latest.revision: 10
author: "tamram"
ms.author: "tamram"
manager: "timlt"
---
# List supported node agent SKUs
  Lists the node agent SKUs supported by the Azure Batch service.

## Request
 See [Common Parameters and Headers](../batchservice/common-parameters-and-headers.md) for headers and parameters that are used by all requests related to accounts.

|Method|Request URI|
|------------|-----------------|
|GET|`https://{account-name}.{region-id}.batch.azure.com/nodeagentskus?$filter={filter}&$skiptoken={skiptoken}&maxresults={result-number}&api-version={api-version}`|

 The value for {filter} can be the following or any AND-ed or OR-ed combination of the following:

|Property|Operations allowed|Type|
|--------------|------------------------|----------|
|osType|eq, ne|String|

## Response
 Status code: 200. For more information, see [Batch Status and Error Codes](../batchservice/batch-status-and-error-codes.md).

 The following example is only a sample response and is not the full list of all supported node agent SKUs.

```

{
  "odata.metadata":"https://myaccount.myregion.batch.azure.com/$metadata#nodeagentskus",
  "value":[
   {
      "id":"batch.node.centos 7",
      "osType":"linux",
      "verifiedImageReferences": [
      {
        "publisher":"OpenLogic",
        "offer":"CentOS",
        "sku":"7.0",
        "version":"latest"
      }]
    },
    {
      "id":"batch.node.ubuntu 14.04",
      "osType":"linux",
      "verifiedImageReferences": [
      {
        "publisher":"Canonical",
        "offer":"UbuntuServer",
        "sku":"14.04.4-LTS",
        "version":"latest"
      }]
    }],
    "odata.nextLink":"https://myaccount.myregion.batch.azure.com/nodeagentskus?$skipToken=xxxyyy&api-version=2016-02-01.3.0"
}

```

|Element name|Type|Notes|
|------------------|----------|-----------|
|id|String|The id of the node agent SKU.|
|osType|String|The type of operating system (Windows/Linux) compatible with the node agent SKU.|
|verifiedImageReferences|Complex Type|The list of images verified to be compatible with this node agent SKU. This collection is not exhaustive (the node agent may be compatible with other images).|

## imageReference

|Element name|Type|Notes|
|------------------|--------------|----------|
|publisher|String|The publisher of the Azure Virtual Machines Marketplace image. For example, `Canonical` or `MicrosoftWindowsServer`.|
|offer|String|The offer type of the Azure Virtual Machines Marketplace image. For example, `UbuntuServer` or `WindowsServer`.|
|sku|String|The SKU of the Azure Virtual Machines Marketplace image. For example, `14.04.0-LTS` or `2012-R2-Datacenter`.|
|version|String|The version of the Azure Virtual Machines Marketplace image. A value of `latest` can be specified to select the latest version of an image. If omitted, the default is `latest`.|

