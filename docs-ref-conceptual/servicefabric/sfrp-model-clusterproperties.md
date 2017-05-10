---
title: "ClusterProperties"
ms.date: "2017-05-09"
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
# ClusterProperties

Describes the cluster resource properties.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [availableClusterVersions](#availableclusterversions) | array of [ClusterVersionDetails](sfrp-model-clusterversiondetails.md) | No |
| [clusterId](#clusterid) | string | No |
| [clusterState](#clusterstate) | string (enum) | No |
| [clusterEndpoint](#clusterendpoint) | string | No |
| [clusterCodeVersion](#clustercodeversion) | string | No |
| [certificate](#certificate) | [CertificateDescription](sfrp-model-certificatedescription.md) | No |
| [reliabilityLevel](#reliabilitylevel) | string (enum) | No |
| [upgradeMode](#upgrademode) | string (enum) | No |
| [clientCertificateThumbprints](#clientcertificatethumbprints) | array of [ClientCertificateThumbprint](sfrp-model-clientcertificatethumbprint.md) | No |
| [clientCertificateCommonNames](#clientcertificatecommonnames) | array of [ClientCertificateCommonName](sfrp-model-clientcertificatecommonname.md) | No |
| [fabricSettings](#fabricsettings) | array of [SettingsSectionDescription](sfrp-model-settingssectiondescription.md) | No |
| [reverseProxyCertificate](#reverseproxycertificate) | [CertificateDescription](sfrp-model-certificatedescription.md) | No |
| [managementEndpoint](#managementendpoint) | string | Yes |
| [nodeTypes](#nodetypes) | array of [NodeTypeDescription](sfrp-model-nodetypedescription.md) | Yes |
| [azureActiveDirectory](#azureactivedirectory) | [AzureActiveDirectory](sfrp-model-azureactivedirectory.md) | No |
| [provisioningState](#provisioningstate) | string (enum) | No |
| [vmImage](#vmimage) | string | No |
| [diagnosticsStorageAccountConfig](#diagnosticsstorageaccountconfig) | [DiagnosticsStorageAccountConfig](sfrp-model-diagnosticsstorageaccountconfig.md) | No |
| [upgradeDescription](#upgradedescription) | [ClusterUpgradePolicy](sfrp-model-clusterupgradepolicy.md) | No |

____
### availableClusterVersions
__Type__: array of [ClusterVersionDetails](sfrp-model-clusterversiondetails.md) <br/>
__Required__: No<br/>
<br/>
The available Service Fabric cluster versions available for this cluster.

____
### clusterId
__Type__: string <br/>
__Required__: No<br/>
<br/>
A service generated unique identifier for the cluster resource.

____
### clusterState
__Type__: string (enum) <br/>
__Required__: No<br/>
<br/>
The state for the cluster.

____
### clusterEndpoint
__Type__: string <br/>
__Required__: No<br/>
<br/>
The Azure Resource Provider endpoint. A system service in the cluster connects to this  endpoint.

____
### clusterCodeVersion
__Type__: string <br/>
__Required__: No<br/>
<br/>
The Service Fabric runtime version of the cluster. This property can only by set the user when **upgradeMode** is set to 'Manual'. To get list of available Service Fabric versions for new clusters use [ClusterVersion API](./ClusterVersion.md). To get the list of available version for existing clusters use **availableClusterVersions**.

____
### certificate
__Type__: [CertificateDescription](sfrp-model-certificatedescription.md) <br/>
__Required__: No<br/>
<br/>
The certificate to use for securing the cluster. The certificate provided will be used for  node to node security within the cluster, SSL certificate for cluster management endpoint and default  admin client.

____
### reliabilityLevel
__Type__: string (enum) <br/>
__Required__: No<br/>
<br/>
The reliability level sets the replica set size of system services. Learn about [ReliabilityLevel](https://docs.microsoft.com/en-us/azure/service-fabric/service-fabric-cluster-capacity).

____
### upgradeMode
__Type__: string (enum) <br/>
__Required__: No<br/>
<br/>
The upgrade mode of the cluster. This indicates if the cluster should be automatically upgraded when new Service Fabric runtime version is available.

____
### clientCertificateThumbprints
__Type__: array of [ClientCertificateThumbprint](sfrp-model-clientcertificatethumbprint.md) <br/>
__Required__: No<br/>
<br/>
The list of client certificates referenced by thumbprint that are allowed to manage the cluster.

____
### clientCertificateCommonNames
__Type__: array of [ClientCertificateCommonName](sfrp-model-clientcertificatecommonname.md) <br/>
__Required__: No<br/>
<br/>
The list of client certificates referenced by common name that are allowed to manage the cluster.

____
### fabricSettings
__Type__: array of [SettingsSectionDescription](sfrp-model-settingssectiondescription.md) <br/>
__Required__: No<br/>
<br/>
The list of custom fabric settings to configure the cluster.

____
### reverseProxyCertificate
__Type__: [CertificateDescription](sfrp-model-certificatedescription.md) <br/>
__Required__: No<br/>
<br/>
The server certificate used by reverse proxy.

____
### managementEndpoint
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The http management endpoint of the cluster.

____
### nodeTypes
__Type__: array of [NodeTypeDescription](sfrp-model-nodetypedescription.md) <br/>
__Required__: Yes<br/>
<br/>
The list of node types in the cluster.

____
### azureActiveDirectory
__Type__: [AzureActiveDirectory](sfrp-model-azureactivedirectory.md) <br/>
__Required__: No<br/>
<br/>
The AAD authentication settings of the cluster.

____
### provisioningState
__Type__: string (enum) <br/>
__Required__: No<br/>
<br/>
The provisioning state of the cluster resource.

____
### vmImage
__Type__: string <br/>
__Required__: No<br/>
<br/>
The VM image VMSS has been configured with. Generic names such as Windows or Linux can be used.

____
### diagnosticsStorageAccountConfig
__Type__: [DiagnosticsStorageAccountConfig](sfrp-model-diagnosticsstorageaccountconfig.md) <br/>
__Required__: No<br/>
<br/>
The storage account information for storing Service Fabric diagnostic logs.

____
### upgradeDescription
__Type__: [ClusterUpgradePolicy](sfrp-model-clusterupgradepolicy.md) <br/>
__Required__: No<br/>
<br/>
The policy to use when upgrading the cluster.
