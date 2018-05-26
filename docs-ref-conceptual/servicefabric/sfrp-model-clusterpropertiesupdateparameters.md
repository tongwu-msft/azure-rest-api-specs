---
title: "ClusterPropertiesUpdateParameters"
ms.date: "2018-05-25"
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
# ClusterPropertiesUpdateParameters

Describes the cluster resource properties that can be updated during PATCH operation.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [addOnFeatures](#addonfeatures) | array of [enum](sfrp-model-enum.md) | No |
| [certificate](#certificate) | [CertificateDescription](sfrp-model-certificatedescription.md) | No |
| [certificateCommonNames](#certificatecommonnames) | [ServerCertificateCommonNames](sfrp-model-servercertificatecommonnames.md) | No |
| [clientCertificateCommonNames](#clientcertificatecommonnames) | array of [ClientCertificateCommonName](sfrp-model-clientcertificatecommonname.md) | No |
| [clientCertificateThumbprints](#clientcertificatethumbprints) | array of [ClientCertificateThumbprint](sfrp-model-clientcertificatethumbprint.md) | No |
| [clusterCodeVersion](#clustercodeversion) | string | No |
| [fabricSettings](#fabricsettings) | array of [SettingsSectionDescription](sfrp-model-settingssectiondescription.md) | No |
| [nodeTypes](#nodetypes) | array of [NodeTypeDescription](sfrp-model-nodetypedescription.md) | No |
| [reliabilityLevel](#reliabilitylevel) | string (enum) | No |
| [reverseProxyCertificate](#reverseproxycertificate) | [CertificateDescription](sfrp-model-certificatedescription.md) | No |
| [upgradeDescription](#upgradedescription) | [ClusterUpgradePolicy](sfrp-model-clusterupgradepolicy.md) | No |
| [upgradeMode](#upgrademode) | string (enum) | No |

____
### addOnFeatures
__Type__: array of [enum](sfrp-model-enum.md) <br/>
__Required__: No<br/>
<br/>
The list of add-on features to enable in the cluster.

____
### certificate
__Type__: [CertificateDescription](sfrp-model-certificatedescription.md) <br/>
__Required__: No<br/>
<br/>
The certificate to use for securing the cluster. The certificate provided will be used for  node to node security within the cluster, SSL certificate for cluster management endpoint and default  admin client.

____
### certificateCommonNames
__Type__: [ServerCertificateCommonNames](sfrp-model-servercertificatecommonnames.md) <br/>
__Required__: No<br/>
<br/>
Describes a list of server certificates referenced by common name that are used to secure the cluster.

____
### clientCertificateCommonNames
__Type__: array of [ClientCertificateCommonName](sfrp-model-clientcertificatecommonname.md) <br/>
__Required__: No<br/>
<br/>
The list of client certificates referenced by common name that are allowed to manage the cluster. This will overwrite the existing list.

____
### clientCertificateThumbprints
__Type__: array of [ClientCertificateThumbprint](sfrp-model-clientcertificatethumbprint.md) <br/>
__Required__: No<br/>
<br/>
The list of client certificates referenced by thumbprint that are allowed to manage the cluster. This will overwrite the existing list.

____
### clusterCodeVersion
__Type__: string <br/>
__Required__: No<br/>
<br/>
The Service Fabric runtime version of the cluster. This property can only by set the user when **upgradeMode** is set to 'Manual'. To get list of available Service Fabric versions for new clusters use [ClusterVersion API](./ClusterVersion.md). To get the list of available version for existing clusters use **availableClusterVersions**.

____
### fabricSettings
__Type__: array of [SettingsSectionDescription](sfrp-model-settingssectiondescription.md) <br/>
__Required__: No<br/>
<br/>
The list of custom fabric settings to configure the cluster. This will overwrite the existing list.

____
### nodeTypes
__Type__: array of [NodeTypeDescription](sfrp-model-nodetypedescription.md) <br/>
__Required__: No<br/>
<br/>
The list of node types in the cluster. This will overwrite the existing list.

____
### reliabilityLevel
__Type__: string (enum) <br/>
__Required__: No<br/>
<br/>


The reliability level sets the replica set size of system services. Learn about [ReliabilityLevel](https://docs.microsoft.com/en-us/azure/service-fabric/service-fabric-cluster-capacity).

  - None - Run the System services with a target replica set count of 1. This should only be used for test clusters.
  - Bronze - Run the System services with a target replica set count of 3. This should only be used for test clusters.
  - Silver - Run the System services with a target replica set count of 5.
  - Gold - Run the System services with a target replica set count of 7.
  - Platinum - Run the System services with a target replica set count of 9.



____
### reverseProxyCertificate
__Type__: [CertificateDescription](sfrp-model-certificatedescription.md) <br/>
__Required__: No<br/>
<br/>
The server certificate used by reverse proxy.

____
### upgradeDescription
__Type__: [ClusterUpgradePolicy](sfrp-model-clusterupgradepolicy.md) <br/>
__Required__: No<br/>
<br/>
The policy to use when upgrading the cluster.

____
### upgradeMode
__Type__: string (enum) <br/>
__Required__: No<br/>
<br/>


The upgrade mode of the cluster when new Service Fabric runtime version is available.

  - Automatic - The cluster will be automatically upgraded to the latest Service Fabric runtime version as soon as it is available.
  - Manual - The cluster will not be automatically upgraded to the latest Service Fabric runtime version. The cluster is upgraded by setting the **clusterCodeVersion** property in the cluster resource.


