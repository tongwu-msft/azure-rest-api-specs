---
title: "List By Resource Group"
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
# List By Resource Group
List cluster resource by resource group

List cluster resource by resource group


## Request
| Method | Request URI |
| ------ | ----------- |
| GET | `/subscriptions/{subscriptionId}/resourcegroups/{resourceGroupName}/providers/Microsoft.ServiceFabric/clusters?api-version=2017-07-01-preview` |


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
__Default__: 2017-07-01-preview <br/>
<br/>
The version of the API. This is a required parameter and it's value must be "2017-07-01-preview" for this specification.

## Responses

| HTTP Status Code | Description | Response Schema |
| --- | --- | --- |
| 200 (OK) | OK - Get cluster  successfully<br/> | [ClusterListResult](sfrp-2017-07-01-preview-model-clusterlistresult.md) |
| All other status codes | Error<br/> | [ErrorModel](sfrp-2017-07-01-preview-model-errormodel.md) |

## Examples

### List cluster by resource group

#### Request
```
GET https://management.azure.com/subscriptions/00000000-0000-0000-0000-000000000000/resourcegroups/resRg/providers/Microsoft.ServiceFabric/clusters?api-version=2017-07-01-preview
```

#### 200 Response
##### Body
```json
{
  "value": [
    {
      "type": "Microsoft.ServiceFabric/clusters",
      "location": "eastus",
      "id": "/subscriptions/00000000-0000-0000-0000-000000000000/resourcegroups/resRg/providers/Microsoft.ServiceFabric/clusters/myCluster",
      "name": "myCluster",
      "tags": {},
      "etag": "W/\"636461851048912981\"",
      "properties": {
        "provisioningState": "Succeeded",
        "clusterId": "39e073b6-36b1-4fcb-8f86-904ec60db4cb",
        "clusterCodeVersion": "6.0.219.9494",
        "clusterState": "WaitingForNodes",
        "managementEndpoint": "https://myCluster.eastus.cloudapp.azure.com:19080",
        "clusterEndpoint": "39e073b6-36b1-4fcb-8f86-904ec60db4cb",
        "certificate": {
          "thumbprint": "5F3660C715EBBDA31DB1FFDCF508302348DE8E7A",
          "thumbprintSecondary": "361A93445450CC8F2FF747F74500E8044942DAFD",
          "x509StoreName": "My"
        },
        "clientCertificateThumbprints": [
          {
            "isAdmin": false,
            "certificateThumbprint": "5F3660C715EBBDA31DB1FFDCF508302348DE8E7A"
          }
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
          "forceRestart": true,
          "upgradeReplicaSetCheckTimeout": "00:10:00",
          "healthCheckWaitDuration": "00:00:30",
          "healthCheckStableDuration": "00:00:30",
          "healthCheckRetryTimeout": "00:05:00",
          "upgradeTimeout": "00:15:00",
          "upgradeDomainTimeout": "00:15:00",
          "healthPolicy": {
            "maxPercentUnhealthyNodes": 100,
            "maxPercentUnhealthyApplications": 100,
            "applicationHealthPolicies": {
              "myAppHealthPolicy": {
                "defaultServiceTypeHealthPolicy": {
                  "maxPercentUnhealthyServices": 100
                }
              }
            }
          },
          "deltaHealthPolicy": {
            "maxPercentDeltaUnhealthyNodes": 0,
            "maxPercentUpgradeDomainDeltaUnhealthyNodes": 0,
            "maxPercentDeltaUnhealthyApplications": 0,
            "applicationDeltaHealthPolicies": {
              "myAppDeltaHealthPolicy": {
                "defaultServiceTypeDeltaHealthPolicy": {
                  "maxPercentDeltaUnhealthyServices": 100
                },
                "serivceTypeDeltaHealthPolicies": {
                  "mySvcTypeDeltaHealthPolicy": {
                    "maxPercentDeltaUnhealthyServices": 100
                  }
                }
              }
            }
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
          }
        ],
        "vmImage": "Windows",
        "azureActiveDirectory": {
          "tenantId": "some_random_guid",
          "clusterApplication": "some_random_guid",
          "clientApplication": "some_random_guid"
        },
        "reliabilityLevel": "Silver",
        "reverseProxyCertificate": {
          "thumbprint": "5F3660C715EBBDA31DB1FFDCF508302348DE8E7A",
          "thumbprintSecondary": "361A93445450CC8F2FF747F74500E8044942DAFD",
          "x509StoreName": "My"
        },
        "upgradeMode": "Manual",
        "availableClusterVersions": [
          {
            "codeVersion": "6.0.219.9494",
            "supportExpiryUtc": "9999-12-31T23:59:59.9999999",
            "environment": "Windows"
          }
        ],
        "addonFeatures": [
          "RepairManager",
          "DnsService"
        ]
      }
    },
    {
      "type": "Microsoft.ServiceFabric/clusters",
      "location": "eastus",
      "id": "/subscriptions/00000000-0000-0000-0000-000000000000/resourcegroups/resRg/providers/Microsoft.ServiceFabric/clusters/myCluster2",
      "name": "myCluster2",
      "tags": {},
      "etag": "W/\"636461847173452802\"",
      "properties": {
        "provisioningState": "Succeeded",
        "clusterId": "c8d11cd8-d9a7-4b58-98c8-9282f8d976a7",
        "clusterCodeVersion": "6.0.127.1",
        "clusterState": "WaitingForNodes",
        "managementEndpoint": "http://myCluster2.eastus.cloudapp.azure.com:19080",
        "clusterEndpoint": "c8d11cd8-d9a7-4b58-98c8-9282f8d976a7",
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
          }
        ],
        "vmImage": "linux",
        "reliabilityLevel": "Silver",
        "upgradeMode": "Manual",
        "availableClusterVersions": [
          {
            "codeVersion": "6.0.127.1",
            "supportExpiryUtc": "9999-12-31T23:59:59.9999999",
            "environment": "Linux"
          }
        ],
        "addonFeatures": [
          "RepairManager"
        ]
      }
    }
  ],
  "nextLink": ""
}
```

