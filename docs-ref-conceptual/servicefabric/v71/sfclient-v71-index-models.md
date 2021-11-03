---
title: "Models"
ms.date: "04/15/2020"
ms.service: "service-fabric"
ms.topic: "reference"
applies_to: 
  - "Azure"
  - "Windows Server 2012 R2"
  - "Windows Server 2016"
dev_langs: 
  - "rest-api"
helpviewer_keywords: 
  - "Service Fabric REST API Reference"
author: "erikadoyle"
ms.author: "edoyle"
manager: "gwallace"
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
| [AadMetadata](sfclient-v71-model-aadmetadata.md) | Azure Active Directory metadata used for secured connection to cluster.<br/> |
| [AadMetadataObject](sfclient-v71-model-aadmetadataobject.md) | Azure Active Directory metadata object used for secured connection to cluster.<br/> |
| [AddRemoveIncrementalNamedPartitionScalingMechanism](sfclient-v71-model-addremoveincrementalnamedpartitionscalingmechanism.md) | Represents a scaling mechanism for adding or removing named partitions of a stateless service. Partition names are in the format '0','1''N-1'<br/> |
| [AddRemoveIncrementalNamedPartitionScalingMechanism](sfclient-v71-model-addremoveincrementalnamedpartitionscalingmechanism.md) | Represents a scaling mechanism for adding or removing named partitions of a stateless service. Partition names are in the format '0','1''N-1'<br/> |
| [AddRemoveReplicaScalingMechanism](sfclient-v71-model-addremovereplicascalingmechanism.md) | Describes the horizontal auto scaling mechanism that adds or removes replicas (containers or container groups).<br/> |
| [AddRemoveReplicaScalingMechanism](sfclient-v71-model-addremovereplicascalingmechanism.md) | Describes the horizontal auto scaling mechanism that adds or removes replicas (containers or container groups).<br/> |
| [AnalysisEventMetadata](sfclient-v71-model-analysiseventmetadata.md) | Metadata about an Analysis Event.<br/> |
| [ApplicationBackupConfigurationInfo](sfclient-v71-model-applicationbackupconfigurationinfo.md) | Backup configuration information for a specific Service Fabric application specifying what backup policy is being applied and suspend description, if any.<br/> |
| [ApplicationBackupConfigurationInfo](sfclient-v71-model-applicationbackupconfigurationinfo.md) | Backup configuration information for a specific Service Fabric application specifying what backup policy is being applied and suspend description, if any.<br/> |
| [ApplicationBackupEntity](sfclient-v71-model-applicationbackupentity.md) | Identifies the Service Fabric application which is being backed up.<br/> |
| [ApplicationBackupEntity](sfclient-v71-model-applicationbackupentity.md) | Identifies the Service Fabric application which is being backed up.<br/> |
| [ApplicationCapacityDescription](sfclient-v71-model-applicationcapacitydescription.md) | Describes capacity information for services of this application. This description can be used for describing the following.<br/>- Reserving the capacity for the services on the nodes<br/>- Limiting the total number of nodes that services of this application can run on<br/>- Limiting the custom capacity metrics to limit the total consumption of this metric by the services of this application<br/> |
| [ApplicationContainerInstanceExitedEvent](sfclient-v71-model-applicationcontainerinstanceexitedevent.md) | Container Exited event.<br/> |
| [ApplicationContainerInstanceExitedEvent](sfclient-v71-model-applicationcontainerinstanceexitedevent.md) | Container Exited event.<br/> |
| [ApplicationCreatedEvent](sfclient-v71-model-applicationcreatedevent.md) | Application Created event.<br/> |
| [ApplicationCreatedEvent](sfclient-v71-model-applicationcreatedevent.md) | Application Created event.<br/> |
| [ApplicationDefinitionKind enum](sfclient-v71-model-applicationdefinitionkind.md) | The mechanism used to define a Service Fabric application.<br/> |
| [ApplicationDeletedEvent](sfclient-v71-model-applicationdeletedevent.md) | Application Deleted event.<br/> |
| [ApplicationDeletedEvent](sfclient-v71-model-applicationdeletedevent.md) | Application Deleted event.<br/> |
| [ApplicationDescription](sfclient-v71-model-applicationdescription.md) | Describes a Service Fabric application.<br/> |
| [ApplicationEvent](sfclient-v71-model-applicationevent.md) | Represents the base for all Application Events.<br/> |
| [ApplicationEvent](sfclient-v71-model-applicationevent.md) | Represents the base for all Application Events.<br/> |
| [ApplicationHealth](sfclient-v71-model-applicationhealth.md) | Represents the health of the application. Contains the application aggregated health state and the service and deployed application health states.<br/> |
| [ApplicationHealth](sfclient-v71-model-applicationhealth.md) | Represents the health of the application. Contains the application aggregated health state and the service and deployed application health states.<br/> |
| [ApplicationHealthEvaluation](sfclient-v71-model-applicationhealthevaluation.md) | Represents health evaluation for an application, containing information about the data and the algorithm used by the health store to evaluate health.<br/> |
| [ApplicationHealthEvaluation](sfclient-v71-model-applicationhealthevaluation.md) | Represents health evaluation for an application, containing information about the data and the algorithm used by the health store to evaluate health.<br/> |
| [ApplicationHealthPolicies](sfclient-v71-model-applicationhealthpolicies.md) | Defines the application health policy map used to evaluate the health of an application or one of its children entities.<br/> |
| [ApplicationHealthPolicy](sfclient-v71-model-applicationhealthpolicy.md) | Defines a health policy used to evaluate the health of an application or one of its children entities.<br/> |
| [ApplicationHealthPolicyMapItem](sfclient-v71-model-applicationhealthpolicymapitem.md) | Defines an item in ApplicationHealthPolicyMap.<br/> |
| [ApplicationHealthReportExpiredEvent](sfclient-v71-model-applicationhealthreportexpiredevent.md) | Application Health Report Expired event.<br/> |
| [ApplicationHealthReportExpiredEvent](sfclient-v71-model-applicationhealthreportexpiredevent.md) | Application Health Report Expired event.<br/> |
| [ApplicationHealthState](sfclient-v71-model-applicationhealthstate.md) | Represents the health state of an application, which contains the application identifier and the aggregated health state.<br/> |
| [ApplicationHealthState](sfclient-v71-model-applicationhealthstate.md) | Represents the health state of an application, which contains the application identifier and the aggregated health state.<br/> |
| [ApplicationHealthStateChunk](sfclient-v71-model-applicationhealthstatechunk.md) | Represents the health state chunk of a application.<br/>The application health state chunk contains the application name, its aggregated health state and any children services and deployed applications that respect the filters in cluster health chunk query description.<br/> |
| [ApplicationHealthStateChunk](sfclient-v71-model-applicationhealthstatechunk.md) | Represents the health state chunk of a application.<br/>The application health state chunk contains the application name, its aggregated health state and any children services and deployed applications that respect the filters in cluster health chunk query description.<br/> |
| [ApplicationHealthStateChunkList](sfclient-v71-model-applicationhealthstatechunklist.md) | The list of application health state chunks in the cluster that respect the input filters in the chunk query. Returned by get cluster health state chunks query.<br/> |
| [ApplicationHealthStateChunkList](sfclient-v71-model-applicationhealthstatechunklist.md) | The list of application health state chunks in the cluster that respect the input filters in the chunk query. Returned by get cluster health state chunks query.<br/> |
| [ApplicationHealthStateFilter](sfclient-v71-model-applicationhealthstatefilter.md) | Defines matching criteria to determine whether a application should be included in the cluster health chunk.<br/>One filter can match zero, one or multiple applications, depending on its properties.<br/> |
| [ApplicationInfo](sfclient-v71-model-applicationinfo.md) | Information about a Service Fabric application.<br/> |
| [ApplicationLoadInfo](sfclient-v71-model-applicationloadinfo.md) | Load Information about a Service Fabric application.<br/> |
| [ApplicationLoadMetricInformation](sfclient-v71-model-applicationloadmetricinformation.md) | Describes load information for a custom resource balancing metric. This can be used to limit the total consumption of this metric by the services of this application.<br/> |
| [ApplicationMetricDescription](sfclient-v71-model-applicationmetricdescription.md) | Describes capacity information for a custom resource balancing metric. This can be used to limit the total consumption of this metric by the services of this application.<br/> |
| [ApplicationNameInfo](sfclient-v71-model-applicationnameinfo.md) | Information about the application name.<br/> |
| [ApplicationNewHealthReportEvent](sfclient-v71-model-applicationnewhealthreportevent.md) | Application Health Report Created event.<br/> |
| [ApplicationNewHealthReportEvent](sfclient-v71-model-applicationnewhealthreportevent.md) | Application Health Report Created event.<br/> |
| [ApplicationPackageCleanupPolicy enum](sfclient-v71-model-applicationpackagecleanuppolicy.md) | The kind of action that needs to be taken for cleaning up the application package after successful provision.<br/> |
| [ApplicationParameter](sfclient-v71-model-applicationparameter.md) | Describes an application parameter override to be applied when creating or upgrading an application.<br/> |
| [ApplicationProcessExitedEvent](sfclient-v71-model-applicationprocessexitedevent.md) | Process Exited event.<br/> |
| [ApplicationProcessExitedEvent](sfclient-v71-model-applicationprocessexitedevent.md) | Process Exited event.<br/> |
| [ApplicationProperties](sfclient-v71-model-applicationproperties.md) | Describes properties of a application resource.<br/> |
| [ApplicationResourceDescription](sfclient-v71-model-applicationresourcedescription.md) | This type describes a application resource.<br/> |
| [ApplicationResourceUpgradeProgressInfo](sfclient-v71-model-applicationresourceupgradeprogressinfo.md) | This type describes an application resource upgrade.<br/> |
| [ApplicationResourceUpgradeState enum](sfclient-v71-model-applicationresourceupgradestate.md) | The state of the application resource upgrade.<br/> |
| [ApplicationScopedVolume](sfclient-v71-model-applicationscopedvolume.md) | Describes a volume whose lifetime is scoped to the application's lifetime.<br/> |
| [ApplicationScopedVolume](sfclient-v71-model-applicationscopedvolume.md) | Describes a volume whose lifetime is scoped to the application's lifetime.<br/> |
| [ApplicationScopedVolumeCreationParameters](sfclient-v71-model-applicationscopedvolumecreationparameters.md) | Describes parameters for creating application-scoped volumes.<br/> |
| [ApplicationScopedVolumeCreationParametersServiceFabricVolumeDisk](sfclient-v71-model-applicationscopedvolumecreationparametersservicefabricvolumedisk.md) | Describes parameters for creating application-scoped volumes provided by Service Fabric Volume Disks<br/> |
| [ApplicationScopedVolumeCreationParametersServiceFabricVolumeDisk](sfclient-v71-model-applicationscopedvolumecreationparametersservicefabricvolumedisk.md) | Describes parameters for creating application-scoped volumes provided by Service Fabric Volume Disks<br/> |
| [ApplicationScopedVolumeKind enum](sfclient-v71-model-applicationscopedvolumekind.md) | Specifies the application-scoped volume kind.<br/> |
| [ApplicationsHealthEvaluation](sfclient-v71-model-applicationshealthevaluation.md) | Represents health evaluation for applications, containing health evaluations for each unhealthy application that impacted current aggregated health state.<br/> |
| [ApplicationsHealthEvaluation](sfclient-v71-model-applicationshealthevaluation.md) | Represents health evaluation for applications, containing health evaluations for each unhealthy application that impacted current aggregated health state.<br/> |
| [ApplicationStatus enum](sfclient-v71-model-applicationstatus.md) | The status of the application.<br/> |
| [ApplicationTypeApplicationsHealthEvaluation](sfclient-v71-model-applicationtypeapplicationshealthevaluation.md) | Represents health evaluation for applications of a particular application type. The application type applications evaluation can be returned when cluster health evaluation returns unhealthy aggregated health state, either Error or Warning. It contains health evaluations for each unhealthy application of the included application type that impacted current aggregated health state.<br/> |
| [ApplicationTypeApplicationsHealthEvaluation](sfclient-v71-model-applicationtypeapplicationshealthevaluation.md) | Represents health evaluation for applications of a particular application type. The application type applications evaluation can be returned when cluster health evaluation returns unhealthy aggregated health state, either Error or Warning. It contains health evaluations for each unhealthy application of the included application type that impacted current aggregated health state.<br/> |
| [ApplicationTypeDefinitionKind enum](sfclient-v71-model-applicationtypedefinitionkind.md) | The mechanism used to define a Service Fabric application type.<br/> |
| [ApplicationTypeHealthPolicyMapItem](sfclient-v71-model-applicationtypehealthpolicymapitem.md) | Defines an item in ApplicationTypeHealthPolicyMap.<br/> |
| [ApplicationTypeImageStorePath](sfclient-v71-model-applicationtypeimagestorepath.md) | Path description for the application package in the image store specified during the prior copy operation.<br/> |
| [ApplicationTypeInfo](sfclient-v71-model-applicationtypeinfo.md) | Information about an application type.<br/> |
| [ApplicationTypeManifest](sfclient-v71-model-applicationtypemanifest.md) | Contains the manifest describing an application type registered in a Service Fabric cluster.<br/> |
| [ApplicationTypeStatus enum](sfclient-v71-model-applicationtypestatus.md) | The status of the application type.<br/> |
| [ApplicationUpgradeCompletedEvent](sfclient-v71-model-applicationupgradecompletedevent.md) | Application Upgrade Completed event.<br/> |
| [ApplicationUpgradeCompletedEvent](sfclient-v71-model-applicationupgradecompletedevent.md) | Application Upgrade Completed event.<br/> |
| [ApplicationUpgradeDescription](sfclient-v71-model-applicationupgradedescription.md) | Describes the parameters for an application upgrade. Note that upgrade description replaces the existing application description. This means that if the parameters are not specified, the existing parameters on the applications will be overwritten with the empty parameters list. This would result in the application using the default value of the parameters from the application manifest. If you do not want to change any existing parameter values, please get the application parameters first using the GetApplicationInfo query and then supply those values as Parameters in this ApplicationUpgradeDescription.<br/> |
| [ApplicationUpgradeDomainCompletedEvent](sfclient-v71-model-applicationupgradedomaincompletedevent.md) | Application Upgrade Domain Completed event.<br/> |
| [ApplicationUpgradeDomainCompletedEvent](sfclient-v71-model-applicationupgradedomaincompletedevent.md) | Application Upgrade Domain Completed event.<br/> |
| [ApplicationUpgradeProgressInfo](sfclient-v71-model-applicationupgradeprogressinfo.md) | Describes the parameters for an application upgrade.<br/> |
| [ApplicationUpgradeRollbackCompletedEvent](sfclient-v71-model-applicationupgraderollbackcompletedevent.md) | Application Upgrade Rollback Completed event.<br/> |
| [ApplicationUpgradeRollbackCompletedEvent](sfclient-v71-model-applicationupgraderollbackcompletedevent.md) | Application Upgrade Rollback Completed event.<br/> |
| [ApplicationUpgradeRollbackStartedEvent](sfclient-v71-model-applicationupgraderollbackstartedevent.md) | Application Upgrade Rollback Started event.<br/> |
| [ApplicationUpgradeRollbackStartedEvent](sfclient-v71-model-applicationupgraderollbackstartedevent.md) | Application Upgrade Rollback Started event.<br/> |
| [ApplicationUpgradeStartedEvent](sfclient-v71-model-applicationupgradestartedevent.md) | Application Upgrade Started event.<br/> |
| [ApplicationUpgradeStartedEvent](sfclient-v71-model-applicationupgradestartedevent.md) | Application Upgrade Started event.<br/> |
| [ApplicationUpgradeUpdateDescription](sfclient-v71-model-applicationupgradeupdatedescription.md) | Describes the parameters for updating an ongoing application upgrade.<br/> |
| [AutoScalingMechanism](sfclient-v71-model-autoscalingmechanism.md) | Describes the mechanism for performing auto scaling operation. Derived classes will describe the actual mechanism.<br/> |
| [AutoScalingMechanismKind enum](sfclient-v71-model-autoscalingmechanismkind.md) | Enumerates the mechanisms for auto scaling.<br/> |
| [AutoScalingMetric](sfclient-v71-model-autoscalingmetric.md) | Describes the metric that is used for triggering auto scaling operation. Derived classes will describe resources or metrics.<br/> |
| [AutoScalingMetricKind enum](sfclient-v71-model-autoscalingmetrickind.md) | Enumerates the metrics that are used for triggering auto scaling.<br/> |
| [AutoScalingPolicy](sfclient-v71-model-autoscalingpolicy.md) | Describes the auto scaling policy<br/> |
| [AutoScalingResourceMetric](sfclient-v71-model-autoscalingresourcemetric.md) | Describes the resource that is used for triggering auto scaling.<br/> |
| [AutoScalingResourceMetric](sfclient-v71-model-autoscalingresourcemetric.md) | Describes the resource that is used for triggering auto scaling.<br/> |
| [AutoScalingResourceMetricName enum](sfclient-v71-model-autoscalingresourcemetricname.md) | Enumerates the resources that are used for triggering auto scaling.<br/> |
| [AutoScalingTrigger](sfclient-v71-model-autoscalingtrigger.md) | Describes the trigger for performing auto scaling operation.<br/> |
| [AutoScalingTriggerKind enum](sfclient-v71-model-autoscalingtriggerkind.md) | Enumerates the triggers for auto scaling.<br/> |
| [AverageLoadScalingTrigger](sfclient-v71-model-averageloadscalingtrigger.md) | Describes the average load trigger used for auto scaling.<br/> |
| [AverageLoadScalingTrigger](sfclient-v71-model-averageloadscalingtrigger.md) | Describes the average load trigger used for auto scaling.<br/> |
| [AveragePartitionLoadScalingTrigger](sfclient-v71-model-averagepartitionloadscalingtrigger.md) | Represents a scaling trigger related to an average load of a metric/resource of a partition.<br/> |
| [AveragePartitionLoadScalingTrigger](sfclient-v71-model-averagepartitionloadscalingtrigger.md) | Represents a scaling trigger related to an average load of a metric/resource of a partition.<br/> |
| [AverageServiceLoadScalingTrigger](sfclient-v71-model-averageserviceloadscalingtrigger.md) | Represents a scaling policy related to an average load of a metric/resource of a service.<br/> |
| [AverageServiceLoadScalingTrigger](sfclient-v71-model-averageserviceloadscalingtrigger.md) | Represents a scaling policy related to an average load of a metric/resource of a service.<br/> |
| [AzureBlobBackupStorageDescription](sfclient-v71-model-azureblobbackupstoragedescription.md) | Describes the parameters for Azure blob store used for storing and enumerating backups.<br/> |
| [AzureBlobBackupStorageDescription](sfclient-v71-model-azureblobbackupstoragedescription.md) | Describes the parameters for Azure blob store used for storing and enumerating backups.<br/> |
| [AzureInternalMonitoringPipelineSinkDescription](sfclient-v71-model-azureinternalmonitoringpipelinesinkdescription.md) | Diagnostics settings for Geneva.<br/> |
| [AzureInternalMonitoringPipelineSinkDescription](sfclient-v71-model-azureinternalmonitoringpipelinesinkdescription.md) | Diagnostics settings for Geneva.<br/> |
| [BackupConfigurationInfo](sfclient-v71-model-backupconfigurationinfo.md) | Describes the backup configuration information.<br/> |
| [BackupEntity](sfclient-v71-model-backupentity.md) | Describes the Service Fabric entity that is configured for backup.<br/> |
| [BackupEntityKind enum](sfclient-v71-model-backupentitykind.md) | The entity type of a Service Fabric entity such as Application, Service or a Partition where periodic backups can be enabled.<br/> |
| [BackupInfo](sfclient-v71-model-backupinfo.md) | Represents a backup point which can be used to trigger a restore.<br/> |
| [BackupPartitionDescription](sfclient-v71-model-backuppartitiondescription.md) | Describes the parameters for triggering partition's backup.<br/> |
| [BackupPolicyDescription](sfclient-v71-model-backuppolicydescription.md) | Describes a backup policy for configuring periodic backup.<br/> |
| [BackupPolicyScope enum](sfclient-v71-model-backuppolicyscope.md) | Specifies the scope at which the backup policy is applied.<br/> |
| [BackupProgressInfo](sfclient-v71-model-backupprogressinfo.md) | Describes the progress of a partition's backup.<br/> |
| [BackupScheduleDescription](sfclient-v71-model-backupscheduledescription.md) | Describes the backup schedule parameters.<br/> |
| [BackupScheduleFrequencyType enum](sfclient-v71-model-backupschedulefrequencytype.md) | Describes the frequency with which to run the time based backup schedule.<br/> |
| [BackupScheduleKind enum](sfclient-v71-model-backupschedulekind.md) | The kind of backup schedule, time based or frequency based.<br/> |
| [BackupState enum](sfclient-v71-model-backupstate.md) | Represents the current state of the partition backup operation.<br/> |
| [BackupStorageDescription](sfclient-v71-model-backupstoragedescription.md) | Describes the parameters for the backup storage.<br/> |
| [BackupStorageKind enum](sfclient-v71-model-backupstoragekind.md) | The kind of backup storage, where backups are saved.<br/> |
| [BackupSuspensionInfo](sfclient-v71-model-backupsuspensioninfo.md) | Describes the backup suspension details.<br/> |
| [BackupSuspensionScope enum](sfclient-v71-model-backupsuspensionscope.md) | Specifies the scope at which the backup suspension was applied.<br/> |
| [BackupType enum](sfclient-v71-model-backuptype.md) | Describes the type of backup, whether its full or incremental.<br/> |
| [BasicRetentionPolicyDescription](sfclient-v71-model-basicretentionpolicydescription.md) | Describes basic retention policy.<br/> |
| [BasicRetentionPolicyDescription](sfclient-v71-model-basicretentionpolicydescription.md) | Describes basic retention policy.<br/> |
| [BinaryPropertyValue](sfclient-v71-model-binarypropertyvalue.md) | Describes a Service Fabric property value of type Binary.<br/> |
| [BinaryPropertyValue](sfclient-v71-model-binarypropertyvalue.md) | Describes a Service Fabric property value of type Binary.<br/> |
| [Chaos](sfclient-v71-model-chaos.md) | Contains a description of Chaos.<br/> |
| [ChaosCodePackageRestartScheduledEvent](sfclient-v71-model-chaoscodepackagerestartscheduledevent.md) | Chaos Restart Code Package Fault Scheduled event.<br/> |
| [ChaosCodePackageRestartScheduledEvent](sfclient-v71-model-chaoscodepackagerestartscheduledevent.md) | Chaos Restart Code Package Fault Scheduled event.<br/> |
| [ChaosContext](sfclient-v71-model-chaoscontext.md) | Describes a map, which is a collection of (string, string) type key-value pairs. The map can be used to record information about<br/>the Chaos run. There cannot be more than 100 such pairs and each string (key or value) can be at most 4095 characters long.<br/>This map is set by the starter of the Chaos run to optionally store the context about the specific run.<br/> |
| [ChaosEvent](sfclient-v71-model-chaosevent.md) | Represents an event generated during a Chaos run.<br/> |
| [ChaosEventKind enum](sfclient-v71-model-chaoseventkind.md) | The kind of Chaos event.<br/> |
| [ChaosEventsSegment](sfclient-v71-model-chaoseventssegment.md) | Contains the list of Chaos events and the continuation token to get the next segment.<br/> |
| [ChaosEventWrapper](sfclient-v71-model-chaoseventwrapper.md) | Wrapper object for Chaos event.<br/> |
| [ChaosNodeRestartScheduledEvent](sfclient-v71-model-chaosnoderestartscheduledevent.md) | Chaos Restart Node Fault Scheduled event.<br/> |
| [ChaosNodeRestartScheduledEvent](sfclient-v71-model-chaosnoderestartscheduledevent.md) | Chaos Restart Node Fault Scheduled event.<br/> |
| [ChaosParameters](sfclient-v71-model-chaosparameters.md) | Defines all the parameters to configure a Chaos run.<br/> |
| [ChaosParametersDictionaryItem](sfclient-v71-model-chaosparametersdictionaryitem.md) | Defines an item in ChaosParametersDictionary of the Chaos Schedule.<br/> |
| [ChaosPartitionPrimaryMoveScheduledEvent](sfclient-v71-model-chaospartitionprimarymovescheduledevent.md) | Chaos Move Primary Fault Scheduled event.<br/> |
| [ChaosPartitionPrimaryMoveScheduledEvent](sfclient-v71-model-chaospartitionprimarymovescheduledevent.md) | Chaos Move Primary Fault Scheduled event.<br/> |
| [ChaosPartitionSecondaryMoveScheduledEvent](sfclient-v71-model-chaospartitionsecondarymovescheduledevent.md) | Chaos Move Secondary Fault Scheduled event.<br/> |
| [ChaosPartitionSecondaryMoveScheduledEvent](sfclient-v71-model-chaospartitionsecondarymovescheduledevent.md) | Chaos Move Secondary Fault Scheduled event.<br/> |
| [ChaosReplicaRemovalScheduledEvent](sfclient-v71-model-chaosreplicaremovalscheduledevent.md) | Chaos Remove Replica Fault Scheduled event.<br/> |
| [ChaosReplicaRemovalScheduledEvent](sfclient-v71-model-chaosreplicaremovalscheduledevent.md) | Chaos Remove Replica Fault Scheduled event.<br/> |
| [ChaosReplicaRestartScheduledEvent](sfclient-v71-model-chaosreplicarestartscheduledevent.md) | Chaos Restart Replica Fault Scheduled event.<br/> |
| [ChaosReplicaRestartScheduledEvent](sfclient-v71-model-chaosreplicarestartscheduledevent.md) | Chaos Restart Replica Fault Scheduled event.<br/> |
| [ChaosSchedule](sfclient-v71-model-chaosschedule.md) | Defines the schedule used by Chaos.<br/> |
| [ChaosScheduleDescription](sfclient-v71-model-chaosscheduledescription.md) | Defines the Chaos Schedule used by Chaos and the version of the Chaos Schedule. The version value wraps back to 0 after surpassing 2,147,483,647.<br/> |
| [ChaosScheduleJob](sfclient-v71-model-chaosschedulejob.md) | Defines a repetition rule and parameters of Chaos to be used with the Chaos Schedule.<br/> |
| [ChaosScheduleJobActiveDaysOfWeek](sfclient-v71-model-chaosschedulejobactivedaysofweek.md) | Defines the days of the week that a Chaos Schedule Job will run for.<br/> |
| [ChaosScheduleStatus enum](sfclient-v71-model-chaosschedulestatus.md) | Current status of the schedule.<br/> |
| [ChaosStartedEvent](sfclient-v71-model-chaosstartedevent.md) | Chaos Started event.<br/> |
| [ChaosStartedEvent](sfclient-v71-model-chaosstartedevent.md) | Chaos Started event.<br/> |
| [ChaosStatus enum](sfclient-v71-model-chaosstatus.md) | Current status of the Chaos run.<br/> |
| [ChaosStoppedEvent](sfclient-v71-model-chaosstoppedevent.md) | Chaos Stopped event.<br/> |
| [ChaosStoppedEvent](sfclient-v71-model-chaosstoppedevent.md) | Chaos Stopped event.<br/> |
| [ChaosTargetFilter](sfclient-v71-model-chaostargetfilter.md) | Defines all filters for targeted Chaos faults, for example, faulting only certain node types or faulting only certain applications.<br/>If ChaosTargetFilter is not used, Chaos faults all cluster entities. If ChaosTargetFilter is used, Chaos faults only the entities that meet the ChaosTargetFilter<br/>specification. NodeTypeInclusionList and ApplicationInclusionList allow a union semantics only. It is not possible to specify an intersection<br/>of NodeTypeInclusionList and ApplicationInclusionList. For example, it is not possible to specify "fault this application only when it is on that node type."<br/>Once an entity is included in either NodeTypeInclusionList or ApplicationInclusionList, that entity cannot be excluded using ChaosTargetFilter. Even if<br/>applicationX does not appear in ApplicationInclusionList, in some Chaos iteration applicationX can be faulted because it happens to be on a node of nodeTypeY that is included<br/>in NodeTypeInclusionList. If both NodeTypeInclusionList and ApplicationInclusionList are null or empty, an ArgumentException is thrown.<br/> |
| [CheckExistsPropertyBatchOperation](sfclient-v71-model-checkexistspropertybatchoperation.md) | Represents a PropertyBatchOperation that compares the Boolean existence of a property with the Exists argument.<br/>The PropertyBatchOperation operation fails if the property's existence is not equal to the Exists argument.<br/>The CheckExistsPropertyBatchOperation is generally used as a precondition for the write operations in the batch.<br/>Note that if one PropertyBatchOperation in a PropertyBatch fails,<br/>the entire batch fails and cannot be committed in a transactional manner.<br/> |
| [CheckExistsPropertyBatchOperation](sfclient-v71-model-checkexistspropertybatchoperation.md) | Represents a PropertyBatchOperation that compares the Boolean existence of a property with the Exists argument.<br/>The PropertyBatchOperation operation fails if the property's existence is not equal to the Exists argument.<br/>The CheckExistsPropertyBatchOperation is generally used as a precondition for the write operations in the batch.<br/>Note that if one PropertyBatchOperation in a PropertyBatch fails,<br/>the entire batch fails and cannot be committed in a transactional manner.<br/> |
| [CheckSequencePropertyBatchOperation](sfclient-v71-model-checksequencepropertybatchoperation.md) | Compares the Sequence Number of a property with the SequenceNumber argument.<br/>A property's sequence number can be thought of as that property's version.<br/>Every time the property is modified, its sequence number is increased.<br/>The sequence number can be found in a property's metadata.<br/>The comparison fails if the sequence numbers are not equal.<br/>CheckSequencePropertyBatchOperation is generally used as a precondition for the write operations in the batch.<br/>Note that if one PropertyBatchOperation in a PropertyBatch fails,<br/>the entire batch fails and cannot be committed in a transactional manner.<br/> |
| [CheckSequencePropertyBatchOperation](sfclient-v71-model-checksequencepropertybatchoperation.md) | Compares the Sequence Number of a property with the SequenceNumber argument.<br/>A property's sequence number can be thought of as that property's version.<br/>Every time the property is modified, its sequence number is increased.<br/>The sequence number can be found in a property's metadata.<br/>The comparison fails if the sequence numbers are not equal.<br/>CheckSequencePropertyBatchOperation is generally used as a precondition for the write operations in the batch.<br/>Note that if one PropertyBatchOperation in a PropertyBatch fails,<br/>the entire batch fails and cannot be committed in a transactional manner.<br/> |
| [CheckValuePropertyBatchOperation](sfclient-v71-model-checkvaluepropertybatchoperation.md) | Represents a PropertyBatchOperation that compares the value of the property with the expected value.<br/>The CheckValuePropertyBatchOperation is generally used as a precondition for the write operations in the batch.<br/>Note that if one PropertyBatchOperation in a PropertyBatch fails,<br/>the entire batch fails and cannot be committed in a transactional manner.<br/> |
| [CheckValuePropertyBatchOperation](sfclient-v71-model-checkvaluepropertybatchoperation.md) | Represents a PropertyBatchOperation that compares the value of the property with the expected value.<br/>The CheckValuePropertyBatchOperation is generally used as a precondition for the write operations in the batch.<br/>Note that if one PropertyBatchOperation in a PropertyBatch fails,<br/>the entire batch fails and cannot be committed in a transactional manner.<br/> |
| [ClusterConfiguration](sfclient-v71-model-clusterconfiguration.md) | Information about the standalone cluster configuration.<br/> |
| [ClusterConfigurationUpgradeDescription](sfclient-v71-model-clusterconfigurationupgradedescription.md) | Describes the parameters for a standalone cluster configuration upgrade.<br/> |
| [ClusterConfigurationUpgradeStatusInfo](sfclient-v71-model-clusterconfigurationupgradestatusinfo.md) | Information about a standalone cluster configuration upgrade status.<br/> |
| [ClusterEvent](sfclient-v71-model-clusterevent.md) | Represents the base for all Cluster Events.<br/> |
| [ClusterEvent](sfclient-v71-model-clusterevent.md) | Represents the base for all Cluster Events.<br/> |
| [ClusterHealth](sfclient-v71-model-clusterhealth.md) | Represents the health of the cluster.<br/>Contains the cluster aggregated health state, the cluster application and node health states as well as the health events and the unhealthy evaluations.<br/> |
| [ClusterHealth](sfclient-v71-model-clusterhealth.md) | Represents the health of the cluster.<br/>Contains the cluster aggregated health state, the cluster application and node health states as well as the health events and the unhealthy evaluations.<br/> |
| [ClusterHealthChunk](sfclient-v71-model-clusterhealthchunk.md) | Represents the health chunk of the cluster.<br/>Contains the cluster aggregated health state, and the cluster entities that respect the input filter.<br/> |
| [ClusterHealthChunkQueryDescription](sfclient-v71-model-clusterhealthchunkquerydescription.md) | The cluster health chunk query description, which can specify the health policies to evaluate cluster health and very expressive filters to select which cluster entities to include in response.<br/> |
| [ClusterHealthPolicies](sfclient-v71-model-clusterhealthpolicies.md) | Health policies to evaluate cluster health.<br/> |
| [ClusterHealthPolicy](sfclient-v71-model-clusterhealthpolicy.md) | Defines a health policy used to evaluate the health of the cluster or of a cluster node.<br/> |
| [ClusterHealthReportExpiredEvent](sfclient-v71-model-clusterhealthreportexpiredevent.md) | Cluster Health Report Expired event.<br/> |
| [ClusterHealthReportExpiredEvent](sfclient-v71-model-clusterhealthreportexpiredevent.md) | Cluster Health Report Expired event.<br/> |
| [ClusterLoadInfo](sfclient-v71-model-clusterloadinfo.md) | Information about load in a Service Fabric cluster. It holds a summary of all metrics and their load in a cluster.<br/> |
| [ClusterManifest](sfclient-v71-model-clustermanifest.md) | Information about the cluster manifest.<br/> |
| [ClusterNewHealthReportEvent](sfclient-v71-model-clusternewhealthreportevent.md) | Cluster Health Report Created event.<br/> |
| [ClusterNewHealthReportEvent](sfclient-v71-model-clusternewhealthreportevent.md) | Cluster Health Report Created event.<br/> |
| [ClusterUpgradeCompletedEvent](sfclient-v71-model-clusterupgradecompletedevent.md) | Cluster Upgrade Completed event.<br/> |
| [ClusterUpgradeCompletedEvent](sfclient-v71-model-clusterupgradecompletedevent.md) | Cluster Upgrade Completed event.<br/> |
| [ClusterUpgradeDescriptionObject](sfclient-v71-model-clusterupgradedescriptionobject.md) | Represents a ServiceFabric cluster upgrade<br/> |
| [ClusterUpgradeDomainCompletedEvent](sfclient-v71-model-clusterupgradedomaincompletedevent.md) | Cluster Upgrade Domain Completed event.<br/> |
| [ClusterUpgradeDomainCompletedEvent](sfclient-v71-model-clusterupgradedomaincompletedevent.md) | Cluster Upgrade Domain Completed event.<br/> |
| [ClusterUpgradeHealthPolicyObject](sfclient-v71-model-clusterupgradehealthpolicyobject.md) | Defines a health policy used to evaluate the health of the cluster during a cluster upgrade.<br/> |
| [ClusterUpgradeProgressObject](sfclient-v71-model-clusterupgradeprogressobject.md) | Information about a cluster upgrade.<br/> |
| [ClusterUpgradeRollbackCompletedEvent](sfclient-v71-model-clusterupgraderollbackcompletedevent.md) | Cluster Upgrade Rollback Completed event.<br/> |
| [ClusterUpgradeRollbackCompletedEvent](sfclient-v71-model-clusterupgraderollbackcompletedevent.md) | Cluster Upgrade Rollback Completed event.<br/> |
| [ClusterUpgradeRollbackStartedEvent](sfclient-v71-model-clusterupgraderollbackstartedevent.md) | Cluster Upgrade Rollback Started event.<br/> |
| [ClusterUpgradeRollbackStartedEvent](sfclient-v71-model-clusterupgraderollbackstartedevent.md) | Cluster Upgrade Rollback Started event.<br/> |
| [ClusterUpgradeStartedEvent](sfclient-v71-model-clusterupgradestartedevent.md) | Cluster Upgrade Started event.<br/> |
| [ClusterUpgradeStartedEvent](sfclient-v71-model-clusterupgradestartedevent.md) | Cluster Upgrade Started event.<br/> |
| [ClusterVersion](sfclient-v71-model-clusterversion.md) | The cluster version.<br/> |
| [CodePackageEntryPoint](sfclient-v71-model-codepackageentrypoint.md) | Information about setup or main entry point of a code package deployed on a Service Fabric node.<br/> |
| [CodePackageEntryPointStatistics](sfclient-v71-model-codepackageentrypointstatistics.md) | Statistics about setup or main entry point  of a code package deployed on a Service Fabric node.<br/> |
| [ComposeDeploymentStatus enum](sfclient-v71-model-composedeploymentstatus.md) | The status of the compose deployment.<br/> |
| [ComposeDeploymentStatusInfo](sfclient-v71-model-composedeploymentstatusinfo.md) | Information about a Service Fabric compose deployment.<br/> |
| [ComposeDeploymentUpgradeDescription](sfclient-v71-model-composedeploymentupgradedescription.md) | Describes the parameters for a compose deployment upgrade.<br/> |
| [ComposeDeploymentUpgradeProgressInfo](sfclient-v71-model-composedeploymentupgradeprogressinfo.md) | Describes the parameters for a compose deployment upgrade.<br/> |
| [ComposeDeploymentUpgradeState enum](sfclient-v71-model-composedeploymentupgradestate.md) | The state of the compose deployment upgrade.<br/> |
| [ConfigParameterOverride](sfclient-v71-model-configparameteroverride.md) | Information about a configuration parameter override.<br/> |
| [ContainerApiRequestBody](sfclient-v71-model-containerapirequestbody.md) | parameters for making container API call.<br/> |
| [ContainerApiResponse](sfclient-v71-model-containerapiresponse.md) | Response body that wraps container API result.<br/> |
| [ContainerApiResult](sfclient-v71-model-containerapiresult.md) | Container API result.<br/> |
| [ContainerCodePackageProperties](sfclient-v71-model-containercodepackageproperties.md) | Describes a container and its runtime properties.<br/> |
| [ContainerEvent](sfclient-v71-model-containerevent.md) | A container event.<br/> |
| [ContainerInstanceEvent](sfclient-v71-model-containerinstanceevent.md) | Represents the base for all Container Events.<br/> |
| [ContainerInstanceEvent](sfclient-v71-model-containerinstanceevent.md) | Represents the base for all Container Events.<br/> |
| [ContainerInstanceView](sfclient-v71-model-containerinstanceview.md) | Runtime information of a container instance.<br/> |
| [ContainerLabel](sfclient-v71-model-containerlabel.md) | Describes a container label.<br/> |
| [ContainerLogs](sfclient-v71-model-containerlogs.md) | Container logs.<br/> |
| [ContainerState](sfclient-v71-model-containerstate.md) | The container state.<br/> |
| [CreateComposeDeploymentDescription](sfclient-v71-model-createcomposedeploymentdescription.md) | Defines description for creating a Service Fabric compose deployment.<br/> |
| [CreateFabricDump enum](sfclient-v71-model-createfabricdump.md) | Possible values include: 'False', 'True'<br/> |
| [CurrentUpgradeDomainProgressInfo](sfclient-v71-model-currentupgradedomainprogressinfo.md) | Information about the current in-progress upgrade domain.<br/> |
| [DataLossMode enum](sfclient-v71-model-datalossmode.md) | Possible values include: 'Invalid', 'PartialDataLoss', 'FullDataLoss'<br/> |
| [DayOfWeek enum](sfclient-v71-model-dayofweek.md) | Describes the days in a week.<br/> |
| [DeactivationIntent enum](sfclient-v71-model-deactivationintent.md) | Possible values include: 'Pause', 'Restart', 'RemoveData'<br/> |
| [DeactivationIntentDescription](sfclient-v71-model-deactivationintentdescription.md) | Describes the intent or reason for deactivating the node.<br/> |
| [DefaultExecutionPolicy](sfclient-v71-model-defaultexecutionpolicy.md) | The default execution policy. Always restart the service if an exit occurs.<br/> |
| [DefaultExecutionPolicy](sfclient-v71-model-defaultexecutionpolicy.md) | The default execution policy. Always restart the service if an exit occurs.<br/> |
| [DeletePropertyBatchOperation](sfclient-v71-model-deletepropertybatchoperation.md) | Represents a PropertyBatchOperation that deletes a specified property if it exists.<br/>Note that if one PropertyBatchOperation in a PropertyBatch fails,<br/>the entire batch fails and cannot be committed in a transactional manner.<br/> |
| [DeletePropertyBatchOperation](sfclient-v71-model-deletepropertybatchoperation.md) | Represents a PropertyBatchOperation that deletes a specified property if it exists.<br/>Note that if one PropertyBatchOperation in a PropertyBatch fails,<br/>the entire batch fails and cannot be committed in a transactional manner.<br/> |
| [DeltaNodesCheckHealthEvaluation](sfclient-v71-model-deltanodescheckhealthevaluation.md) | Represents health evaluation for delta nodes, containing health evaluations for each unhealthy node that impacted current aggregated health state.<br/>Can be returned during cluster upgrade when the aggregated health state of the cluster is Warning or Error.<br/> |
| [DeltaNodesCheckHealthEvaluation](sfclient-v71-model-deltanodescheckhealthevaluation.md) | Represents health evaluation for delta nodes, containing health evaluations for each unhealthy node that impacted current aggregated health state.<br/>Can be returned during cluster upgrade when the aggregated health state of the cluster is Warning or Error.<br/> |
| [DeployedApplicationHealth](sfclient-v71-model-deployedapplicationhealth.md) | Information about the health of an application deployed on a Service Fabric node.<br/> |
| [DeployedApplicationHealth](sfclient-v71-model-deployedapplicationhealth.md) | Information about the health of an application deployed on a Service Fabric node.<br/> |
| [DeployedApplicationHealthEvaluation](sfclient-v71-model-deployedapplicationhealthevaluation.md) | Represents health evaluation for a deployed application, containing information about the data and the algorithm used by the health store to evaluate health.<br/> |
| [DeployedApplicationHealthEvaluation](sfclient-v71-model-deployedapplicationhealthevaluation.md) | Represents health evaluation for a deployed application, containing information about the data and the algorithm used by the health store to evaluate health.<br/> |
| [DeployedApplicationHealthReportExpiredEvent](sfclient-v71-model-deployedapplicationhealthreportexpiredevent.md) | Deployed Application Health Report Expired event.<br/> |
| [DeployedApplicationHealthReportExpiredEvent](sfclient-v71-model-deployedapplicationhealthreportexpiredevent.md) | Deployed Application Health Report Expired event.<br/> |
| [DeployedApplicationHealthState](sfclient-v71-model-deployedapplicationhealthstate.md) | Represents the health state of a deployed application, which contains the entity identifier and the aggregated health state.<br/> |
| [DeployedApplicationHealthState](sfclient-v71-model-deployedapplicationhealthstate.md) | Represents the health state of a deployed application, which contains the entity identifier and the aggregated health state.<br/> |
| [DeployedApplicationHealthStateChunk](sfclient-v71-model-deployedapplicationhealthstatechunk.md) | Represents the health state chunk of a deployed application, which contains the node where the application is deployed, the aggregated health state and any deployed service packages that respect the chunk query description filters.<br/> |
| [DeployedApplicationHealthStateChunk](sfclient-v71-model-deployedapplicationhealthstatechunk.md) | Represents the health state chunk of a deployed application, which contains the node where the application is deployed, the aggregated health state and any deployed service packages that respect the chunk query description filters.<br/> |
| [DeployedApplicationHealthStateChunkList](sfclient-v71-model-deployedapplicationhealthstatechunklist.md) | The list of deployed application health state chunks that respect the input filters in the chunk query. Returned by get cluster health state chunks query.<br/> |
| [DeployedApplicationHealthStateFilter](sfclient-v71-model-deployedapplicationhealthstatefilter.md) | Defines matching criteria to determine whether a deployed application should be included as a child of an application in the cluster health chunk.<br/>The deployed applications are only returned if the parent application matches a filter specified in the cluster health chunk query description.<br/>One filter can match zero, one or multiple deployed applications, depending on its properties.<br/> |
| [DeployedApplicationInfo](sfclient-v71-model-deployedapplicationinfo.md) | Information about application deployed on the node.<br/> |
| [DeployedApplicationNewHealthReportEvent](sfclient-v71-model-deployedapplicationnewhealthreportevent.md) | Deployed Application Health Report Created event.<br/> |
| [DeployedApplicationNewHealthReportEvent](sfclient-v71-model-deployedapplicationnewhealthreportevent.md) | Deployed Application Health Report Created event.<br/> |
| [DeployedApplicationsHealthEvaluation](sfclient-v71-model-deployedapplicationshealthevaluation.md) | Represents health evaluation for deployed applications, containing health evaluations for each unhealthy deployed application that impacted current aggregated health state.<br/>Can be returned when evaluating application health and the aggregated health state is either Error or Warning.<br/> |
| [DeployedApplicationsHealthEvaluation](sfclient-v71-model-deployedapplicationshealthevaluation.md) | Represents health evaluation for deployed applications, containing health evaluations for each unhealthy deployed application that impacted current aggregated health state.<br/>Can be returned when evaluating application health and the aggregated health state is either Error or Warning.<br/> |
| [DeployedApplicationStatus enum](sfclient-v71-model-deployedapplicationstatus.md) | The status of the application deployed on the node. Following are the possible values.<br/> |
| [DeployedCodePackageInfo](sfclient-v71-model-deployedcodepackageinfo.md) | Information about code package deployed on a Service Fabric node.<br/> |
| [DeployedServicePackageHealth](sfclient-v71-model-deployedservicepackagehealth.md) | Information about the health of a service package for a specific application deployed on a Service Fabric node.<br/> |
| [DeployedServicePackageHealth](sfclient-v71-model-deployedservicepackagehealth.md) | Information about the health of a service package for a specific application deployed on a Service Fabric node.<br/> |
| [DeployedServicePackageHealthEvaluation](sfclient-v71-model-deployedservicepackagehealthevaluation.md) | Represents health evaluation for a deployed service package, containing information about the data and the algorithm used by health store to evaluate health. The evaluation is returned only when the aggregated health state is either Error or Warning.<br/> |
| [DeployedServicePackageHealthEvaluation](sfclient-v71-model-deployedservicepackagehealthevaluation.md) | Represents health evaluation for a deployed service package, containing information about the data and the algorithm used by health store to evaluate health. The evaluation is returned only when the aggregated health state is either Error or Warning.<br/> |
| [DeployedServicePackageHealthReportExpiredEvent](sfclient-v71-model-deployedservicepackagehealthreportexpiredevent.md) | Deployed Service Health Report Expired event.<br/> |
| [DeployedServicePackageHealthReportExpiredEvent](sfclient-v71-model-deployedservicepackagehealthreportexpiredevent.md) | Deployed Service Health Report Expired event.<br/> |
| [DeployedServicePackageHealthState](sfclient-v71-model-deployedservicepackagehealthstate.md) | Represents the health state of a deployed service package, containing the entity identifier and the aggregated health state.<br/> |
| [DeployedServicePackageHealthState](sfclient-v71-model-deployedservicepackagehealthstate.md) | Represents the health state of a deployed service package, containing the entity identifier and the aggregated health state.<br/> |
| [DeployedServicePackageHealthStateChunk](sfclient-v71-model-deployedservicepackagehealthstatechunk.md) | Represents the health state chunk of a deployed service package, which contains the service manifest name and the service package aggregated health state.<br/> |
| [DeployedServicePackageHealthStateChunk](sfclient-v71-model-deployedservicepackagehealthstatechunk.md) | Represents the health state chunk of a deployed service package, which contains the service manifest name and the service package aggregated health state.<br/> |
| [DeployedServicePackageHealthStateChunkList](sfclient-v71-model-deployedservicepackagehealthstatechunklist.md) | The list of deployed service package health state chunks that respect the input filters in the chunk query. Returned by get cluster health state chunks query.<br/> |
| [DeployedServicePackageHealthStateFilter](sfclient-v71-model-deployedservicepackagehealthstatefilter.md) | Defines matching criteria to determine whether a deployed service package should be included as a child of a deployed application in the cluster health chunk.<br/>The deployed service packages are only returned if the parent entities match a filter specified in the cluster health chunk query description. The parent deployed application and its parent application must be included in the cluster health chunk.<br/>One filter can match zero, one or multiple deployed service packages, depending on its properties.<br/> |
| [DeployedServicePackageInfo](sfclient-v71-model-deployedservicepackageinfo.md) | Information about service package deployed on a Service Fabric node.<br/> |
| [DeployedServicePackageNewHealthReportEvent](sfclient-v71-model-deployedservicepackagenewhealthreportevent.md) | Deployed Service Health Report Created event.<br/> |
| [DeployedServicePackageNewHealthReportEvent](sfclient-v71-model-deployedservicepackagenewhealthreportevent.md) | Deployed Service Health Report Created event.<br/> |
| [DeployedServicePackagesHealthEvaluation](sfclient-v71-model-deployedservicepackageshealthevaluation.md) | Represents health evaluation for deployed service packages, containing health evaluations for each unhealthy deployed service package that impacted current aggregated health state. Can be returned when evaluating deployed application health and the aggregated health state is either Error or Warning.<br/> |
| [DeployedServicePackagesHealthEvaluation](sfclient-v71-model-deployedservicepackageshealthevaluation.md) | Represents health evaluation for deployed service packages, containing health evaluations for each unhealthy deployed service package that impacted current aggregated health state. Can be returned when evaluating deployed application health and the aggregated health state is either Error or Warning.<br/> |
| [DeployedServiceReplicaDetailInfo](sfclient-v71-model-deployedservicereplicadetailinfo.md) | Information about a Service Fabric service replica deployed on a node.<br/> |
| [DeployedServiceReplicaInfo](sfclient-v71-model-deployedservicereplicainfo.md) | Information about a Service Fabric service replica deployed on a node.<br/> |
| [DeployedServiceTypeInfo](sfclient-v71-model-deployedservicetypeinfo.md) | Information about service type deployed on a node, information such as the status of the service type registration on a node.<br/> |
| [DeployedStatefulServiceReplicaDetailInfo](sfclient-v71-model-deployedstatefulservicereplicadetailinfo.md) | Information about a stateful replica running in a code package. Note DeployedServiceReplicaQueryResult will contain duplicate data like ServiceKind, ServiceName, PartitionId and replicaId.<br/> |
| [DeployedStatefulServiceReplicaDetailInfo](sfclient-v71-model-deployedstatefulservicereplicadetailinfo.md) | Information about a stateful replica running in a code package. Note DeployedServiceReplicaQueryResult will contain duplicate data like ServiceKind, ServiceName, PartitionId and replicaId.<br/> |
| [DeployedStatefulServiceReplicaInfo](sfclient-v71-model-deployedstatefulservicereplicainfo.md) | Information about a stateful service replica deployed on a node.<br/> |
| [DeployedStatefulServiceReplicaInfo](sfclient-v71-model-deployedstatefulservicereplicainfo.md) | Information about a stateful service replica deployed on a node.<br/> |
| [DeployedStatelessServiceInstanceDetailInfo](sfclient-v71-model-deployedstatelessserviceinstancedetailinfo.md) | Information about a stateless instance running in a code package. Note that DeployedServiceReplicaQueryResult will contain duplicate data like ServiceKind, ServiceName, PartitionId and InstanceId.<br/> |
| [DeployedStatelessServiceInstanceDetailInfo](sfclient-v71-model-deployedstatelessserviceinstancedetailinfo.md) | Information about a stateless instance running in a code package. Note that DeployedServiceReplicaQueryResult will contain duplicate data like ServiceKind, ServiceName, PartitionId and InstanceId.<br/> |
| [DeployedStatelessServiceInstanceInfo](sfclient-v71-model-deployedstatelessserviceinstanceinfo.md) | Information about a stateless service instance deployed on a node.<br/> |
| [DeployedStatelessServiceInstanceInfo](sfclient-v71-model-deployedstatelessserviceinstanceinfo.md) | Information about a stateless service instance deployed on a node.<br/> |
| [DeploymentStatus enum](sfclient-v71-model-deploymentstatus.md) | Specifies the status of a deployed application or service package on a Service Fabric node.<br/> |
| [DeployServicePackageToNodeDescription](sfclient-v71-model-deployservicepackagetonodedescription.md) | Defines description for downloading packages associated with a service manifest to image cache on a Service Fabric node.<br/> |
| [DiagnosticsDescription](sfclient-v71-model-diagnosticsdescription.md) | Describes the diagnostics options available<br/> |
| [DiagnosticsRef](sfclient-v71-model-diagnosticsref.md) | Reference to sinks in DiagnosticsDescription.<br/> |
| [DiagnosticsSinkKind enum](sfclient-v71-model-diagnosticssinkkind.md) | The kind of DiagnosticsSink.<br/> |
| [DiagnosticsSinkProperties](sfclient-v71-model-diagnosticssinkproperties.md) | Properties of a DiagnosticsSink.<br/> |
| [DisableBackupDescription](sfclient-v71-model-disablebackupdescription.md) | It describes the body parameters while disabling backup of a backup entity(Application/Service/Partition).<br/> |
| [DiskInfo](sfclient-v71-model-diskinfo.md) | Information about the disk<br/> |
| [DoublePropertyValue](sfclient-v71-model-doublepropertyvalue.md) | Describes a Service Fabric property value of type Double.<br/> |
| [DoublePropertyValue](sfclient-v71-model-doublepropertyvalue.md) | Describes a Service Fabric property value of type Double.<br/> |
| [EnableBackupDescription](sfclient-v71-model-enablebackupdescription.md) | Specifies the parameters needed to enable periodic backup.<br/> |
| [EndpointProperties](sfclient-v71-model-endpointproperties.md) | Describes a container endpoint.<br/> |
| [EndpointRef](sfclient-v71-model-endpointref.md) | Describes a reference to a service endpoint.<br/> |
| [EnsureAvailabilitySafetyCheck](sfclient-v71-model-ensureavailabilitysafetycheck.md) | Safety check that waits to ensure the availability of the partition. It waits until there are replicas available such that bringing down this replica will not cause availability loss for the partition.<br/> |
| [EnsureAvailabilitySafetyCheck](sfclient-v71-model-ensureavailabilitysafetycheck.md) | Safety check that waits to ensure the availability of the partition. It waits until there are replicas available such that bringing down this replica will not cause availability loss for the partition.<br/> |
| [EnsurePartitionQuorumSafetyCheck](sfclient-v71-model-ensurepartitionquorumsafetycheck.md) | Safety check that ensures that a quorum of replicas are not lost for a partition.<br/> |
| [EnsurePartitionQuorumSafetyCheck](sfclient-v71-model-ensurepartitionquorumsafetycheck.md) | Safety check that ensures that a quorum of replicas are not lost for a partition.<br/> |
| [EntityHealth](sfclient-v71-model-entityhealth.md) | Health information common to all entities in the cluster. It contains the aggregated health state, health events and unhealthy evaluation.<br/> |
| [EntityHealthState](sfclient-v71-model-entityhealthstate.md) | A base type for the health state of various entities in the cluster. It contains the aggregated health state.<br/> |
| [EntityHealthStateChunk](sfclient-v71-model-entityhealthstatechunk.md) | A base type for the health state chunk of various entities in the cluster. It contains the aggregated health state.<br/> |
| [EntityHealthStateChunkList](sfclient-v71-model-entityhealthstatechunklist.md) | A base type for the list of health state chunks found in the cluster. It contains the total number of health states that match the input filters.<br/> |
| [EntityKind enum](sfclient-v71-model-entitykind.md) | The entity type of a Service Fabric entity such as Cluster, Node, Application, Service, Partition, Replica etc.<br/> |
| [EntityKindHealthStateCount](sfclient-v71-model-entitykindhealthstatecount.md) | Represents health state count for entities of the specified entity kind.<br/> |
| [EntryPointStatus enum](sfclient-v71-model-entrypointstatus.md) | Specifies the status of the code package entry point deployed on a Service Fabric node.<br/> |
| [EnvironmentVariable](sfclient-v71-model-environmentvariable.md) | Describes an environment variable for the container.<br/> |
| [EnvironmentVariableType enum](sfclient-v71-model-environmentvariabletype.md) | The type of the environment variable being given in value<br/> |
| [Epoch](sfclient-v71-model-epoch.md) | An Epoch is a configuration number for the partition as a whole. When the configuration of the replica set changes, for example when the Primary replica changes, the operations that are replicated from the new Primary replica are said to be a new Epoch from the ones which were sent by the old Primary replica.<br/> |
| [EventHealthEvaluation](sfclient-v71-model-eventhealthevaluation.md) | Represents health evaluation of a HealthEvent that was reported on the entity.<br/>The health evaluation is returned when evaluating health of an entity results in Error or Warning.<br/> |
| [EventHealthEvaluation](sfclient-v71-model-eventhealthevaluation.md) | Represents health evaluation of a HealthEvent that was reported on the entity.<br/>The health evaluation is returned when evaluating health of an entity results in Error or Warning.<br/> |
| [ExecutingFaultsChaosEvent](sfclient-v71-model-executingfaultschaosevent.md) | Describes a Chaos event that gets generated when Chaos has decided on the faults for an iteration. This Chaos event contains the details of the faults as a list of strings.<br/> |
| [ExecutingFaultsChaosEvent](sfclient-v71-model-executingfaultschaosevent.md) | Describes a Chaos event that gets generated when Chaos has decided on the faults for an iteration. This Chaos event contains the details of the faults as a list of strings.<br/> |
| [ExecutionPolicy](sfclient-v71-model-executionpolicy.md) | The execution policy of the service<br/> |
| [ExecutionPolicyType enum](sfclient-v71-model-executionpolicytype.md) | Enumerates the execution policy types for services.<br/> |
| [ExternalStoreProvisionApplicationTypeDescription](sfclient-v71-model-externalstoreprovisionapplicationtypedescription.md) | Describes the operation to register or provision an application type using an application package from an external store instead of a package uploaded to the Service Fabric image store.<br/> |
| [ExternalStoreProvisionApplicationTypeDescription](sfclient-v71-model-externalstoreprovisionapplicationtypedescription.md) | Describes the operation to register or provision an application type using an application package from an external store instead of a package uploaded to the Service Fabric image store.<br/> |
| [FabricCodeVersionInfo](sfclient-v71-model-fabriccodeversioninfo.md) | Information about a Service Fabric code version.<br/> |
| [FabricConfigVersionInfo](sfclient-v71-model-fabricconfigversioninfo.md) | Information about a Service Fabric config version.<br/> |
| [FabricError](sfclient-v71-model-fabricerror.md) | The REST API operations for Service Fabric return standard HTTP status codes. This type defines the additional information returned from the Service Fabric API operations that are not successful.<br/> |
| [FabricErrorCodes enum](sfclient-v71-model-fabricerrorcodes.md) | Defines the fabric error codes that be returned as part of the error object in response to Service Fabric API operations that are not successful. Following are the error code values that can be returned for a specific HTTP status code.<br/><br/>  - Possible values of the error code for HTTP status code 400 (Bad Request)<br/>    - "FABRIC_E_INVALID_PARTITION_KEY"<br/>    - "FABRIC_E_IMAGEBUILDER_VALIDATION_ERROR"<br/>    - "FABRIC_E_INVALID_ADDRESS"<br/>    - "FABRIC_E_APPLICATION_NOT_UPGRADING"<br/>    - "FABRIC_E_APPLICATION_UPGRADE_VALIDATION_ERROR"<br/>    - "FABRIC_E_FABRIC_NOT_UPGRADING"<br/>    - "FABRIC_E_FABRIC_UPGRADE_VALIDATION_ERROR"<br/>    - "FABRIC_E_INVALID_CONFIGURATION"<br/>    - "FABRIC_E_INVALID_NAME_URI"<br/>    - "FABRIC_E_PATH_TOO_LONG"<br/>    - "FABRIC_E_KEY_TOO_LARGE"<br/>    - "FABRIC_E_SERVICE_AFFINITY_CHAIN_NOT_SUPPORTED"<br/>    - "FABRIC_E_INVALID_ATOMIC_GROUP"<br/>    - "FABRIC_E_VALUE_EMPTY"<br/>    - "FABRIC_E_BACKUP_IS_ENABLED"<br/>    - "FABRIC_E_RESTORE_SOURCE_TARGET_PARTITION_MISMATCH"<br/>    - "FABRIC_E_INVALID_FOR_STATELESS_SERVICES"<br/>    - "FABRIC_E_INVALID_SERVICE_SCALING_POLICY"<br/>    - "E_INVALIDARG"<br/><br/>  - Possible values of the error code for HTTP status code 404 (Not Found)<br/>    - "FABRIC_E_NODE_NOT_FOUND"<br/>    - "FABRIC_E_APPLICATION_TYPE_NOT_FOUND"<br/>    - "FABRIC_E_APPLICATION_NOT_FOUND"<br/>    - "FABRIC_E_SERVICE_TYPE_NOT_FOUND"<br/>    - "FABRIC_E_SERVICE_DOES_NOT_EXIST"<br/>    - "FABRIC_E_SERVICE_TYPE_TEMPLATE_NOT_FOUND"<br/>    - "FABRIC_E_CONFIGURATION_SECTION_NOT_FOUND"<br/>    - "FABRIC_E_PARTITION_NOT_FOUND"<br/>    - "FABRIC_E_REPLICA_DOES_NOT_EXIST"<br/>    - "FABRIC_E_SERVICE_GROUP_DOES_NOT_EXIST"<br/>    - "FABRIC_E_CONFIGURATION_PARAMETER_NOT_FOUND"<br/>    - "FABRIC_E_DIRECTORY_NOT_FOUND"<br/>    - "FABRIC_E_FABRIC_VERSION_NOT_FOUND"<br/>    - "FABRIC_E_FILE_NOT_FOUND"<br/>    - "FABRIC_E_NAME_DOES_NOT_EXIST"<br/>    - "FABRIC_E_PROPERTY_DOES_NOT_EXIST"<br/>    - "FABRIC_E_ENUMERATION_COMPLETED"<br/>    - "FABRIC_E_SERVICE_MANIFEST_NOT_FOUND"<br/>    - "FABRIC_E_KEY_NOT_FOUND"<br/>    - "FABRIC_E_HEALTH_ENTITY_NOT_FOUND"<br/>    - "FABRIC_E_BACKUP_NOT_ENABLED"<br/>    - "FABRIC_E_BACKUP_POLICY_NOT_EXISTING"<br/>    - "FABRIC_E_FAULT_ANALYSIS_SERVICE_NOT_EXISTING"<br/>    - "FABRIC_E_IMAGEBUILDER_RESERVED_DIRECTORY_ERROR"<br/><br/>  - Possible values of the error code for HTTP status code 409 (Conflict)<br/>    - "FABRIC_E_APPLICATION_TYPE_ALREADY_EXISTS"<br/>    - "FABRIC_E_APPLICATION_ALREADY_EXISTS"<br/>    - "FABRIC_E_APPLICATION_ALREADY_IN_TARGET_VERSION"<br/>    - "FABRIC_E_APPLICATION_TYPE_PROVISION_IN_PROGRESS"<br/>    - "FABRIC_E_APPLICATION_UPGRADE_IN_PROGRESS"<br/>    - "FABRIC_E_SERVICE_ALREADY_EXISTS"<br/>    - "FABRIC_E_SERVICE_GROUP_ALREADY_EXISTS"<br/>    - "FABRIC_E_APPLICATION_TYPE_IN_USE"<br/>    - "FABRIC_E_FABRIC_ALREADY_IN_TARGET_VERSION"<br/>    - "FABRIC_E_FABRIC_VERSION_ALREADY_EXISTS"<br/>    - "FABRIC_E_FABRIC_VERSION_IN_USE"<br/>    - "FABRIC_E_FABRIC_UPGRADE_IN_PROGRESS"<br/>    - "FABRIC_E_NAME_ALREADY_EXISTS"<br/>    - "FABRIC_E_NAME_NOT_EMPTY"<br/>    - "FABRIC_E_PROPERTY_CHECK_FAILED"<br/>    - "FABRIC_E_SERVICE_METADATA_MISMATCH"<br/>    - "FABRIC_E_SERVICE_TYPE_MISMATCH"<br/>    - "FABRIC_E_HEALTH_STALE_REPORT"<br/>    - "FABRIC_E_SEQUENCE_NUMBER_CHECK_FAILED"<br/>    - "FABRIC_E_NODE_HAS_NOT_STOPPED_YET"<br/>    - "FABRIC_E_INSTANCE_ID_MISMATCH"<br/>    - "FABRIC_E_BACKUP_IN_PROGRESS"<br/>    - "FABRIC_E_RESTORE_IN_PROGRESS"<br/>    - "FABRIC_E_BACKUP_POLICY_ALREADY_EXISTING"<br/><br/>  - Possible values of the error code for HTTP status code 413 (Request Entity Too Large)<br/>    - "FABRIC_E_VALUE_TOO_LARGE"<br/><br/>  - Possible values of the error code for HTTP status code 500 (Internal Server Error)<br/>    - "FABRIC_E_NODE_IS_UP"<br/>    - "E_FAIL"<br/>    - "FABRIC_E_SINGLE_INSTANCE_APPLICATION_ALREADY_EXISTS"<br/>    - "FABRIC_E_SINGLE_INSTANCE_APPLICATION_NOT_FOUND"<br/>    - "FABRIC_E_VOLUME_ALREADY_EXISTS"<br/>    - "FABRIC_E_VOLUME_NOT_FOUND"<br/>    - "SerializationError"<br/><br/>  - Possible values of the error code for HTTP status code 503 (Service Unavailable)<br/>    - "FABRIC_E_NO_WRITE_QUORUM"<br/>    - "FABRIC_E_NOT_PRIMARY"<br/>    - "FABRIC_E_NOT_READY"<br/>    - "FABRIC_E_RECONFIGURATION_PENDING"<br/>    - "FABRIC_E_SERVICE_OFFLINE"<br/>    - "E_ABORT"<br/>    - "FABRIC_E_VALUE_TOO_LARGE"<br/><br/>  - Possible values of the error code for HTTP status code 504 (Gateway Timeout)<br/>    - "FABRIC_E_COMMUNICATION_ERROR"<br/>    - "FABRIC_E_OPERATION_NOT_COMPLETE"<br/>    - "FABRIC_E_TIMEOUT"<br/> |
| [FabricErrorError](sfclient-v71-model-fabricerrorerror.md) | Error object containing error code and error message.<br/> |
| [FabricEvent](sfclient-v71-model-fabricevent.md) | Represents the base for all Fabric Events.<br/> |
| [FabricEventKind enum](sfclient-v71-model-fabriceventkind.md) | The kind of FabricEvent.<br/> |
| [FabricReplicaStatus enum](sfclient-v71-model-fabricreplicastatus.md) | Specifies the status of the replica.<br/> |
| [FailedPropertyBatchInfo](sfclient-v71-model-failedpropertybatchinfo.md) | Derived from PropertyBatchInfo. Represents the property batch failing. Contains information about the specific batch failure.<br/> |
| [FailedPropertyBatchInfo](sfclient-v71-model-failedpropertybatchinfo.md) | Derived from PropertyBatchInfo. Represents the property batch failing. Contains information about the specific batch failure.<br/> |
| [FailedUpgradeDomainProgressObject](sfclient-v71-model-failedupgradedomainprogressobject.md) | The detailed upgrade progress for nodes in the current upgrade domain at the point of failure.<br/> |
| [FailureAction enum](sfclient-v71-model-failureaction.md) | The compensating action to perform when a Monitored upgrade encounters monitoring policy or health policy violations.<br/>Invalid indicates the failure action is invalid. Rollback specifies that the upgrade will start rolling back automatically.<br/>Manual indicates that the upgrade will switch to UnmonitoredManual upgrade mode.<br/> |
| [FailureReason enum](sfclient-v71-model-failurereason.md) | The cause of an upgrade failure that resulted in FailureAction being executed.<br/> |
| [FailureUpgradeDomainProgressInfo](sfclient-v71-model-failureupgradedomainprogressinfo.md) | Information about the upgrade domain progress at the time of upgrade failure.<br/> |
| [FileInfo](sfclient-v71-model-fileinfo.md) | Information about a image store file.<br/> |
| [FileShareBackupStorageDescription](sfclient-v71-model-filesharebackupstoragedescription.md) | Describes the parameters for file share storage used for storing or enumerating backups.<br/> |
| [FileShareBackupStorageDescription](sfclient-v71-model-filesharebackupstoragedescription.md) | Describes the parameters for file share storage used for storing or enumerating backups.<br/> |
| [FileVersion](sfclient-v71-model-fileversion.md) | Information about the version of image store file.<br/> |
| [FolderInfo](sfclient-v71-model-folderinfo.md) | Information about a image store folder. It includes how many files this folder contains and its image store relative path.<br/> |
| [FolderSizeInfo](sfclient-v71-model-foldersizeinfo.md) | Information of a image store folder size<br/> |
| [FrequencyBasedBackupScheduleDescription](sfclient-v71-model-frequencybasedbackupscheduledescription.md) | Describes the frequency based backup schedule.<br/> |
| [FrequencyBasedBackupScheduleDescription](sfclient-v71-model-frequencybasedbackupscheduledescription.md) | Describes the frequency based backup schedule.<br/> |
| [GatewayDestination](sfclient-v71-model-gatewaydestination.md) | Describes destination endpoint for routing traffic.<br/> |
| [GatewayProperties](sfclient-v71-model-gatewayproperties.md) | Describes properties of a gateway resource.<br/> |
| [GatewayResourceDescription](sfclient-v71-model-gatewayresourcedescription.md) | This type describes a gateway resource.<br/> |
| [GetBackupByStorageQueryDescription](sfclient-v71-model-getbackupbystoragequerydescription.md) | Describes additional filters to be applied, while listing backups, and backup storage details from where to fetch the backups.<br/> |
| [GetPropertyBatchOperation](sfclient-v71-model-getpropertybatchoperation.md) | Represents a PropertyBatchOperation that gets the specified property if it exists.<br/>Note that if one PropertyBatchOperation in a PropertyBatch fails,<br/>the entire batch fails and cannot be committed in a transactional manner.<br/> |
| [GetPropertyBatchOperation](sfclient-v71-model-getpropertybatchoperation.md) | Represents a PropertyBatchOperation that gets the specified property if it exists.<br/>Note that if one PropertyBatchOperation in a PropertyBatch fails,<br/>the entire batch fails and cannot be committed in a transactional manner.<br/> |
| [GuidPropertyValue](sfclient-v71-model-guidpropertyvalue.md) | Describes a Service Fabric property value of type Guid.<br/> |
| [GuidPropertyValue](sfclient-v71-model-guidpropertyvalue.md) | Describes a Service Fabric property value of type Guid.<br/> |
| [HeaderMatchType enum](sfclient-v71-model-headermatchtype.md) | Possible values include: 'exact'<br/> |
| [HealthEvaluation](sfclient-v71-model-healthevaluation.md) | Represents a health evaluation which describes the data and the algorithm used by health manager to evaluate the health of an entity.<br/> |
| [HealthEvaluationKind enum](sfclient-v71-model-healthevaluationkind.md) | The health manager in the cluster performs health evaluations in determining the aggregated health state of an entity. This enumeration provides information on the kind of evaluation that was performed. Following are the possible values.<br/> |
| [HealthEvaluationWrapper](sfclient-v71-model-healthevaluationwrapper.md) | Wrapper object for health evaluation.<br/> |
| [HealthEvent](sfclient-v71-model-healthevent.md) | Represents health information reported on a health entity, such as cluster, application or node, with additional metadata added by the Health Manager.<br/> |
| [HealthEvent](sfclient-v71-model-healthevent.md) | Represents health information reported on a health entity, such as cluster, application or node, with additional metadata added by the Health Manager.<br/> |
| [HealthInformation](sfclient-v71-model-healthinformation.md) | Represents common health report information. It is included in all health reports sent to health store and in all health events returned by health queries.<br/> |
| [HealthState enum](sfclient-v71-model-healthstate.md) | The health state of a Service Fabric entity such as Cluster, Node, Application, Service, Partition, Replica etc.<br/> |
| [HealthStateCount](sfclient-v71-model-healthstatecount.md) | Represents information about how many health entities are in Ok, Warning and Error health state.<br/> |
| [HealthStatistics](sfclient-v71-model-healthstatistics.md) | The health statistics of an entity, returned as part of the health query result when the query description is configured to include statistics.<br/>The statistics include health state counts for all children types of the current entity.<br/>For example, for cluster, the health statistics include health state counts for nodes, applications, services, partitions, replicas, deployed applications and deployed service packages.<br/>For partition, the health statistics include health counts for replicas.<br/> |
| [HostIsolationMode enum](sfclient-v71-model-hostisolationmode.md) | Specifies the isolation mode of main entry point of a code package when it's host type is ContainerHost. This is specified as part of container host policies in application manifest while importing service manifest.<br/> |
| [HostType enum](sfclient-v71-model-hosttype.md) | Specifies the type of host for main entry point of a code package as specified in service manifest.<br/> |
| [HttpConfig](sfclient-v71-model-httpconfig.md) | Describes the http configuration for external connectivity for this network.<br/> |
| [HttpHostConfig](sfclient-v71-model-httphostconfig.md) | Describes the hostname properties for http routing.<br/> |
| [HttpRouteConfig](sfclient-v71-model-httprouteconfig.md) | Describes the hostname properties for http routing.<br/> |
| [HttpRouteMatchHeader](sfclient-v71-model-httproutematchheader.md) | Describes header information for http route matching.<br/> |
| [HttpRouteMatchPath](sfclient-v71-model-httproutematchpath.md) | Path to match for routing.<br/> |
| [HttpRouteMatchRule](sfclient-v71-model-httproutematchrule.md) | Describes a rule for http route matching.<br/> |
| [IdentityDescription](sfclient-v71-model-identitydescription.md) | Information describing the identities associated with this application.<br/> |
| [IdentityItemDescription](sfclient-v71-model-identityitemdescription.md) | Describes a single user-assigned identity associated with the application.<br/> |
| [ImageRegistryCredential](sfclient-v71-model-imageregistrycredential.md) | Image registry credential.<br/> |
| [ImageRegistryPasswordType enum](sfclient-v71-model-imageregistrypasswordtype.md) | The type of the image registry password being given in password<br/> |
| [ImageStoreContent](sfclient-v71-model-imagestorecontent.md) | Information about the image store content.<br/> |
| [ImageStoreCopyDescription](sfclient-v71-model-imagestorecopydescription.md) | Information about how to copy image store content from one image store relative path to another image store relative path.<br/> |
| [ImageStoreInfo](sfclient-v71-model-imagestoreinfo.md) | Information about the ImageStore's resource usage<br/> |
| [ImpactLevel enum](sfclient-v71-model-impactlevel.md) | Possible values include: 'Invalid', 'None', 'Restart', 'RemoveData', 'RemoveNode'<br/> |
| [InlinedValueSecretResourceProperties](sfclient-v71-model-inlinedvaluesecretresourceproperties.md) | Describes the properties of a secret resource whose value is provided explicitly as plaintext. The secret resource may have multiple values, each being uniquely versioned. The secret value of each version is stored encrypted, and delivered as plaintext into the context of applications referencing it.<br/> |
| [InlinedValueSecretResourceProperties](sfclient-v71-model-inlinedvaluesecretresourceproperties.md) | Describes the properties of a secret resource whose value is provided explicitly as plaintext. The secret resource may have multiple values, each being uniquely versioned. The secret value of each version is stored encrypted, and delivered as plaintext into the context of applications referencing it.<br/> |
| [Int64PropertyValue](sfclient-v71-model-int64propertyvalue.md) | Describes a Service Fabric property value of type Int64.<br/> |
| [Int64PropertyValue](sfclient-v71-model-int64propertyvalue.md) | Describes a Service Fabric property value of type Int64.<br/> |
| [Int64RangePartitionInformation](sfclient-v71-model-int64rangepartitioninformation.md) | Describes the partition information for the integer range that is based on partition schemes.<br/> |
| [Int64RangePartitionInformation](sfclient-v71-model-int64rangepartitioninformation.md) | Describes the partition information for the integer range that is based on partition schemes.<br/> |
| [InvokeDataLossResult](sfclient-v71-model-invokedatalossresult.md) | Represents information about an operation in a terminal state (Completed or Faulted).<br/> |
| [InvokeQuorumLossResult](sfclient-v71-model-invokequorumlossresult.md) | Represents information about an operation in a terminal state (Completed or Faulted).<br/> |
| [KeyValueStoreReplicaStatus](sfclient-v71-model-keyvaluestorereplicastatus.md) | Key value store related information for the replica.<br/> |
| [KeyValueStoreReplicaStatus](sfclient-v71-model-keyvaluestorereplicastatus.md) | Key value store related information for the replica.<br/> |
| [LoadMetricInformation](sfclient-v71-model-loadmetricinformation.md) | Represents data structure that contains load information for a certain metric in a cluster.<br/> |
| [LoadMetricReport](sfclient-v71-model-loadmetricreport.md) | Represents the load metric report which contains the time metric was reported, its name and value.<br/> |
| [LoadMetricReportInfo](sfclient-v71-model-loadmetricreportinfo.md) | Information about load reported by replica.<br/> |
| [LocalNetworkResourceProperties](sfclient-v71-model-localnetworkresourceproperties.md) | Information about a Service Fabric container network local to a single Service Fabric cluster.<br/> |
| [LocalNetworkResourceProperties](sfclient-v71-model-localnetworkresourceproperties.md) | Information about a Service Fabric container network local to a single Service Fabric cluster.<br/> |
| [ManagedApplicationIdentity](sfclient-v71-model-managedapplicationidentity.md) | Describes a managed application identity.<br/> |
| [ManagedApplicationIdentityDescription](sfclient-v71-model-managedapplicationidentitydescription.md) | Managed application identity description.<br/> |
| [MonitoringPolicyDescription](sfclient-v71-model-monitoringpolicydescription.md) | Describes the parameters for monitoring an upgrade in Monitored mode.<br/> |
| [MoveCost enum](sfclient-v71-model-movecost.md) | Specifies the move cost for the service.<br/> |
| [NameDescription](sfclient-v71-model-namedescription.md) | Describes a Service Fabric name.<br/> |
| [NamedPartitionInformation](sfclient-v71-model-namedpartitioninformation.md) | Describes the partition information for the name as a string that is based on partition schemes.<br/> |
| [NamedPartitionInformation](sfclient-v71-model-namedpartitioninformation.md) | Describes the partition information for the name as a string that is based on partition schemes.<br/> |
| [NamedPartitionSchemeDescription](sfclient-v71-model-namedpartitionschemedescription.md) | Describes the named partition scheme of the service.<br/> |
| [NamedPartitionSchemeDescription](sfclient-v71-model-namedpartitionschemedescription.md) | Describes the named partition scheme of the service.<br/> |
| [NetworkKind enum](sfclient-v71-model-networkkind.md) | The type of a Service Fabric container network.<br/> |
| [NetworkRef](sfclient-v71-model-networkref.md) | Describes a network reference in a service.<br/> |
| [NetworkResourceDescription](sfclient-v71-model-networkresourcedescription.md) | This type describes a network resource.<br/> |
| [NetworkResourceProperties](sfclient-v71-model-networkresourceproperties.md) | Describes properties of a network resource.<br/> |
| [NetworkResourcePropertiesBase](sfclient-v71-model-networkresourcepropertiesbase.md) | This type describes the properties of a network resource, including its kind.<br/> |
| [NodeAbortedEvent](sfclient-v71-model-nodeabortedevent.md) | Node Aborted event.<br/> |
| [NodeAbortedEvent](sfclient-v71-model-nodeabortedevent.md) | Node Aborted event.<br/> |
| [NodeAddedToClusterEvent](sfclient-v71-model-nodeaddedtoclusterevent.md) | Node Added event.<br/> |
| [NodeAddedToClusterEvent](sfclient-v71-model-nodeaddedtoclusterevent.md) | Node Added event.<br/> |
| [NodeClosedEvent](sfclient-v71-model-nodeclosedevent.md) | Node Closed event.<br/> |
| [NodeClosedEvent](sfclient-v71-model-nodeclosedevent.md) | Node Closed event.<br/> |
| [NodeDeactivateCompletedEvent](sfclient-v71-model-nodedeactivatecompletedevent.md) | Node Deactivate Completed event.<br/> |
| [NodeDeactivateCompletedEvent](sfclient-v71-model-nodedeactivatecompletedevent.md) | Node Deactivate Completed event.<br/> |
| [NodeDeactivateStartedEvent](sfclient-v71-model-nodedeactivatestartedevent.md) | Node Deactivate Started event.<br/> |
| [NodeDeactivateStartedEvent](sfclient-v71-model-nodedeactivatestartedevent.md) | Node Deactivate Started event.<br/> |
| [NodeDeactivationInfo](sfclient-v71-model-nodedeactivationinfo.md) | Information about the node deactivation. This information is valid for a node that is undergoing deactivation or has already been deactivated.<br/> |
| [NodeDeactivationIntent enum](sfclient-v71-model-nodedeactivationintent.md) | The intent or the reason for deactivating the node. Following are the possible values for it.<br/> |
| [NodeDeactivationStatus enum](sfclient-v71-model-nodedeactivationstatus.md) | The status of node deactivation operation. Following are the possible values.<br/> |
| [NodeDeactivationTask](sfclient-v71-model-nodedeactivationtask.md) | The task representing the deactivation operation on the node.<br/> |
| [NodeDeactivationTaskId](sfclient-v71-model-nodedeactivationtaskid.md) | Identity of the task related to deactivation operation on the node.<br/> |
| [NodeDeactivationTaskType enum](sfclient-v71-model-nodedeactivationtasktype.md) | The type of the task that performed the node deactivation. Following are the possible values.<br/> |
| [NodeDownEvent](sfclient-v71-model-nodedownevent.md) | Node Down event.<br/> |
| [NodeDownEvent](sfclient-v71-model-nodedownevent.md) | Node Down event.<br/> |
| [NodeEvent](sfclient-v71-model-nodeevent.md) | Represents the base for all Node Events.<br/> |
| [NodeEvent](sfclient-v71-model-nodeevent.md) | Represents the base for all Node Events.<br/> |
| [NodeHealth](sfclient-v71-model-nodehealth.md) | Information about the health of a Service Fabric node.<br/> |
| [NodeHealth](sfclient-v71-model-nodehealth.md) | Information about the health of a Service Fabric node.<br/> |
| [NodeHealthEvaluation](sfclient-v71-model-nodehealthevaluation.md) | Represents health evaluation for a node, containing information about the data and the algorithm used by health store to evaluate health. The evaluation is returned only when the aggregated health state is either Error or Warning.<br/> |
| [NodeHealthEvaluation](sfclient-v71-model-nodehealthevaluation.md) | Represents health evaluation for a node, containing information about the data and the algorithm used by health store to evaluate health. The evaluation is returned only when the aggregated health state is either Error or Warning.<br/> |
| [NodeHealthReportExpiredEvent](sfclient-v71-model-nodehealthreportexpiredevent.md) | Node Health Report Expired event.<br/> |
| [NodeHealthReportExpiredEvent](sfclient-v71-model-nodehealthreportexpiredevent.md) | Node Health Report Expired event.<br/> |
| [NodeHealthState](sfclient-v71-model-nodehealthstate.md) | Represents the health state of a node, which contains the node identifier and its aggregated health state.<br/> |
| [NodeHealthState](sfclient-v71-model-nodehealthstate.md) | Represents the health state of a node, which contains the node identifier and its aggregated health state.<br/> |
| [NodeHealthStateChunk](sfclient-v71-model-nodehealthstatechunk.md) | Represents the health state chunk of a node, which contains the node name and its aggregated health state.<br/> |
| [NodeHealthStateChunk](sfclient-v71-model-nodehealthstatechunk.md) | Represents the health state chunk of a node, which contains the node name and its aggregated health state.<br/> |
| [NodeHealthStateChunkList](sfclient-v71-model-nodehealthstatechunklist.md) | The list of node health state chunks in the cluster that respect the input filters in the chunk query. Returned by get cluster health state chunks query.<br/> |
| [NodeHealthStateChunkList](sfclient-v71-model-nodehealthstatechunklist.md) | The list of node health state chunks in the cluster that respect the input filters in the chunk query. Returned by get cluster health state chunks query.<br/> |
| [NodeHealthStateFilter](sfclient-v71-model-nodehealthstatefilter.md) | Defines matching criteria to determine whether a node should be included in the returned cluster health chunk.<br/>One filter can match zero, one or multiple nodes, depending on its properties.<br/>Can be specified in the cluster health chunk query description.<br/> |
| [NodeId](sfclient-v71-model-nodeid.md) | An internal ID used by Service Fabric to uniquely identify a node. Node Id is deterministically generated from node name.<br/> |
| [NodeImpact](sfclient-v71-model-nodeimpact.md) | Describes the expected impact of a repair to a particular node.<br/><br/>This type supports the Service Fabric platform; it is not meant to be used directly from your code.<br/> |
| [NodeInfo](sfclient-v71-model-nodeinfo.md) | Information about a node in Service Fabric cluster.<br/> |
| [NodeLoadInfo](sfclient-v71-model-nodeloadinfo.md) | Information about load on a Service Fabric node. It holds a summary of all metrics and their load on a node.<br/> |
| [NodeLoadMetricInformation](sfclient-v71-model-nodeloadmetricinformation.md) | Represents data structure that contains load information for a certain metric on a node.<br/> |
| [NodeNewHealthReportEvent](sfclient-v71-model-nodenewhealthreportevent.md) | Node Health Report Created event.<br/> |
| [NodeNewHealthReportEvent](sfclient-v71-model-nodenewhealthreportevent.md) | Node Health Report Created event.<br/> |
| [NodeOpenFailedEvent](sfclient-v71-model-nodeopenfailedevent.md) | Node Open Failed event.<br/> |
| [NodeOpenFailedEvent](sfclient-v71-model-nodeopenfailedevent.md) | Node Open Failed event.<br/> |
| [NodeOpenSucceededEvent](sfclient-v71-model-nodeopensucceededevent.md) | Node Opened Succeeded event.<br/> |
| [NodeOpenSucceededEvent](sfclient-v71-model-nodeopensucceededevent.md) | Node Opened Succeeded event.<br/> |
| [NodeRemovedFromClusterEvent](sfclient-v71-model-noderemovedfromclusterevent.md) | Node Removed event.<br/> |
| [NodeRemovedFromClusterEvent](sfclient-v71-model-noderemovedfromclusterevent.md) | Node Removed event.<br/> |
| [NodeRepairImpactDescription](sfclient-v71-model-noderepairimpactdescription.md) | Describes the expected impact of a repair on a set of nodes.<br/><br/>This type supports the Service Fabric platform; it is not meant to be used directly from your code.<br/> |
| [NodeRepairImpactDescription](sfclient-v71-model-noderepairimpactdescription.md) | Describes the expected impact of a repair on a set of nodes.<br/><br/>This type supports the Service Fabric platform; it is not meant to be used directly from your code.<br/> |
| [NodeRepairTargetDescription](sfclient-v71-model-noderepairtargetdescription.md) | Describes the list of nodes targeted by a repair action.<br/><br/>This type supports the Service Fabric platform; it is not meant to be used directly from your code.<br/> |
| [NodeRepairTargetDescription](sfclient-v71-model-noderepairtargetdescription.md) | Describes the list of nodes targeted by a repair action.<br/><br/>This type supports the Service Fabric platform; it is not meant to be used directly from your code.<br/> |
| [NodeResult](sfclient-v71-model-noderesult.md) | Contains information about a node that was targeted by a user-induced operation.<br/> |
| [NodesHealthEvaluation](sfclient-v71-model-nodeshealthevaluation.md) | Represents health evaluation for nodes, containing health evaluations for each unhealthy node that impacted current aggregated health state. Can be returned when evaluating cluster health and the aggregated health state is either Error or Warning.<br/> |
| [NodesHealthEvaluation](sfclient-v71-model-nodeshealthevaluation.md) | Represents health evaluation for nodes, containing health evaluations for each unhealthy node that impacted current aggregated health state. Can be returned when evaluating cluster health and the aggregated health state is either Error or Warning.<br/> |
| [NodeStatus enum](sfclient-v71-model-nodestatus.md) | The status of the node.<br/> |
| [NodeStatusFilter enum](sfclient-v71-model-nodestatusfilter.md) | Possible values include: 'default', 'all', 'up', 'down', 'enabling', 'disabling', 'disabled', 'unknown', 'removed'<br/> |
| [NodeTransitionProgress](sfclient-v71-model-nodetransitionprogress.md) | Information about an NodeTransition operation.  This class contains an OperationState and a NodeTransitionResult.  The NodeTransitionResult is not valid until OperationState<br/>is Completed or Faulted.<br/> |
| [NodeTransitionResult](sfclient-v71-model-nodetransitionresult.md) | Represents information about an operation in a terminal state (Completed or Faulted).<br/> |
| [NodeTransitionType enum](sfclient-v71-model-nodetransitiontype.md) | Possible values include: 'Invalid', 'Start', 'Stop'<br/> |
| [NodeUpEvent](sfclient-v71-model-nodeupevent.md) | Node Up event.<br/> |
| [NodeUpEvent](sfclient-v71-model-nodeupevent.md) | Node Up event.<br/> |
| [NodeUpgradePhase enum](sfclient-v71-model-nodeupgradephase.md) | The state of the upgrading node.<br/> |
| [NodeUpgradeProgressInfo](sfclient-v71-model-nodeupgradeprogressinfo.md) | Information about the upgrading node and its status<br/> |
| [OperatingSystemType enum](sfclient-v71-model-operatingsystemtype.md) | The operation system required by the code in service.<br/> |
| [OperationState enum](sfclient-v71-model-operationstate.md) | The state of the operation.<br/> |
| [OperationStatus](sfclient-v71-model-operationstatus.md) | Contains the OperationId, OperationState, and OperationType for user-induced operations.<br/> |
| [OperationType enum](sfclient-v71-model-operationtype.md) | The type of the operation.<br/> |
| [PackageSharingPolicyInfo](sfclient-v71-model-packagesharingpolicyinfo.md) | Represents a policy for the package sharing.<br/> |
| [PackageSharingPolicyScope enum](sfclient-v71-model-packagesharingpolicyscope.md) | Represents the scope for PackageSharingPolicy. This is specified during DeployServicePackageToNode operation.<br/> |
| [PagedApplicationInfoList](sfclient-v71-model-pagedapplicationinfolist.md) | The list of applications in the cluster. The list is paged when all of the results cannot fit in a single message. The next set of results can be obtained by executing the same query with the continuation token provided in this list.<br/> |
| [PagedApplicationResourceDescriptionList](sfclient-v71-model-pagedapplicationresourcedescriptionlist.md) | The list of application resources. The list is paged when all of the results cannot fit in a single message. The next set of results can be obtained by executing the same query with the continuation token provided in this list.<br/> |
| [PagedApplicationTypeInfoList](sfclient-v71-model-pagedapplicationtypeinfolist.md) | The list of application types that are provisioned or being provisioned in the cluster. The list is paged when all of the results cannot fit in a single message. The next set of results can be obtained by executing the same query with the continuation token provided in this list.<br/> |
| [PagedBackupConfigurationInfoList](sfclient-v71-model-pagedbackupconfigurationinfolist.md) | The list of backup configuration information. The list is paged when all of the results cannot fit in a single message. The next set of results can be obtained by executing the same query with the continuation token provided in this list.<br/> |
| [PagedBackupEntityList](sfclient-v71-model-pagedbackupentitylist.md) | The list of backup entities that are being periodically backed. The list is paged when all of the results cannot fit in a single message. The next set of results can be obtained by executing the same query with the continuation token provided in this list.<br/> |
| [PagedBackupInfoList](sfclient-v71-model-pagedbackupinfolist.md) | The list of backups. The list is paged when all of the results cannot fit in a single message. The next set of results can be obtained by executing the same query with the continuation token provided in this list.<br/> |
| [PagedBackupPolicyDescriptionList](sfclient-v71-model-pagedbackuppolicydescriptionlist.md) | The list of backup policies configured in the cluster. The list is paged when all of the results cannot fit in a single message. The next set of results can be obtained by executing the same query with the continuation token provided in this list.<br/> |
| [PagedComposeDeploymentStatusInfoList](sfclient-v71-model-pagedcomposedeploymentstatusinfolist.md) | The list of compose deployments in the cluster. The list is paged when all of the results cannot fit in a single message. The next set of results can be obtained by executing the same query with the continuation token provided in this list.<br/> |
| [PagedDeployedApplicationInfoList](sfclient-v71-model-pageddeployedapplicationinfolist.md) | The list of deployed applications in activating, downloading, or active states on a node.<br/>The list is paged when all of the results cannot fit in a single message.<br/>The next set of results can be obtained by executing the same query with the continuation token provided in this list.<br/> |
| [PagedGatewayResourceDescriptionList](sfclient-v71-model-pagedgatewayresourcedescriptionlist.md) | The list of gateway resources. The list is paged when all of the results cannot fit in a single message. The next set of results can be obtained by executing the same query with the continuation token provided in this list.<br/> |
| [PagedNetworkResourceDescriptionList](sfclient-v71-model-pagednetworkresourcedescriptionlist.md) | The list of network resources. The list is paged when all of the results cannot fit in a single message. The next set of results can be obtained by executing the same query with the continuation token provided in this list.<br/> |
| [PagedNodeInfoList](sfclient-v71-model-pagednodeinfolist.md) | The list of nodes in the cluster. The list is paged when all of the results cannot fit in a single message. The next set of results can be obtained by executing the same query with the continuation token provided in this list.<br/> |
| [PagedPropertyInfoList](sfclient-v71-model-pagedpropertyinfolist.md) | The paged list of Service Fabric properties under a given name. The list is paged when all of the results cannot fit in a single message. The next set of results can be obtained by executing the same query with the continuation token provided in this list.<br/> |
| [PagedReplicaInfoList](sfclient-v71-model-pagedreplicainfolist.md) | The list of replicas in the cluster for a given partition. The list is paged when all of the results cannot fit in a single message. The next set of results can be obtained by executing the same query with the continuation token provided in this list.<br/> |
| [PagedSecretResourceDescriptionList](sfclient-v71-model-pagedsecretresourcedescriptionlist.md) | The list of secret resources. The list is paged when all of the results cannot fit in a single message. The next set of results can be obtained by executing the same query with the continuation token provided in this list.<br/> |
| [PagedSecretValueResourceDescriptionList](sfclient-v71-model-pagedsecretvalueresourcedescriptionlist.md) | The list of values of a secret resource, paged if the number of results exceeds the limits of a single message. The next set of results can be obtained by executing the same query with the continuation token provided in the previous page.<br/> |
| [PagedServiceInfoList](sfclient-v71-model-pagedserviceinfolist.md) | The list of services in the cluster for an application. The list is paged when all of the results cannot fit in a single message. The next set of results can be obtained by executing the same query with the continuation token provided in this list.<br/> |
| [PagedServicePartitionInfoList](sfclient-v71-model-pagedservicepartitioninfolist.md) | The list of partition in the cluster for a service. The list is paged when all of the results cannot fit in a single message. The next set of results can be obtained by executing the same query with the continuation token provided in this list.<br/> |
| [PagedServiceReplicaDescriptionList](sfclient-v71-model-pagedservicereplicadescriptionlist.md) | The list of service resource replicas in the cluster. The list is paged when all of the results cannot fit in a single message. The next set of results can be obtained by executing the same query with the continuation token provided in this list.<br/> |
| [PagedServiceResourceDescriptionList](sfclient-v71-model-pagedserviceresourcedescriptionlist.md) | The list of service resources. The list is paged when all of the results cannot fit in a single message. The next set of results can be obtained by executing the same query with the continuation token provided in this list.<br/> |
| [PagedSubNameInfoList](sfclient-v71-model-pagedsubnameinfolist.md) | A paged list of Service Fabric names. The list is paged when all of the results cannot fit in a single message. The next set of results can be obtained by executing the same query with the continuation token provided in this list.<br/> |
| [PagedVolumeResourceDescriptionList](sfclient-v71-model-pagedvolumeresourcedescriptionlist.md) | The list of volume resources. The list is paged when all of the results cannot fit in a single message. The next set of results can be obtained by executing the same query with the continuation token provided in this list.<br/> |
| [PartitionAccessStatus enum](sfclient-v71-model-partitionaccessstatus.md) | Specifies the access status of the partition.<br/> |
| [PartitionAnalysisEvent](sfclient-v71-model-partitionanalysisevent.md) | Represents the base for all Partition Analysis Events.<br/> |
| [PartitionAnalysisEvent](sfclient-v71-model-partitionanalysisevent.md) | Represents the base for all Partition Analysis Events.<br/> |
| [PartitionBackupConfigurationInfo](sfclient-v71-model-partitionbackupconfigurationinfo.md) | Backup configuration information, for a specific partition, specifying what backup policy is being applied and suspend description, if any.<br/> |
| [PartitionBackupConfigurationInfo](sfclient-v71-model-partitionbackupconfigurationinfo.md) | Backup configuration information, for a specific partition, specifying what backup policy is being applied and suspend description, if any.<br/> |
| [PartitionBackupEntity](sfclient-v71-model-partitionbackupentity.md) | Identifies the Service Fabric stateful partition which is being backed up.<br/> |
| [PartitionBackupEntity](sfclient-v71-model-partitionbackupentity.md) | Identifies the Service Fabric stateful partition which is being backed up.<br/> |
| [PartitionDataLossProgress](sfclient-v71-model-partitiondatalossprogress.md) | Information about a partition data loss user-induced operation.<br/> |
| [PartitionEvent](sfclient-v71-model-partitionevent.md) | Represents the base for all Partition Events.<br/> |
| [PartitionEvent](sfclient-v71-model-partitionevent.md) | Represents the base for all Partition Events.<br/> |
| [PartitionHealth](sfclient-v71-model-partitionhealth.md) | Information about the health of a Service Fabric partition.<br/> |
| [PartitionHealth](sfclient-v71-model-partitionhealth.md) | Information about the health of a Service Fabric partition.<br/> |
| [PartitionHealthEvaluation](sfclient-v71-model-partitionhealthevaluation.md) | Represents health evaluation for a partition, containing information about the data and the algorithm used by health store to evaluate health. The evaluation is returned only when the aggregated health state is either Error or Warning.<br/> |
| [PartitionHealthEvaluation](sfclient-v71-model-partitionhealthevaluation.md) | Represents health evaluation for a partition, containing information about the data and the algorithm used by health store to evaluate health. The evaluation is returned only when the aggregated health state is either Error or Warning.<br/> |
| [PartitionHealthReportExpiredEvent](sfclient-v71-model-partitionhealthreportexpiredevent.md) | Partition Health Report Expired event.<br/> |
| [PartitionHealthReportExpiredEvent](sfclient-v71-model-partitionhealthreportexpiredevent.md) | Partition Health Report Expired event.<br/> |
| [PartitionHealthState](sfclient-v71-model-partitionhealthstate.md) | Represents the health state of a partition, which contains the partition identifier and its aggregated health state.<br/> |
| [PartitionHealthState](sfclient-v71-model-partitionhealthstate.md) | Represents the health state of a partition, which contains the partition identifier and its aggregated health state.<br/> |
| [PartitionHealthStateChunk](sfclient-v71-model-partitionhealthstatechunk.md) | Represents the health state chunk of a partition, which contains the partition ID, its aggregated health state and any replicas that respect the filters in the cluster health chunk query description.<br/> |
| [PartitionHealthStateChunk](sfclient-v71-model-partitionhealthstatechunk.md) | Represents the health state chunk of a partition, which contains the partition ID, its aggregated health state and any replicas that respect the filters in the cluster health chunk query description.<br/> |
| [PartitionHealthStateChunkList](sfclient-v71-model-partitionhealthstatechunklist.md) | The list of partition health state chunks that respect the input filters in the chunk query description.<br/>Returned by get cluster health state chunks query as part of the parent application hierarchy.<br/> |
| [PartitionHealthStateFilter](sfclient-v71-model-partitionhealthstatefilter.md) | Defines matching criteria to determine whether a partition should be included as a child of a service in the cluster health chunk.<br/>The partitions are only returned if the parent entities match a filter specified in the cluster health chunk query description. The parent service and application must be included in the cluster health chunk.<br/>One filter can match zero, one or multiple partitions, depending on its properties.<br/> |
| [PartitionInformation](sfclient-v71-model-partitioninformation.md) | Information about the partition identity, partitioning scheme and keys supported by it.<br/> |
| [PartitionInstanceCountScaleMechanism](sfclient-v71-model-partitioninstancecountscalemechanism.md) | Represents a scaling mechanism for adding or removing instances of stateless service partition.<br/> |
| [PartitionInstanceCountScaleMechanism](sfclient-v71-model-partitioninstancecountscalemechanism.md) | Represents a scaling mechanism for adding or removing instances of stateless service partition.<br/> |
| [PartitionLoadInformation](sfclient-v71-model-partitionloadinformation.md) | Represents load information for a partition, which contains the primary and secondary reported load metrics.<br/>In case there is no load reported, PartitionLoadInformation will contain the default load for the service of the partition.<br/>For default loads, LoadMetricReport's LastReportedUtc is set to 0.<br/> |
| [PartitionNewHealthReportEvent](sfclient-v71-model-partitionnewhealthreportevent.md) | Partition Health Report Created event.<br/> |
| [PartitionNewHealthReportEvent](sfclient-v71-model-partitionnewhealthreportevent.md) | Partition Health Report Created event.<br/> |
| [PartitionPrimaryMoveAnalysisEvent](sfclient-v71-model-partitionprimarymoveanalysisevent.md) | Partition Primary Move Analysis event.<br/> |
| [PartitionPrimaryMoveAnalysisEvent](sfclient-v71-model-partitionprimarymoveanalysisevent.md) | Partition Primary Move Analysis event.<br/> |
| [PartitionQuorumLossProgress](sfclient-v71-model-partitionquorumlossprogress.md) | Information about a partition quorum loss user-induced operation.<br/> |
| [PartitionReconfiguredEvent](sfclient-v71-model-partitionreconfiguredevent.md) | Partition Reconfiguration event.<br/> |
| [PartitionReconfiguredEvent](sfclient-v71-model-partitionreconfiguredevent.md) | Partition Reconfiguration event.<br/> |
| [PartitionRestartProgress](sfclient-v71-model-partitionrestartprogress.md) | Information about a partition restart user-induced operation.<br/> |
| [PartitionSafetyCheck](sfclient-v71-model-partitionsafetycheck.md) | Represents a safety check for the service partition being performed by service fabric before continuing with operations.<br/> |
| [PartitionScheme enum](sfclient-v71-model-partitionscheme.md) | Enumerates the ways that a service can be partitioned.<br/> |
| [PartitionSchemeDescription](sfclient-v71-model-partitionschemedescription.md) | Describes how the service is partitioned.<br/> |
| [PartitionsHealthEvaluation](sfclient-v71-model-partitionshealthevaluation.md) | Represents health evaluation for the partitions of a service, containing health evaluations for each unhealthy partition that impacts current aggregated health state. Can be returned when evaluating service health and the aggregated health state is either Error or Warning.<br/> |
| [PartitionsHealthEvaluation](sfclient-v71-model-partitionshealthevaluation.md) | Represents health evaluation for the partitions of a service, containing health evaluations for each unhealthy partition that impacts current aggregated health state. Can be returned when evaluating service health and the aggregated health state is either Error or Warning.<br/> |
| [PrimaryReplicatorStatus](sfclient-v71-model-primaryreplicatorstatus.md) | Provides statistics about the Service Fabric Replicator, when it is functioning in a Primary role.<br/> |
| [PrimaryReplicatorStatus](sfclient-v71-model-primaryreplicatorstatus.md) | Provides statistics about the Service Fabric Replicator, when it is functioning in a Primary role.<br/> |
| [Probe](sfclient-v71-model-probe.md) | Probes have a number of fields that you can use to control their behavior.<br/> |
| [ProbeExec](sfclient-v71-model-probeexec.md) | Exec command to run inside the container.<br/> |
| [ProbeHttpGet](sfclient-v71-model-probehttpget.md) | Http probe for the container.<br/> |
| [ProbeHttpGetHeaders](sfclient-v71-model-probehttpgetheaders.md) | Http headers.<br/> |
| [ProbeTcpSocket](sfclient-v71-model-probetcpsocket.md) | Tcp port to probe inside the container.<br/> |
| [PropertyBatchDescriptionList](sfclient-v71-model-propertybatchdescriptionlist.md) | Describes a list of property batch operations to be executed. Either all or none of the operations will be committed.<br/> |
| [PropertyBatchInfo](sfclient-v71-model-propertybatchinfo.md) | Information about the results of a property batch.<br/> |
| [PropertyBatchInfoKind enum](sfclient-v71-model-propertybatchinfokind.md) | The kind of property batch info, determined by the results of a property batch. The following are the possible values.<br/> |
| [PropertyBatchOperation](sfclient-v71-model-propertybatchoperation.md) | Represents the base type for property operations that can be put into a batch and submitted.<br/> |
| [PropertyBatchOperationKind enum](sfclient-v71-model-propertybatchoperationkind.md) | The kind of property batch operation, determined by the operation to be performed. The following are the possible values.<br/> |
| [PropertyDescription](sfclient-v71-model-propertydescription.md) | Description of a Service Fabric property.<br/> |
| [PropertyInfo](sfclient-v71-model-propertyinfo.md) | Information about a Service Fabric property.<br/> |
| [PropertyMetadata](sfclient-v71-model-propertymetadata.md) | The metadata associated with a property, including the property's name.<br/> |
| [PropertyValue](sfclient-v71-model-propertyvalue.md) | Describes a Service Fabric property value.<br/> |
| [PropertyValueKind enum](sfclient-v71-model-propertyvaluekind.md) | The kind of property, determined by the type of data. Following are the possible values.<br/> |
| [ProvisionApplicationTypeDescription](sfclient-v71-model-provisionapplicationtypedescription.md) | Describes the operation to register or provision an application type using an application package uploaded to the Service Fabric image store.<br/> |
| [ProvisionApplicationTypeDescription](sfclient-v71-model-provisionapplicationtypedescription.md) | Describes the operation to register or provision an application type using an application package uploaded to the Service Fabric image store.<br/> |
| [ProvisionApplicationTypeDescriptionBase](sfclient-v71-model-provisionapplicationtypedescriptionbase.md) | Represents the type of registration or provision requested, and if the operation needs to be asynchronous or not. Supported types of provision operations are from either image store or external store.<br/> |
| [ProvisionApplicationTypeKind enum](sfclient-v71-model-provisionapplicationtypekind.md) | The kind of application type registration or provision requested. The application package can be registered or provisioned either from the image store or from an external store. Following are the kinds of the application type provision.<br/> |
| [ProvisionFabricDescription](sfclient-v71-model-provisionfabricdescription.md) | Describes the parameters for provisioning a cluster.<br/> |
| [PutPropertyBatchOperation](sfclient-v71-model-putpropertybatchoperation.md) | Puts the specified property under the specified name.<br/>Note that if one PropertyBatchOperation in a PropertyBatch fails,<br/>the entire batch fails and cannot be committed in a transactional manner.<br/> |
| [PutPropertyBatchOperation](sfclient-v71-model-putpropertybatchoperation.md) | Puts the specified property under the specified name.<br/>Note that if one PropertyBatchOperation in a PropertyBatch fails,<br/>the entire batch fails and cannot be committed in a transactional manner.<br/> |
| [QuorumLossMode enum](sfclient-v71-model-quorumlossmode.md) | Possible values include: 'Invalid', 'QuorumReplicas', 'AllReplicas'<br/> |
| [ReconfigurationInformation](sfclient-v71-model-reconfigurationinformation.md) | Information about current reconfiguration like phase, type, previous configuration role of replica and reconfiguration start date time.<br/> |
| [ReconfigurationPhase enum](sfclient-v71-model-reconfigurationphase.md) | The reconfiguration phase of a replica of a stateful service.<br/> |
| [ReconfigurationType enum](sfclient-v71-model-reconfigurationtype.md) | The type of reconfiguration for replica of a stateful service.<br/> |
| [RegistryCredential](sfclient-v71-model-registrycredential.md) | Credential information to connect to container registry.<br/> |
| [ReliableCollectionsRef](sfclient-v71-model-reliablecollectionsref.md) | Specifying this parameter adds support for reliable collections<br/> |
| [RemoteReplicatorAcknowledgementDetail](sfclient-v71-model-remotereplicatoracknowledgementdetail.md) | Provides various statistics of the acknowledgements that are being received from the remote replicator.<br/> |
| [RemoteReplicatorAcknowledgementStatus](sfclient-v71-model-remotereplicatoracknowledgementstatus.md) | Provides details about the remote replicators from the primary replicator's point of view.<br/> |
| [RemoteReplicatorStatus](sfclient-v71-model-remotereplicatorstatus.md) | Represents the state of the secondary replicator from the primary replicator’s point of view.<br/> |
| [RepairImpactDescriptionBase](sfclient-v71-model-repairimpactdescriptionbase.md) | Describes the expected impact of executing a repair task.<br/><br/>This type supports the Service Fabric platform; it is not meant to be used directly from your code.<br/> |
| [RepairImpactKind enum](sfclient-v71-model-repairimpactkind.md) | Specifies the kind of the impact. This type supports the Service Fabric platform; it is not meant to be used directly from your code.'<br/> |
| [RepairTargetDescriptionBase](sfclient-v71-model-repairtargetdescriptionbase.md) | Describes the entities targeted by a repair action.<br/><br/>This type supports the Service Fabric platform; it is not meant to be used directly from your code.<br/> |
| [RepairTargetKind enum](sfclient-v71-model-repairtargetkind.md) | Specifies the kind of the repair target. This type supports the Service Fabric platform; it is not meant to be used directly from your code.'<br/> |
| [RepairTask](sfclient-v71-model-repairtask.md) | Represents a repair task, which includes information about what kind of repair was requested, what its progress is, and what its final result was.<br/><br/>This type supports the Service Fabric platform; it is not meant to be used directly from your code.<br/> |
| [RepairTaskApproveDescription](sfclient-v71-model-repairtaskapprovedescription.md) | Describes a request for forced approval of a repair task.<br/><br/>This type supports the Service Fabric platform; it is not meant to be used directly from your code.<br/> |
| [RepairTaskCancelDescription](sfclient-v71-model-repairtaskcanceldescription.md) | Describes a request to cancel a repair task.<br/><br/>This type supports the Service Fabric platform; it is not meant to be used directly from your code.<br/> |
| [RepairTaskDeleteDescription](sfclient-v71-model-repairtaskdeletedescription.md) | Describes a request to delete a completed repair task.<br/><br/>This type supports the Service Fabric platform; it is not meant to be used directly from your code.<br/> |
| [RepairTaskHealthCheckState enum](sfclient-v71-model-repairtaskhealthcheckstate.md) | Specifies the workflow state of a repair task's health check. This type supports the Service Fabric platform; it is not meant to be used directly from your code.<br/> |
| [RepairTaskHistory](sfclient-v71-model-repairtaskhistory.md) | A record of the times when the repair task entered each state.<br/><br/>This type supports the Service Fabric platform; it is not meant to be used directly from your code.<br/> |
| [RepairTaskUpdateHealthPolicyDescription](sfclient-v71-model-repairtaskupdatehealthpolicydescription.md) | Describes a request to update the health policy of a repair task.<br/><br/>This type supports the Service Fabric platform; it is not meant to be used directly from your code.<br/> |
| [RepairTaskUpdateInfo](sfclient-v71-model-repairtaskupdateinfo.md) | Describes the result of an operation that created or updated a repair task.<br/><br/>This type supports the Service Fabric platform; it is not meant to be used directly from your code.<br/> |
| [ReplicaEvent](sfclient-v71-model-replicaevent.md) | Represents the base for all Replica Events.<br/> |
| [ReplicaEvent](sfclient-v71-model-replicaevent.md) | Represents the base for all Replica Events.<br/> |
| [ReplicaHealth](sfclient-v71-model-replicahealth.md) | Represents a base class for stateful service replica or stateless service instance health.<br/>Contains the replica aggregated health state, the health events and the unhealthy evaluations.<br/> |
| [ReplicaHealthEvaluation](sfclient-v71-model-replicahealthevaluation.md) | Represents health evaluation for a replica, containing information about the data and the algorithm used by health store to evaluate health. The evaluation is returned only when the aggregated health state is either Error or Warning.<br/> |
| [ReplicaHealthEvaluation](sfclient-v71-model-replicahealthevaluation.md) | Represents health evaluation for a replica, containing information about the data and the algorithm used by health store to evaluate health. The evaluation is returned only when the aggregated health state is either Error or Warning.<br/> |
| [ReplicaHealthReportServiceKind enum](sfclient-v71-model-replicahealthreportservicekind.md) | Possible values include: 'Stateless', 'Stateful'<br/> |
| [ReplicaHealthState](sfclient-v71-model-replicahealthstate.md) | Represents a base class for stateful service replica or stateless service instance health state.<br/> |
| [ReplicaHealthStateChunk](sfclient-v71-model-replicahealthstatechunk.md) | Represents the health state chunk of a stateful service replica or a stateless service instance.<br/>The replica health state contains the replica ID and its aggregated health state.<br/> |
| [ReplicaHealthStateChunk](sfclient-v71-model-replicahealthstatechunk.md) | Represents the health state chunk of a stateful service replica or a stateless service instance.<br/>The replica health state contains the replica ID and its aggregated health state.<br/> |
| [ReplicaHealthStateChunkList](sfclient-v71-model-replicahealthstatechunklist.md) | The list of replica health state chunks that respect the input filters in the chunk query. Returned by get cluster health state chunks query.<br/> |
| [ReplicaHealthStateFilter](sfclient-v71-model-replicahealthstatefilter.md) | Defines matching criteria to determine whether a replica should be included as a child of a partition in the cluster health chunk.<br/>The replicas are only returned if the parent entities match a filter specified in the cluster health chunk query description. The parent partition, service and application must be included in the cluster health chunk.<br/>One filter can match zero, one or multiple replicas, depending on its properties.<br/> |
| [ReplicaInfo](sfclient-v71-model-replicainfo.md) | Information about the identity, status, health, node name, uptime, and other details about the replica.<br/> |
| [ReplicaKind enum](sfclient-v71-model-replicakind.md) | The role of a replica of a stateful service.<br/> |
| [ReplicaRole enum](sfclient-v71-model-replicarole.md) | The role of a replica of a stateful service.<br/> |
| [ReplicasHealthEvaluation](sfclient-v71-model-replicashealthevaluation.md) | Represents health evaluation for replicas, containing health evaluations for each unhealthy replica that impacted current aggregated health state. Can be returned when evaluating partition health and the aggregated health state is either Error or Warning.<br/> |
| [ReplicasHealthEvaluation](sfclient-v71-model-replicashealthevaluation.md) | Represents health evaluation for replicas, containing health evaluations for each unhealthy replica that impacted current aggregated health state. Can be returned when evaluating partition health and the aggregated health state is either Error or Warning.<br/> |
| [ReplicaStatus enum](sfclient-v71-model-replicastatus.md) | The status of a replica of a service.<br/> |
| [ReplicaStatusBase](sfclient-v71-model-replicastatusbase.md) | Information about the replica.<br/> |
| [ReplicatorOperationName enum](sfclient-v71-model-replicatoroperationname.md) | Specifies the operation currently being executed by the Replicator.<br/> |
| [ReplicatorQueueStatus](sfclient-v71-model-replicatorqueuestatus.md) | Provides various statistics of the queue used in the service fabric replicator.<br/>Contains information about the service fabric replicator like the replication/copy queue utilization, last acknowledgement received timestamp, etc.<br/>Depending on the role of the replicator, the properties in this type imply different meanings.<br/> |
| [ReplicatorStatus](sfclient-v71-model-replicatorstatus.md) | Represents a base class for primary or secondary replicator status.<br/>Contains information about the service fabric replicator like the replication/copy queue utilization, last acknowledgement received timestamp, etc.<br/> |
| [ResolvedServiceEndpoint](sfclient-v71-model-resolvedserviceendpoint.md) | Endpoint of a resolved service partition.<br/> |
| [ResolvedServicePartition](sfclient-v71-model-resolvedservicepartition.md) | Information about a service partition and its associated endpoints.<br/> |
| [ResourceLimits](sfclient-v71-model-resourcelimits.md) | This type describes the resource limits for a given container. It describes the most amount of resources a container is allowed to use before being restarted.<br/> |
| [ResourceRequests](sfclient-v71-model-resourcerequests.md) | This type describes the requested resources for a given container. It describes the least amount of resources required for the container. A container can consume more than requested resources up to the specified limits before being restarted. Currently, the requested resources are treated as limits.<br/> |
| [ResourceRequirements](sfclient-v71-model-resourcerequirements.md) | This type describes the resource requirements for a container or a service.<br/> |
| [ResourceStatus enum](sfclient-v71-model-resourcestatus.md) | Status of the resource.<br/> |
| [RestartDeployedCodePackageDescription](sfclient-v71-model-restartdeployedcodepackagedescription.md) | Defines description for restarting a deployed code package on Service Fabric node.<br/> |
| [RestartNodeDescription](sfclient-v71-model-restartnodedescription.md) | Describes the parameters to restart a Service Fabric node.<br/> |
| [RestartPartitionMode enum](sfclient-v71-model-restartpartitionmode.md) | Possible values include: 'Invalid', 'AllReplicasOrInstances', 'OnlyActiveSecondaries'<br/> |
| [RestartPartitionResult](sfclient-v71-model-restartpartitionresult.md) | Represents information about an operation in a terminal state (Completed or Faulted).<br/> |
| [RestartPolicy enum](sfclient-v71-model-restartpolicy.md) | Enumerates the restart policy for RunToCompletionExecutionPolicy<br/> |
| [RestorePartitionDescription](sfclient-v71-model-restorepartitiondescription.md) | Specifies the parameters needed to trigger a restore of a specific partition.<br/> |
| [RestoreProgressInfo](sfclient-v71-model-restoreprogressinfo.md) | Describes the progress of a restore operation on a partition.<br/> |
| [RestoreState enum](sfclient-v71-model-restorestate.md) | Represents the current state of the partition restore operation.<br/> |
| [ResultStatus enum](sfclient-v71-model-resultstatus.md) | Possible values include: 'Invalid', 'Succeeded', 'Cancelled', 'Interrupted', 'Failed', 'Pending'<br/> |
| [ResumeApplicationUpgradeDescription](sfclient-v71-model-resumeapplicationupgradedescription.md) | Describes the parameters for resuming an unmonitored manual Service Fabric application upgrade<br/> |
| [ResumeClusterUpgradeDescription](sfclient-v71-model-resumeclusterupgradedescription.md) | Describes the parameters for resuming a cluster upgrade.<br/> |
| [RetentionPolicyDescription](sfclient-v71-model-retentionpolicydescription.md) | Describes the retention policy configured.<br/> |
| [RetentionPolicyType enum](sfclient-v71-model-retentionpolicytype.md) | The type of retention policy. Currently only "Basic" retention policy is supported.<br/> |
| [RollingUpgradeMode enum](sfclient-v71-model-rollingupgrademode.md) | The mode used to monitor health during a rolling upgrade. The values are UnmonitoredAuto, UnmonitoredManual, and Monitored.<br/> |
| [RollingUpgradeUpdateDescription](sfclient-v71-model-rollingupgradeupdatedescription.md) | Describes the parameters for updating a rolling upgrade of application or cluster.<br/> |
| [RunToCompletionExecutionPolicy](sfclient-v71-model-runtocompletionexecutionpolicy.md) | The run to completion execution policy, the service will perform its desired operation and complete successfully. If the service encounters failure, it will restarted based on restart policy specified. If the service completes its operation successfully, it will not be restarted again.<br/> |
| [RunToCompletionExecutionPolicy](sfclient-v71-model-runtocompletionexecutionpolicy.md) | The run to completion execution policy, the service will perform its desired operation and complete successfully. If the service encounters failure, it will restarted based on restart policy specified. If the service completes its operation successfully, it will not be restarted again.<br/> |
| [SafetyCheck](sfclient-v71-model-safetycheck.md) | Represents a safety check performed by service fabric before continuing with the operations. These checks ensure the availability of the service and the reliability of the state.<br/> |
| [SafetyCheckKind enum](sfclient-v71-model-safetycheckkind.md) | The kind of safety check performed by service fabric before continuing with the operations. These checks ensure the availability of the service and the reliability of the state. Following are the kinds of safety checks.<br/> |
| [SafetyCheckWrapper](sfclient-v71-model-safetycheckwrapper.md) | A wrapper for the safety check object. Safety checks are performed by service fabric before continuing with the operations. These checks ensure the availability of the service and the reliability of the state.<br/> |
| [ScalingMechanismDescription](sfclient-v71-model-scalingmechanismdescription.md) | Describes the mechanism for performing a scaling operation.<br/> |
| [ScalingMechanismKind enum](sfclient-v71-model-scalingmechanismkind.md) | Enumerates the ways that a service can be scaled.<br/> |
| [ScalingPolicyDescription](sfclient-v71-model-scalingpolicydescription.md) | Describes how the scaling should be performed<br/> |
| [ScalingTriggerDescription](sfclient-v71-model-scalingtriggerdescription.md) | Describes the trigger for performing a scaling operation.<br/> |
| [ScalingTriggerKind enum](sfclient-v71-model-scalingtriggerkind.md) | Enumerates the ways that a service can be scaled.<br/> |
| [Scheme enum](sfclient-v71-model-scheme.md) | Possible values include: 'http', 'https'<br/> |
| [SecondaryActiveReplicatorStatus](sfclient-v71-model-secondaryactivereplicatorstatus.md) | Status of the secondary replicator when it is in active mode and is part of the replica set.<br/> |
| [SecondaryActiveReplicatorStatus](sfclient-v71-model-secondaryactivereplicatorstatus.md) | Status of the secondary replicator when it is in active mode and is part of the replica set.<br/> |
| [SecondaryIdleReplicatorStatus](sfclient-v71-model-secondaryidlereplicatorstatus.md) | Status of the secondary replicator when it is in idle mode and is being built by the primary.<br/> |
| [SecondaryIdleReplicatorStatus](sfclient-v71-model-secondaryidlereplicatorstatus.md) | Status of the secondary replicator when it is in idle mode and is being built by the primary.<br/> |
| [SecondaryReplicatorStatus](sfclient-v71-model-secondaryreplicatorstatus.md) | Provides statistics about the Service Fabric Replicator, when it is functioning in a ActiveSecondary role.<br/> |
| [SecretKind enum](sfclient-v71-model-secretkind.md) | Describes the kind of secret.<br/> |
| [SecretResourceDescription](sfclient-v71-model-secretresourcedescription.md) | This type describes a secret resource.<br/> |
| [SecretResourceProperties](sfclient-v71-model-secretresourceproperties.md) | Describes the properties of a secret resource.<br/> |
| [SecretResourcePropertiesBase](sfclient-v71-model-secretresourcepropertiesbase.md) | This type describes the properties of a secret resource, including its kind.<br/> |
| [SecretValue](sfclient-v71-model-secretvalue.md) | This type represents the unencrypted value of the secret.<br/> |
| [SecretValueProperties](sfclient-v71-model-secretvalueproperties.md) | This type describes properties of secret value resource.<br/> |
| [SecretValueResourceDescription](sfclient-v71-model-secretvalueresourcedescription.md) | This type describes a value of a secret resource. The name of this resource is the version identifier corresponding to this secret value.<br/> |
| [SecretValueResourceProperties](sfclient-v71-model-secretvalueresourceproperties.md) | This type describes properties of a secret value resource.<br/> |
| [SecretValueResourceProperties](sfclient-v71-model-secretvalueresourceproperties.md) | This type describes properties of a secret value resource.<br/> |
| [SeedNodeSafetyCheck](sfclient-v71-model-seednodesafetycheck.md) | Represents a safety check for the seed nodes being performed by service fabric before continuing with node level operations.<br/> |
| [SeedNodeSafetyCheck](sfclient-v71-model-seednodesafetycheck.md) | Represents a safety check for the seed nodes being performed by service fabric before continuing with node level operations.<br/> |
| [SelectedPartition](sfclient-v71-model-selectedpartition.md) | This class returns information about the partition that the user-induced operation acted upon.<br/> |
| [ServiceBackupConfigurationInfo](sfclient-v71-model-servicebackupconfigurationinfo.md) | Backup configuration information for a specific Service Fabric service specifying what backup policy is being applied and suspend description, if any.<br/> |
| [ServiceBackupConfigurationInfo](sfclient-v71-model-servicebackupconfigurationinfo.md) | Backup configuration information for a specific Service Fabric service specifying what backup policy is being applied and suspend description, if any.<br/> |
| [ServiceBackupEntity](sfclient-v71-model-servicebackupentity.md) | Identifies the Service Fabric stateful service which is being backed up.<br/> |
| [ServiceBackupEntity](sfclient-v71-model-servicebackupentity.md) | Identifies the Service Fabric stateful service which is being backed up.<br/> |
| [ServiceCorrelationDescription](sfclient-v71-model-servicecorrelationdescription.md) | Creates a particular correlation between services.<br/> |
| [ServiceCorrelationScheme enum](sfclient-v71-model-servicecorrelationscheme.md) | The service correlation scheme.<br/> |
| [ServiceCreatedEvent](sfclient-v71-model-servicecreatedevent.md) | Service Created event.<br/> |
| [ServiceCreatedEvent](sfclient-v71-model-servicecreatedevent.md) | Service Created event.<br/> |
| [ServiceDeletedEvent](sfclient-v71-model-servicedeletedevent.md) | Service Deleted event.<br/> |
| [ServiceDeletedEvent](sfclient-v71-model-servicedeletedevent.md) | Service Deleted event.<br/> |
| [ServiceDescription](sfclient-v71-model-servicedescription.md) | A ServiceDescription contains all of the information necessary to create a service.<br/> |
| [ServiceEndpointRole enum](sfclient-v71-model-serviceendpointrole.md) | The role of the replica where the endpoint is reported.<br/> |
| [ServiceEvent](sfclient-v71-model-serviceevent.md) | Represents the base for all Service Events.<br/> |
| [ServiceEvent](sfclient-v71-model-serviceevent.md) | Represents the base for all Service Events.<br/> |
| [ServiceFromTemplateDescription](sfclient-v71-model-servicefromtemplatedescription.md) | Defines description for creating a Service Fabric service from a template defined in the application manifest.<br/> |
| [ServiceHealth](sfclient-v71-model-servicehealth.md) | Information about the health of a Service Fabric service.<br/> |
| [ServiceHealth](sfclient-v71-model-servicehealth.md) | Information about the health of a Service Fabric service.<br/> |
| [ServiceHealthEvaluation](sfclient-v71-model-servicehealthevaluation.md) | Represents health evaluation for a service, containing information about the data and the algorithm used by health store to evaluate health. The evaluation is returned only when the aggregated health state is either Error or Warning.<br/> |
| [ServiceHealthEvaluation](sfclient-v71-model-servicehealthevaluation.md) | Represents health evaluation for a service, containing information about the data and the algorithm used by health store to evaluate health. The evaluation is returned only when the aggregated health state is either Error or Warning.<br/> |
| [ServiceHealthReportExpiredEvent](sfclient-v71-model-servicehealthreportexpiredevent.md) | Service Health Report Expired event.<br/> |
| [ServiceHealthReportExpiredEvent](sfclient-v71-model-servicehealthreportexpiredevent.md) | Service Health Report Expired event.<br/> |
| [ServiceHealthState](sfclient-v71-model-servicehealthstate.md) | Represents the health state of a service, which contains the service identifier and its aggregated health state.<br/> |
| [ServiceHealthState](sfclient-v71-model-servicehealthstate.md) | Represents the health state of a service, which contains the service identifier and its aggregated health state.<br/> |
| [ServiceHealthStateChunk](sfclient-v71-model-servicehealthstatechunk.md) | Represents the health state chunk of a service, which contains the service name, its aggregated health state and any partitions that respect the filters in the cluster health chunk query description.<br/> |
| [ServiceHealthStateChunk](sfclient-v71-model-servicehealthstatechunk.md) | Represents the health state chunk of a service, which contains the service name, its aggregated health state and any partitions that respect the filters in the cluster health chunk query description.<br/> |
| [ServiceHealthStateChunkList](sfclient-v71-model-servicehealthstatechunklist.md) | The list of service health state chunks that respect the input filters in the chunk query. Returned by get cluster health state chunks query.<br/> |
| [ServiceHealthStateFilter](sfclient-v71-model-servicehealthstatefilter.md) | Defines matching criteria to determine whether a service should be included as a child of an application in the cluster health chunk.<br/>The services are only returned if the parent application matches a filter specified in the cluster health chunk query description.<br/>One filter can match zero, one or multiple services, depending on its properties.<br/> |
| [ServiceIdentity](sfclient-v71-model-serviceidentity.md) | Map service identity friendly name to an application identity.<br/> |
| [ServiceInfo](sfclient-v71-model-serviceinfo.md) | Information about a Service Fabric service.<br/> |
| [ServiceKind enum](sfclient-v71-model-servicekind.md) | The kind of service (Stateless or Stateful).<br/> |
| [ServiceLoadMetricDescription](sfclient-v71-model-serviceloadmetricdescription.md) | Specifies a metric to load balance a service during runtime.<br/> |
| [ServiceLoadMetricWeight enum](sfclient-v71-model-serviceloadmetricweight.md) | Determines the metric weight relative to the other metrics that are configured for this service. During runtime, if two metrics end up in conflict, the Cluster Resource Manager prefers the metric with the higher weight.<br/> |
| [ServiceNameInfo](sfclient-v71-model-servicenameinfo.md) | Information about the service name.<br/> |
| [ServiceNewHealthReportEvent](sfclient-v71-model-servicenewhealthreportevent.md) | Service Health Report Created event.<br/> |
| [ServiceNewHealthReportEvent](sfclient-v71-model-servicenewhealthreportevent.md) | Service Health Report Created event.<br/> |
| [ServiceOperationName enum](sfclient-v71-model-serviceoperationname.md) | Specifies the current active life-cycle operation on a stateful service replica or stateless service instance.<br/> |
| [ServicePackageActivationMode enum](sfclient-v71-model-servicepackageactivationmode.md) | The activation mode of service package to be used for a Service Fabric service. This is specified at the time of creating the Service.<br/> |
| [ServicePartitionInfo](sfclient-v71-model-servicepartitioninfo.md) | Information about a partition of a Service Fabric service.<br/> |
| [ServicePartitionKind enum](sfclient-v71-model-servicepartitionkind.md) | The kind of partitioning scheme used to partition the service.<br/> |
| [ServicePartitionStatus enum](sfclient-v71-model-servicepartitionstatus.md) | The status of the service fabric service partition.<br/> |
| [ServicePlacementInvalidDomainPolicyDescription](sfclient-v71-model-serviceplacementinvaliddomainpolicydescription.md) | Describes the policy to be used for placement of a Service Fabric service where a particular fault or upgrade domain should not be used for placement of the instances or replicas of that service.<br/> |
| [ServicePlacementInvalidDomainPolicyDescription](sfclient-v71-model-serviceplacementinvaliddomainpolicydescription.md) | Describes the policy to be used for placement of a Service Fabric service where a particular fault or upgrade domain should not be used for placement of the instances or replicas of that service.<br/> |
| [ServicePlacementNonPartiallyPlaceServicePolicyDescription](sfclient-v71-model-serviceplacementnonpartiallyplaceservicepolicydescription.md) | Describes the policy to be used for placement of a Service Fabric service where all replicas must be able to be placed in order for any replicas to be created.<br/> |
| [ServicePlacementNonPartiallyPlaceServicePolicyDescription](sfclient-v71-model-serviceplacementnonpartiallyplaceservicepolicydescription.md) | Describes the policy to be used for placement of a Service Fabric service where all replicas must be able to be placed in order for any replicas to be created.<br/> |
| [ServicePlacementPolicyDescription](sfclient-v71-model-serviceplacementpolicydescription.md) | Describes the policy to be used for placement of a Service Fabric service.<br/> |
| [ServicePlacementPolicyType enum](sfclient-v71-model-serviceplacementpolicytype.md) | The type of placement policy for a service fabric service. Following are the possible values.<br/> |
| [ServicePlacementPreferPrimaryDomainPolicyDescription](sfclient-v71-model-serviceplacementpreferprimarydomainpolicydescription.md) | Describes the policy to be used for placement of a Service Fabric service where the service's Primary replicas should optimally be placed in a particular domain.<br/><br/>This placement policy is usually used with fault domains in scenarios where the Service Fabric cluster is geographically distributed in order to indicate that a service's primary replica should be located in a particular fault domain, which in geo-distributed scenarios usually aligns with regional or datacenter boundaries. Note that since this is an optimization it is possible that the Primary replica may not end up located in this domain due to failures, capacity limits, or other constraints.<br/> |
| [ServicePlacementPreferPrimaryDomainPolicyDescription](sfclient-v71-model-serviceplacementpreferprimarydomainpolicydescription.md) | Describes the policy to be used for placement of a Service Fabric service where the service's Primary replicas should optimally be placed in a particular domain.<br/><br/>This placement policy is usually used with fault domains in scenarios where the Service Fabric cluster is geographically distributed in order to indicate that a service's primary replica should be located in a particular fault domain, which in geo-distributed scenarios usually aligns with regional or datacenter boundaries. Note that since this is an optimization it is possible that the Primary replica may not end up located in this domain due to failures, capacity limits, or other constraints.<br/> |
| [ServicePlacementRequiredDomainPolicyDescription](sfclient-v71-model-serviceplacementrequireddomainpolicydescription.md) | Describes the policy to be used for placement of a Service Fabric service where the instances or replicas of that service must be placed in a particular domain<br/> |
| [ServicePlacementRequiredDomainPolicyDescription](sfclient-v71-model-serviceplacementrequireddomainpolicydescription.md) | Describes the policy to be used for placement of a Service Fabric service where the instances or replicas of that service must be placed in a particular domain<br/> |
| [ServicePlacementRequireDomainDistributionPolicyDescription](sfclient-v71-model-serviceplacementrequiredomaindistributionpolicydescription.md) | Describes the policy to be used for placement of a Service Fabric service where two replicas from the same partition should never be placed in the same fault or upgrade domain.<br/><br/>While this is not common it can expose the service to an increased risk of concurrent failures due to unplanned outages or other cases of subsequent/concurrent failures. As an example, consider a case where replicas are deployed across different data center, with one replica per location. In the event that one of the datacenters goes offline, normally the replica that was placed in that datacenter will be packed into one of the remaining datacenters. If this is not desirable then this policy should be set.<br/> |
| [ServicePlacementRequireDomainDistributionPolicyDescription](sfclient-v71-model-serviceplacementrequiredomaindistributionpolicydescription.md) | Describes the policy to be used for placement of a Service Fabric service where two replicas from the same partition should never be placed in the same fault or upgrade domain.<br/><br/>While this is not common it can expose the service to an increased risk of concurrent failures due to unplanned outages or other cases of subsequent/concurrent failures. As an example, consider a case where replicas are deployed across different data center, with one replica per location. In the event that one of the datacenters goes offline, normally the replica that was placed in that datacenter will be packed into one of the remaining datacenters. If this is not desirable then this policy should be set.<br/> |
| [ServiceProperties](sfclient-v71-model-serviceproperties.md) | Describes properties of a service resource.<br/> |
| [ServiceReplicaDescription](sfclient-v71-model-servicereplicadescription.md) | Describes a replica of a service resource.<br/> |
| [ServiceReplicaDescription](sfclient-v71-model-servicereplicadescription.md) | Describes a replica of a service resource.<br/> |
| [ServiceReplicaProperties](sfclient-v71-model-servicereplicaproperties.md) | Describes the properties of a service replica.<br/> |
| [ServiceResourceDescription](sfclient-v71-model-serviceresourcedescription.md) | This type describes a service resource.<br/> |
| [ServiceResourceProperties](sfclient-v71-model-serviceresourceproperties.md) | This type describes properties of a service resource.<br/> |
| [ServicesHealthEvaluation](sfclient-v71-model-serviceshealthevaluation.md) | Represents health evaluation for services of a certain service type belonging to an application, containing health evaluations for each unhealthy service that impacted current aggregated health state. Can be returned when evaluating application health and the aggregated health state is either Error or Warning.<br/> |
| [ServicesHealthEvaluation](sfclient-v71-model-serviceshealthevaluation.md) | Represents health evaluation for services of a certain service type belonging to an application, containing health evaluations for each unhealthy service that impacted current aggregated health state. Can be returned when evaluating application health and the aggregated health state is either Error or Warning.<br/> |
| [ServiceStatus enum](sfclient-v71-model-servicestatus.md) | The status of the application.<br/> |
| [ServiceTypeDescription](sfclient-v71-model-servicetypedescription.md) | Describes a service type defined in the service manifest of a provisioned application type. The properties the ones defined in the service manifest.<br/> |
| [ServiceTypeExtensionDescription](sfclient-v71-model-servicetypeextensiondescription.md) | Describes extension of a service type defined in the service manifest.<br/> |
| [ServiceTypeHealthPolicy](sfclient-v71-model-servicetypehealthpolicy.md) | Represents the health policy used to evaluate the health of services belonging to a service type.<br/> |
| [ServiceTypeHealthPolicyMapItem](sfclient-v71-model-servicetypehealthpolicymapitem.md) | Defines an item in ServiceTypeHealthPolicyMap.<br/> |
| [ServiceTypeInfo](sfclient-v71-model-servicetypeinfo.md) | Information about a service type that is defined in a service manifest of a provisioned application type.<br/> |
| [ServiceTypeManifest](sfclient-v71-model-servicetypemanifest.md) | Contains the manifest describing a service type registered as part of an application in a Service Fabric cluster.<br/> |
| [ServiceTypeRegistrationStatus enum](sfclient-v71-model-servicetyperegistrationstatus.md) | The status of the service type registration on the node.<br/> |
| [ServiceUpdateDescription](sfclient-v71-model-serviceupdatedescription.md) | A ServiceUpdateDescription contains all of the information necessary to update a service.<br/> |
| [ServiceUpgradeProgress](sfclient-v71-model-serviceupgradeprogress.md) | Information about how many replicas are completed or pending for a specific service during upgrade.<br/> |
| [Setting](sfclient-v71-model-setting.md) | Describes a setting for the container. The setting file path can be fetched from environment variable "Fabric_SettingPath". The path for Windows container is "C:\\secrets". The path for Linux container is "/var/secrets".<br/> |
| [SettingType enum](sfclient-v71-model-settingtype.md) | The type of the setting being given in value<br/> |
| [SingletonPartitionInformation](sfclient-v71-model-singletonpartitioninformation.md) | Information about a partition that is singleton. The services with singleton partitioning scheme are effectively non-partitioned. They only have one partition.<br/> |
| [SingletonPartitionInformation](sfclient-v71-model-singletonpartitioninformation.md) | Information about a partition that is singleton. The services with singleton partitioning scheme are effectively non-partitioned. They only have one partition.<br/> |
| [SingletonPartitionSchemeDescription](sfclient-v71-model-singletonpartitionschemedescription.md) | Describes the partition scheme of a singleton-partitioned, or non-partitioned service.<br/> |
| [SingletonPartitionSchemeDescription](sfclient-v71-model-singletonpartitionschemedescription.md) | Describes the partition scheme of a singleton-partitioned, or non-partitioned service.<br/> |
| [SizeTypes enum](sfclient-v71-model-sizetypes.md) | Possible values include: 'Small', 'Medium', 'Large'<br/> |
| [StartClusterUpgradeDescription](sfclient-v71-model-startclusterupgradedescription.md) | Describes the parameters for starting a cluster upgrade.<br/> |
| [StartedChaosEvent](sfclient-v71-model-startedchaosevent.md) | Describes a Chaos event that gets generated when Chaos is started.<br/> |
| [StartedChaosEvent](sfclient-v71-model-startedchaosevent.md) | Describes a Chaos event that gets generated when Chaos is started.<br/> |
| [State enum](sfclient-v71-model-state.md) | Possible values include: 'Invalid', 'Created', 'Claimed', 'Preparing', 'Approved', 'Executing', 'Restoring', 'Completed'<br/> |
| [StatefulReplicaHealthReportExpiredEvent](sfclient-v71-model-statefulreplicahealthreportexpiredevent.md) | Stateful Replica Health Report Expired event.<br/> |
| [StatefulReplicaHealthReportExpiredEvent](sfclient-v71-model-statefulreplicahealthreportexpiredevent.md) | Stateful Replica Health Report Expired event.<br/> |
| [StatefulReplicaNewHealthReportEvent](sfclient-v71-model-statefulreplicanewhealthreportevent.md) | Stateful Replica Health Report Created event.<br/> |
| [StatefulReplicaNewHealthReportEvent](sfclient-v71-model-statefulreplicanewhealthreportevent.md) | Stateful Replica Health Report Created event.<br/> |
| [StatefulServiceDescription](sfclient-v71-model-statefulservicedescription.md) | Describes a stateful service.<br/> |
| [StatefulServiceDescription](sfclient-v71-model-statefulservicedescription.md) | Describes a stateful service.<br/> |
| [StatefulServiceInfo](sfclient-v71-model-statefulserviceinfo.md) | Information about a stateful Service Fabric service.<br/> |
| [StatefulServiceInfo](sfclient-v71-model-statefulserviceinfo.md) | Information about a stateful Service Fabric service.<br/> |
| [StatefulServicePartitionInfo](sfclient-v71-model-statefulservicepartitioninfo.md) | Information about a partition of a stateful Service Fabric service..<br/> |
| [StatefulServicePartitionInfo](sfclient-v71-model-statefulservicepartitioninfo.md) | Information about a partition of a stateful Service Fabric service..<br/> |
| [StatefulServiceReplicaHealth](sfclient-v71-model-statefulservicereplicahealth.md) | Represents the health of the stateful service replica.<br/>Contains the replica aggregated health state, the health events and the unhealthy evaluations.<br/> |
| [StatefulServiceReplicaHealth](sfclient-v71-model-statefulservicereplicahealth.md) | Represents the health of the stateful service replica.<br/>Contains the replica aggregated health state, the health events and the unhealthy evaluations.<br/> |
| [StatefulServiceReplicaHealthState](sfclient-v71-model-statefulservicereplicahealthstate.md) | Represents the health state of the stateful service replica, which contains the replica ID and the aggregated health state.<br/> |
| [StatefulServiceReplicaHealthState](sfclient-v71-model-statefulservicereplicahealthstate.md) | Represents the health state of the stateful service replica, which contains the replica ID and the aggregated health state.<br/> |
| [StatefulServiceReplicaInfo](sfclient-v71-model-statefulservicereplicainfo.md) | Represents a stateful service replica. This includes information about the identity, role, status, health, node name, uptime, and other details about the replica.<br/> |
| [StatefulServiceReplicaInfo](sfclient-v71-model-statefulservicereplicainfo.md) | Represents a stateful service replica. This includes information about the identity, role, status, health, node name, uptime, and other details about the replica.<br/> |
| [StatefulServiceTypeDescription](sfclient-v71-model-statefulservicetypedescription.md) | Describes a stateful service type defined in the service manifest of a provisioned application type.<br/> |
| [StatefulServiceTypeDescription](sfclient-v71-model-statefulservicetypedescription.md) | Describes a stateful service type defined in the service manifest of a provisioned application type.<br/> |
| [StatefulServiceUpdateDescription](sfclient-v71-model-statefulserviceupdatedescription.md) | Describes an update for a stateful service.<br/> |
| [StatefulServiceUpdateDescription](sfclient-v71-model-statefulserviceupdatedescription.md) | Describes an update for a stateful service.<br/> |
| [StatelessReplicaHealthReportExpiredEvent](sfclient-v71-model-statelessreplicahealthreportexpiredevent.md) | Stateless Replica Health Report Expired event.<br/> |
| [StatelessReplicaHealthReportExpiredEvent](sfclient-v71-model-statelessreplicahealthreportexpiredevent.md) | Stateless Replica Health Report Expired event.<br/> |
| [StatelessReplicaNewHealthReportEvent](sfclient-v71-model-statelessreplicanewhealthreportevent.md) | Stateless Replica Health Report Created event.<br/> |
| [StatelessReplicaNewHealthReportEvent](sfclient-v71-model-statelessreplicanewhealthreportevent.md) | Stateless Replica Health Report Created event.<br/> |
| [StatelessServiceDescription](sfclient-v71-model-statelessservicedescription.md) | Describes a stateless service.<br/> |
| [StatelessServiceDescription](sfclient-v71-model-statelessservicedescription.md) | Describes a stateless service.<br/> |
| [StatelessServiceInfo](sfclient-v71-model-statelessserviceinfo.md) | Information about a stateless Service Fabric service.<br/> |
| [StatelessServiceInfo](sfclient-v71-model-statelessserviceinfo.md) | Information about a stateless Service Fabric service.<br/> |
| [StatelessServiceInstanceHealth](sfclient-v71-model-statelessserviceinstancehealth.md) | Represents the health of the stateless service instance.<br/>Contains the instance aggregated health state, the health events and the unhealthy evaluations.<br/> |
| [StatelessServiceInstanceHealth](sfclient-v71-model-statelessserviceinstancehealth.md) | Represents the health of the stateless service instance.<br/>Contains the instance aggregated health state, the health events and the unhealthy evaluations.<br/> |
| [StatelessServiceInstanceHealthState](sfclient-v71-model-statelessserviceinstancehealthstate.md) | Represents the health state of the stateless service instance, which contains the instance ID and the aggregated health state.<br/> |
| [StatelessServiceInstanceHealthState](sfclient-v71-model-statelessserviceinstancehealthstate.md) | Represents the health state of the stateless service instance, which contains the instance ID and the aggregated health state.<br/> |
| [StatelessServiceInstanceInfo](sfclient-v71-model-statelessserviceinstanceinfo.md) | Represents a stateless service instance. This includes information about the identity, status, health, node name, uptime, and other details about the instance.<br/> |
| [StatelessServiceInstanceInfo](sfclient-v71-model-statelessserviceinstanceinfo.md) | Represents a stateless service instance. This includes information about the identity, status, health, node name, uptime, and other details about the instance.<br/> |
| [StatelessServicePartitionInfo](sfclient-v71-model-statelessservicepartitioninfo.md) | Information about a partition of a stateless Service Fabric service.<br/> |
| [StatelessServicePartitionInfo](sfclient-v71-model-statelessservicepartitioninfo.md) | Information about a partition of a stateless Service Fabric service.<br/> |
| [StatelessServiceTypeDescription](sfclient-v71-model-statelessservicetypedescription.md) | Describes a stateless service type defined in the service manifest of a provisioned application type.<br/> |
| [StatelessServiceTypeDescription](sfclient-v71-model-statelessservicetypedescription.md) | Describes a stateless service type defined in the service manifest of a provisioned application type.<br/> |
| [StatelessServiceUpdateDescription](sfclient-v71-model-statelessserviceupdatedescription.md) | Describes an update for a stateless service.<br/> |
| [StatelessServiceUpdateDescription](sfclient-v71-model-statelessserviceupdatedescription.md) | Describes an update for a stateless service.<br/> |
| [StoppedChaosEvent](sfclient-v71-model-stoppedchaosevent.md) | Describes a Chaos event that gets generated when Chaos stops because either the user issued a stop or the time to run was up.<br/> |
| [StoppedChaosEvent](sfclient-v71-model-stoppedchaosevent.md) | Describes a Chaos event that gets generated when Chaos stops because either the user issued a stop or the time to run was up.<br/> |
| [StringPropertyValue](sfclient-v71-model-stringpropertyvalue.md) | Describes a Service Fabric property value of type String.<br/> |
| [StringPropertyValue](sfclient-v71-model-stringpropertyvalue.md) | Describes a Service Fabric property value of type String.<br/> |
| [SuccessfulPropertyBatchInfo](sfclient-v71-model-successfulpropertybatchinfo.md) | Derived from PropertyBatchInfo. Represents the property batch succeeding. Contains the results of any "Get" operations in the batch.<br/> |
| [SuccessfulPropertyBatchInfo](sfclient-v71-model-successfulpropertybatchinfo.md) | Derived from PropertyBatchInfo. Represents the property batch succeeding. Contains the results of any "Get" operations in the batch.<br/> |
| [SystemApplicationHealthEvaluation](sfclient-v71-model-systemapplicationhealthevaluation.md) | Represents health evaluation for the fabric:/System application, containing information about the data and the algorithm used by health store to evaluate health. The evaluation is returned only when the aggregated health state of the cluster is either Error or Warning.<br/> |
| [SystemApplicationHealthEvaluation](sfclient-v71-model-systemapplicationhealthevaluation.md) | Represents health evaluation for the fabric:/System application, containing information about the data and the algorithm used by health store to evaluate health. The evaluation is returned only when the aggregated health state of the cluster is either Error or Warning.<br/> |
| [TcpConfig](sfclient-v71-model-tcpconfig.md) | Describes the tcp configuration for external connectivity for this network.<br/> |
| [TestErrorChaosEvent](sfclient-v71-model-testerrorchaosevent.md) | Describes a Chaos event that gets generated when an unexpected event occurs in the Chaos engine.<br/>For example, due to the cluster snapshot being inconsistent, while faulting an entity, Chaos found that the entity was already faulted -- which would be an unexpected event.<br/> |
| [TestErrorChaosEvent](sfclient-v71-model-testerrorchaosevent.md) | Describes a Chaos event that gets generated when an unexpected event occurs in the Chaos engine.<br/>For example, due to the cluster snapshot being inconsistent, while faulting an entity, Chaos found that the entity was already faulted -- which would be an unexpected event.<br/> |
| [TimeBasedBackupScheduleDescription](sfclient-v71-model-timebasedbackupscheduledescription.md) | Describes the time based backup schedule.<br/> |
| [TimeBasedBackupScheduleDescription](sfclient-v71-model-timebasedbackupscheduledescription.md) | Describes the time based backup schedule.<br/> |
| [TimeOfDay](sfclient-v71-model-timeofday.md) | Defines an hour and minute of the day specified in 24 hour time.<br/> |
| [TimeRange](sfclient-v71-model-timerange.md) | Defines a time range in a 24 hour day specified by a start and end time.<br/> |
| [UniformInt64RangePartitionSchemeDescription](sfclient-v71-model-uniformint64rangepartitionschemedescription.md) | Describes a partitioning scheme where an integer range is allocated evenly across a number of partitions.<br/> |
| [UniformInt64RangePartitionSchemeDescription](sfclient-v71-model-uniformint64rangepartitionschemedescription.md) | Describes a partitioning scheme where an integer range is allocated evenly across a number of partitions.<br/> |
| [UnplacedReplicaInformation](sfclient-v71-model-unplacedreplicainformation.md) | Contains information for an unplaced replica.<br/> |
| [UnprovisionApplicationTypeDescriptionInfo](sfclient-v71-model-unprovisionapplicationtypedescriptioninfo.md) | Describes the operation to unregister or unprovision an application type and its version that was registered with the Service Fabric.<br/> |
| [UnprovisionFabricDescription](sfclient-v71-model-unprovisionfabricdescription.md) | Describes the parameters for unprovisioning a cluster.<br/> |
| [UpdateClusterUpgradeDescription](sfclient-v71-model-updateclusterupgradedescription.md) | Parameters for updating a cluster upgrade.<br/> |
| [UpgradeDomainDeltaNodesCheckHealthEvaluation](sfclient-v71-model-upgradedomaindeltanodescheckhealthevaluation.md) | Represents health evaluation for delta unhealthy cluster nodes in an upgrade domain, containing health evaluations for each unhealthy node that impacted current aggregated health state.<br/>Can be returned during cluster upgrade when cluster aggregated health state is Warning or Error.<br/> |
| [UpgradeDomainDeltaNodesCheckHealthEvaluation](sfclient-v71-model-upgradedomaindeltanodescheckhealthevaluation.md) | Represents health evaluation for delta unhealthy cluster nodes in an upgrade domain, containing health evaluations for each unhealthy node that impacted current aggregated health state.<br/>Can be returned during cluster upgrade when cluster aggregated health state is Warning or Error.<br/> |
| [UpgradeDomainInfo](sfclient-v71-model-upgradedomaininfo.md) | Information about an upgrade domain.<br/> |
| [UpgradeDomainNodesHealthEvaluation](sfclient-v71-model-upgradedomainnodeshealthevaluation.md) | Represents health evaluation for cluster nodes in an upgrade domain, containing health evaluations for each unhealthy node that impacted current aggregated health state. Can be returned when evaluating cluster health during cluster upgrade and the aggregated health state is either Error or Warning.<br/> |
| [UpgradeDomainNodesHealthEvaluation](sfclient-v71-model-upgradedomainnodeshealthevaluation.md) | Represents health evaluation for cluster nodes in an upgrade domain, containing health evaluations for each unhealthy node that impacted current aggregated health state. Can be returned when evaluating cluster health during cluster upgrade and the aggregated health state is either Error or Warning.<br/> |
| [UpgradeDomainState enum](sfclient-v71-model-upgradedomainstate.md) | The state of the upgrade domain.<br/> |
| [UpgradeKind enum](sfclient-v71-model-upgradekind.md) | The kind of upgrade out of the following possible values.<br/> |
| [UpgradeMode enum](sfclient-v71-model-upgrademode.md) | The mode used to monitor health during a rolling upgrade. The values are UnmonitoredAuto, UnmonitoredManual, and Monitored.<br/> |
| [UpgradeOrchestrationServiceState](sfclient-v71-model-upgradeorchestrationservicestate.md) | Service state of Service Fabric Upgrade Orchestration Service.<br/> |
| [UpgradeOrchestrationServiceStateSummary](sfclient-v71-model-upgradeorchestrationservicestatesummary.md) | Service state summary of Service Fabric Upgrade Orchestration Service.<br/> |
| [UpgradeSortOrder enum](sfclient-v71-model-upgradesortorder.md) | Defines the order in which an upgrade proceeds through the cluster.<br/> |
| [UpgradeState enum](sfclient-v71-model-upgradestate.md) | The state of the upgrade domain.<br/> |
| [UpgradeType enum](sfclient-v71-model-upgradetype.md) | The type of upgrade out of the following possible values.<br/> |
| [UploadChunkRange](sfclient-v71-model-uploadchunkrange.md) | Information about which portion of the file to upload.<br/> |
| [UploadSession](sfclient-v71-model-uploadsession.md) | Information about a image store upload session<br/> |
| [UploadSessionInfo](sfclient-v71-model-uploadsessioninfo.md) | Information about an image store upload session. A session is associated with a relative path in the image store.<br/> |
| [UsageInfo](sfclient-v71-model-usageinfo.md) | Information about how much space and how many files in the file system the ImageStore is using in this category<br/> |
| [ValidationFailedChaosEvent](sfclient-v71-model-validationfailedchaosevent.md) | Chaos event corresponding to a failure during validation.<br/> |
| [ValidationFailedChaosEvent](sfclient-v71-model-validationfailedchaosevent.md) | Chaos event corresponding to a failure during validation.<br/> |
| [VolumeProperties](sfclient-v71-model-volumeproperties.md) | Describes properties of a volume resource.<br/> |
| [VolumeProvider enum](sfclient-v71-model-volumeprovider.md) | Describes the provider of the volume resource.<br/> |
| [VolumeProviderParametersAzureFile](sfclient-v71-model-volumeproviderparametersazurefile.md) | This type describes a volume provided by an Azure Files file share.<br/> |
| [VolumeReference](sfclient-v71-model-volumereference.md) | Describes a reference to a volume resource.<br/> |
| [VolumeResourceDescription](sfclient-v71-model-volumeresourcedescription.md) | This type describes a volume resource.<br/> |
| [WaitForInbuildReplicaSafetyCheck](sfclient-v71-model-waitforinbuildreplicasafetycheck.md) | Safety check that waits for the replica build operation to finish. This indicates that there is a replica that is going through the copy or is providing data for building another replica. Bring the node down will abort this copy operation which are typically expensive involving data movements.<br/> |
| [WaitForInbuildReplicaSafetyCheck](sfclient-v71-model-waitforinbuildreplicasafetycheck.md) | Safety check that waits for the replica build operation to finish. This indicates that there is a replica that is going through the copy or is providing data for building another replica. Bring the node down will abort this copy operation which are typically expensive involving data movements.<br/> |
| [WaitForPrimaryPlacementSafetyCheck](sfclient-v71-model-waitforprimaryplacementsafetycheck.md) | Safety check that waits for the primary replica that was moved out of the node due to upgrade to be placed back again on that node.<br/> |
| [WaitForPrimaryPlacementSafetyCheck](sfclient-v71-model-waitforprimaryplacementsafetycheck.md) | Safety check that waits for the primary replica that was moved out of the node due to upgrade to be placed back again on that node.<br/> |
| [WaitForPrimarySwapSafetyCheck](sfclient-v71-model-waitforprimaryswapsafetycheck.md) | Safety check that waits for the primary replica to be moved out of the node before starting an upgrade to ensure the availability of the primary replica for the partition.<br/> |
| [WaitForPrimarySwapSafetyCheck](sfclient-v71-model-waitforprimaryswapsafetycheck.md) | Safety check that waits for the primary replica to be moved out of the node before starting an upgrade to ensure the availability of the primary replica for the partition.<br/> |
| [WaitForReconfigurationSafetyCheck](sfclient-v71-model-waitforreconfigurationsafetycheck.md) | Safety check that waits for the current reconfiguration of the partition to be completed before starting an upgrade.<br/> |
| [WaitForReconfigurationSafetyCheck](sfclient-v71-model-waitforreconfigurationsafetycheck.md) | Safety check that waits for the current reconfiguration of the partition to be completed before starting an upgrade.<br/> |
| [WaitingChaosEvent](sfclient-v71-model-waitingchaosevent.md) | Describes a Chaos event that gets generated when Chaos is waiting for the cluster to become ready for faulting, for example, Chaos may be waiting for the on-going upgrade to finish.<br/> |
| [WaitingChaosEvent](sfclient-v71-model-waitingchaosevent.md) | Describes a Chaos event that gets generated when Chaos is waiting for the cluster to become ready for faulting, for example, Chaos may be waiting for the on-going upgrade to finish.<br/> |
