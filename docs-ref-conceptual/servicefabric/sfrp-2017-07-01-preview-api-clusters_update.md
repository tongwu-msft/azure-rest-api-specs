---
title: "Update"
ms.date: "2017-11-30"
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
| PATCH | `/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.ServiceFabric/clusters/{clusterName}?api-version=2017-07-01-preview` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [resourceGroupName](#resourcegroupname) | string | Yes | Path |
| [clusterName](#clustername) | string | Yes | Path |
| [subscriptionId](#subscriptionid) | string | Yes | Path |
| [api-version](#api-version) | string | Yes | Query |
| [parameters](#parameters) | [ClusterUpdateParameters](sfrp-2017-07-01-preview-model-clusterupdateparameters.md) | Yes | Body |

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
__Default__: 2017-07-01-preview <br/>
<br/>
The version of the API. This is a required parameter and it's value must be "2017-07-01-preview" for this specification.

____
### parameters
__Type__: [ClusterUpdateParameters](sfrp-2017-07-01-preview-model-clusterupdateparameters.md) <br/>
__Required__: Yes<br/>
<br/>
The parameters which contains the property value and property name which used to update the cluster configuration.

## Responses

| HTTP Status Code | Description | Response Schema |
| --- | --- | --- |
| 200 (OK) | OK - Cluster updated successfully<br/> | [Cluster](sfrp-2017-07-01-preview-model-cluster.md) |
| 202 (Accepted) | Accepted - Update request accepted; the operation will complete asynchronously.<br/> |  |
| All other status codes | Error<br/> | [ErrorModel](sfrp-2017-07-01-preview-model-errormodel.md) |

## Examples

### Patch a cluster

#### Request
```
PATCH https://management.azure.com/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/resRg/providers/Microsoft.ServiceFabric/clusters/myCluster?api-version=2017-07-01-preview
```

##### Body
```json
{
  "type": "Microsoft.ServiceFabric/clusters",
  "location": "eastus",
  "id": "/subscriptions/00000000-0000-0000-0000-000000000000/resourcegroups/resRg/providers/Microsoft.ServiceFabric/clusters/myCluster",
  "name": "myCluster",
  "tags": {
    "a": "b"
  },
  "properties": {
    "clusterState": "Default",
    "nodeTypes": [
      {
        "name": "nt1vm",
        "clientConnectionEndpointPort": 19000,
        "httpGatewayEndpointPort": 19007,
        "applicationPorts": {
          "startPort": 20000,
          "endPort": 30000
        },
        "ephemeralPorts": {
          "startPort": 49000,
          "endPort": 64000
        },
        "isPrimary": true,
        "vmInstanceCount": 5,
        "durabilityLevel": "Bronze"
      },
      {
        "name": "testnt1",
        "clientConnectionEndpointPort": 0,
        "httpGatewayEndpointPort": 0,
        "applicationPorts": {
          "startPort": 1000,
          "endPort": 2000
        },
        "ephemeralPorts": {
          "startPort": 3000,
          "endPort": 4000
        },
        "isPrimary": false,
        "vmInstanceCount": 3,
        "durabilityLevel": "Bronze"
      }
    ],
    "reliabilityLevel": "Bronze",
    "upgradeMode": "Default",
    "addonFeatures": []
  }
}
```

#### 202 Response
##### Headers
```html
Retry-After: 10
Location: http://10.91.140.224/subscriptions/00000000-0000-0000-0000-000000000000/providers/Microsoft.ServiceFabric/locations/eastus/operationResults/c5e391f2-1472-4758-b52b-019addbebf61?api-version=2017-07-01-privatepreview
```

##### Body
```json
{
  "type": "Microsoft.ServiceFabric/clusters",
  "location": "eastus",
  "id": "/subscriptions/00000000-0000-0000-0000-000000000000/resourcegroups/resRg/providers/Microsoft.ServiceFabric/clusters/myCluster",
  "name": "myCluster",
  "tags": {
    "a": "b"
  },
  "etag": "W/\"636461851048912980\"",
  "properties": {
    "provisioningState": "Succeeded",
    "clusterId": "39e073b6-36b1-4fcb-8f86-904ec60db4cb",
    "clusterCodeVersion": "6.0.219.9494",
    "clusterState": "WaitingForNodes",
    "managementEndpoint": "http://myCluster.eastus.cloudapp.azure.com:19080",
    "clusterEndpoint": "39e073b6-36b1-4fcb-8f86-904ec60db4cb",
    "clientCertificateThumbprints": [],
    "clientCertificateCommonNames": [],
    "fabricSettings": [
      {
        "name": "UpgradeService",
        "parameters": [
          {
            "name": "AppPollIntervalInSeconds",
            "value": "60"
          }
        ]
      }
    ],
    "upgradeDescription": {
      "overrideUserUpgradePolicy": false,
      "forceRestart": false,
      "upgradeReplicaSetCheckTimeout": "10675199.02:48:05.4775807",
      "healthCheckWaitDuration": "00:05:00",
      "healthCheckStableDuration": "00:05:00",
      "healthCheckRetryTimeout": "00:45:00",
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
      "storageAccountName": "diag",
      "protectedAccountKeyName": "StorageAccountKey1",
      "blobEndpoint": "https://diag.blob.core.windows.net/",
      "queueEndpoint": "https://diag.queue.core.windows.net/",
      "tableEndpoint": "https://diag.table.core.windows.net/"
    },
    "nodeTypes": [
      {
        "name": "nt1vm",
        "clientConnectionEndpointPort": 19000,
        "httpGatewayEndpointPort": 19007,
        "applicationPorts": {
          "startPort": 20000,
          "endPort": 30000
        },
        "ephemeralPorts": {
          "startPort": 49000,
          "endPort": 64000
        },
        "isPrimary": true,
        "vmInstanceCount": 5,
        "durabilityLevel": "Bronze"
      },
      {
        "name": "testnt1",
        "clientConnectionEndpointPort": 0,
        "httpGatewayEndpointPort": 0,
        "applicationPorts": {
          "startPort": 1000,
          "endPort": 2000
        },
        "ephemeralPorts": {
          "startPort": 3000,
          "endPort": 4000
        },
        "isPrimary": false,
        "vmInstanceCount": 3,
        "durabilityLevel": "Bronze"
      }
    ],
    "reliabilityLevel": "Bronze",
    "upgradeMode": "Automatic",
    "availableClusterVersions": [
      {
        "codeVersion": "6.0.219.9494",
        "supportExpiryUtc": "9999-12-31T23:59:59.9999999",
        "environment": "Windows"
      }
    ],
    "addonFeatures": []
  }
}
```

