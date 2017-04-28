---
title: "ClusterProperties"
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
# ClusterProperties

The cluster resource properties

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
| [provisioningState](#provisioningstate) | [ProvisioningState](sfrp-model-provisioningstate.md) | No |
| [vmImage](#vmimage) | string | No |
| [diagnosticsStorageAccountConfig](#diagnosticsstorageaccountconfig) | [DiagnosticsStorageAccountConfig](sfrp-model-diagnosticsstorageaccountconfig.md) | No |
| [upgradeDescription](#upgradedescription) | [ClusterUpgradePolicy](sfrp-model-clusterupgradepolicy.md) | No |

____
### availableClusterVersions
__Type__: array of [ClusterVersionDetails](sfrp-model-clusterversiondetails.md) <br/>
__Required__: No<br/>
<br/>
The available cluster code version which the cluster can upgrade to, note that you must choose upgradeMode to manual to upgrade to

____
### clusterId
__Type__: string <br/>
__Required__: No<br/>
<br/>
The unique identifier for the cluster resource

____
### clusterState
__Type__: string (enum) <br/>
__Required__: No<br/>
<br/>
The state for the cluster

____
### clusterEndpoint
__Type__: string <br/>
__Required__: No<br/>
<br/>
The endpoint for the cluster connecting to servicefabric resource provider

____
### clusterCodeVersion
__Type__: string <br/>
__Required__: No<br/>
<br/>
The ServiceFabric code version running in your cluster

____
### certificate
__Type__: [CertificateDescription](sfrp-model-certificatedescription.md) <br/>
__Required__: No<br/>
<br/>
This primay certificate will be used as cluster node to node security, SSL certificate for cluster management endpoint and default admin client

____
### reliabilityLevel
__Type__: string (enum) <br/>
__Required__: No<br/>
<br/>
Cluster reliability level indicates replica set size of system service

____
### upgradeMode
__Type__: string (enum) <br/>
__Required__: No<br/>
<br/>
Cluster upgrade mode indicates if fabric upgrade is initiated automatically by the system or not

____
### clientCertificateThumbprints
__Type__: array of [ClientCertificateThumbprint](sfrp-model-clientcertificatethumbprint.md) <br/>
__Required__: No<br/>
<br/>
The client thumbprint details ,it is used for client access for cluster operation

____
### clientCertificateCommonNames
__Type__: array of [ClientCertificateCommonName](sfrp-model-clientcertificatecommonname.md) <br/>
__Required__: No<br/>
<br/>
 List of client certificates to whitelist based on common names

____
### fabricSettings
__Type__: array of [SettingsSectionDescription](sfrp-model-settingssectiondescription.md) <br/>
__Required__: No<br/>
<br/>
List of custom fabric settings to configure the cluster.

____
### reverseProxyCertificate
__Type__: [CertificateDescription](sfrp-model-certificatedescription.md) <br/>
__Required__: No<br/>
<br/>
The server certificate used by reverse proxy

____
### managementEndpoint
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The http management endpoint of the cluster

____
### nodeTypes
__Type__: array of [NodeTypeDescription](sfrp-model-nodetypedescription.md) <br/>
__Required__: Yes<br/>
<br/>
The list of nodetypes that make up the cluster

____
### azureActiveDirectory
__Type__: [AzureActiveDirectory](sfrp-model-azureactivedirectory.md) <br/>
__Required__: No<br/>
<br/>
The settings to enable AAD authentication on the cluster

____
### provisioningState
__Type__: [ProvisioningState](sfrp-model-provisioningstate.md) <br/>
__Required__: No<br/>
<br/>
The provisioning state of the cluster resource

____
### vmImage
__Type__: string <br/>
__Required__: No<br/>
<br/>
The name of VM image VMSS has been configured with. Generic names such as Windows or Linux can be used.

____
### diagnosticsStorageAccountConfig
__Type__: [DiagnosticsStorageAccountConfig](sfrp-model-diagnosticsstorageaccountconfig.md) <br/>
__Required__: No<br/>
<br/>
The storage diagnostics account configuration details

____
### upgradeDescription
__Type__: [ClusterUpgradePolicy](sfrp-model-clusterupgradepolicy.md) <br/>
__Required__: No<br/>
<br/>
The policy to use when upgrading the cluster.
