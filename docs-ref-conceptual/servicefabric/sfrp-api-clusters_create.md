---
title: "Create"
ms.date: "2017-05-16"
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
# Create
Create a ServiceFabric cluster

Create cluster resource


## Request
| Method | Request URI |
| ------ | ----------- |
| PUT | `/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.ServiceFabric/clusters/{clusterName}?api-version=2016-09-01` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [resourceGroupName](#resourcegroupname) | string | Yes | Path |
| [clusterName](#clustername) | string | Yes | Path |
| [subscriptionId](#subscriptionid) | string | Yes | Path |
| [api-version](#api-version) | string | Yes | Query |
| [Cluster](#cluster) | [Cluster](sfrp-model-cluster.md) | Yes | Body |

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
### Cluster
__Type__: [Cluster](sfrp-model-cluster.md) <br/>
__Required__: Yes<br/>
<br/>
The cluster resource.

## Responses

| HTTP Status Code | Description | Response Schema |
| --- | --- | --- |
| 200 (OK) | OK - Put cluster successfully<br/> | [Cluster](sfrp-model-cluster.md) |
| 202 (Accepted) | Accepted - Put request accepted; the operation will complete asynchronously.<br/> |  |
| All other status codes | Error<br/> | [ErrorModel](sfrp-model-errormodel.md) |

## Examples

### Put a cluster with min parameter

#### Request
```
PUT https://management.azure.com/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/resRg/providers/Microsoft.ServiceFabric/clusters/myCluster?api-version=2016-09-01
```

##### Body
```json
{
  "properties": {
    "clusterCodeVersion": "5.5.149.9494",
    "reliabilityLevel": "Silver",
    "upgradeMode": "Automatic",
    "managementEndpoint": "https://myCluster.southcentralus.cloudapp.azure.com:19080",
    "nodeTypes": [
      {
        "name": "nt1vm",
        "clientConnectionEndpointPort": 19000,
        "httpGatewayEndpointPort": 19080,
        "durabilityLevel": "Bronze",
        "applicationPorts": {
          "startPort": 20000,
          "endPort": 30000
        },
        "ephemeralPorts": {
          "startPort": 49152,
          "endPort": 65534
        },
        "isPrimary": true,
        "vmInstanceCount": 5
      }
    ],
    "vmImage": "Windows",
    "diagnosticsStorageAccountConfig": {
      "storageAccountName": "7623qfhwmnstw2",
      "protectedAccountKeyName": "StorageAccountKey1",
      "blobEndpoint": "https://7623qfhwmnstw2.blob.core.windows.net/",
      "queueEndpoint": "https://7623qfhwmnstw2.queue.core.windows.net/",
      "tableEndpoint": "https://7623qfhwmnstw2.table.core.windows.net/"
    }
  },
  "location": "southcentralus",
  "tags": {
    "resourceType": "Service Fabric",
    "clusterName": "myCluster"
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
  "tags": {
    "resourceType": "Service Fabric",
    "clusterName": "myCluster"
  },
  "properties": {
    "provisioningState": "Updating",
    "clusterId": "466e7604-b8ae-4696-a91d-d7b5fcc63628",
    "clusterCodeVersion": "5.5.149.9494",
    "clusterState": "UpdatingUserConfiguration",
    "managementEndpoint": "https://myCluster.southcentralus.cloudapp.azure.com:19080",
    "clusterEndpoint": "https://warp-test-winfabrp-southcentralus.trafficmanager.net/runtime/clusters/466e7604-b8ae-4696-a91d-d7b5fcc63628",
    "certificate": {
      "thumbprint": "483B5DE52ECA35147B94C5E116FA7B2E34BB68F9",
      "x509StoreName": "My"
    },
    "upgradeDescription": {
      "forceRestart": true,
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
      "storageAccountName": "ba3wzulspn67w2",
      "protectedAccountKeyName": "StorageAccountKey1",
      "blobEndpoint": "https://ba3wzulspn67w2.blob.core.windows.net/",
      "queueEndpoint": "https://ba3wzulspn67w2.queue.core.windows.net/",
      "tableEndpoint": "https://ba3wzulspn67w2.table.core.windows.net/"
    },
    "nodeTypes": [
      {
        "name": "nt1vm",
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
        "durabilityLevel": "Bronze"
      }
    ],
    "vmImage": "Windows",
    "reliabilityLevel": "Silver",
    "upgradeMode": "Automatic",
    "availableClusterVersions": [
      {
        "codeVersion": "5.5.67.9494",
        "supportExpiryUtc": "9999-12-31T23:59:59.9999999",
        "environment": "Windows"
      },
      {
        "codeVersion": "5.5.149.9494",
        "supportExpiryUtc": "9999-12-31T23:59:59.9999999",
        "environment": "Windows"
      }
    ]
  }
}
```


### Put a cluster with max parameter

#### Request
```
PUT https://management.azure.com/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/resRg/providers/Microsoft.ServiceFabric/clusters/myCluster?api-version=2016-09-01
```

##### Body
```json
{
  "properties": {
    "clusterCodeVersion": "5.5.149.9494",
    "certificate": {
      "thumbprint": "5F3660C715EBBDA31DB1FFDCF508302348DE8E7A",
      "thumbprintSecondary": "361A93445450CC8F2FF747F74500E8044942DAFD",
      "x509StoreName": "My"
    },
    "reliabilityLevel": "Silver",
    "upgradeMode": "Automatic",
    "clientCertificateThumbprints": [
      "5F3660C715EBBDA31DB1FFDCF508302348DE8E7A"
    ],
    "clientCertificateCommonNames": [
      {
        "isAdmin": true,
        "certificateCommonName": "abc.com",
        "certificateIssuerThumbprint": "5F3660C715EBBDA31DB1FFDCF508302348DE8E7A"
      }
    ],
    "fabricSettings": [
      {
        "name": "Security",
        "parameters": [
          {
            "name": "ClusterProtectionLevel",
            "value": "EncryptAndSign"
          }
        ]
      }
    ],
    "managementEndpoint": "https://sfclust2.southcentralus.cloudapp.azure.com:19080",
    "nodeTypes": [
      {
        "name": "nt1vm",
        "clientConnectionEndpointPort": 19000,
        "httpGatewayEndpointPort": 19080,
        "durabilityLevel": "Bronze",
        "applicationPorts": {
          "startPort": 20000,
          "endPort": 30000
        },
        "ephemeralPorts": {
          "startPort": 49152,
          "endPort": 65534
        },
        "isPrimary": true,
        "vmInstanceCount": 5
      }
    ],
    "vmImage": "Windows",
    "diagnosticsStorageAccountConfig": {
      "storageAccountName": "7623qfhwmnstw2",
      "protectedAccountKeyName": "StorageAccountKey1",
      "blobEndpoint": "https://7623qfhwmnstw2.blob.core.windows.net/",
      "queueEndpoint": "https://7623qfhwmnstw2.queue.core.windows.net/",
      "tableEndpoint": "https://7623qfhwmnstw2.table.core.windows.net/"
    },
    "upgradeDescription": {
      "forceRestart": true,
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
    }
  },
  "location": "southcentralus",
  "tags": {
    "resourceType": "Service Fabric",
    "clusterName": "myCluster"
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
  "tags": {
    "resourceType": "Service Fabric",
    "clusterName": "myCluster"
  },
  "properties": {
    "provisioningState": "Updating",
    "clusterId": "466e7604-b8ae-4696-a91d-d7b5fcc63628",
    "clusterCodeVersion": "5.5.149.9494",
    "clusterState": "UpdatingUserConfiguration",
    "managementEndpoint": "https://myCluster.southcentralus.cloudapp.azure.com:19080",
    "clusterEndpoint": "https://warp-test-winfabrp-southcentralus.trafficmanager.net/runtime/clusters/466e7604-b8ae-4696-a91d-d7b5fcc63628",
    "certificate": {
      "thumbprint": "483B5DE52ECA35147B94C5E116FA7B2E34BB68F9",
      "x509StoreName": "My"
    },
    "clientCertificateThumbprints": [
      "5F3660C715EBBDA31DB1FFDCF508302348DE8E7A"
    ],
    "clientCertificateCommonNames": [
      {
        "isAdmin": true,
        "certificateCommonName": "abc.com",
        "certificateIssuerThumbprint": "5F3660C715EBBDA31DB1FFDCF508302348DE8E7A"
      }
    ],
    "fabricSettings": [
      {
        "name": "Hosting",
        "parameters": [
          {
            "name": "ActivationMaxRetryInterval",
            "value": "10000"
          }
        ]
      }
    ],
    "upgradeDescription": {
      "forceRestart": true,
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
      "storageAccountName": "ba3wzulspn67w2",
      "protectedAccountKeyName": "StorageAccountKey1",
      "blobEndpoint": "https://ba3wzulspn67w2.blob.core.windows.net/",
      "queueEndpoint": "https://ba3wzulspn67w2.queue.core.windows.net/",
      "tableEndpoint": "https://ba3wzulspn67w2.table.core.windows.net/"
    },
    "nodeTypes": [
      {
        "name": "nt1vm",
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
        "durabilityLevel": "Bronze"
      }
    ],
    "vmImage": "Windows",
    "reliabilityLevel": "Silver",
    "upgradeMode": "Automatic",
    "availableClusterVersions": [
      {
        "codeVersion": "5.5.67.9494",
        "supportExpiryUtc": "9999-12-31T23:59:59.9999999",
        "environment": "Windows"
      },
      {
        "codeVersion": "5.5.149.9494",
        "supportExpiryUtc": "9999-12-31T23:59:59.9999999",
        "environment": "Windows"
      }
    ]
  }
}
```

