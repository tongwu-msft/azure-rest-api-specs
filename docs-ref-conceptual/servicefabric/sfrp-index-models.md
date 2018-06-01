---
title: "Models"
ms.date: "2018-06-04"
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
# Type Models


| Name | Description |
| --- | --- |
| [AddOnFeatures enum](sfrp-model-addonfeatures.md) | The available cluster add-on features.<br/><br/>  - RepairManager - The [Service Fabric Repair Manager](https://docs.microsoft.com/en-us/azure/service-fabric/service-fabric-patch-orchestration-application#prerequisites) service.<br/>  - DnsService - The [Service Fabric DNS](https://docs.microsoft.com/en-us/azure/service-fabric/service-fabric-dnsservice) service.<br/>  - BackupRestoreService - The [Service Fabric Backup and Restore](https://docs.microsoft.com/en-us/azure/service-fabric/service-fabric-backuprestoreservice-quickstart-azurecluster) service.<br/>  - ResourceMonitorService - The Service Fabric Resource Monitor service.<br/> |
| [ApplicationDeltaHealthPolicy](sfrp-model-applicationdeltahealthpolicy.md) | Defines a delta health policy used to evaluate the health of an application or one of its child entities when upgrading the cluster.<br/> |
| [ApplicationHealthPolicy](sfrp-model-applicationhealthpolicy.md) | Defines a health policy used to evaluate the health of an application or one of its children entities.<br/> |
| [AvailableOperationDisplay](sfrp-model-availableoperationdisplay.md) | Operation supported by the Service Fabric resource provider<br/> |
| [AzureActiveDirectory](sfrp-model-azureactivedirectory.md) | The settings to enable AAD authentication on the cluster.<br/> |
| [CertificateDescription](sfrp-model-certificatedescription.md) | Describes the certificate details.<br/> |
| [ClientCertificateCommonName](sfrp-model-clientcertificatecommonname.md) | Describes the client certificate details using common name.<br/> |
| [ClientCertificateThumbprint](sfrp-model-clientcertificatethumbprint.md) | Describes the client certificate details using thumbprint.<br/> |
| [Cluster](sfrp-model-cluster.md) | The cluster resource<br/> |
| [ClusterCodeVersionsListResult](sfrp-model-clustercodeversionslistresult.md) | The list results of the Service Fabric runtime versions.<br/> |
| [ClusterCodeVersionsResult](sfrp-model-clustercodeversionsresult.md) | The result of the Service Fabric runtime versions<br/> |
| [ClusterHealthPolicy](sfrp-model-clusterhealthpolicy.md) | Defines a health policy used to evaluate the health of the cluster or of a cluster node.<br/> |
| [ClusterListResult](sfrp-model-clusterlistresult.md) | Cluster list results<br/> |
| [ClusterProperties](sfrp-model-clusterproperties.md) | Describes the cluster resource properties.<br/> |
| [ClusterPropertiesUpdateParameters](sfrp-model-clusterpropertiesupdateparameters.md) | Describes the cluster resource properties that can be updated during PATCH operation.<br/> |
| [ClusterUpdateParameters](sfrp-model-clusterupdateparameters.md) | Cluster update request<br/> |
| [ClusterUpgradeDeltaHealthPolicy](sfrp-model-clusterupgradedeltahealthpolicy.md) | Describes the delta health policies for the cluster upgrade.<br/> |
| [ClusterUpgradePolicy](sfrp-model-clusterupgradepolicy.md) | Describes the policy used when upgrading the cluster.<br/> |
| [ClusterVersionDetails](sfrp-model-clusterversiondetails.md) | The detail of the Service Fabric runtime version result<br/> |
| [DiagnosticsStorageAccountConfig](sfrp-model-diagnosticsstorageaccountconfig.md) | The storage account information for storing Service Fabric diagnostic logs.<br/> |
| [EndpointRangeDescription](sfrp-model-endpointrangedescription.md) | Port range details<br/> |
| [ErrorModel](sfrp-model-errormodel.md) | The structure of the error.<br/> |
| [ErrorModelError](sfrp-model-errormodelerror.md) | The error details.<br/> |
| [NodeTypeDescription](sfrp-model-nodetypedescription.md) | Describes a node type in the cluster, each node type represents sub set of nodes in the cluster.<br/> |
| [OperationListResult](sfrp-model-operationlistresult.md) | Describes the result of the request to list Service Fabric resource provider operations.<br/> |
| [OperationResult](sfrp-model-operationresult.md) | Available operation list result<br/> |
| [ProvisioningState enum](sfrp-model-provisioningstate.md) | Possible values include: 'Updating', 'Succeeded', 'Failed', 'Canceled'<br/> |
| [Resource](sfrp-model-resource.md) | The resource model definition.<br/> |
| [ServerCertificateCommonName](sfrp-model-servercertificatecommonname.md) | Describes the server certificate details using common name.<br/> |
| [ServerCertificateCommonNames](sfrp-model-servercertificatecommonnames.md) | Describes a list of server certificates referenced by common name that are used to secure the cluster.<br/> |
| [ServiceTypeDeltaHealthPolicy](sfrp-model-servicetypedeltahealthpolicy.md) | Represents the delta health policy used to evaluate the health of services belonging to a service type when upgrading the cluster.<br/> |
| [ServiceTypeHealthPolicy](sfrp-model-servicetypehealthpolicy.md) | Represents the health policy used to evaluate the health of services belonging to a service type.<br/> |
| [SettingsParameterDescription](sfrp-model-settingsparameterdescription.md) | Describes a parameter in fabric settings of the cluster.<br/> |
| [SettingsSectionDescription](sfrp-model-settingssectiondescription.md) | Describes a section in the fabric settings of the cluster.<br/> |
