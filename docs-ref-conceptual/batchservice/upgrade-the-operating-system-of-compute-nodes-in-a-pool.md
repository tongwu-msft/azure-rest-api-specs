---
title: "Upgrade the operating system of compute nodes in a pool | Microsoft Docs"
ms.custom: ""
ms.date: "2017-02-01"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "batch"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 3b3e18b6-06d1-4014-8888-81959474a6b4
caps.latest.revision: 13
author: "tamram"
ms.author: "tamram"
manager: "timlt"
---
# Upgrade the operating system of compute nodes in a pool
  Upgrades the operating system of compute nodes in the specified pool.

##  <a name="bk_lifetime"></a> Request
 See [Common Parameters and Headers](../batchservice/common-parameters-and-headers.md) for headers and parameters that are used by all requests related to pools.

|Method|Request URI|
|------------|-----------------|
|POST|`https://{account-name}.{region-id}.batch.azure.com/pools/{pool-id}/upgradeos?api-version={api-version}`|

 Replace {pool\-id} with the id of the pool that you want to upgrade.

```
{
    "targetOSVersion":"WA-GUEST-OS-2.28_201409-01"
}

```

|Element name|Required|Type|Notes|
|------------------|--------------|----------|-----------|
|targetOSVersion|Yes|String|The Azure Guest OS version to be installed on the virtual machines in the pool.<br /><br /> For permitted values, see [Azure Guest OS Releases](https://azure.microsoft.com/en-us/documentation/articles/cloud-services-guestos-update-matrix/#releases)|

## Response
 Status code: 202. For more information, see [Batch Status and Error Codes](../batchservice/batch-status-and-error-codes.md)

## Remarks
 During an upgrade, the Batch service upgrades each compute node in the pool.  When a compute node is chosen for upgrade, any tasks running on that node are removed from the node and returned to the queue to be rerun later \(or on a different compute node\).  The node will be unavailable until the upgrade is complete.

 This operation results in temporarily reduced pool capacity as nodes are taken out of service to be upgraded.  Although the Batch service tries to avoid upgrading all compute nodes at the same time, it does not guarantee to do this \(particularly on small pools\); therefore, the pool may be temporarily unavailable to run tasks. When this operation runs, the pool state changes to **upgrading**.  When all compute nodes have finished upgrading, the pool state returns to **active**.

 While the upgrade is in progress, the pool’s currentOSVersion reflects the OS version that nodes are upgrading *from*, and targetOSVersion reflects the OS version that nodes are upgrading to.  Once the upgrade is complete, currentOSVersion is updated to reflect the OS version now running on all nodes.

 This operation can be invoked only on PaaS pools \(pools created with the cloudServiceConfiguration property\). If this operation is invoked on IaaS pools \(pools created with the virtualMachineConfiguration property\), then the Batch service returns 409 \(Conflict\).

