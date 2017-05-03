---
title: "Update"
ms.date: "2017-05-03"
ms.prod: "azure"
ms.service: "service-fabric"
ms.topic: "reference"
applies_to: 
  - "Azure"
dev_langs: 
  - "rest-api"
helpviewer_keywords: 
  - "Service Fabric Resource Manager REST API Reference"
author: "rwike77"
ms.author: "ryanwi"
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
# Update
Update cluster configuration

Update cluster configuration


## Request
| Method | Request URI |
| ------ | ----------- |
| PATCH | `/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.ServiceFabric/clusters/{clusterName}?api-version=2016-09-01` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [resourceGroupName](#resourcegroupname) | string | Yes | Path |
| [clusterName](#clustername) | string | Yes | Path |
| [subscriptionId](#subscriptionid) | string | Yes | Path |
| [api-version](#api-version) | string | Yes | Query |
| [ClusterUpdateParameters](#clusterupdateparameters) | [ClusterUpdateParameters](sfrp-model-clusterupdateparameters.md) | Yes | Body |

____
### resourceGroupName
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The name of the resource group.

____
### clusterName
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The name of the cluster resource

____
### subscriptionId
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The customer subscription identifier

____
### api-version
__Type__: string <br/>
__Required__: Yes<br/>
__Default__: 2016-09-01 <br/>
<br/>
The version of the API. This is a required parameter and it's value must be "2016-09-01".

____
### ClusterUpdateParameters
__Type__: [ClusterUpdateParameters](sfrp-model-clusterupdateparameters.md) <br/>
__Required__: Yes<br/>
<br/>
The parameters which contains the property value and property name which used to update the cluster configuration.

## Responses

| HTTP Status Code | Description | Response Schema |
| --- | --- | --- |
| 200 (OK) | OK - Cluster updated successfully<br/> | [Cluster](sfrp-model-cluster.md) |
| 202 (Accepted) | Accepted - Update request accepted; the operation will complete asynchronously.<br/> |  |
| All other status codes | Error<br/> | [ErrorModel](sfrp-model-errormodel.md) |

## Examples

### Patch a cluster

#### Request
```
PATCH https://management.azure.com/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/resRg/providers/Microsoft.ServiceFabric/clusters/myCluster?api-version=2016-09-01
```

##### Body
```json
{
  "properties": {
    "nodeTypes": [
      {
        "name": "n1",
        "clientConnectionEndpointPort": 19000,
        "httpGatewayEndpointPort": 19080,
        "durabilityLevel": "Silver",
        "applicationPorts": {
          "startPort": 20000,
          "endPort": 30000
        },
        "ephemeralPorts": {
          "startPort": 49152,
          "endPort": 65534
        },
        "isPrimary": true,
        "vmInstanceCount": 5,
        "reverseProxyEndpointPort": 9998
      }
    ]
  }
}
```

#### 200 Response
##### Body
```json
{
  "type": "Microsoft.ServiceFabric/clusters",
  "location": "southcentralus",
  "id": "/subscriptions/00000000-0000-0000-0000-000000000000/resourcegroups/resRg/providers/Microsoft.ServiceFabric/clusters/myCluster",
  "name": "myCluster",
  "tags": {},
  "properties": {
    "provisioningState": "Succeeded",
    "clusterId": "8d566293-3508-4d62-ba7b-056fa710c3c9",
    "clusterCodeVersion": "5.5.216.0",
    "clusterState": "Ready",
    "managementEndpoint": "http://myCluster.southcentralus.cloudapp.azure.com:19080",
    "clusterEndpoint": "https://warp-test-winfabrp-southcentralus.trafficmanager.net/runtime/clusters/8d566293-3508-4d62-ba7b-056fa710c3c9",
    "clientCertificateThumbprints": [],
    "clientCertificateCommonNames": [],
    "fabricSettings": [],
    "upgradeDescription": {
      "overrideUserUpgradePolicy": false,
      "forceRestart": true,
      "upgradeReplicaSetCheckTimeout": "10675199.02:48:05.4775807",
      "healthCheckWaitDuration": "00:00:01",
      "healthCheckStableDuration": "00:00:01",
      "healthCheckRetryTimeout": "00:00:01",
      "upgradeTimeout": "12:00:00",
      "upgradeDomainTimeout": "02:00:00",
      "healthPolicy": {
        "maxPercentUnhealthyNodes": 100,
        "maxPercentUnhealthyApplications": 100
      },
      "deltaHealthPolicy": {
        "maxPercentDeltaUnhealthyNodes": 0,
        "maxPercentUpgradeDomainDeltaUnhealthyNodes": 0,
        "maxPercentDeltaUnhealthyApplications": 0
      }
    },
    "diagnosticsStorageAccountConfig": {
      "storageAccountName": "sflogssdktest5486",
      "protectedAccountKeyName": "StorageAccountKey1",
      "blobEndpoint": "https://sflogssdktest5486.blob.core.windows.net/",
      "queueEndpoint": "https://sflogssdktest5486.queue.core.windows.net/",
      "tableEndpoint": "https://sflogssdktest5486.table.core.windows.net/"
    },
    "nodeTypes": [
      {
        "name": "n1",
        "clientConnectionEndpointPort": 19000,
        "httpGatewayEndpointPort": 19080,
        "applicationPorts": {
          "startPort": 20000,
          "endPort": 30000
        },
        "ephemeralPorts": {
          "startPort": 49152,
          "endPort": 65534
        },
        "isPrimary": true,
        "vmInstanceCount": 5,
        "reverseProxyEndpointPort": 9998,
        "durabilityLevel": "Silver"
      }
    ],
    "vmImage": "Windows",
    "reliabilityLevel": "Bronze",
    "upgradeMode": "Automatic",
    "availableClusterVersions": [
      {
        "codeVersion": "5.4.145.9494",
        "supportExpiryUtc": "2017-05-10T00:00:00",
        "environment": "Windows"
      },
      {
        "codeVersion": "5.4.164.9494",
        "supportExpiryUtc": "2017-05-10T00:00:00",
        "environment": "Windows"
      },
      {
        "codeVersion": "5.5.216.0",
        "supportExpiryUtc": "9999-12-31T23:59:59.9999999",
        "environment": "Windows"
      }
    ]
  }
}
```

