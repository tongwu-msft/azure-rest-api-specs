---
title: "ClusterPropertiesUpdateParameters"
ms.date: "2017-04-28"
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

The cluster resource properties can be updated

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [reliabilityLevel](#reliabilitylevel) | string (enum) | No |
| [upgradeMode](#upgrademode) | string (enum) | No |
| [clusterCodeVersion](#clustercodeversion) | string | No |
| [certificate](#certificate) | [CertificateDescription](sfrp-model-certificatedescription.md) | No |
| [clientCertificateThumbprints](#clientcertificatethumbprints) | array of [ClientCertificateThumbprint](sfrp-model-clientcertificatethumbprint.md) | No |
| [clientCertificateCommonNames](#clientcertificatecommonnames) | array of [ClientCertificateCommonName](sfrp-model-clientcertificatecommonname.md) | No |
| [fabricSettings](#fabricsettings) | array of [SettingsSectionDescription](sfrp-model-settingssectiondescription.md) | No |
| [reverseProxyCertificate](#reverseproxycertificate) | [CertificateDescription](sfrp-model-certificatedescription.md) | No |
| [nodeTypes](#nodetypes) | array of [NodeTypeDescription](sfrp-model-nodetypedescription.md) | No |
| [upgradeDescription](#upgradedescription) | [ClusterUpgradePolicy](sfrp-model-clusterupgradepolicy.md) | No |

____
### reliabilityLevel
__Type__: string (enum) <br/>
__Required__: No<br/>
<br/>
This level is used to set the number of replicas of the system services

____
### upgradeMode
__Type__: string (enum) <br/>
__Required__: No<br/>
<br/>
Cluster upgrade mode indicates if fabric upgrade is initiated automatically by the system or not

____
### clusterCodeVersion
__Type__: string <br/>
__Required__: No<br/>
<br/>
The ServiceFabric code version, if set it, please make sure you have set upgradeMode to Manual, otherwise ,it will fail, if you are using PUT new cluster, you can get the version by using ClusterVersions_List, if you are updating existing cluster, you can get the availableClusterVersions from Clusters_Get

____
### certificate
__Type__: [CertificateDescription](sfrp-model-certificatedescription.md) <br/>
__Required__: No<br/>
<br/>
This primay certificate will be used as cluster node to node security, SSL certificate for cluster management endpoint and default admin client, the certificate should exist in the virtual machine scale sets or Azure key vault, before you add it. It will override original value

____
### clientCertificateThumbprints
__Type__: array of [ClientCertificateThumbprint](sfrp-model-clientcertificatethumbprint.md) <br/>
__Required__: No<br/>
<br/>
The client thumbprint details, it is used for client access for cluster operation, it will override existing collection

____
### clientCertificateCommonNames
__Type__: array of [ClientCertificateCommonName](sfrp-model-clientcertificatecommonname.md) <br/>
__Required__: No<br/>
<br/>
List of client certificates to whitelist based on common names.

____
### fabricSettings
__Type__: array of [SettingsSectionDescription](sfrp-model-settingssectiondescription.md) <br/>
__Required__: No<br/>
<br/>
List of custom fabric settings to configure the cluster, Note, it will overwrite existing collection

____
### reverseProxyCertificate
__Type__: [CertificateDescription](sfrp-model-certificatedescription.md) <br/>
__Required__: No<br/>
<br/>
Certificate for the reverse proxy

____
### nodeTypes
__Type__: array of [NodeTypeDescription](sfrp-model-nodetypedescription.md) <br/>
__Required__: No<br/>
<br/>
The list of nodetypes that make up the cluster, it will override

____
### upgradeDescription
__Type__: [ClusterUpgradePolicy](sfrp-model-clusterupgradepolicy.md) <br/>
__Required__: No<br/>
<br/>
The policy to use when upgrading the cluster.
