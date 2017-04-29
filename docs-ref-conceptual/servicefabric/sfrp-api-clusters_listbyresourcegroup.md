---
title: "List By Resource Group"
ms.date: "2017-04-29"
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
# List By Resource Group
List cluster resource by resource group

List cluster resource by resource group


## Request
| Method | Request URI |
| ------ | ----------- |
| GET | `/subscriptions/{subscriptionId}/resourcegroups/{resourceGroupName}/providers/Microsoft.ServiceFabric/clusters?api-version=2016-09-01` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [resourceGroupName](#resourcegroupname) | string | Yes | Path |
| [subscriptionId](#subscriptionid) | string | Yes | Path |
| [api-version](#api-version) | string | Yes | Query |

____
### resourceGroupName
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The name of the resource group.

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
| 200 (OK) | OK - Get cluster  successfully<br/> | [ClusterListResult](sfrp-model-clusterlistresult.md) |
| All other status codes | Error<br/> | [ErrorModel](sfrp-model-errormodel.md) |

## Examples

### List cluster by resource group

#### Request
```
GET https://management.azure.com/subscriptions/00000000-0000-0000-0000-000000000000/resourcegroups/resRg/providers/Microsoft.ServiceFabric/clusters?api-version=2016-09-01
```

#### 200 Response
##### Body
```json
{
  "value": [
    {
      "type": "Microsoft.ServiceFabric/clusters",
      "location": "southcentralus",
      "id": "/subscriptions/00000000-0000-0000-0000-000000000000/resourcegroups/psrg1/providers/Microsoft.ServiceFabric/clusters/testcluster",
      "name": "testcluster",
      "tags": {
        "resourceType": "Service Fabric",
        "clusterName": "testcluster"
      },
      "properties": {
        "provisioningState": "Succeeded",
        "clusterId": "29cfe945-7ff1-4234-b567-09871226d4f6",
        "clusterCodeVersion": "5.5.216.0",
        "clusterState": "Ready",
        "managementEndpoint": "https://testcluster.southcentralus.cloudapp.azure.com:19080",
        "clusterEndpoint": "https://warp-test-winfabrp-southcentralus.trafficmanager.net/runtime/clusters/29cfe945-7ff1-4234-b567-09871226d4f6",
        "certificate": {
          "thumbprint": "5F3660C715EBBDA31DB1FFDCF508302348DE8E7A",
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
          "storageAccountName": "sflogppe231337596",
          "protectedAccountKeyName": "StorageAccountKey1",
          "blobEndpoint": "https://sflogppe231337596.blob.core.windows.net/",
          "queueEndpoint": "https://sflogppe231337596.queue.core.windows.net/",
          "tableEndpoint": "https://sflogppe231337596.table.core.windows.net/"
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
            "durabilityLevel": "Silver"
          }
        ],
        "vmImage": "Windows",
        "reliabilityLevel": "Silver",
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
          },
          {
            "codeVersion": "5.5.219.0",
            "supportExpiryUtc": "9999-12-31T23:59:59.9999999",
            "environment": "Windows"
          }
        ]
      }
    }
  ]
}
```

