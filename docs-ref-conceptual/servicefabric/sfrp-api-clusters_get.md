---
title: "Get"
ms.date: "2017-05-08"
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
# Get
Get cluster resource

Get cluster resource


## Request
| Method | Request URI |
| ------ | ----------- |
| GET | `/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.ServiceFabric/clusters/{clusterName}?api-version=2016-09-01` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [resourceGroupName](#resourcegroupname) | string | Yes | Path |
| [clusterName](#clustername) | string | Yes | Path |
| [subscriptionId](#subscriptionid) | string | Yes | Path |
| [api-version](#api-version) | string | Yes | Query |

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

## Responses

| HTTP Status Code | Description | Response Schema |
| --- | --- | --- |
| 200 (OK) | OK - Get cluster successfully<br/> | [Cluster](sfrp-model-cluster.md) |
| All other status codes | Error<br/> | [ErrorModel](sfrp-model-errormodel.md) |

## Examples

### Get a cluster

#### Request
```
GET https://management.azure.com/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/resRg/providers/Microsoft.ServiceFabric/clusters/myCluster?api-version=2016-09-01
```

#### 200 Response
##### Body
```json
{
  "id": "/subscriptions/00000000-0000-0000-0000-000000000000/resourcegroups/resRg/providers/Microsoft.ServiceFabric/clusters/myCluster",
  "location": "southcentralus",
  "name": "myCluster",
  "properties": {
    "provisioningState": "Succeeded",
    "clusterId": "1a1acec2-8d75-424a-81af-2fb83dd1cac8",
    "clusterCodeVersion": "5.5.149.9494",
    "clusterState": "Ready",
    "managementEndpoint": "https://myCluster.southcentralus.cloudapp.azure.com:19080",
    "clusterEndpoint": "https://warp-test-winfabrp-southcentralus.trafficmanager.net/runtime/clusters/1a1acec2-8d75-424a-81af-2fb83dd1cac8",
    "certificate": {
      "thumbprint": "1901CF0F76AF711BEE53DF39941092BDAC8D9050",
      "x509StoreName": "My"
    },
    "clientCertificateThumbprints": [],
    "clientCertificateCommonNames": [],
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
    "upgradeDescription": {
      "overrideUserUpgradePolicy": false,
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
      "storageAccountName": "3nrb4ixoj6ogq2",
      "protectedAccountKeyName": "StorageAccountKey1",
      "blobEndpoint": "https://3nrb4ixoj6ogq2.blob.core.windows.net/",
      "queueEndpoint": "https://3nrb4ixoj6ogq2.queue.core.windows.net/",
      "tableEndpoint": "https://3nrb4ixoj6ogq2.table.core.windows.net/"
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
        "codeVersion": "5.1.158.9590",
        "supportExpiryUtc": "9999-12-31T23:59:59.9999999",
        "environment": "Windows"
      },
      {
        "codeVersion": "5.2.0.100",
        "supportExpiryUtc": "9999-12-31T23:59:59.9999999",
        "environment": "Windows"
      },
      {
        "codeVersion": "5.2.207.9590",
        "supportExpiryUtc": "9999-12-31T23:59:59.9999999",
        "environment": "Windows"
      },
      {
        "codeVersion": "5.3.121.9494",
        "supportExpiryUtc": "9999-12-31T23:59:59.9999999",
        "environment": "Windows"
      },
      {
        "codeVersion": "5.3.311.9590",
        "supportExpiryUtc": "9999-12-31T23:59:59.9999999",
        "environment": "Windows"
      },
      {
        "codeVersion": "5.4.30.100",
        "supportExpiryUtc": "9999-12-31T23:59:59.9999999",
        "environment": "Windows"
      },
      {
        "codeVersion": "5.4.35.100",
        "supportExpiryUtc": "9999-12-31T23:59:59.9999999",
        "environment": "Windows"
      },
      {
        "codeVersion": "5.4.38.100",
        "supportExpiryUtc": "9999-12-31T23:59:59.9999999",
        "environment": "Windows"
      },
      {
        "codeVersion": "5.4.118.9494",
        "supportExpiryUtc": "9999-12-31T23:59:59.9999999",
        "environment": "Windows"
      },
      {
        "codeVersion": "5.4.132.9494",
        "supportExpiryUtc": "9999-12-31T23:59:59.9999999",
        "environment": "Windows"
      },
      {
        "codeVersion": "5.4.145.9494",
        "supportExpiryUtc": "9999-12-31T23:59:59.9999999",
        "environment": "Windows"
      },
      {
        "codeVersion": "5.4.164.9494",
        "supportExpiryUtc": "9999-12-31T23:59:59.9999999",
        "environment": "Windows"
      },
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
  },
  "tags": {
    "clusterName": "myCluster",
    "resourceType": "Service Fabric"
  },
  "type": "Microsoft.ServiceFabric/clusters"
}
```

